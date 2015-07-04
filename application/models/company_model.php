<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class company_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}	
	
	function add_company($data) {
		return $this->db->insert('company',$data);
	}

	function update_company($data,$companyid) {
		$this->db->where('companyid',$companyid);
		return $this->db->update('company',$data);
	}

	function delete_company($data,$del_id) {
		$this->db->where_in('companyid',$del_id);
		return $this->db->update('company',$data);
	}	
	
	function get_companies($companyid=false,$companyname=false,$short_name=false,$cmobile=false,$from_date=false,$to_date=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('company.companyid',$this->session->userdata('companyid'));
		}
		if($companyid!='') {
			$this->db->where("company.companyid",$companyid);
 		}		
		if($companyname!='') {
			$this->db->like("company.companyname",$companyname);
 		} 	
		if($short_name!='') {
			$this->db->like("company.shortname",$short_name);
 		} 
		if($cmobile!='') {
			$this->db->where("company.cmobile",$cmobile);
 		} 		
		if($from_date!='') {
			$this->db->where('date(company.establishdate) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(company.establishdate) <=',$to_date);
		} 	
		$this->db->where('company.deleted_at IS NULL', null, false);
		$rs=$this->db->get('company');
		return $rs->result_array();		
	}

	function get_modules() {
		return $this->db->get('modules')->result_array();
	}
	function get_company_modules($filter=false) {
		if($filter!='') {
			apply_filter($filter);
		}
		$this->db->join('modules','modules.module_id=company_modules.module_id');
		$res=$this->db->get('company_modules');
		return  $res->result_array();
	}

	function add_company_module($module_data) {
		return $this->db->insert('company_modules',$module_data);
	}	
}