<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class project extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if($this->session->userdata('uid') == '') {
			redirect(base_url());
		}
	}
	
	function index() {
		$data['pageTitle']="View Project";
		$data['title']="View Project";
		$this->load->helper('form');
		$this->load->model('project_model');	
		$data['project']=$this->project_model->get_project();
		$data['project_status']=$this->project_model->get_project_status();
		$data['contant']=$this->load->view('project_list',$data,true);
		$this->load->view('master',$data);			
	}	
	
	function search_project() {
		$data['pageTitle']="View Project";
		$data['title']="View Project";
		$this->load->helper('form');
		$this->load->model('project_model');
		$project_title=$this->input->post('project_title');		
		$from_date=$this->input->post('from_date');		
		$to_date=$this->input->post('to_date');		
		$lead_owner=$this->input->post('lead_owner');
		$project_status=$this->input->post('project_status');
		$data['project_status']=$this->project_model->get_project_status();		
		$data['project']=$this->project_model->get_project('','',$project_title,$from_date,$to_date,$lead_owner,$project_status);
		$data['contant']=$this->load->view('project_list',$data,true);
		$this->load->view('master',$data);		
	}
	
	function edit_project($project_id) {
		$this->load->model('project_model');
		$this->load->model('user_model');	
		$data['employee']=$this->user_model->get_employee();
		$data['customer']=$this->user_model->get_customer();		
		$data['project_status']=$this->project_model->get_project_status();	
		$data['project']=$this->project_model->get_project($project_id);
		$data['project_team']=$this->project_model->get_project_team($project_id);
		$this->load->view('project_addform',$data);
	}
	
	function add_project() {
		$this->load->model('user_model');
		$this->load->model('project_model');		
		$data['employee']=$this->user_model->get_employee();
		$data['customer']=$this->user_model->get_customer();
		$data['project_status']=$this->project_model->get_project_status();
		$this->load->view('project_addform',$data);
	}	
	
	function save_project() {
		//dsm($this->input->post()); die;
		$project_id=$this->input->post('project_id');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('project_title', 'Project Title', 'required');
		$this->form_validation->set_rules('start_date', 'Project Start Date', 'regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');
		$this->form_validation->set_rules('project_status', 'Project Status', 'required');
		$this->form_validation->set_rules('apporx_end', 'Approx End Date', 'regex_match[/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/]');
		$this->form_validation->set_rules('emp_id', 'Project Team', 'required');
		$this->form_validation->set_rules('project_description', 'Project Description', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}	
		else {
			$companyid = $this->session->userdata('companyid');
			$custid=$this->input->post('custid');
			$project_title=$this->input->post('project_title');
			$live_url=$this->input->post('live_url');
			$test_url=$this->input->post('test_url');
			$start_date=$this->input->post('start_date');
			$project_status=$this->input->post('project_status');
			$apporx_end=$this->input->post('apporx_end');
			if($apporx_end=="") {
				$apporx_end=null;
			}			
			$project_description=$this->input->post('project_description');
			$emp_ids=$this->input->post('emp_id');
			$file_title=$this->input->post('file_title');
			$project_data = array(
				'companyid'=>$companyid,
				'custid'=>$custid,
				'project_title'=>$project_title,
				'live_url'=>$live_url,
				'test_url'=>$test_url,
				'start_date'=>$start_date,
				'project_status'=>$project_status,
				'apporx_end'=>$apporx_end,
				'created_by'=>$this->session->userdata('emp_id'),
				'project_description'=>$project_description,
			);
			if($project_id) {
				$this->db->trans_begin();
				$res=$this->project_model->update_project($project_data,$project_id);
				if($res) {
					$project_team=$this->project_model->get_project_team($project_id);
					$project_emp=array_column($project_team,'emp_id');

					foreach($emp_ids as $key=>$emp) {
						if(in_array($emp, $project_emp)) {
							unset($project_emp[$key]);
							$id_unset=array_search($emp, $emp_ids);
							unset($emp_ids[$key]);
						}
					}

					/* delete removed emp */
					if(count($project_emp) > 0) {
						foreach($project_emp as $key=>$emp) { 
							$this->db->where('project_id',$project_id);
							$this->db->where('emp_id',$emp);
							$this->db->delete('project_team');
						}
					}
					
					/* add new added emp */
					if(count($emp_ids) > 0) {
						foreach($emp_ids as $key=>$emp) { 
							$team_data=array(
								'project_id'=>$project_id,
								'emp_id'=>$emp
							);
							$this->db->insert('project_team',$team_data);
						}
					}

					if($_FILES['file']['name'][0]!='') {
						/* Project file */
						$this->check_dir($project_title);
						$file=$_FILES['file'];
						$count=count($file['name']);
						for($i=0;$i<$count;$i++) {
							$ext_file=pathinfo($file['name'][$i],PATHINFO_EXTENSION);
							if($ext_file=="png" || $ext_file=="jpg" || $ext_file=="jpeg" || $ext_file=="gif" || $ext_file=="doc"|| $ext_file=="docx"|| $ext_file=="ppt"|| $ext_file=="pptx"|| $ext_file=="xls"|| $ext_file=="xlsx" || $ext_file=="pdf" || $ext_file=="txt") {
								$folder='./upload/'.$project_title;	
								$file_name=$file['name'][$i];

								if($file_title[$i]!='') {
									$file_name=$file_title[$i];								
								}

								$upload=$folder.'/'.$file_name;
								$storepath='upload/'.$project_title.'/'.$file_name;
								$file_size=$_FILES['file']['size'][$i];
								if(move_uploaded_file($file['tmp_name'][$i],$upload)) {
									$this->load->model('project_model');	
									$project=$this->project_model->get_project($project_id);							

									$file_data=array(
										'project_id'=>$project_id,
										'companyid'=>$this->session->userdata('companyid'),
										'file_title'=>$file_name,
										'file_path'=>$storepath,
										'file_type'=>$ext_file,
										'file_size'=>$file_size,
										'created_at'=>date('Y-m-d H:i:s'),
										'upload_by'=>$this->session->userdata('uid'),
									);
									$res1=$this->project_model->save_file($file_data);
								}
								else {
									$this->session->set_flashdata("error","Something went wrong, File is not uploaded");
								}
							}
							else {
								$this->session->set_flashdata("error","Undefined file format, File is not uploaded");
							}
						}
					}
					if ($this->db->trans_status() === FALSE) {
					    $this->db->trans_rollback();
					    set_message('Something went wrong'.$this->db->_error_message());
						redirect_back();	
					}
					else {
					    $this->db->trans_commit();
					   set_message('Project Edited Successfully','success');
						redirect_back();	
					}
				}
				else {
					set_message('Something went wrong');
					$this->db->trans_rollback();
					redirect_back();				
				}				
			}
			else {
				$project_data['created_at']=date('Y-m-d H:i:s');
				$this->db->trans_begin();
				$res=$this->project_model->add_project($project_data);
				$project_id=$this->db->insert_id();
				if($res) {
					/* add new added emp */
					if(count($emp_ids) > 0) {
						foreach($emp_ids as $key=>$emp) { 
							$team_data=array(
								'project_id'=>$project_id,
								'emp_id'=>$emp
							);
							$this->db->insert('project_team',$team_data);
						}
					}
					if($_FILES['file']['name'][0]!='') {
						/* Project file */
						$this->check_dir($project_title);
						$file=$_FILES['file'];
						$count=count($file['name']);
						for($i=0;$i<$count;$i++) {
							$ext_file=pathinfo($file['name'][$i],PATHINFO_EXTENSION);
							if($ext_file=="png" || $ext_file=="jpg" || $ext_file=="jpeg" || $ext_file=="gif" || $ext_file=="doc"|| $ext_file=="docx"|| $ext_file=="ppt"|| $ext_file=="pptx"|| $ext_file=="xls"|| $ext_file=="xlsx" || $ext_file=="pdf" || $ext_file=="txt") {
								$folder='./upload/'.$project_title;	
								$file_name=$file['name'][$i];
								$doc_name=$file_name;
								if($file_title[$i]!='') {
									$doc_name=$file_title[$i];						
								}

								$upload=$folder.'/'.$file_name;
								$storepath='upload/'.$project_title.'/'.$file_name;
								$file_size=$_FILES['file']['size'][$i];
								if(move_uploaded_file($file['tmp_name'][$i],$upload)) {
									$this->load->model('project_model');	
									$project=$this->project_model->get_project($project_id);							

									$file_data=array(
										'project_id'=>$project_id,
										'companyid'=>$this->session->userdata('companyid'),
										'file_title'=>$doc_name,
										'file_path'=>$storepath,
										'file_type'=>$ext_file,
										'file_size'=>$file_size,
										'created_at'=>date('Y-m-d H:i:s'),
										'upload_by'=>$this->session->userdata('uid'),
									);
									$res1=$this->project_model->save_file($file_data);
								}
								else {
									$this->session->set_flashdata("error","Something went wrong, File is not uploaded");
								}
							}
							else {
								$this->session->set_flashdata("error","Undefined file format, File is not uploaded");
							}
						}
					}
					if ($this->db->trans_status() === FALSE) {
					    $this->db->trans_rollback();
					    set_message('Something went wrong'.$this->db->_error_message());
						redirect_back();	
					}
					else {
					    $this->db->trans_commit();
					    set_message('Project Added Successfully','success');
						redirect_back();	
					} 		
				}
				else {
					set_message('Something went wrong');
					 $this->db->trans_rollback();
					redirect_back();				
				}
			}
		}
	}
	
	function project_detail($project_id) {
		$data['pageTitle']="Project Detail";
		$this->load->model('project_model');	
		$data['project_detail']=$this->project_model->get_project($project_id);
		$data['project_team']=$this->project_model->get_project_team($project_id);
		$data['project_comment']=$this->project_model->get_project_comment($project_id);
		$data['project_id']=$project_id;
		//dsm($data['project_comment']); die;
		//$data['lead_detail']=$this->lead_model->get_lead($lead_id);
		$data['activity']=$this->project_model->get_project_activity($project_id);
		$data['files']=$this->project_model->get_file('',$project_id);
		$data['title']=$data['project_detail'][0]['company_name'];	
		$data['project_status']=$this->project_model->get_project_status();	
		$data['contant']=$this->load->view('project_detail',$data,true);
		$this->load->view('master',$data);	
	}	
	
	function check_dir($name) {
		$referer=$_SERVER['HTTP_REFERER'];
		$server=parse_url($referer);
		/* main upload folder */
		if(!file_exists('./upload') || !is_dir('./upload')) {
			mkdir("./upload");
		}
		
		/* folder of project */
		$document_path='./upload/'.$name;
		if(!file_exists($document_path) || !is_dir($document_path)) {
			mkdir($document_path);
		}	
	}

	function add_project_activity($project_id) {
		$this->load->model('lead_model');
		$this->load->model('project_model');
		$this->load->model('user_model');	
		$data['project_id']=$project_id;
		$data['employee']=$this->user_model->get_employee();		
		$data['project_status']=$this->project_model->get_project_status();		
		$this->load->view('project_activity',$data);	
	}

	function save_activity() {
		//dsm($this->input->post()); die;
		$activity_id=$this->input->post('activity_id');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('activity_owner', 'Activity Owner', 'required');
		$this->form_validation->set_rules('activity_title', 'Activity Title', 'required');
		$this->form_validation->set_rules('datetime', 'Activity Date', 'required');
		$this->form_validation->set_rules('project_status', 'Project Status', 'required');
		$this->form_validation->set_rules('comment', 'Comment', 'required');
		$this->form_validation->set_rules('activity_type', 'Activity Type', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}
		else {
			$project_id=$this->input->post('project_id');
			$activity_owner=$this->input->post('activity_owner');
			$activity_title=$this->input->post('activity_title');
			$datetime=$this->input->post('datetime')." ".date('H:i:s');
			$project_status=$this->input->post('project_status');
			$comment=$this->input->post('comment');
			$activity_type=$this->input->post('activity_type');
			$activity_data=array(
				'project_id'=>$project_id,
				'activity_owner'=>$activity_owner,
				'activity_title'=>$activity_title,
				'datetime'=>$datetime,
				'project_status'=>$project_status,
				'activity_type'=>$activity_type,
				'comment'=>$comment,
				'created_by'=>$this->session->userdata('uid'),
			);	

			if($activity_id) {
				$activity_data['updated_at']=date('Y-m-d H:i:s');
				$res=$this->lead_model->update_lead_activity($activity_data,$activity_id);
				if($res) {
					set_message('Activity Edited Successfully','success');
					redirect_back();					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}				
			}
			else {
				$activity_data['created_at']=date('Y-m-d H:i:s');
				$res=$this->project_model->add_project_activity($activity_data);
				if($res) {
					set_message('Activity Added Successfully','success');
					redirect_back();					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}
			}
		}	
	}
	
	function edit_project_activity($comment_id) {
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');		
		$data['employee']=$this->user_model->get_employee();
		$data['activity']=$this->project_model->get_project_activity('',$comment_id);
		$data['project_status']=$this->project_model->get_project_status();	
		$data['project_id']=$data['activity'][0]['project_id'];
		$this->load->view('project_activity',$data);		
	}
	
	function del_project_activity() {
		$this->load->model('project_model');
		$id=$this->input->post('id');
		$delquery = $this->project_model->del_project_activity($id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Project Activity deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);			
	}

	function save_comment() {
		//dsm($this->input->post()); die;
		$comment_id=$this->input->post('comment_id');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('comment_title', 'Comment Title', 'required');
		$this->form_validation->set_rules('comment_descriptio', 'Comment', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}
		else {
			$project_id=$this->input->post('project_id');
			$task_id=$this->input->post('task_id');
			$comment_title=$this->input->post('comment_title');
			$datetime=$this->input->post('datetime')." ".date('H:i:s');
			$project_status=$this->input->post('project_status');
			$task_status=$this->input->post('task_status');
			$comment_descriptio=$this->input->post('comment_descriptio');
			$comment_data=array(
				'project_id'=>$project_id,
				'task_id'=>$task_id,
				'comment_title'=>$comment_title,
				'project_status'=>$project_status,
				'task_status'=>$task_status,
				'comment_descriptio'=>$comment_descriptio,
				'user_id'=>$this->session->userdata('emp_id'),
			);	
			if($project_id) {
				$chk_comment=$this->project_model->get_project_comment('',$comment_id);
			}
			else if($task_id) {
				$chk_comment=$this->project_model->get_task_comment('',$comment_id);
			}		

			if($comment_id) {
				$comment_data['updated_at']=date('Y-m-d H:i:s');
				if($chk_comment[0]['user_id']==$this->session->userdata('emp_id')||$this->session->userdata('role')=='admin') {
					$res=$this->project_model->update_comment($comment_data,$comment_id);
					if($res) {
						set_message('Comment Edited Successfully','success');
						redirect_back();					
					}
					else {
						set_message('Something went wrong');
						redirect_back();
					}						
				}
				else {
					set_message('Not authority to edit comment. ');
					redirect_back();					
				}
			}
			else {
				$comment_data['created_at']=date('Y-m-d H:i:s');
				$res=$this->project_model->add_comment($comment_data);
				if($res) {
					set_message('Comment Added Successfully','success');
					redirect_back();					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}
			}
		}	
	}

	function edit_project_comment($comment_id) {
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');	
		$chk_comment=$this->project_model->get_project_comment('',$comment_id);
		if($chk_comment[0]['user_id']==$this->session->userdata('emp_id')||$this->session->userdata('role')=='admin') {
			$data['project_detail']=$this->project_model->get_project($chk_comment[0]['project_id']);
			$data['project_id']=$data['project_detail'][0]['project_id'];
			$data['comment']=$this->project_model->get_project_comment('',$comment_id);
			$data['project_status']=$this->project_model->get_project_status();
			$this->load->view('project_comment',$data);	
		}
		else {
			set_message('Not authority to edit comment. ');
			$this->load->view('show_msg');
		}
	}
	
	function del_comment() {
		$this->load->model('project_model');
		$id=$this->input->post('id');
		$delquery = $this->project_model->del_comment($id);
		if($delquery) {
			$return=array("status"=>'1',"message"=>"Comment deleted successfully");
		}
		else {
			$return=array("status"=>'0',"message"=>"Something went wrong!!");
		}
		echo json_encode($return);			
	}	

	function task_list() {
		$data['pageTitle']="View Task List";
		$data['title']="View Task List";
		$this->load->model('project_model');	
		$data['task']=$this->project_model->get_task();
		$data['project_status']=$this->project_model->get_project_status();
		$data['task_status']=$this->project_model->get_task_status();
		$data['contant']=$this->load->view('task_list',$data,true);
		$this->load->view('master',$data);
	}
	
	function add_task($project_task_id=false) {
		$data['pageTitle']="View Task List";
		$data['title']="View Task List";
		$this->load->model('project_model');
		$this->load->model('user_model');
		$data['employee']=$this->user_model->get_employee();
		$data['project']=$this->project_model->get_project();
		$data['project_status']=$this->project_model->get_project_status();
		$data['task_status']=$this->project_model->get_task_status();
		$data['task_priority']=$this->project_model->get_task_priority();
		$data['task_label']=$this->project_model->get_task_label();
		if($project_task_id) {
			$data['task']=$this->project_model->get_task('',$project_task_id);
			//dsm($data['task']);die;
		}
		$this->load->view('task_addform',$data);		
	}
	
	function save_task() {
		//dsm($this->input->post()); die;
		$project_task_id=$this->input->post('project_task_id');
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
		$this->form_validation->set_rules('project_id', 'Project', 'required');
		$this->form_validation->set_rules('employee_id', 'Employee', 'required');
		$this->form_validation->set_rules('project_task_priority', 'Task Priority', 'required');
		$this->form_validation->set_rules('project_task_label', 'Task Label', 'required');
		$this->form_validation->set_rules('project_status_id', 'project Status', 'required');
		$this->form_validation->set_rules('task_status', 'Task Status', 'required');
		$this->form_validation->set_rules('project_task_title', 'Task Title', 'required');
		$this->form_validation->set_rules('project_task_description', 'Task Description', 'required');
		if ($this->form_validation->run() == FALSE) {
			set_message(validation_errors());
			redirect_back();
			return 0;
		}
		else {
			$project_id=$this->input->post('project_id');
			$employee_id=$this->input->post('employee_id');
			$project_task_priority=$this->input->post('project_task_priority');
			$project_task_label=$this->input->post('project_task_label');
			$project_status_id=$this->input->post('project_status_id');
			$task_status=$this->input->post('task_status');
			$project_task_title=$this->input->post('project_task_title');
			$project_task_progress=$this->input->post('project_task_progress');
			$project_task_estimate=$this->input->post('project_task_estimate');
			$start_date=$this->input->post('start_date');
			$due_date=$this->input->post('due_date');
			$project_task_description=$this->input->post('project_task_description');
			$task_data=array(
				'project_id'=>$project_id,
				'employee_id'=>$employee_id,
				'project_task_priority'=>$project_task_priority,
				'project_task_label'=>$project_task_label,
				'project_status_id'=>$project_status_id,
				'task_status'=>$task_status,
				'project_task_title'=>$project_task_title,
				'project_task_progress'=>$project_task_progress,
				'project_task_estimate'=>$project_task_estimate,
				'start_date'=>$start_date,
				'due_date'=>$due_date,
				'project_task_description'=>$project_task_description,
				'created_by'=>$this->session->userdata('uid'),
			);	

			if($project_task_id) {
				$task_data['updated_at']=date('Y-m-d H:i:s');
				$res=$this->project_model->update_project_task($task_data,$project_task_id);
				if($res) {
					set_message('Task Edited Successfully','success');
					redirect_back();					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}				
			}
			else {
				$task_data['created_at']=date('Y-m-d H:i:s');
				$res=$this->project_model->add_project_task($task_data);
				if($res) {
					set_message('Task Added Successfully','success');
					redirect_back();					
				}
				else {
					set_message('Something went wrong');
					redirect_back();
				}
			}
		}	
	}
	
	function task_detail($project_task_id) {
		$data['pageTitle']="Task Detail";
		$this->load->model('project_model');	
		$data['task']=$this->project_model->get_task('',$project_task_id);
		$data['project']=$this->project_model->get_project($data['task'][0]['project_id']);
		$data['task_comment']=$this->project_model->get_task_comment($project_task_id);
		$data['title']='Project - '.$data['project'][0]['project_title'].' - task';	
		$data['task_status']=$this->project_model->get_task_status();
		$data['project_task_id']=$project_task_id;		
		$data['contant']=$this->load->view('task_detail',$data,true);
		$this->load->view('master',$data);	
	}
	
	function edit_task_comment($comment_id) {
		$this->load->model('lead_model');
		$this->load->model('user_model');
		$this->load->model('project_model');	
		$chk_comment=$this->project_model->get_task_comment('',$comment_id);
		if($chk_comment[0]['user_id']==$this->session->userdata('emp_id')||$this->session->userdata('role')=='admin') {
			$data['task']=$this->project_model->get_task('',$chk_comment[0]['task_id']);
			$data['comment']=$this->project_model->get_task_comment('',$comment_id);
			$data['task_status']=$this->project_model->get_task_status();
			$data['project_task_id']=$data['task'][0]['project_task_id'];
			$this->load->view('task_comment',$data);				
		}
		else {
			set_message('Not authority to edit comment.'); 
			$this->load->view('show_msg');
		}
	}	
	
	function search_task() {
		//dsm($this->input->post()); die;
		$data['pageTitle']="View Task";
		$data['title']="View Task";
		$this->load->helper('form');
		$this->load->model('project_model');
		$project_task_title=$this->input->post('project_task_title');		
		$from_date=$this->input->post('from_date');		
		$to_date=$this->input->post('to_date');
		$task_status=$this->input->post('task_status');
		$data['task_status']=$this->project_model->get_task_status();
		$data['task']=$this->project_model->get_task('','',$project_task_title,$from_date,$to_date,$task_status);
		$data['contant']=$this->load->view('task_list',$data,true);
		$this->load->view('master',$data);		
	}	
}