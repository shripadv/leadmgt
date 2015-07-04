<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class dashboard_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}	
	
	function save_file($file_data) {
		return $this->db->insert('file',$file_data);
	}	

	function get_files($filter=false) {
		if($this->session->userdata('role') != 'admin') {
			$this->db->where('file.companyid',$this->session->userdata('companyid'));
		}	
		if($filter!='') {
			apply_filter($filter);
		}
		$this->db->select('file.*,p1.first_name as lead_fname,p1.last_name as lead_lname,p2.first_name as client_fname,p2.last_name as client_lname,p3.first_name as emp_fname,p3.last_name as emp_lname,project.project_title,p4.first_name as user_fname,p4.last_name as user_lname');
		$this->db->join('project','project.project_id=file.project_id','left');
		$this->db->join('lead','lead.lead_id=file.lead_id','left');
		$this->db->join('people p1','lead.people_id=p1.people_id','left');
		$this->db->join('customer','customer.custid=file.client_id','left');
		$this->db->join('people p2','customer.people_id=p2.people_id','left');	
		$this->db->join('employee','employee.emp_id=file.emp_id','left');
		$this->db->join('people p3','employee.people_id=p3.people_id','left');	
		$this->db->join('users','users.uid=file.upload_by','left');
		$this->db->join('people p4','users.people_id=p4.people_id','left');			
		$rs=$this->db->get('file');
		return $rs->result_array();		
	}
	function get_state() {
		$this->db->select('StateName');	
	  	$query = $this->db->get('state');
	 	return $query->result_array();       
	}

	function get_country() {
		$this->db->select('country_name');
	  	$query = $this->db->get('countries');
	 	return $query->result_array();       
	}			
}