<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class lead extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('uid') == '') {
			redirect(base_url());
		}
	}
	
	function index() {
		$data['pageTitle']="View Lead";
		$data['title']="View Lead";
		$this->load->helper('form');
		$this->load->model('lead_model');	
		$filter['WHERE']="(lead.lead_status != '1')";
		$data['lead']=$this->lead_model->get_lead('','','','','',$filter);
		$activity_count=$this->lead_model->get_activity_count();
		$new_arr=array();
		foreach ($activity_count as $key=>$value) {
			$new_arr[$value['lead_id']]=$value['act_cnt'];
		}	
        $data['new_arr']=$new_arr;
		$data['contant']=$this->load->view('lead_list',$data,true);
		$this->load->view('master',$data);			
	}
	
	function add_lead() {
		$data['pageTitle']="Add Lead";
		$data['title']="Add Lead";
		$this->load->helper('form');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['employee']=$this->user_model->get_employee();
		$filter['WHERE']="(lead_status_id != '1' AND lead_status_id != '5')";
		$data['lead_status']=$this->lead_model->get_lead_status($filter);
		$data['lead_source']=$this->lead_model->get_lead_source();
		$data['product']=$this->lead_model->get_product();
		$data['lead']=$this->lead_model->get_lead();
		$data['contant']=$this->load->view('lead_addform',$data,true);
		$this->load->view('master',$data);		
	}
	
	function edit_lead($people_id) {
		$data['pageTitle']="Edit Lead";
		$data['title']="Edit Lead";
		$this->load->helper('form');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['employee']=$this->user_model->get_employee();
		$data['lead_status']=$this->lead_model->get_lead_status();
		$data['lead_source']=$this->lead_model->get_lead_source();
		$data['product']=$this->lead_model->get_product();
		$data['edit_people']=$this->lead_model->get_lead('',$people_id);
		$data['contant']=$this->load->view('lead_addform',$data,true);
		$this->load->view('master',$data);		
	}

	function search_lead() {
		$data['pageTitle']="View Lead";
		$data['title']="View Lead";
		$this->load->helper('form');
		$this->load->model('lead_model');	
		$name=$this->input->post('name');
		$mobile=$this->input->post('mobile');
		$lead_owner=$this->input->post('lead_owner');
		$data['lead']=$this->lead_model->get_lead('','',$name,$mobile,$lead_owner);
		$data['contant']=$this->load->view('lead_list',$data,true);
		$this->load->view('master',$data);			
	}
	
	function save_lead() {
		//dsm($this->input->post()); die;
		$lead_id=$this->input->post('lead_id');
		$p_id=$this->input->post('p_id');
		
		$this->load->model('user_model');
		$this->load->model('lead_model');
		$this->load->model('people_model');
		if($p_id) {
			//dsm($this->input->post()); die;
			$res=$this->people_model->add_new_people($p_id);
			if($res) {
				$updated_at	= date('Y-m-d H:i:s');
				$lead_owner=$this->input->post('lead_owner');
				$lead_source=$this->input->post('lead_source');
				$lead_status=$this->input->post('lead_status');
				$created_by=$this->session->userdata('uid');	
				$companyid = $this->session->userdata('companyid');				
				$product=$this->input->post('product');
				$str="";
				if(!empty($product)) {
					foreach($product as $key) {
						 $str .= ",".$key;
					}
				}
				$product=substr($str,1);				
				$lead_data = array(
					'companyid'=>$companyid,
					'people_id'=>$p_id,
					'lead_owner'=>$lead_owner,
					'lead_source'=>$lead_source,
					'lead_status'=>$lead_status,
					'product'=>$product,
					'created_by'=>$created_by,
					'updated_at'=>$updated_at
				);
				$res1=$this->lead_model->update_lead($lead_data,$lead_id);			
				$this->session->set_flashdata('success','lead edited successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}				
		}
		else {
			$email=$this->input->post('email');
			$chk_email=$this->lead_model->chekemail($email);
			if(empty($chk_email)) {
				$people_id=$this->people_model->add_new_people();
			}
			else {
				$people_id=$chk_email[0]['people_id'];
			}
			if($people_id) {
				$companyid = $this->session->userdata('companyid');
				$created_at	= date('Y-m-d H:i:s');
				$lead_owner=$this->input->post('lead_owner');
				$lead_source=$this->input->post('lead_source');
				$lead_status=$this->input->post('lead_status');
				$created_by=$this->session->userdata('uid');
				$product=$this->input->post('product');
				$str="";
				if(!empty($product)) {
					foreach($product as $key) {
						 $str .= ",".$key;
					}
				}
				$product=substr($str,1);
				$lead_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'lead_owner'=>$lead_owner,
					'lead_source'=>$lead_source,
					'lead_status'=>$lead_status,
					'product'=>$product,
					'created_by'=>$created_by,
					'created_at'=>$created_at
				);
				$res=$this->lead_model->add_lead($lead_data);				
				$this->session->set_flashdata('success','New Lead added successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}
		}
	}
	
	function lead_detail($lead_id) {
		$data['pageTitle']="Lead Detail";
		$this->load->model('lead_model');	
		$this->load->model('project_model');	
		$data['lead_detail']=$this->lead_model->get_lead($lead_id);
		$data['activity']=$this->lead_model->get_lead_activity($lead_id);
		$data['files']=$this->project_model->get_file($lead_id);
		$data['title']=$data['lead_detail'][0]['company_name'];	
		$data['contant']=$this->load->view('lead_detail',$data,true);
		$this->load->view('master',$data);	
	}
	
	function del_lead() {
		$this->load->model('lead_model');
		$people_id=$this->input->post('id');
		$delquery = $this->lead_model->del_lead($people_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Lead deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);		
	}
	
	function add_lead_activity($lead_id) {
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$this->load->model('user_model');	
		$data['lead_id']=$lead_id;
		$data['employee']=$this->user_model->get_employee();
		$data['lead_status']=$this->lead_model->get_lead_status();		
		$data['project_status']=$this->project_model->get_project_status();		
		$this->load->view('add_activityform',$data);	
	}
	
	function edit_lead_activity($activity_id) {
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');		
		$data['employee']=$this->user_model->get_employee();
		$data['lead_status']=$this->lead_model->get_lead_status();	
		$data['activity']=$this->lead_model->get_lead_activity('',$activity_id);
		$data['project_status']=$this->project_model->get_project_status();	
		$data['lead_id']=$data['activity'][0]['lead_id'];
		$this->load->view('add_activityform',$data);
	}	
	
	function save_activity() {
		//dsm($this->input->post()); die;
		$activity_id=$this->input->post('activity_id');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('activity_owner', 'Activity Owner', 'required');
		$this->form_validation->set_rules('activity_title', 'Activity Title', 'required');
		$this->form_validation->set_rules('datetime', 'Activity Date', 'required');
		$this->form_validation->set_rules('lead_status', 'Lead Status', 'required');
		$this->form_validation->set_rules('comment', 'Comment', 'required');
		$this->form_validation->set_rules('activity_type', 'Activity Type', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}
		else {		
			$lead_id=$this->input->post('lead_id');
			$activity_owner=$this->input->post('activity_owner');
			$activity_title=$this->input->post('activity_title');
			$datetime=$this->input->post('datetime')." ".date('H:i:s');
			$lead_status=$this->input->post('lead_status');
			$comment=$this->input->post('comment');
			$activity_type=$this->input->post('activity_type');
			$activity_data=array(
				'lead_id'=>$lead_id,
				'activity_owner'=>$activity_owner,
				'activity_title'=>$activity_title,
				'datetime'=>$datetime,
				'lead_status'=>$lead_status,
				'activity_type'=>$activity_type,
				'comment'=>$comment,
				'created_by'=>$this->session->userdata('uid'),
			);
			if($activity_id) {
				$data['activity']=$this->lead_model->get_lead_activity('',$activity_id);
				if($this->session->userdata('uid')!=$data['activity'][0]['created_by'] || $this->session->userdata('emp_id')!=$data['activity'][0]['activity_owner']) {	
					set_message('Access denied! No authority to edit');
					redirect_back();
					die;
				}	
				$activity_data['updated_at']=date('Y-m-d H:i:s');
				$this->db->trans_begin();
				$res=$this->lead_model->update_lead_activity($activity_data,$activity_id);
		
				if($res) {
					$lead_data=array('updated_at'=>date('Y-m-d H:i:s'));
					$this->lead_model->update_lead($lead_data,$lead_id);
					
					if ($this->db->trans_status() === FALSE)
					{
						$this->db->trans_rollback();
						set_message('Something went wrong');
						redirect_back();				
					}
					else
					{
						$this->db->trans_commit();
						print_last_query();die;
						set_message('Activity Edited Successfully','success');
						redirect_back();	
					}						
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}
			}
			else {
				$activity_data['created_at']=date('Y-m-d H:i:s');
				$this->db->trans_begin();
				$res=$this->lead_model->add_lead_activity($activity_data);
				if($res) {
					$lead_data=array('updated_at'=>date('Y-m-d H:i:s'));
					$this->lead_model->update_lead($lead_data,$lead_id);
					
					if ($this->db->trans_status() === FALSE)
					{
						$this->db->trans_rollback();
						set_message('Something went wrong');
						redirect_back();				
					}
					else
					{
						$this->db->trans_commit();
						set_message('Activity Added Successfully','success');
						redirect_back();	
					}					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}
			}
		}
	}
	
	function del_lead_activity() {
		$this->load->model('lead_model');
		$id=$this->input->post('id');
		$delquery = $this->lead_model->del_lead_activity($id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Lead Activity deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);			
	}
	
	function product() {
		$this->load->model('lead_model');
		$data['pageTitle']="View Product";
		$data['title']="View Product";
		$data['product']=$this->lead_model->get_product();
		$data['contant']=$this->load->view('lead_product',$data,true);
		$this->load->view('master',$data);				
	}
	
	function add_product($product_id=false) {
		$this->load->model('lead_model');
		if($product_id) {
			$filter['product_id =']=$product_id;
			$data['product']=$this->lead_model->get_product($filter);
			$this->load->view('add_product',$data);			
		}
		else {
			$this->load->view('add_product');		
		}
	}
	
	function save_product() {
		//dsm($this->input->post()); die;
		$this->load->model('lead_model');
		$product_id=$this->input->post('product_id');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('product_title', 'Product', 'required|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('price', 'Product Price', 'regex_match[/^[0-9]$/]');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}
		$product_title=$this->input->post('product_title');
		$price=$this->input->post('price');
		$note=$this->input->post('note');
		$companyid=$this->session->userdata('companyid');
		$product_data=array(
			'companyid'=>$companyid,
			'product_title'=>$product_title,
			'price'=>$price,
			'note'=>$note,
		);
		if($product_id) {
			$res=$this->lead_model->update_product($product_data,$product_id);
			if($res) {
				set_message('Product edited successfully.', 'success');
				redirect_back();
			}
			else {
				set_message('Something went wrong.');
				redirect_back();				
			}			
		}
		else {
			$product_data['created_at']=date('Y-m-d H:i:s');
			$res=$this->lead_model->add_product($product_data);
			if($res) {
				set_message('Product added successfully.', 'success');
				redirect_back();
			}
			else {
				set_message('Something went wrong.');
				redirect_back();				
			}
		}
	}
	
	function del_product() {
		$this->load->model('lead_model');
		$product_id=$this->input->post('id');
		$del_query=$this->lead_model->delete_product($product_id);
		if($del_query) {
			$return=array("status"=>"1","message"=>"Product(s) deleted successfully.");
		}
		else {
			$return=array("status"=>"0","message"=>"Something went wrong.");
		}
		echo json_encode($return);
	}
	
	function search_product() {
		$data['pageTitle']="View Product";
		$data['title']="View Product";	
		$this->load->model('lead_model');
		$product_title=$this->input->post('product_title');
		$price=$this->input->post('price');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');
		$filter=array();
		if($product_title!='') {
			$filter['WHERE']="product_title like '%".$product_title."%'";
		}
		if($price!='') {
			$filter['price =']=$price;
		}
		if($from_date!='') {
			$filter['created_at >=']=$from_date;
		}
		if($to_date!='') {
			$filter['created_at <=']=$to_date;
		}
		$data['product']=$this->lead_model->get_product($filter);
		$data['contant']=$this->load->view('lead_product',$data,true);
		$this->load->view('master',$data);
	}
}
