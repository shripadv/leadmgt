<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class payment_model extends CI_Model {

	public function __construct() {
		parent::__construct();
	}

	public function get_payments($filter=false) {
		/* apply filter for query */
		if($filter) {
			apply_filter($filter);	
		}

		$this->db->select('payment_received.*,people.last_name,people.company_name,invoice.invoice_no,invoice.total_amount as invoice_amount,invoice.bill_date as invoice_date');
		$this->db->where('payment_received.companyid',$this->session->userdata('companyid'));
		$this->db->join('invoice','payment_received.inid=invoice.inid','left');
		$this->db->join('customer','invoice.custid=customer.custid','left');
		$this->db->join('people','customer.people_id=people.people_id');
		$rs=$this->db->get('payment_received');
		$result=$rs->result_array();
		return $result;
	}
}