<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class user extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('role') != 'user' && $this->session->userdata('role') != 'admin' ) {
			redirect(base_url().'dashboard');
		}		
	}
	
	function add_user() {
		$data['pageTitle']="Add User";
		$data['title']="Add User";
		$this->load->model('company_model');
		$this->load->helper('form');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['company']=$this->company_model->get_companies();
		$data['contant']=$this->load->view('userform',$data,true);
		$this->load->view('master',$data);	
	}	

	function save_user() {
		//dsm($this->input->post()); die;
		$p_id=$this->input->post('p_id');
		$uid=$this->input->post('uid');
		$cmodules=$this->input->post('cmodules');
		$this->load->model('user_model');
		$this->load->model('people_model');
		if($p_id) {
			$res=$this->people_model->add_new_people($p_id);
			if($res) {	
				$companyid = $this->input->post('companyid');
				$dob = $this->input->post('dob');
				$updated_at	= date('Y-m-d H:i:s');
				$user_data = array(
					'companyid'=>$companyid,
					'dob'=>$dob,
					'updated_at'=>$updated_at
				);
				$res1=$this->user_model->update_user($user_data,$uid);	
				if(isset($cmodules) && !empty($cmodules)) {
					$filter['user_module.uid']=$uid;
					$oldmodules=$this->user_model->get_user_modules($filter);
					$oldmodules=array_column($oldmodules,'module_id');
					foreach ($cmodules as $key => $value) {
						if(in_array($value,$oldmodules)) {
							$key_to_remove=array_search($value, $oldmodules);
							unset($oldmodules[$key_to_remove]);
						}
						else {
							$user_module=array(
								'uid'=>$uid,
								'module_id'=>$value,
							);
							$res2=$this->user_model->add_user_module($user_module);					
						}
					}
					foreach($oldmodules as $key=>$value) {
						$this->db->where('module_id',$value);
						$this->db->where('uid',$uid);
						$this->db->delete('user_module');
					}									
				}						
				$this->session->set_flashdata('success','User edited successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}			
		}
		else {
			$password = $this->input->post('password');
			$cfpassword = $this->input->post('cfpassword');
			if($password!=$cfpassword) {
				set_message('Password not matched!');
				redirect_back();
				die;
			}
			$people_id=$this->people_model->add_new_people();
			if($people_id) {
				$companyid = $this->input->post('companyid');
				$password = $this->input->post('password');
				$email = $this->input->post('email');
				$dob = $this->input->post('dob');
				$cmodules = $this->input->post('cmodules');
				$role = 'user';
				$created_at	= date('Y-m-d H:i:s');
				$user_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'password'=>md5($password),
					'temp'=>$password,
					'role'=>$role,
					'dob'=>$dob,
					'email'=>$email,
					'created_at'=>$created_at
				);
				$res1=$this->user_model->add_user($user_data);
				$uid=$this->db->insert_id();	
				$emp_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'created_at'=>$created_at
				);
				$res=$this->user_model->add_employee($emp_data);
				if(isset($cmodules) && !empty($cmodules)) {
					foreach ($cmodules as $key => $value) {
						$user_module=array(
							'uid'=>$uid,
							'module_id'=>$value,
						);
						$res2=$this->user_model->add_user_module($user_module);
					}
				}				
				set_message('New User added successfully','success');
				redirect_back();
			}
			else {
				set_message('Somthing went wrong');
				redirect_back();
			}
		}					
	}
		
	function view_user() {
		$data['pageTitle']="Company User Details";
		$data['title']="Company User Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();
		$this->load->model('user_model');
		$this->load->helper('form');
		$data['user']=$this->user_model->get_companies_user();
		$data['contant']=$this->load->view('user_list',$data,true);
		$this->load->view('master',$data);		
	}
	
	function edit_user($p_id) {
		$data['pageTitle']="Edit User";
		$data['title']="Edit User";
		$this->load->model('user_model');
		$this->load->helper('form');	
		$this->load->model('company_model');
		$this->load->model('dashboard_model');
		$company['company_modules.companyid']=$this->session->userdata('uid');
		$data['modules']=$this->company_model->get_company_modules();
		$user=$this->user_model->get_companies_user(false,false,false,false,false,false,$p_id);
		$filter['user_module.uid']=$user[0]['uid'];
		$edit_modules=$this->user_model->get_user_modules($filter);
		$new_modules=array();
		foreach ($edit_modules as $key => $value) {
			$new_modules[$value['module_id']]=$value;
		}
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['company']=$this->company_model->get_companies();		
		$data['edit_people']=$this->user_model->get_companies_user('','','','','','',$p_id);
		$data['edit_people']['edit_modules']=$new_modules;
		//dsm($data['edit_people']['edit_modules']);	
		$data['contant']=$this->load->view('userform',$data,true);
		$this->load->view('master',$data);		
	}

	function del_user() {
		$this->load->model('user_model');
		$del_id=$this->input->post('id');
		$delquery = $this->user_model->delete_people($del_id);
		if($delquery) {
			$delquery1 = $this->user_model->delete_user($del_id);
			$return=array("status"=>'1',"message"=>"User deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);		
	}
	
	function search_user() {
		$data['pageTitle']="Company User Details";
		$data['title']="Company User Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();
		$this->load->model('user_model');
		$this->load->helper('form');
		$companyid=$this->input->post('companyid');
		$name=$this->input->post('name');
		$mobile = $this->input->post('mobile');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');			
		$data['user']=$this->user_model->get_companies_user('',$companyid,$name,$mobile,$from_date,$to_date);
		$data['contant']=$this->load->view('user_list',$data,true);
		$this->load->view('master',$data);		
	}

	function add_client() {
		$data['pageTitle']="Add Client";
		$data['title']="Add Client";
		$this->load->model('user_model');
		$this->load->helper('form');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['contant']=$this->load->view('customer_addform',$data,true);
		$this->load->view('master',$data);	
	}
	
	function edit_client($p_id) {
		$data['pageTitle']="Edit Client";
		$data['title']="Edit Client";	
		$this->load->model('user_model');
		$this->load->helper('form');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['edit_people']=$this->user_model->get_customer('','','','','',$p_id);
		$data['contant']=$this->load->view('customer_addform',$data,true);
		$this->load->view('master',$data);		
	}	
	
	function del_client() {
		$this->load->model('user_model');
		$del_id=$this->input->post('id');
		$delquery = $this->user_model->delete_people($del_id);
		if($delquery) {
			$delquery1 = $this->user_model->delete_customer($del_id);
			$return=array("status"=>'1',"message"=>"Client deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);		
	}	
	
	function save_customer() {
		//dsm($this->input->post()); die;
		$custid=$this->input->post('custid');
		$p_id=$this->input->post('p_id');
		$this->load->model('user_model');
		$this->load->model('people_model');
		if($p_id) {
			$res=$this->people_model->add_new_people($p_id);
			if($res) {
				$updated_at	= date('Y-m-d H:i:s');
				$cust_data = array(
					'updated_at'=>$updated_at
				);
				$res1=$this->user_model->update_customer($cust_data,$custid);			
				$this->session->set_flashdata('success','Customer edited successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}			
		}
		else {
			$people_id=$this->people_model->add_new_people();
			if($people_id) {
				$companyid = $this->session->userdata('companyid');
				$created_at	= date('Y-m-d H:i:s');
				$cust_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'created_at'=>$created_at
				);
				$res1=$this->user_model->add_customer($cust_data);	
				set_message('New Customer added successfully','success');
				redirect_back();
			}
			else {
				set_message('Somthing went wrong');
				redirect_back();
			}
		}			
	}
	function view_client() {
		$data['pageTitle']="Client Details";
		$data['title']="Client Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();		
		$this->load->model('user_model');
		$this->load->helper('form');
		$data['customer']=$this->user_model->get_customer();
		$data['contant']=$this->load->view('customer_list',$data,true);
		$this->load->view('master',$data);		
	}

	function search_client() {
		$data['pageTitle']="Client Details";
		$data['title']="Client Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();
		$this->load->model('user_model');
		$this->load->helper('form');
		$companyid=$this->input->post('companyid');
		$name=$this->input->post('name');
		$mobile = $this->input->post('mobile');		
		$data['customer']=$this->user_model->get_customer('',$companyid,$name,$mobile);
		$data['contant']=$this->load->view('customer_list',$data,true);
		$this->load->view('master',$data);		
	}	
	
	function add_employee() {
		$data['pageTitle']="Add Employee";
		$data['title']="Add Employee";
		$this->load->model('user_model');
		$this->load->helper('form');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['contant']=$this->load->view('employee_addform',$data,true);
		$this->load->view('master',$data);	
	}	
	
	function save_employee() {
		//dsm($this->input->post()); die;
		$emp_id=$this->input->post('emp_id');
		$p_id=$this->input->post('p_id');
		
		$this->load->model('user_model');
		$this->load->model('people_model');
		if($p_id) {
			//dsm($this->input->post()); die;
			$res=$this->people_model->add_new_people($p_id);
			if($res) {
				$updated_at	= date('Y-m-d H:i:s');
				$join_date=$this->input->post('join_date');
				$dob=$this->input->post('dob');
				$designation=$this->input->post('designation');				
				$emp_data = array(
					'join_date'=>$join_date,
					'dob'=>$dob,
					'designation'=>$designation,				
					'updated_at'=>$updated_at
				);
				$res1=$this->user_model->update_employee($emp_data,$emp_id);			
				$this->session->set_flashdata('success','Employee edited successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}				
		}
		else {
			$people_id=$this->people_model->add_new_people();
			if($people_id) {
				$companyid = $this->session->userdata('companyid');
				$created_at	= date('Y-m-d H:i:s');
				$join_date=$this->input->post('join_date');
				$dob=$this->input->post('dob');
				$designation=$this->input->post('designation');
				
				$emp_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'join_date'=>$join_date,
					'dob'=>$dob,
					'designation'=>$designation,
					'created_at'=>$created_at
				);
				$res=$this->user_model->add_employee($emp_data);	

				$companyid = $this->session->userdata('companyid');
				$password = $this->input->post('password');
				$email = $this->input->post('email');
				$dob = $this->input->post('dob');
				$role = 'employee';
				$created_at	= date('Y-m-d H:i:s');
				$user_data = array(
					'companyid'=>$companyid,
					'people_id'=>$people_id,
					'password'=>md5($password),
					'temp'=>$password,
					'role'=>$role,
					'dob'=>$dob,
					'email'=>$email,
					'created_at'=>$created_at
				);
				$res1=$this->user_model->add_user($user_data);				
				$this->session->set_flashdata('success','New Employee and User added successfully');
				redirect_back();
			}
			else {
				$this->session->set_flashdata('error','Somthing went wrong');
				redirect_back();
			}
		}
	}
	
	function del_employee() {
		$this->load->model('user_model');
		$del_id=$this->input->post('id');
		$delquery = $this->user_model->delete_people($del_id);
		if($delquery) {
			$delquery1 = $this->user_model->delete_employee($del_id);
			$return=array("status"=>'1',"message"=>"Employee deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);		
	}
	
	function view_employee() {
		$data['pageTitle']="Employee Details";
		$data['title']="Employee Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();		
		$this->load->model('user_model');
		$this->load->helper('form');
		$data['employee']=$this->user_model->get_employee();
		$data['contant']=$this->load->view('employee_list',$data,true);
		$this->load->view('master',$data);		
	}	
	
	function edit_employee($p_id) {
		$data['pageTitle']="Edit Employee";
		$data['title']="Edit Employee";	
		$this->load->model('user_model');
		$this->load->helper('form');
		$this->load->model('dashboard_model');
		$data['sel_state']=$this->dashboard_model->get_state();	
		$data['sel_country']=$this->dashboard_model->get_country();			
		$data['edit_people']=$this->user_model->get_employee('','','','','','','',$p_id);
		$data['contant']=$this->load->view('employee_addform',$data,true);
		$this->load->view('master',$data);		
	}	
	
	function search_employee() {
		$data['pageTitle']="Employee Details";
		$data['title']="Employee Details";
		$this->load->model('company_model');
		$data['company']=$this->company_model->get_companies();		
		$this->load->model('user_model');
		$this->load->helper('form');
		$data['employee']=$this->user_model->get_employee('',$companyid,$name,$mobile,$from_date,$to_date);
		$data['contant']=$this->load->view('employee_list',$data,true);
		$this->load->view('master',$data);	
	}	
}