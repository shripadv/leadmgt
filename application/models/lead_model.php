<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class lead_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}

	function get_lead_status($filter=false) {
		if($filter!='') {
			apply_filter($filter);
		}		
		$this->db->order_by('rank','asc');
		$res=$this->db->get('lead_status');
		return $res->result_array();	
	}
	
	function get_lead_source() {
		$res=$this->db->get('lead_source');
		return $res->result_array();
	}
	
	function get_product($filter=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('product.companyid',$this->session->userdata('companyid'));
		}	
		if($filter!='') {
			apply_filter($filter);
		}
		$res=$this->db->get('product');
		return $res->result_array();
	}	
	
	function add_lead($lead_data) {
		return $this->db->insert('lead',$lead_data);
	}

	function update_lead($lead_data,$lead_id) {
		$this->db->where('lead_id',$lead_id);
		return $this->db->update('lead',$lead_data);	
	}
	
	function get_lead($lead_id=false,$people_id=false,$name=false,$mobile=false,$lead_owner=false,$filter=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('lead.companyid',$this->session->userdata('companyid'));
		}	
		if($filter!='') {
			apply_filter($filter);
		}
		if($lead_id!='') {
			$this->db->where('lead.lead_id',$lead_id);
		}
		if($people_id!='') {
			$this->db->where('p1.people_id',$people_id);
		}
		if($name!='') {
			$this->db->like('p1.first_name',$name);
			$this->db->or_like('p1.last_name',$name);
		}
		if($mobile!='') {
			$this->db->where('p1.mobile',$mobile);
		}
		if($lead_owner!='') {
			$this->db->like('p2.first_name',$lead_owner);
			$this->db->or_like('p2.last_name',$lead_owner);
		}		
		$this->db->select('lead.*,p1.*,lead_source.*,lead_status.*,employee.*,p2.first_name as emp_first,p2.last_name as emp_secound,lead.people_id as lead_people,lead.updated_at as lupdate,lead.created_at as lcreatedate');	
		//, count(activity_id) as act_cnt
		$this->db->join('people p1','p1.people_id=lead.people_id');	
		$this->db->join('lead_source','lead_source.lead_source_id=lead.lead_source');	
		$this->db->join('lead_status','lead_status.lead_status_id=lead.lead_status');	
		$this->db->join('product','product.product_id=lead.product','left');	
		$this->db->join('employee','lead.lead_owner=employee.emp_id');
		$this->db->join('people p2','p2.people_id=employee.people_id');
		$res=$this->db->get('lead');
		return $res->result_array();	
	}
	
	function get_activity_count() {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('lead.companyid',$this->session->userdata('companyid'));
		}	
		$this->db->select('count(activity.activity_id) as act_cnt,lead.lead_id');	
		$this->db->join('activity','activity.lead_id=lead.lead_id','left');
		$this->db->group_by('activity.lead_id');
		$res=$this->db->get('lead');
		return $res->result_array();		
	}
	
	function get_lead_activity($lead_id=false,$activity_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('lead.companyid',$this->session->userdata('companyid'));
		}		
		if($lead_id!='') {
			$this->db->where('lead.lead_id',$lead_id);
		}
		if($activity_id!='') {
			$this->db->where('activity.activity_id',$activity_id);
		}
		$this->db->select('lead.*,p1.*,lead_status.lead_status as lead_status_title,lead_status.color,product.*,employee.*,p2.first_name as emp_first,p2.last_name as emp_secound,activity.*');
		$this->db->join('lead','activity.lead_id=lead.lead_id');
		$this->db->join('people p1','p1.people_id=lead.people_id');		
		$this->db->join('lead_status','lead_status.lead_status_id=activity.lead_status');	
		$this->db->join('product','product.product_id=lead.product','left');	
		$this->db->join('employee','activity.activity_owner=employee.emp_id');
		$this->db->join('people p2','p2.people_id=employee.people_id');
		$this->db->order_by('activity.activity_id','desc');
		$res=$this->db->get('activity');
		return $res->result_array();		
	}
	
	function add_lead_activity($activity_data) {
		$this->db->insert('activity',$activity_data);
		return $this->update_leadstatus($activity_data['lead_id'],$activity_data['lead_status']);
	}
	
	function update_lead_activity($activity_data,$activity_id) {
		$this->db->where('activity_id',$activity_id);
		if($this->db->update('activity',$activity_data)) {
			$rs=$this->db->query("select activity_id from activity where lead_id=? order by activity_id desc limit 0,1",array($activity_data['lead_id']));
			$result_array=$rs->result_array();
			if(!isset($result_array[0])) {
				return false;
			}
			$result_array=$result_array[0];
			if($result_array['activity_id'] == $activity_id) {
				return $this->update_leadstatus($activity_data['lead_id'],$activity_data['lead_status']);	
			}
			return true;
		}
		else {
			return false;
		}
	}	
	
	function del_lead_activity($id) {
		$this->db->where('activity_id',$id);
		return $this->db->delete('activity');		
	}
	
	function del_lead($people_id) {
		$this->db->where_in('people_id',$people_id);
		return $this->db->delete('lead');		
	}
	
	function count_lead($lead_owner=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('lead.companyid',$this->session->userdata('companyid'));
		}	
		if($lead_owner!='') {
			$this->db->where('lead_owner',$lead_owner);
		}
		$this->db->select('count(*) as cnt');
		$res=$this->db->get('lead');
		return (array)$res->row(1);	
	}
	
	function chekemail($email=false) {
		if($email!='') {
			$this->db->where('email',$email);
		}
		$this->db->join('customer','people.people_id=customer.people_id');
		$res=$this->db->get('people');
		return $res->result_array();
	}

	/* update lead status, this function is called when any activity is add or update */
	function update_leadstatus($lead_id,$status_id) {
		//dsm(func_get_args());die;
		$this->db->where("lead_id",$lead_id);
		return $this->db->update('lead',array('lead_status'=>$status_id));
	}
	
	/* function to add new product */
	function add_product($product_data) {
		return $this->db->insert('product',$product_data);
	}
	
	/* function to update existing product */ 
	function update_product($product_data,$product_id) {
		$this->db->where('product_id',$product_id);
		return $this->db->update('product',$product_data);
	}
	
	/* function to delete existing product */
	function delete_product($product_id) {
		$this->db->where_in('product_id',$product_id);
		return $this->db->delete('product');
	}
}