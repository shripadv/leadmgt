<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class people_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}
	
	function add_new_people($p_id=false) {
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('first_name', 'Name', 'required|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('last_name', 'Name', 'required|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('company_name', 'company name', 'min_length[1]|max_length[100]');
		$this->form_validation->set_rules('mobile', 'Mobile', 'regex_match[/^[0-9]{10}$/]');
		$this->form_validation->set_rules('email', 'Email', 'valid_email');
		$this->form_validation->set_rules('address1', 'Address', 'required|min_length[1]|max_length[200]');
		$this->form_validation->set_rules('city', 'city', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}	
		else {
			$first_name = strtoupper($this->input->post('first_name'));
			$last_name = strtoupper($this->input->post('last_name'));
			$company_name = strtoupper($this->input->post('company_name'));
			$email = $this->input->post('email');
			$sec_email = $this->input->post('sec_email');
			$mobile = $this->input->post('mobile');
			$phone = $this->input->post('phone');
			$website = $this->input->post('website');
			$skype = $this->input->post('skype');
			$industry = $this->input->post('industry');
			$address1 = $this->input->post('address1');
			$address2 = $this->input->post('address2');
			$city = $this->input->post('city');
			$state = $this->input->post('state');
			$country = $this->input->post('country');
			$note = $this->input->post('note');		
			if($this->session->userdata('role')!='admin') {
				$companyid = $this->session->userdata('companyid');
			}
			else {
				$companyid = $this->input->post('companyid');
			}
			
			$people_data = array(
				'company_name'=>$company_name,
				'first_name'=>$first_name,
				'last_name'=>$last_name,
				'email'=>$email,
				'sec_email'=>$sec_email,
				'mobile'=>$mobile,
				'phone'=>$phone,
				'website'=>$website,
				'skype'=>$skype,
				'industry'=>$industry,
				'address1'=>$address1,
				'address2'=>$address2,
				'city'=>$city,
				'state'=>$state,
				'country'=>$country,
				'note'=>$note
			);	
			if($p_id) {
				$updated_at	= date('Y-m-d H:i:s');
				$people_data['updated_at']=$updated_at;			
				$this->db->where('people_id',$p_id);
				$res=$this->db->update('people',$people_data);
				return $res;
			}
			else {
				$created_at	= date('Y-m-d H:i:s');
				$people_data['created_at']=$created_at;
				$this->db->insert('people',$people_data);
				$people_id=$this->db->insert_id();	
				return $people_id;
			}
		}	
	}
}	