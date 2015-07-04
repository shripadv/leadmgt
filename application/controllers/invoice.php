<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class invoice extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('role') != 'user' && $this->session->userdata('role') != 'admin' ) {
			redirect(base_url().'dashboard');
		}		
	}

	function create_invoice() {
		$data['pageTitle']="Create Invoice";
		$data['title']="Create Invoice";
		$this->load->model('invoice_model');
		$this->load->helper('form');
		$this->load->model('user_model');
		$data['customer']=$this->user_model->get_customer();
		$data['tax']=$this->invoice_model->get_tax();
		$data['service']=$this->invoice_model->get_service();
		$inidrs=$this->invoice_model->get_last_inid();
		$data['inid']='001';
		if(isset($inidrs[0])) {
			$data['inid']=++$inidrs[0]['invoice_no'];	
		}
		
		$data['contant']=$this->load->view('invoiceaddform',$data,true);
		$this->load->view('master',$data);		
	}
	
	function edit_invoice($inid) {
		$data['pageTitle']="Edit Invoice";
		$data['title']="Edit Invoice";
		$this->load->model('invoice_model');
		$this->load->helper('form');
		$this->load->model('user_model');
		$data['customer']=$this->user_model->get_customer();
		$data['service']=$this->invoice_model->get_service();
		$data['tax']=$this->invoice_model->get_tax();
		$data['edit_invoice']=$this->invoice_model->get_invoice_detail($inid);
		$data['contant']=$this->load->view('invoiceaddform',$data,true);
		$this->load->view('master',$data);		
	}
	
	function save_invoice() {
		$submit=$this->input->post('submit');
		$this->load->model('invoice_model');
		$back_url=$_SERVER['HTTP_REFERER'];
		
		/* validation rules */
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('custid', 'Customer', 'required|integer');
		$this->form_validation->set_rules('invoice_no', 'Invoice No.', 'required');
		$this->form_validation->set_rules('advamount', 'Advance Amount', 'numeric');
		$this->form_validation->set_rules('bill_date', 'Bill Date', 'required|regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');
		$particular=$this->input->post('particular');
		$i=1;
		foreach($particular as $key=>$val) {
			$this->form_validation->set_rules('quantity['.$key.']', 'Item '.$i.' Quantity', 'integer|greater_than[0]|required');
			$this->form_validation->set_rules('rate['.$key.']', 'Item '.$i.' Rate', 'numeric|greater_than[0]|required');
			$this->form_validation->set_rules('amount['.$key.']', 'Item '.$i.' Amount', 'numeric|greater_than[0]|required');
			$i++;
		}
		
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			$this->session->flashdata('old_data',$this->input->post());
			redirect($back_url);
			return 0;
		}
		
		/* define variables */
		$inid=$this->input->post('inid');
		$custid=$this->input->post('custid');
		$advamount=$this->input->post('advamount');
		$invoice_no=$this->input->post('invoice_no');
		$bill_date=$this->input->post('bill_date');
		$quantity=$this->input->post('quantity');
		$rate=$this->input->post('rate');
		$amount=$this->input->post('amount');
		$reimbursement=$this->input->post('reimbursement');
		$companyid=$this->session->userdata('companyid');
		$total_amount=0;
		$tax_rate_arr=$this->input->post('tax_amount');
		$tax_array=$this->input->post('tax');
		$payment_type=$this->input->post('payment_type');
		$payment_amount=$this->input->post('payment_amount');
		$deleted_item=$this->input->post('deleted_item');
		$tax_array_count=count($tax_array);
		$tax_amount_array=array();
		$service_tax='';
		$reimbursement_amount=array();
		$reimbursement_total=0;
		
		/* calculate total amount and reimbursement amount */
		foreach($amount as $key=>$val) {
			if(isset($reimbursement[$key]) && $reimbursement[$key]!='') {
				$reimbursement_total+=$val;
			}
			else {
				$total_amount+=$val;
			}
		};
		$ctotal_amount=$total_amount;
		
		/* total amount and service tax calculation */
		if($tax_array_count > 0 && is_array($tax_array)) {
			foreach($tax_array as $val=>$value) {
				if($service_tax=='') {
					$tax_det=$this->invoice_model->get_tax($val,"service tax");
					$service_tax=$total_amount*($tax_rate_arr[$val]/100);
					$tax_amount_array[$val]=round($service_tax);
				}
				else {
					$tax_amount_array[$val]=round($service_tax*($tax_rate_arr[$val]/100));
				}
				$ctotal_amount+=$tax_amount_array[$val];
			}
		}

		/* add  reimbursement amount to grand total */
		$ctotal_amount+=round($reimbursement_total);

		/* start transaction */
		$this->db->trans_begin();

		/* update invoice */
		if($inid) {
			/* get old record */
			$rs_invoice=$this->invoice_model->get_invoice(array('invoice.inid'=>$inid));

			/*get payment of invoice*/
			$this->load->model('payment_model');
			$payments=$this->payment_model->get_payments(array('payment_received.inid'=>$inid));
			if(count($payments) > 0) { 
				$total_payment=array_sum(array_column($payments,'amount'));
				if($total_payment > round($ctotal_amount)) {
					set_message("You cannot reduce the invoice total below the amount paid.<br/>If you entered a payment by mistake, you can edit it in your payment history.");
					redirect($back_url);
				}
			}
			


			/* delete invoice items which is removed */
			if($deleted_item!='') {
				$deleted_item=rtrim($deleted_item,',');
				$deleted_array=explode(',', $deleted_item);
				$this->invoice_model->del_invoice_item($deleted_array,$inid);
			}
			
			/* update record of invoice */
			$updated_at	= date('Y-m-d H:i:s');
			$in_data=array(
				'invoice_no' =>$invoice_no,
				'custid' =>$custid,
				'companyid'=>$companyid,
				'total_amount'=>round($ctotal_amount),
				'bill_date' =>$bill_date,
				'updated_at' =>$updated_at
			);
			
			$res=$this->invoice_model->update_invoice($in_data,$inid);
			$initid=$this->input->post('initid');
			$invoice_items=$this->invoice_model->get_invoice_item(false,$inid);
			$item_count=count($invoice_items);
			if($item_count > 0) {
				$intids=array_column($invoice_items,'initid');
			}
			
			/* add invoice items */
			foreach($particular as $i=>$per) {
				$reimb=0;
				if(isset($reimbursement[$i]) && $reimbursement[$i]=='1') {
					$reimb=1;
				}
				$partdata=array(
					'inid'=>$inid,
					'particular'=>$particular[$i],
					'quantity' =>$quantity[$i],
					'rate' =>$rate[$i],
					'reimbursement'=>$reimb,
					'amount' => round($quantity[$i]*$rate[$i]),
					'updated_at' =>$updated_at
				);
				if($item_count < 1) {
					$res1=$this->invoice_model->add_invoiceitem($partdata);
				}
				else {
					if(in_array($i,$intids)) {
						$res1=$this->invoice_model->update_invoice_item($partdata,$i);
					}
					else {
						$res1=$this->invoice_model->add_invoiceitem($partdata);
					}
				}
			}

			/* add tax to invoice item */
			if($tax_array_count > 0 && is_array($tax_array)) {
				foreach($tax_array as $key=>$value) {
					if(strpos($key,'_') === false) {
						$val=$key;
						$tax_id=$key;
					}
					else {
						$key_arr=explode('_',$key);
						/* invoice item id */
						$val=$key_arr[0];
						/* tax id */
						$tax_id=$key_arr[1];
					}
					
					$tax_det=$this->invoice_model->get_tax($tax_id);
					$taxdata=array(
						'inid'=> $inid,
						'particular'=>$tax_det[0]['name'].' '.$tax_rate_arr[$key].'%',
						'quantity' =>'1',
						'rate' =>$tax_rate_arr[$key],
						'tax_id'=> $tax_id,	
						'amount' => round($tax_amount_array[$key])
					);
					
					if(strpos($key,'_') === false) {
						$taxdata['created_at']=$updated_at;
						$res2=$this->invoice_model->add_invoiceitem($taxdata);
					}
					else {
						$taxdata['updated_at']=$updated_at;
						$res2=$this->invoice_model->update_invoice_item($taxdata,$val);
					}
				}
			}
			
			/* for deleting tax from invoice item */
			if(is_array($tax_rate_arr)) {
				foreach($tax_rate_arr as $key=>$amount) {
					if(strpos($key,'_') !== false) {
						if(!isset($tax_array[$key])) {
							$key_arr=explode('_',$key);
							$invoice_item=$key_arr[0];
							$this->del_invoice_item($invoice_item);
						}
					}
				}
			}
			
			
		}	
		else {
			$created_at	= date('Y-m-d H:i:s');	
			$payment_entry=false;
			$in_data=array(
				'invoice_no' =>$invoice_no,
				'companyid'=>$companyid,
				'custid' =>$custid,
				'total_amount' =>round($ctotal_amount),
				'bill_date' =>$bill_date,
				'created_at' =>$created_at,
				'payment_status'=>'draft'
			);

			/* set invoice status */
			if($payment_type!='' && $payment_amount!='' && is_numeric($payment_amount) && $payment_amount > 0) {
				if($payment_amount == $ctotal_amount) {
					$in_data['payment_status']="paid";
					$payment_entry=true;
				}
				elseif($payment_amount < $ctotal_amount) {
					$in_data['payment_status']="partial";
					$payment_entry=true;
				}
				else {
					set_message("Payment amount can not gratethan invoice total amount </li><li> Payment Entry Skipped, Now You have to add payment manually.");
				}
			}

			$res=$this->invoice_model->add_invoice($in_data);
			$inid=$this->db->insert_id();
			
			/* add invoice items to database */
			foreach($particular as $i=>$values) {
				$reimb=0;
				if(isset($reimbursement[$i]) && $reimbursement[$i]=='1') {
					$reimb=1;
				}
				
				$partdata=array(
					'inid'=> $inid,
					'particular'=>$particular[$i],
					'quantity' =>$quantity[$i],
					'rate' =>$rate[$i],
					'reimbursement'=>$reimb,
					'amount' => round($quantity[$i]*$rate[$i]),
					'created_at'=> $created_at
				);
				$res1=$this->invoice_model->add_invoiceitem($partdata);
			}
			
			if($tax_array_count > 0 && is_array($tax_array)) {
				foreach($tax_array as $val=>$value) {
					$tax_det=$this->invoice_model->get_tax($val);
					$taxdata=array(
						'inid'=> $inid,
						'particular'=>$tax_det[0]['name']." ".$tax_rate_arr[$val]." %",
						'quantity' =>'1',
						'rate' =>$tax_rate_arr[$val],
						'amount' => round($tax_amount_array[$val]),
						'tax_id'=> $val,	
						'created_at'=> $created_at	
					);
					$res2=$this->invoice_model->add_invoiceitem($taxdata);
				}
			}
			
			/* for advance payment */
			if($payment_entry) {
				$ref_no=$this->input->post('ref_no');
				$payment_note=$this->input->post('payment_note');
				
				$payment_data=array(
					'companyid'=>$companyid,
					'inid'=>$inid,
					'payment_type'=>$payment_type,
					'ref_no'=>$ref_no,
					'amount'=>$payment_amount,
					'date'=>$created_at,
					'note'=>$payment_note,
					'created_at'=>$created_at,
				);
				$this->db->insert('payment_received',$payment_data);
			}
		}
		
		if ($this->db->trans_status() === FALSE) {
			set_message('Something went wrong, Please Try again</li><li>'.$this->db->_error_message());
		    $this->db->trans_rollback();
			$this->session->set_flashdata('old_data',$this->input->post());
			redirect($back_url);
		}
		else {
		    $this->db->trans_commit();
		    $message='Invoice Saved successfully. <a target="_blank" href="'.base_url().'invoice/print_rec/'.$inid.'">Click Here to Print Invoice</a>';
			set_message($message,'success');
			redirect(base_url()."invoice/create_invoice");
		}
		
	}
	
	function add_taxes($tax=false) {
		$data['pageTitle']="Add New Tax";
		$data['title']="Add New Tax";
		$this->load->model('invoice_model');
		$this->load->helper('form');
		if($tax) {
			$data['edit_tax']=$this->invoice_model->get_tax($tax);
		}
		$data['tax']=$this->invoice_model->get_tax();
		$data['contant']=$this->load->view('taxform',$data,true);
		$this->load->view('master',$data);	
	}	

	function save_taxes() {
		$this->load->model('invoice_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('name', 'Tax Particular', 'required|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('tax', 'Tax', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect(base_url().'invoice/add_taxes');
			return 0;
		}	
		else {
			$taxid=$this->input->post('taxid');
			$name = strtoupper($this->input->post('name'));
			$tax = $this->input->post('tax');
			$note = $this->input->post('note');
			$companyid = $this->session->userdata('companyid');
			if($taxid) {
				$updated_at	= date('Y-m-d H:i:s');
				$len=strlen($tax);
				$pos=strpos($tax,'@');
				if($pos != $len-1) {
					$tax = $tax."@";
				}
				$tax_data = array(
					'name'=>$name,
					'tax'=>$tax,
					'note'=>$note,
					'updated_at'=>$updated_at
				);
				$res=$this->invoice_model->update_tax($tax_data,$taxid);	
				if($res) {
					$this->session->set_flashdata('success','Tax edited successfully');
					redirect(base_url().'invoice/add_taxes');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'invoice/add_taxes');
				}				
			}
			else {
				$created_at	= date('Y-m-d H:i:s');
				$len=strlen($tax);
				$pos=strpos($tax,'@');
				if($pos != $len-1) {
					$tax = $tax."@";
				}
				$tax_data = array(
					'companyid'=>$companyid,
					'name'=>$name,
					'tax'=>$tax,
					'note'=>$note,
					'created_at'=>$created_at
				);		
				$res=$this->invoice_model->add_tax($tax_data);	
				if($res) {
					$this->session->set_flashdata('success','Tax added successfully');
					redirect(base_url().'invoice/add_taxes');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'invoice/add_taxes');
				}
			}
		}
	}

	function del_taxes() {
		$this->load->model('invoice_model');
		$del_id=$this->input->post('id');
		$tax_data = array(
			'deleted_at'=>date('Y-m-d h:i:s')		
		);
		
		$delquery = $this->invoice_model->del_tax($tax_data,$del_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Tax deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);				
	}
	
	function print_rec($inid) {
		$this->load->model('invoice_model');
		$this->load->model('payment_model');
		$data['invoice']=$this->invoice_model->get_invoice_detail($inid);
		if(count($data['invoice']) > 0 && $inid!='') {
			$data['payments']=$this->payment_model->get_payments(array('invoice.inid'=>$inid));
			$data['paid_amount']=0;
			$data['due_amount']=$data['invoice'][0]['total_amount'];
			if(count($data['payments']) > 0 ) {
				$data['paid_amount']=array_sum(array_column($data['payments'],'amount'));
				$data['due_amount']-=$data['paid_amount'];
			}
			
			$this->load->view('receipt',$data);	
		}
		else {
			set_message("Invalid Invoice selected");
			redirect(base_url());
		}
	}

	function add_service($service=false) {
		$data['pageTitle']="Add New Service";
		$data['title']="Add New Service";
		$this->load->model('invoice_model');
		$this->load->helper('form');
		if($service) {
			$data['edit_service']=$this->invoice_model->get_service($service);
		}
		$data['service']=$this->invoice_model->get_service();
		$data['contant']=$this->load->view('serviceaddform',$data,true);
		$this->load->view('master',$data);	
	}

	function del_service() {
		$this->load->model('invoice_model');
		$del_id=$this->input->post('id');
		$service_data = array(
			'deleted_at'=>date('Y-m-d h:i:s')		
		);
		
		$delquery = $this->invoice_model->del_service($service_data,$del_id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Service deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);				
	}

	function save_service() {
		$this->load->model('invoice_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('servicename', 'Service Name', 'required|min_length[1]');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect(base_url().'invoice/add_service');
			return 0;
		}	
		else {
			$serviceid=$this->input->post('serviceid');
			$servicename = strtoupper($this->input->post('servicename'));
			$note = $this->input->post('note');
			$companyid = $this->session->userdata('companyid');
			if($serviceid) {
				$updated_at	= date('Y-m-d H:i:s');
				$service_data = array(
					'servicename'=>$servicename,
					'note'=>$note,
					'updated_at'=>$updated_at
				);
				$res=$this->invoice_model->update_service($service_data,$serviceid);	
				if($res) {
					$this->session->set_flashdata('success','Service edited successfully');
					redirect(base_url().'invoice/add_service');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'invoice/add_service');
				}				
			}
			else {
				$created_at	= date('Y-m-d H:i:s');
				$service_data = array(
					'companyid'=>$companyid,
					'servicename'=>$servicename,
					'note'=>$note,
					'created_at'=>$created_at
				);		
				$res=$this->invoice_model->add_service($service_data);	
				if($res) {
					$this->session->set_flashdata('success','Service added successfully');
					redirect(base_url().'invoice/add_service');
				}
				else {
					$this->session->set_flashdata('error','Somthing went wrong');
					redirect(base_url().'invoice/add_service');
				}
			}
		}
	}	
	
	function view_invoice() {
		$data['title']="Invoice Details";
		$this->load->model('dashboard_model');
		$this->load->model('company_model');
		$this->load->model('user_model');
		$this->load->model('invoice_model');
		$data['invoice']=$this->invoice_model->get_invoice();
		$data['customer_list']=$this->user_model->get_customer();
		$data['contant']=$this->load->view('view_invoice',$data,true);
		$this->load->view('master',$data);		
	}
	
	function search_invoice() {
		$custid=$this->input->post('custid');
		$payment_status=$this->input->post('payment_status');
		$invoice_no=$this->input->post('invoice_no');
		$from_date=$this->input->post('from_date');
		$to_date=$this->input->post('to_date');		
		$this->load->model('invoice_model');
		$this->load->model('user_model');

		$filter=array();

		if($custid!='') {
			$filter['invoice.custid']=$custid;
		}

		if($payment_status!='') {
			if($payment_status=='drafted') {
				$filter['HAVING']="sum(payment_received.amount) IS NULL";	
			}
			elseif($payment_status=='partial') {
				$filter['HAVING']='sum(payment_received.amount) > 0';	
				$filter['HAVING']='sum(payment_received.amount) < invoice.total_amount';	
			}
			elseif($payment_status=='paid') {
				$filter['HAVING']='sum(payment_received.amount) = invoice.total_amount';	
			}
		}

		if($invoice_no!='') {
			$filter['invoice.invoice_no']=$invoice_no;
		}

		if($from_date!='') {
			$filter['invoice.bill_date >= ']=$from_date;
		}

		if($to_date!='') {
			$filter['invoice.bill_date <= ']=$to_date;
		}
		$this->db->_protect_identifiers=false;
		$data['invoice']=$this->invoice_model->get_invoice($filter);
		$data['customer_list']=$this->user_model->get_customer();
		$data['contant']=$this->load->view('view_invoice',$data,true);
		$this->load->view('master',$data);		
	}

	function del_invoice() {
		$this->load->model('invoice_model');
		$del_id=$this->input->post('id');
		if(count($del_id) > 0) {
			$delquery = $this->invoice_model->del_invoice($del_id);
			if($delquery) {
				$return=array("status"=>'1',"message"=>"Invoice and invoice Payment Deleted successfully");	
			}
			else {
				$return=array("status"=>'0',"message"=>"Something went wrong!!");
			}
			
		}
		else {
			$return=array("status"=>'0',"message"=>"Invalid invoice Selected");
		}
		
		echo json_encode($return);				
	}
	
	function convertpdf($inid) {
		$url=base_url().'invoice/view_invoice';
		$this->load->model('invoice_model');
		$this->load->model('payment_model');
		$data['invoice']=$this->invoice_model->get_invoice_detail($inid);
		if(count($data['invoice']) > 0 && $inid!='') {
			$data['payments']=$this->payment_model->get_payments(array('invoice.inid'=>$inid));
			$data['paid_amount']=0;
			$data['due_amount']=$data['invoice'][0]['total_amount'];
			if(count($data['payments']) > 0 ) {
				$data['paid_amount']=array_sum(array_column($data['payments'],'amount'));
				$data['due_amount']-=$data['paid_amount'];
			}
			//$this->load->view('receipt_pdf', $data);
		}	
		
 	    //Load the library
	    $this->load->library('html2pdf');

	    //Load html view
	    $this->html2pdf->html($this->load->view('receipt_pdf', $data, true));

		
		/* main upload folder */
		if(!file_exists('./assets') || !is_dir('./assets')) {
			mkdir("./assets");
		}
		
		/* pdf folder of invoice */
		$document_path='./assets/pdfs/';
		if(!file_exists($document_path) || !is_dir($document_path)) {
			mkdir($document_path);
		}	
		/* image folder of invoice */
		$image_path='./assets/images/';
		if(!file_exists($image_path) || !is_dir($image_path)) {
			mkdir($image_path);
		}	
		
		//Decode the string
		$unencodedData=$this->load->view('receipt_pdf', $data, true);
		 
		//Save the image
		file_put_contents($image_path.'img.jpg', $unencodedData);		

	    //Set folder to save PDF to
	    $this->html2pdf->folder('./assets/pdfs/');
		
		//Set the filename to save/download as
		$filename=$data['invoice'][0]['company_name'].date('M-Y');
		$filename = str_replace(' ', '_', $filename);
		$this->html2pdf->filename($filename.'.pdf');
	    
	    //Set the paper defaults
	    $this->html2pdf->paper('a4', 'portrait');

	    
	    if($path = $this->html2pdf->create('save')) {
			//dsm($path); die;
			$download_file=base_url().'assets/pdfs/'.$filename.'.pdf';
/* 			$img_file=base_url().'assets/images/'.$filename.'.jpeg';
			$image = imagegrabscreen();
			imagejpeg($image,$filename.'.jpeg');
			imagedestroy($image); */	
			
			$url=base_url().'invoice/view_invoice';
			
			$config['protocol'] = "mail";
			$config['charset'] = 'iso-8859-1';
			$config['mailtype'] = 'html';
			$config['email_crlf'] = "\r\n";
			$config['email_newline'] = "\r\n";
			$this->load->library('email');
			$this->email->clear(TRUE);

			$this->email->initialize($config);
			$this->email->from('info@onlineonion.com', 'G-Ordinateur');
			$this->email->to($data['invoice'][0]['email']);
			//$this->email->cc('naranarethiya@yopmail.com'); 
			$this->email->subject('PDF Invoice');
			$this->email->message('Please find the attach invoice pdf.');
			$this->email->attach($path);
			//$this->email->send();		
			//echo $this->email->print_debugger();	
			
			set_message('PDF is generated successfully!<li>Sent to register email.</li><li><a href='.$download_file.' target="_blank" download>Click to download pdf</a></li>','success');
			redirect($url);		   
	    } 		
	}
}