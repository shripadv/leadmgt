<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class expense_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}

	function get_expensetype_detail($extid=false,$title=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('expense_type.companyid',$this->session->userdata('companyid'));
		}
		if($this->session->userdata('role')=='operator') {
			$this->db->where('expense_type.branch_id',$this->session->userdata('branch_id'));
		}		
		if($title!='') {
			$this->db->like("expense_type.title",$title);
 		}
		if($extid!='') {
			$this->db->where("expense_type.extid",$extid);
 		}
		$this->db->select('expense_type.*');
		$this->db->from('expense_type');
		$this->db->where('expense_type.deleted_at IS NULL', null, false);		
	  	$query = $this->db->get();
	  	return $query->result_array();  				
	}

	function delete_expensetype($data,$del_id) {
		$this->db->where_in('expense_type.extid',$del_id);
		$this->db->where('expense_type.companyid',$this->session->userdata('companyid'));
		return $this->db->update('expense_type', $data); 
	}

    function get_expense_detail($exid=false,$extid=false,$payment_type=false,$ref_no=false,$amount=false,$from_date=false,$to_date=false,$branch_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('expenses.companyid',$this->session->userdata('companyid'));
		}	
		if($this->session->userdata('role')=='operator') {
			$this->db->where('expenses.brid',$this->session->userdata('branch_id'));
		}
		if($exid!='') {
			$this->db->where("expenses.exid",$exid);
 		}
		if($branch_id!='') {
			$this->db->where("expenses.brid",$branch_id);
		}
		if($payment_type!='') {
			$this->db->where("expenses.payment_type",$payment_type);
 		}
		if($extid!='') {
			$this->db->where("expenses.extid",$extid);
 		}
		if($amount!='') {
			$this->db->where("expenses.amount",$amount);
 		}
		if($ref_no!='') {
			$this->db->where("expenses.ref_no",$ref_no);
 		} 	
		if($from_date!='') {
			$this->db->where('date(expenses.date) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(expenses.date) <=',$to_date);
		}
		$this->db->select('expenses.*,expense_type.title as extTitle');
		$this->db->from('expenses');
		$this->db->join('expense_type','expenses.extid=expense_type.extid');
		$this->db->where('expenses.deleted_at IS NULL', null, false);	
	  	$query = $this->db->get();		
	  	return $query->result_array();		
	}

	function delete_expense($data,$del_id) {
		$this->db->where_in('expenses.exid',$del_id);
		$this->db->where('expenses.companyid',$this->session->userdata('companyid'));
		return $this->db->update('expenses', $data); 
	}	
}