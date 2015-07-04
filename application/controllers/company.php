<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class company extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('role') != 'user' && $this->session->userdata('role') != 'admin' ) {
			redirect(base_url().'dashboard');
		}	
	}
	
	function add_company() {
		$data['pageTitle']="Add Company";
		$data['title']="Add Company";
		$this->load->model('company_model');
		$this->load->helper('form');
		$data['modules']=$this->company_model->get_modules();
		$data['contant']=$this->load->view('company_addform',$data,true);
		$this->load->view('master',$data);	
	}
	
	function edit_company($cid) {
		if($cid) {
			$data['pageTitle']="Edit Company";
			$data['title']="Edit Company";
			$this->load->model('company_model');
			$this->load->helper('form');
			$data['edit_company']=$this->company_model->get_companies($cid);
			$data['modules']=$this->company_model->get_modules();
			$filter['company_modules.companyid']=$cid;
			$edit_modules=$this->company_model->get_company_modules($filter);
			$new_modules=array();
			foreach ($edit_modules as $key => $value) {
				$new_modules[$value['module_id']]=$value;
			}
			//dsm($data['edit_company']['modules']); die;
			$data['edit_company']['modules']=$new_modules;
			$data['contant']=$this->load->view('company_addform',$data,true);
			$this->load->view('master',$data);	
		}
	}

	function del_company() {
		$this->load->model('company_model');
		$del_id=$this->input->post('id');
		$data = array(
			'deleted_at'=>date('Y-m-d h:i:s')		
		);
		
		$delquery = $this->company_model->delete_company($data,$del_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Company deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);		
	}
	
	function save_company() {
		dsm($this->input->post()); //die;
		$companyid=$this->input->post('companyid');
		/* Including Validation Library */
		$this->load->model('company_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('companyname', 'Company Name', 'required|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('short_name', 'Company Short Name', 'required|min_length[1]|max_length[15]');
		$this->form_validation->set_rules('tag_line', 'Company Tag Line', 'min_length[1]|max_length[50]');
		$this->form_validation->set_rules('cmobile', 'Company Mobile', 'regex_match[/^[0-9]{10}$/]');
		$this->form_validation->set_rules('ctel', 'Company Telephone', 'regex_match[/^[0-9]/]');
		$this->form_validation->set_rules('cemail', 'Company Email', 'valid_email');
		$this->form_validation->set_rules('edate', 'Establish date', 'regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');
		$this->form_validation->set_rules('caddress', 'Company Address', 'required');
		$this->form_validation->set_rules('invoice_template', 'Receipt Header', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect(base_url().'company/add_company');
			return 0;
		}
		else {
			$companyname=strtoupper($this->input->post('companyname'));
			$short_name=strtoupper($this->input->post('short_name'));
			$tag_line=$this->input->post('tag_line');
			$owner=strtoupper($this->input->post('owner'));
			$edate = $this->input->post('edate');
			$cemail = $this->input->post('cemail');
			$pan = $this->input->post('pan');
			$sertexno = $this->input->post('sertexno');
			$cmobile = $this->input->post('cmobile');	
			$ctel = $this->input->post('ctel');	
			$caddress = $this->input->post('caddress');			
			$terms_condition = $this->input->post('terms_condition');			
			$invoice_template = $this->input->post('invoice_template');			
			$cmodules = $this->input->post('cmodules');			
			if($companyid) {
				$updated_at	= date('Y-m-d H:i:s');	
				$data = array(
					'companyname'=>$companyname,
					'shortname'=>$short_name,
					'tag_line'=>$tag_line,
					'owner'=>$owner,
					'cemail'=>$cemail,
					'cmobile'=>$cmobile,
					'ctel'=>$ctel,
					'pan'=>$pan,
					'sertexno'=>$sertexno,
					'caddress'=>$caddress,
					'terms_condition'=>$terms_condition,
					'establishdate'=>$edate,
					'invoice_template'=>$invoice_template,
					'updated_at'=>$updated_at
				);

				if(isset($_FILES['file']['name']) && $_FILES['file']['name']!='') {
					$this->check_dir($short_name);	
					$file=$_FILES['file'];
					$ext_imgfile=pathinfo($file['name'],PATHINFO_EXTENSION);

					if($ext_imgfile=="png" || $ext_imgfile=="jpg" || $ext_imgfile=="jpeg" || $ext_imgfile=="gif") {
						$folder='./logo/'.$short_name;			
						$thumb_folder=$folder.'/thumb_150';	

						$file_name=$file['name'];
						$upload=$folder.'/'.$file_name;
						$data['clogo']=$short_name.'/'.$file_name;
						move_uploaded_file($file['tmp_name'],$upload);	
						
						if(file_exists($upload)) {
							$this->image_thumb($upload,120,120,$file_name,$thumb_folder);
						}
					}
					else {
						set_message("Company logo file is Invalid");
					}
				}

				$res=$this->company_model->update_company($data,$companyid);
				if($res) {
					if(isset($cmodules) && !empty($cmodules)) {
						$filter['company_modules.companyid']=$companyid;
						$oldmodules=$this->company_model->get_company_modules($filter);
						$oldmodules=array_column($oldmodules,'module_id');
						foreach ($cmodules as $key => $value) {
							if(in_array($value,$oldmodules)) {
								$key_to_remove=array_search($value, $oldmodules);
								unset($oldmodules[$key_to_remove]);
							}
							else {
								$module_data=array(
									'companyid'=>$companyid,
									'module_id'=>$value,
								);
								$this->company_model->add_company_module($module_data);					
							}
						}
						foreach($oldmodules as $key=>$value) {
							$this->db->where('module_id',$value);
							$this->db->where('companyid',$companyid);
							$this->db->delete('company_modules');
						}									
					}
					set_message('Company edited successfully','success');
					if($this->session->userdata('role')=="user") {
						redirect(base_url().'company/edit_company/'.$companyid);
					}
					else {
						redirect(base_url().'company/view_company');
					}
				}
				else {
					set_message('Somthing went wrong');
					redirect(base_url().'company/edit_company/'.$companyid);				
				}					
			}
			else {
				$storepath="";
				$created_at	= date('Y-m-d H:i:s');	
				if(isset($_FILES['file']['name'])&& $_FILES['file']['name']!='') {
					$this->check_dir($short_name);	
					$file=$_FILES['file'];
					$ext_imgfile=pathinfo($file['name'],PATHINFO_EXTENSION);
					if($ext_imgfile=="png" || $ext_imgfile=="jpg" || $ext_imgfile=="jpeg" || $ext_imgfile=="gif") {
						$folder='./logo/'.$short_name;			
						$thumb_folder=$folder.'/thumb_150';	

						$file_name=$file['name'];
						$upload=$folder.'/'.$file_name;
						$storepath=$short_name.'/'.$file_name;
						move_uploaded_file($file['tmp_name'],$upload);	
						
						if(file_exists($upload)) {
							$this->image_thumb($upload,120,120,$file_name,$thumb_folder);
						}
					}
					else {
						set_message("Company logo file is Invalid");
					}
				}
					
				$data = array(
					'companyname'=>$companyname,
					'shortname'=>$short_name,
					'tag_line'=>$tag_line,
					'owner'=>$owner,
					'cemail'=>$cemail,
					'cmobile'=>$cmobile,
					'ctel'=>$ctel,
					'pan'=>$pan,
					'sertexno'=>$sertexno,
					'caddress'=>$caddress,
					'establishdate'=>$edate,
					'terms_condition'=>$terms_condition,
					'invoice_template'=>$invoice_template,
					'clogo' => $storepath,
					'created_at'=>$created_at
				);

				$res=$this->company_model->add_company($data);
				$companyid=$this->db->insert_id();
				if($res) {
					if(isset($cmodules)) {
						foreach ($cmodules as $key => $value) {
							$module_data=array(
								'companyid'=>$companyid,
								'module_id'=>$value,
							);
							$this->company_model->add_company_module($module_data);
						}
					}
					set_message('New Company added successfully','success');
					redirect(base_url().'company/add_company');
				}
				else {
					set_message('Somthing went wrong');
					redirect(base_url().'company/add_company');				
				}
			}
		}
	}

	function view_company() {
		$data['pageTitle']="Company Details";
		$data['title']="Company Details";
		$this->load->model('company_model');
		$this->load->helper('form');
		$data['company']=$this->company_model->get_companies();
		$data['contant']=$this->load->view('company_list',$data,true);
		$this->load->view('master',$data);		
	}

	function search_company() {
		$data['pageTitle']="Company Details";
		$data['title']="Company Details";
		$this->load->model('company_model');
		$this->load->helper('form');
		$companyname=$this->input->post('companyname');
		$short_name=$this->input->post('short_name');
		$cmobile = $this->input->post('cmobile');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');		
		$data['company']=$this->company_model->get_companies('',$companyname,$short_name,$cmobile,$from_date,$to_date);
		$data['contant']=$this->load->view('company_list',$data,true);
		$this->load->view('master',$data);		
	}
	
	function company_modules() {
		$companyid=$this->input->post('id');
		$this->load->model('company_model');
		$filter['company_modules.companyid']=$companyid;
		$edit_modules=$this->company_model->get_company_modules($filter);
		echo json_encode($edit_modules);
	}
	
	function check_dir($short_name) {
		$referer=$_SERVER['HTTP_REFERER'];
		$server=parse_url($referer);

		/* main upload folder */
		if(!file_exists('./logo') || !is_dir('./logo')) {
			mkdir("./logo");
		}
		
		/* Logo folder of user */
		$document_path='./logo/'.$short_name;
		if(!file_exists($document_path) || !is_dir($document_path)) {
			mkdir($document_path);
		}	

		/* thumb150 folder of each user */
		$thumb_folder=$document_path.'/thumb_150';
		if(!file_exists($thumb_folder) || !is_dir($thumb_folder)) {
			mkdir($thumb_folder);
		}
	}	
	
	function image_thumb($image_path, $width, $height,$ofilename,$thumb_folder) {
	    // Path to image thumbnail
	    $image_thumb = $thumb_folder . '/' . $ofilename;
	    if (!file_exists($image_thumb)) {
	        // LOAD LIBRARY
	        $this->load->library('image_lib');

	        // CONFIGURE IMAGE LIBRARY
	        $config['image_library']    = 'gd2';
	        $config['source_image']     = $image_path;
			$config['new_image']        = $image_thumb;
	        $config['create_thumb']     = TRUE;
	        $config['maintain_ratio']   = TRUE;
	        $config['width']            = $width;
	        $config['height']           = $height;
	        $this->image_lib->initialize($config);
	        $this->image_lib->resize();
	        $this->image_lib->clear();
	    }
	}		
}