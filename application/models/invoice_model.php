<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class invoice_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}
	
	function add_tax($tax_data) {
		return $this->db->insert('tax',$tax_data);
	}
	
	function update_tax($tax_data,$taxid) {
		$this->db->where('taxid',$taxid);
		$companyid=$this->session->userdata('companyid');
		$this->db->where('companyid',$companyid);
		return $this->db->update('tax',$tax_data);
	}
	
	function del_tax($tax_data,$taxid) {
		$this->db->where_in('taxid',$taxid);
		return $this->db->update('tax',$tax_data);
	}	
	
	function get_tax($taxid=false,$title=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('tax.companyid',$this->session->userdata('companyid'));
		}
		if($taxid!="") {
			$this->db->where('taxid',$taxid);
		}
		if($title!="") {
			$this->db->like('name',$title);
		}		
		$this->db->where('tax.deleted_at IS NULL', null, false);
		$rs=$this->db->get('tax');
		return $rs->result_array();
	}
	
	function get_invoice_item($initid=false,$inid=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('customer.companyid',$this->session->userdata('companyid'));
		}
		if($initid!='') {
			$this->db->where("invoice_item.initid",$initid);
 		} 
		
		if($inid) {
			$this->db->where("invoice.inid",$inid);
		}

		$this->db->select('invoice_item.*');
		$this->db->from('invoice_item');
		$this->db->where('invoice_item.deleted_at is null');
		$this->db->join('invoice','invoice.inid=invoice_item.inid');
		$this->db->join('customer','customer.custid=invoice.custid');
		$rs=$this->db->get();
		return $rs->result_array();
	}	
	
	function add_invoice($in_data) {
		return $this->db->insert('invoice',$in_data);
	}

	function add_invoiceitem($data) {
		return $this->db->insert('invoice_item',$data);
	}
	
	function update_invoice($in_data,$inid) {
		$this->db->where('inid',$inid);
		$companyid=$this->session->userdata('companyid');
		$this->db->where('companyid',$companyid);
		return $this->db->update('invoice',$in_data);
	}

	function update_invoice_item($data,$initid) {
		$companyid=$this->session->userdata('companyid');
		$where="";
		$set="";
		foreach($data as $col=>$val) {
			$set.=" invoice_item.".$col." = '".$val."' ,";
		}
		$set=rtrim($set,' ,');
		$sql="update invoice_item 
			join invoice on invoice.inid=invoice_item.inid
			set ".$set." where invoice.companyid=? and invoice_item.initid=?";
		return $this->db->query($sql,array($companyid,$initid));
	}	
	
	function del_invoice($inid) {
		$this->db->where_in('inid',$inid);
		$companyid=$this->session->userdata('companyid');
		$this->db->where('invoice.companyid',$companyid);
		$this->db->trans_begin();
		$this->db->delete('invoice');
		$this->del_invoice_items($inid);
		$this->db->query("delete from payment_received where inid in (?) and companyid=?",array(implode(',',$inid),$companyid));
		if ($this->db->trans_status() === FALSE) {
			 $this->db->trans_rollback();
			return false;
		}
		else {
			$this->db->trans_commit();
			return true;
		}


	}

	/* delete all item of invoice */
	function del_invoice_items($inid) {
		$companyid=$this->session->userdata('companyid');

		if(is_array($inid)) {
			$inid=implode(',',$inid);
		}

		return $this->db->query('delete `invoice_item` from invoice_item 
		left join invoice on invoice_item.inid=invoice.inid 
		where invoice_item.inid in (?) and invoice.companyid=?',array($inid,$companyid));
		
	}

	/* delete single item from invoice */
	function del_invoice_item($initid,$inid=false) {
		$companyid=$this->session->userdata('companyid');
		$inid_condition="";

		if($inid) {
			$inid_condition=" and invoice_item.inid='".$inid."'";
		}

		if(is_array($initid)) {
			$initid=implode(',',$initid);
		}

		$sql='delete `invoice_item` from invoice_item 
		left join invoice on invoice_item.inid=invoice.inid 
		where invoice_item.initid in (?) '.$inid_condition.' and invoice.companyid=?';

		$rs=$this->db->query($sql,array($initid,$companyid));

		return $rs;
	}	
	
	function get_invoice($filter=false) {
		if($filter) {
			apply_filter($filter);
		}

		$this->db->where('invoice.companyid',$this->session->userdata('companyid'));
		$this->db->select('invoice.*,customer.custid,people.first_name,people.last_name,people.company_name,people.email,people.mobile,people.address1,people.address2,sum(payment_received.amount) as paid_amount');
		$this->db->join('customer','customer.custid=invoice.custid');
		$this->db->join('people','customer.people_id=people.people_id');
		$this->db->join('payment_received','invoice.inid=payment_received.inid','left');
		$this->db->order_by('invoice.created_at desc');
		$this->db->group_by('invoice.inid');
		$rs=$this->db->get('invoice');
		return $rs->result_array();
	}
	
	function get_invoice_detail($inid) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('customer.companyid',$this->session->userdata('companyid'));
		}
		if($inid) {
			$this->db->where('invoice.inid',$inid);
			$this->db->where('invoice_item.inid',$inid);
		}
		$this->db->select('invoice.*,invoice_item.*,customer.*,people.*,company.*');
		$this->db->from('invoice');
		$this->db->join('customer','customer.custid=invoice.custid');
		$this->db->join('people','customer.people_id=people.people_id');
		$this->db->join('company','customer.companyid=company.companyid');
		$this->db->join('invoice_item','invoice_item.inid=invoice.inid');
		$this->db->order_by('invoice_item.reimbursement','asc');
		$this->db->order_by('invoice_item.tax_id','asc');
		$this->db->order_by('invoice_item.initid','asc');
		$rs=$this->db->get();
		return $rs->result_array();
	}
	
	function get_last_inid() {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('invoice.companyid',$this->session->userdata('companyid'));
		}
		//$this->db->join('customer','customer.custid=invoice.custid');
		$this->db->order_by("invoice.inid", "desc"); 
		$this->db->limit(1);
		$rs=$this->db->get('invoice');
		return $rs->result_array();		
	}
	
	function get_service($serviceid=false,$title=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('service.companyid',$this->session->userdata('companyid'));
		}
		if($serviceid!="") {
			$this->db->where('serviceid',$serviceid);
		}
		if($title!="") {
			$this->db->like('servicename',$title);
		}		
		$this->db->where('service.deleted_at IS NULL', null, false);
		$rs=$this->db->get('service');
		return $rs->result_array();
	}	
	
	function add_service($service_data) {
		return $this->db->insert('service',$service_data);
	}
	
	function update_service($service_data,$serviceid) {
		$this->db->where('serviceid',$serviceid);
		$companyid=$this->session->userdata('companyid');
		$this->db->where('companyid',$companyid);
		return $this->db->update('service',$service_data);
	}
	
	function del_service($service_data,$serviceid) {
		$this->db->where_in('serviceid',$serviceid);
		$companyid=$this->session->userdata('companyid');
		$this->db->where('companyid',$companyid);
		return $this->db->update('service',$service_data);
	}
	
	function count_invoice() {
		$this->db->where('invoice.companyid',$this->session->userdata('companyid'));
		$this->db->select('count(invoice.inid) as cnt');
		$this->db->from('invoice');
		$this->db->join('customer','invoice.custid=customer.custid','left');
		$this->db->join('company','company.companyid=customer.companyid','left');
		$this->db->where('invoice.deleted_at IS NULL', null, false);
		$rs=$this->db->get()->result_array();
		return $rs[0]['cnt'];
	}

	function sum_totalamount() {
		$this->db->where('invoice.companyid',$this->session->userdata('companyid'));
		$this->db->select('SUM(invoice.total_amount) as cnt');
		$this->db->from('invoice');
		$rs=$this->db->get()->result_array();
		return $rs[0]['cnt'];
	}

	function sum_paidamount() {
		$this->db->where('payment_received.companyid',$this->session->userdata('companyid'));
		$this->db->select('SUM(payment_received.amount) as cnt');
		$this->db->from('payment_received');
		$rs=$this->db->get()->result_array();
		return $rs[0]['cnt'];
	}

}