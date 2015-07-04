<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class expense extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('role') != 'user' && $this->session->userdata('role') != 'admin' ) {
			redirect(base_url().'dashboard');
		}			
	}

	public function index() {
		$this->view_expense();
	}

	public function add_expensetype() {
		$this->load->view('expensetype_addform');		
	}

	public function save_expensetype(){
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('title', 'Title', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect(base_url().'expense/view_expensetype');
		}	
		else {
			$extid=$this->input->post('extid');
			$companyid=$this->session->userdata('companyid');
			$title=strtoupper($this->input->post('title'));			
			$note=$this->input->post('note');
			if($extid) {
				$updated_at=date('Y-m-d H:i:s');		
				$data = array(
					'title'=>$title,
					'companyid'=>$companyid,
					'note'=>$note,
					'updated_at'=>$updated_at
				);
				$this->db->where('extid',$extid);
				$res=$this->db->update('expense_type',$data);
				if($res){
					$this->session->set_flashdata('success','Expense Type edited successfully');
					redirect(base_url().'expense/view_expensetype');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'expense/view_expensetype');
				}				
			}
			else {
				$created_at=date('Y-m-d H:i:s');		
				$data = array(
					'title'=>$title,
					'companyid'=>$companyid,
					'note'=>$note,
					'created_at'=>$created_at
				);	
				$res=$this->db->insert('expense_type',$data);
				if($res){
					$this->session->set_flashdata('success','Expense Type added successfully');
					redirect(base_url().'expense/view_expensetype');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'expense/view_expensetype');
				}	
			}		
		}	
	}

	public function view_expensetype(){
		$data['pageTitle']="Expense Head List";
		$data['title']="Expense Head List";
		$this->load->model('expense_model');
		$data['expensetype']=$this->expense_model->get_expensetype_detail();
		$data['contant']=$this->load->view('expensetype_list',$data,true);
		$this->load->view('master',$data);		
	}	

	public function search_etype() {
		$data['pageTitle']="Expense Head List";
		$data['title']="Expense Head List";
		$title=$this->input->post('title');
		$this->load->model('expense_model');
		$data['expensetype']=$this->expense_model->get_expensetype_detail('',$title);
		$data['contant']=$this->load->view('expensetype_list',$data,true);
		$this->load->view('master',$data);		
	}

	public function edit_etype($extid) {
		/*$exid=$this->input->post('exid');*/
		$this->load->model('expense_model');
		$expensetype=$this->expense_model->get_expensetype_detail($extid);
		$json['status']="0";
		if(count($expensetype)>0) {
			$json['status']="1";
			$data['edit_etype']=$expensetype[0];
			$json['view']=$this->load->view('expensetype_addform',$data,true);
		}
		else {
			$json['view']= "Something went wrong";	
		}	
		echo json_encode($json);			
	}

	public function delete_etype() {
		$this->load->model('expense_model');
		$del_id=$this->input->post('id');
		$data = array(
			'deleted_at'=>date('Y-m-d h:i:s')		
		);
		
		$delquery = $this->expense_model->delete_expensetype($data,$del_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Expense Type deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);			
	}

	public function add_expense() {
		$this->load->model('expense_model');
		$data['expensetype']=$this->expense_model->get_expensetype_detail();
		$this->load->view('expense_addform',$data);		
	}	

	public function save_expense(){
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('extid', 'Title', 'required');
		$this->form_validation->set_rules('payment_type', 'Payment Type', 'required');
		$this->form_validation->set_rules('amount', 'Amount', 'required');
		$this->form_validation->set_rules('date', 'Date', 'required');

		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect(base_url().'expense/view_expense');
		}	
		else {
			$exid=$this->input->post('exid');
			$companyid=$this->session->userdata('companyid');
			$extid=$this->input->post('extid');
			$payment_type=$this->input->post('payment_type');
			$ref_no=$this->input->post('ref_no');
			$amount=$this->input->post('amount');
			$date=$this->input->post('date');
			$branch_id=$this->input->post('branch_id');
			$note=$this->input->post('note');
			if($exid) {
				$updated_at=date('Y-m-d H:i:s');		
				$data = array(
					'extid'=>$extid,
					'companyid'=>$companyid,
					'payment_type'=>$payment_type,
					'ref_no'=>$ref_no,
					'amount'=>$amount,
					'date'=>$date,
					'note'=>$note,
					'updated_at'=>$updated_at
				);	
				$this->db->where('exid',$exid);
				$res=$this->db->update('expenses',$data);				
				if($res){
					$this->session->set_flashdata('success','Expense edited successfully');
					redirect(base_url().'expense/view_expense');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'expense/view_expense');
				}					
			}
			else {
				$created_at=date('Y-m-d H:i:s');		
				$data = array(
					'extid'=>$extid,
					'companyid'=>$companyid,
					'payment_type'=>$payment_type,
					'ref_no'=>$ref_no,
					'amount'=>$amount,
					'date'=>$date,
					'note'=>$note,
					'created_at'=>$created_at
				);	
				$res=$this->db->insert('expenses',$data);
				if($res){
					$this->session->set_flashdata('success','Expense added successfully');
					redirect(base_url().'expense/view_expense');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'expense/view_expense');
				}
			}			
		}	
	}

	public function view_expense(){
		$data['pageTitle']="Expense List";
		$data['title']="Expense List";
		$this->load->model('expense_model');
		$data['expense']=$this->expense_model->get_expense_detail();
		$data['expensetype']=$this->expense_model->get_expensetype_detail();
		$data['contant']=$this->load->view('expense_list',$data,true);
		$this->load->view('master',$data);		
	}

	public function search_expense() {
		$data['pageTitle']="Expense List";
		$data['title']="Expense List";

		$extid=$this->input->post('extid');
		$payment_type=$this->input->post('payment_type');
		$ref_no=$this->input->post('ref_no');
		$amount=$this->input->post('amount');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');

		if($this->session->userdata('role')=='operator') {
			$branch_id=$this->session->userdata('branch_id');
		}
		else {
			$branch_id=$this->input->post('branch_id');
		}	

		$this->load->model('expense_model');
		$data['expense']=$this->expense_model->get_expense_detail('',$extid,$payment_type,$ref_no,$amount,$from_date,$to_date,$branch_id);
		$data['expensetype']=$this->expense_model->get_expensetype_detail();
		$data['contant']=$this->load->view('expense_list',$data,true);
		$this->load->view('master',$data);		
	}

	public function edit_expense($exid) {
		/*$exid=$this->input->post('exid');*/
		$this->load->model('expense_model');
		$data['expensetype']=$this->expense_model->get_expensetype_detail();
		$expense=$this->expense_model->get_expense_detail($exid);
		$json['status']="0";
		if(count($expense)>0) {
			$json['status']="1";
			$data['edit_expense']=$expense[0];
			$json['view']=$this->load->view('expense_addform',$data,true);
		}
		else {
			$json['view']= "Something went wrong";	
		}	
		echo json_encode($json);			
	}	

	public function delete_expense() {
		$this->load->model('expense_model');
		$del_id=$this->input->post('id');
		$data = array(
			'deleted_at'=>date('Y-m-d h:i:s')		
		);
		$delquery = $this->expense_model->delete_expense($data,$del_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Expense deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);			
	}

	public function view_expensereport() {
		$this->load->model('expense_model');
		$data['expense']=$this->expense_model->get_expense_detail();		
		$this->load->view('print_expense_report',$data);	
	}
}	