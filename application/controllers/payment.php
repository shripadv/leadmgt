<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class payment extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('role') != 'user' && $this->session->userdata('role') != 'admin' ) {
			redirect(base_url().'dashboard');
		}	
	}

	function index() {
		$this->load->model('payment_model');
		$this->load->model('user_model');
		$filter=array(
			'ORDER_BY'=>array('payment_received.date'=>'desc'),
			'LIMIT'=>'50'
		);
		$data['customer_list']=$this->user_model->get_customer();
		$data['payments']=$this->payment_model->get_payments($filter);
		$data['contant']=$this->load->view('payment_view',$data,true);
		$this->load->view('master',$data);
	}

	function search_payments() {
		$this->load->model('payment_model');
		$this->load->model('user_model');
		$custid=$this->input->post('custid');
		$invoice_no=$this->input->post('invoice_no');
		$payment_type=$this->input->post('payment_type');
		$ref_no=$this->input->post('ref_no');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');

		$this->load->library('form_validation');
		$this->form_validation->set_rules('custid','integer');
		$this->form_validation->set_rules('from_date','regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');
		$this->form_validation->set_rules('to_date','regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');

		if($this->form_validation->run() == FALSE) {
			set_message("Invalid date format");
			redirect(base_url()."payment");
		}

		if($custid!='') {
			$filter['invoice.custid']=$custid;
		}

		if($invoice_no!='') {
			$filter['invoice.invoice_no']=$invoice_no;
		}

		if($payment_type!='') {
			$filter['payment_received.payment_type']=$payment_type;
		}

		if($ref_no!='') {
			$filter['payment_received.ref_no']=$ref_no;
		}

		if($from_date!='') {
			$filter['payment_received.date >= ']=$from_date;
		}

		if($to_date!='') {
			$filter['payment_received.date <= ']=$to_date;
		}

		$filter['ORDER_BY']=array('payment_received.date'=>'desc');

		$data['customer_list']=$this->user_model->get_customer();
		$data['payments']=$this->payment_model->get_payments($filter);
		$data['contant']=$this->load->view('payment_view',$data,true);
		$this->load->view('master',$data);
	}

	function add_payment($inid) {
		$this->load->model('payment_model');
		$this->load->model('invoice_model');
		$data['invoice']=$this->invoice_model->get_invoice(array('invoice.inid'=>$inid));
		if(count($data['invoice']) < 1) {
			echo "Invalid Invoice Selected";
			return 0;
			die;
		}

		$data['due_amount']=$data['invoice'][0]['total_amount'];

		$data['payments']=$this->payment_model->get_payments(array('payment_received.inid'=>$inid));
		if(count($data['payments']) > 0) { 
			$total_payment=array_sum(array_column($data['payments'],'amount'));
			$total_amount=$data['invoice'][0]['total_amount'];
			$data['due_amount']=($total_amount)-($total_payment);
		}
		$this->load->view('payment_addform',$data);
	}

	function edit_payment($prid) {
		$this->load->model('payment_model');
		$this->load->model('invoice_model');
		$data['edit_payment']=$this->payment_model->get_payments(array('payment_received.prid'=>$prid));
		if(count($data['edit_payment']) < 1) {
			echo "Invalid Payment entry Selected";
			return 0;
			die;
		}

		/* get payments of invoice */
		$data['payments']=$this->payment_model->get_payments(array('payment_received.inid'=>$data['edit_payment'][0]['inid']));

		/* calculate  */
		$data['due_amount']=$data['edit_payment'][0]['invoice_amount'];

		if(count($data['payments']) > 0) { 
			$total_payment=array_sum(array_column($data['payments'],'amount'));
			$total_amount=$data['edit_payment'][0]['invoice_amount'];
			$data['due_amount']=($total_amount)-($total_payment);
		}

		$data['due_amount']=$data['due_amount']+$data['edit_payment'][0]['amount'];
		$data['edit_payment']=$data['edit_payment'][0];
		//dsm($data);
		$this->load->view('payment_addform',$data);
	}

	function save_edit_payment() {
		$back_url=$_SERVER['HTTP_REFERER'];
		$now=date('Y-m-d H:i:s');
		$prid=$this->input->post('prid');
		$this->load->model('payment_model');
		$this->load->model('invoice_model');
		//dsm($this->input->post());die;
		$edit_payment=$this->payment_model->get_payments(array('payment_received.prid'=>$prid));
		if(count($edit_payment) < 1) {
			set_message("Invalid Payment Entry");
			redirect($back_url);
			die;
		}

		/* get payments of invoice */
		$payments=$this->payment_model->get_payments(array('payment_received.inid'=>$edit_payment[0]['inid']));

		/* calculate  */
		$due_amount=$edit_payment[0]['invoice_amount'];

		if(count($payments) > 0) { 
			$total_payment=array_sum(array_column($payments,'amount'));
			$total_amount=$edit_payment[0]['invoice_amount'];
			$due_amount=($total_amount)-($total_payment);
		}

		$due_amount=$due_amount+$edit_payment[0]['amount'];

		$this->load->library('form_validation');
		$this->form_validation->set_rules('amount','Amount','numeric|less_than['.($due_amount+1).']|required');
		$this->form_validation->set_rules('payment_type','Payment Method','required');
		$this->form_validation->set_rules('date','Payment date','required|regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');

		if($this->form_validation->run()==false) {
			set_message(validation_errors());
			redirect($back_url);
			return 0;
			die;
		}

		/* get post details */
		$insert['amount']=round($this->input->post('amount'));
		$insert['ref_no']=$this->input->post('ref_no');
		$insert['note']=$this->input->post('note');
		$insert['payment_type']=$this->input->post('payment_type');
		$insert['date']=$this->input->post('date');
		$insert['updated_at']=$now;
		$this->db->where('prid',$prid);
		$this->db->update('payment_received',$insert);
		
		set_message('Payment Edited Successfully','success');
		redirect(base_url()."payment");
	}

	function save_payment() {
		$back_url=$_SERVER['HTTP_REFERER'];
		$now=date('Y-m-d H:i:s');
		$inid=$this->input->post('inid');
		$this->load->model('payment_model');
		$this->load->model('invoice_model');
		$invoice=$this->invoice_model->get_invoice(array('invoice.inid'=>$inid));
		if(count($invoice) < 1) {
			set_message("Invalid Invoice Selected");
			redirect($back_url);
		}

		$due_amount=$invoice[0]['total_amount'];

		$payments=$this->payment_model->get_payments(array('payment_received.inid'=>$inid));
		if(count($payments) > 0) { 
			$total_payment=array_sum(array_column($payments,'amount'));
			$due_amount=($invoice[0]['total_amount'])-($total_payment);
		}

		if($due_amount < 1) {
			set_message("this invoice already paid");
			redirect($back_url);
		}

		$this->load->library('form_validation');
		$this->form_validation->set_rules('amount','Amount','numeric|less_than['.($due_amount+1).']|required');
		$this->form_validation->set_rules('payment_type','Payment Method','required');
		$this->form_validation->set_rules('date','Payment date','required|regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');

		if($this->form_validation->run()==false) {
			set_message(validation_errors());
			redirect($back_url);
			return 0;
			die;
		}

		/* get post details */
		$insert['amount']=round($this->input->post('amount'));
		$insert['ref_no']=$this->input->post('ref_no');
		$insert['note']=$this->input->post('note');
		$insert['payment_type']=$this->input->post('payment_type');
		$insert['inid']=$this->input->post('inid');
		$insert['companyid']=$this->session->userdata('companyid');
		$insert['date']=$this->input->post('date');
		$insert['created_at']=$now;
		$this->db->insert('payment_received',$insert);
		set_message('Payment Enter successfully','success');
		redirect(base_url()."payment");
	}

	function del_payment() {
		$id=$this->input->post('id');
		$id=$this->input->post('id');
		$id=$this->input->post('id');
		if($id!='') {
			$this->db->where('companyid',$this->session->userdata('companyid'));
			$this->db->where_in('prid',$id);
			if(($this->db->delete('payment_received'))) {
				$data['message']="Payment(s) Deleted successfully";
				$data['status']="1";
			}
			else {
				$data['message']="Something went wrong";
				$data['status']="0";
			}
		}
		echo json_encode($data);
	}

}