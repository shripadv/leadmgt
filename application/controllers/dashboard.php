<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class dashboard extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('uid') == '') {
			redirect(base_url());
		}
	}
	
	function index() {
		$data['pageTitle']="Dashboard";
		$data['title']="Dashboard";
		$this->load->model('dashboard_model');
		$this->load->model('company_model');
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$this->load->model('user_model');
		$this->load->model('invoice_model');
		$data['company']=$this->company_model->get_companies();
		$data['user']=$this->user_model->get_companies_user();
		$data['cnttotal']=$this->user_model->count_customer();
		$data['cntinvoice']=$this->invoice_model->count_invoice();
		$data['total_paidamount']=$this->invoice_model->sum_paidamount();
		$data['total_amount']=$this->invoice_model->sum_totalamount();
		$data['outstanding']=$data['total_amount']-$data['total_paidamount'];
		if($this->session->userdata('role') == 'employee' || $this->session->userdata('role') == 'user') {
			$people_id=$this->user_model->get_companies_user($this->session->userdata('uid'));
			$emp_id=$this->user_model->get_employee('','','','','','','',$this->session->userdata($people_id[0]['people_id']));
			$data['leadtotal']=$this->lead_model->count_lead();
			$data['myleadtotal']=$this->lead_model->count_lead($this->session->userdata('uid'));
			$data['projecttotal']=$this->project_model->count_project();
			$data['myprojecttotal']=$this->project_model->count_project($emp_id[0]['emp_id']);
			$filter=array();
			$filter['LIMIT']=array(10,0);
			$filter['ORDER_BY']=array('lead.updated_at'=>'desc');
			$data['lead_data']=$this->lead_model->get_lead(false,false,false,false,false,$filter);
			$activity_count=$this->lead_model->get_activity_count();
			$new_arr=array();
			foreach ($activity_count as $key=>$value) {
				$new_arr[$value['lead_id']]=$value['act_cnt'];
			}	
			$data['new_arr']=$new_arr;
		}
		$data['contant']=$this->load->view('dashboard',$data,true);
		$this->load->view('master',$data);
	}
	
	function get_old_record() {
		$client=$this->db->get('customer')->result_array();
		foreach($client as $row) {
			$name=explode(" ",$row['cperson']);
			if(isset($name[1])) {
				$lname=$name[1];
			}
			else {
				$lname="";
			}			
			$people_data = array(
				'company_name'=>$row['cust_name'],
				'first_name'=>$name[0],
				'last_name'=>$lname,
				'email'=>$row['cust_email'],
				'mobile'=>$row['cust_mobile'],
				'website'=>$row['note'],
				'address1'=>$row['cust_address'],
				'state'=>'maharashatra',
				'country'=>'india',
				'created_at'=>$row['created_at'],
				'updated_at'=>$row['updated_at']				
			);	
			$this->db->insert('people',$people_data);
			$people_id=$this->db->insert_id();
			$cust_data = array(
				'custid'=>$row['custid'],
				'companyid'=>$row['companyid'],
				'people_id'=>$people_id,
				'created_at'=>$row['created_at'],
				'updated_at'=>$row['updated_at']
			);	
			$this->db->insert('new_customer',$cust_data);
		}
		echo "Data Inserted";
	}
	
	function file_upload() {
		$this->load->model('dashboard_model');
		$this->load->model('user_model');
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$data['customer']=$this->user_model->get_customer();
		$data['project']=$this->project_model->get_project();
		$data['employee']=$this->user_model->get_employee();
		$data['lead']=$this->lead_model->get_lead();
		$this->load->view('file_addform',$data);
	}
	
	function save_file() {
		//dsm($this->input->post());
		//dsm($_FILES);
		$this->load->model('dashboard_model');
		$this->load->model('user_model');
		$this->load->model('lead_model');
		$this->load->model('project_model');
		
		$lead_id=$this->input->post('lead_id');
		$custid=$this->input->post('custid');
		$project_id=$this->input->post('project_id');
		$emp_id=$this->input->post('emp_id');
		$file_title=$this->input->post('file_title');
		if($_FILES['file']['name'][0]!='') {
			/* file upload*/
			
			$file=$_FILES['file'];
			$count=count($file['name']);
			for($i=0;$i<$count;$i++) {
				$ext_file=trim(strtolower(pathinfo($file['name'][$i],PATHINFO_EXTENSION)));
				$valid_files=array('png','jpg','jpeg','gif','doc','docx','ppt','pptx','xls','xlsx','pdf','txt','zip','sql','csv','psd','tar','tgz','html','rtf','json');
				
				$file_name=$file['name'][$i];
				$file_size=$_FILES['file']['size'][$i];
				
				if(in_array($ext_file,$valid_files)) {
					if($file_title[$i]!='') {
						$filetitle=$file_title[$i];								
					}
					else {
						$filetitle=$file['name'][$i];	
					}
					if($lead_id) {
						$lead=$this->lead_model->get_lead($lead_id);
						$name=$lead[0]['first_name']." ".$lead[0]['last_name'];
						$this->check_dir($name);
						$folder='./upload/'.$name;
						$upload=$folder.'/'.$file_name;
						$storepath='upload/'.$name.'/'.$file_name;						
					}
					if($custid) {
						$customer=$this->user_model->get_customer($custid);
						$name=$customer[0]['first_name']." ".$customer[0]['last_name'];
						$this->check_dir($name);
						$folder='./upload/'.$name;
						$upload=$folder.'/'.$file_name;
						$storepath='upload/'.$name.'/'.$file_name;					
					}
					if($project_id) {
						$project=$this->project_model->get_project($project_id);
						$name=$project[0]['project_title'];
						$this->check_dir($name);
						$folder='./upload/'.$name;
						$upload=$folder.'/'.$file_name;
						$storepath='upload/'.$name.'/'.$file_name;					
					}
					if($emp_id) {
						$employee=$this->user_model->get_employee($emp_id);
						$name=$employee[0]['first_name']." ".$employee[0]['last_name'];
						$this->check_dir($name);
						$folder='./upload/'.$name;
						$upload=$folder.'/'.$file_name;
						$storepath='upload/'.$name.'/'.$file_name;					
					}				

					if(move_uploaded_file($file['tmp_name'][$i],$upload)) {
						$file_data=array(
							'companyid'=>$this->session->userdata('companyid'),
							'lead_id'=>$lead_id,
							'client_id'=>$custid,
							'project_id'=>$project_id,
							'emp_id'=>$emp_id,
							'file_title'=>$filetitle,
							'file_path'=>$storepath,
							'file_type'=>$ext_file,
							'file_size'=>$file_size,
							'created_at'=>date('Y-m-d H:i:s'),
							'upload_by'=>$this->session->userdata('uid'),
						);		
						$res1=$this->project_model->save_file($file_data);
						set_message('<b>'.$file_name.'</b> uploaded successfully.','success');
					}
					else {
						set_message('<b>'.$file_name.'</b> is not uploaded, Something went wrong.');
					}
				}	
				else {
					set_message('<b>'.$file_name.'</b> is not valid file, you can upload only <b>'.implode(', ',$valid_files).'</b>.');
				}
			}
		}
		redirect_back();
	}

	function file_view() {
		$data['pageTitle']="File List";
		$data['title']="File List";	
		$this->load->model('dashboard_model');
		$this->load->model('user_model');
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$data['customer']=$this->user_model->get_customer();
		$data['project']=$this->project_model->get_project();
		$data['employee']=$this->user_model->get_employee();
		$data['lead']=$this->lead_model->get_lead();		
		$data['files']=$this->dashboard_model->get_files();
		//dsm($data['files']); die;
		$data['contant']=$this->load->view('view_file',$data,true);
		$this->load->view('master',$data);		
	}

	function search_file() {
		$data['pageTitle']="File List";
		$data['title']="File List";
		$this->load->model('dashboard_model');
		$this->load->model('user_model');
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$data['customer']=$this->user_model->get_customer();
		$data['project']=$this->project_model->get_project();
		$data['employee']=$this->user_model->get_employee();
		$data['lead']=$this->lead_model->get_lead();	
		
		$emp_id=$this->input->post('emp_id');		
		$client_id=$this->input->post('client_id');
		$lead_id=$this->input->post('lead_id');
		$project_id=$this->input->post('project_id');
		$file_title=$this->input->post('file_title');
		$file_type=$this->input->post('file_type');
		$from_date=$this->input->post('from_date');		
		$to_date=$this->input->post('to_date');		
		$filter=array();
		if(!empty($from_date) && $from_date!='') {
			$filter['file.created_at >=']=$from_date;
		}
		if(!empty($to_date) && $to_date!='') {
			$filter['file.created_at <=']=$to_date;
		}		
		if($file_title!='') {
			$filter['WHERE']="file.file_title like '%".$file_title."%'";
		}
		if($file_type!='') {
			$filter['WHERE']="file.file_type like '%".$file_type."%'";
		}
		if($emp_id!='') {
			$filter['file.emp_id =']=$emp_id;
		}	
		if($client_id!='') {
			$filter['file.client_id =']=$client_id;
		}		
		if($lead_id!='') {
			$filter['file.lead_id =']=$lead_id;
		}		
		if($project_id!='') {
			$filter['file.project_id =']=$project_id;
		}		
		$data['files']=$this->dashboard_model->get_files($filter);
		//dsm($data['files']); die;
		$data['contant']=$this->load->view('view_file',$data,true);
		$this->load->view('master',$data);	
	}		
	
	function check_dir($name) {
		$referer=$_SERVER['HTTP_REFERER'];
		$server=parse_url($referer);
		/* main upload folder */
		if(!file_exists('./upload') || !is_dir('./upload')) {
			mkdir("./upload");
		}
		
		/* folder of project */
		$document_path='./upload/'.$name;
		if(!file_exists($document_path) || !is_dir($document_path)) {
			mkdir($document_path);
		}	
	}	
}
