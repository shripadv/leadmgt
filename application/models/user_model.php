<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class user_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}	
	
	function add_user($user_data) {
		return $this->db->insert('users',$user_data);
	}	

	function update_user($user_data,$uid) {
		$this->db->where('uid',$uid);
		return $this->db->update('users',$user_data);
	}
	
	function delete_people($del_id) {
		$this->db->where_in('people_id',$del_id);
		return $this->db->delete('people');
	}
	
	function delete_user($data,$del_id) {
		$this->db->where_in('people_id',$del_id);
		return $this->db->delete('customer');
	}
	
	function get_companies_user($uid=false,$companyid=false,$name=false,$mobile=false,$from_date=false,$to_date=false,$people_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('users.companyid',$this->session->userdata('companyid'));
		}	
		if($uid!='') {
			$this->db->where("users.uid",$uid);
		}
		if($people_id!='') {
			$this->db->where("people.people_id",$people_id);
		}
		if($companyid!='') {
			$this->db->where("users.companyid",$companyid);
 		} 	
		if($name!='') {
			$this->db->like("users.name",$name);
 		} 
		if($mobile!='') {
			$this->db->where("users.mobile",$mobile);
 		} 		
		if($from_date!='') {
			$this->db->where('date(users.dob) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(users.dob) <=',$to_date);
		} 
		$this->db->select('users.*,company.companyname,people.*');
		$this->db->from('users');
		$this->db->join('company','company.companyid=users.companyid');
		$this->db->join('people','people.people_id=users.people_id');
		$this->db->where('users.deleted_at IS NULL', null, false);
		$rs=$this->db->get();
		return $rs->result_array();		
	}	
	function chk_email($email) {
		$this->db->where("email",$email);
		$this->db->where('deleted_at IS NULL', null, false);
		$row=$this->db->get('users');
		return $row->num_rows();	
	}
	function add_customer($cust_data) {
		return $this->db->insert('customer',$cust_data);
	}	
	
	function update_customer($cust_data,$custid) {
		$this->db->where('custid',$custid);
		return $this->db->update('customer',$cust_data);
	}

	function delete_customer($del_id) {
		$this->db->where_in('people_id',$del_id);
		return $this->db->delete('customer');
	}
	
	function get_customer($custid=false,$companyid=false,$name=false,$mobile=false,$limit=false,$people_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('customer.companyid',$this->session->userdata('companyid'));
		}
		if($custid!='') {
			$this->db->where("customer.custid",$custid);
		}
		if($people_id!='') {
			$this->db->where("people.people_id",$people_id);
		}
		if($companyid!='') {
			$this->db->where("customer.companyid",$companyid);
 		} 	
		if($name!='') {
			$this->db->like("people.first_name",$name);
			$this->db->or_like("people.last_name",$name);
			$this->db->or_like("people.email",$name);
 		} 
		if($mobile!='') {
			$this->db->like("people.mobile",$mobile);
 		} 
		if($limit!='') {
			$this->db->limit($limit);
			$this->db->order_by('customer.custid','desc');
 		} 		
		$this->db->select('customer.*,company.companyname,people.*');
		$this->db->from('customer');
		$this->db->join('company','company.companyid=customer.companyid');
		$this->db->join('people','people.people_id=customer.people_id');
		$this->db->where('customer.deleted_at IS NULL', null, false);
		$rs=$this->db->get();
		return $rs->result_array();		
	}	
	function count_customer() {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('customer.companyid',$this->session->userdata('companyid'));
		}	
		$this->db->select('count(customer.custid) as cnt');
		$this->db->from('customer');
		$this->db->join('company','company.companyid=customer.companyid');
		$this->db->where('customer.deleted_at IS NULL', null, false);
		$rs=$this->db->get();
		return (array)$rs->row(1);		
	}	
	
	function add_employee($emp_data) {
		return $this->db->insert('employee',$emp_data);
	}

	function update_employee($emp_data,$emp_id) {
		$this->db->where('emp_id',$emp_id);
		return $this->db->update('employee',$emp_data);
	}

	function delete_employee($del_id) {
		$this->db->where_in('people_id',$del_id);
		return $this->db->delete('employee');
	}

	function get_employee($emp_id=false,$companyid=false,$name=false,$mobile=false,$from_date=false,$to_date=false,$limit=false,$people_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('employee.companyid',$this->session->userdata('companyid'));
		}
		if($emp_id!='') {
			$this->db->where("employee.emp_id",$emp_id);
		}
		if($people_id!='') {
			$this->db->where("people.people_id",$people_id);
		}
		if($companyid!='') {
			$this->db->where("employee.companyid",$companyid);
 		} 	
		if($name!='') {
			$this->db->like("people.first_name",$name);
			$this->db->or_like("people.last_name",$name);
			$this->db->or_like("people.email",$name);
 		} 
		if($mobile!='') {
			$this->db->like("people.mobile",$mobile);
 		} 
		if($limit!='') {
			$this->db->limit($limit);
			$this->db->order_by('employee.emp_id','desc');
 		} 
		if($from_date!='') {
			$this->db->where('date(employee.dob) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(employee.dob) <=',$to_date);
		} 		
		$this->db->select('employee.*,company.companyname,people.*');
		$this->db->from('employee');
		$this->db->join('company','company.companyid=employee.companyid');
		$this->db->join('people','people.people_id=employee.people_id');
		$this->db->join('users','users.people_id=people.people_id');
		$this->db->where('users.role !=','admin');
		$rs=$this->db->get();
		return $rs->result_array();		
	}	

	function add_user_module($user_module){
		return $this->db->insert('user_module',$user_module);
	}

	function get_user_modules($filter=false) {
		if($filter!='') {
			apply_filter($filter);
		}
		$this->db->join('modules','modules.module_id=user_module.module_id');
		$res=$this->db->get('user_module');
		return  $res->result_array();
	}		
}