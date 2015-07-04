<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
  
class project_model extends CI_Model {
	public function __construct() {
		$this->load->database();
	}

	function get_project_status() {
		$res=$this->db->get('project_status');
		return $res->result_array();	
	}
	
	function get_project($project_id=false,$people_id=false,$project_title=false,$from_date=false,$to_date=false,$lead_owner=false,$lead_id=false,$project_status=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('project.companyid',$this->session->userdata('companyid'));
		}		
		if($project_id!='') {
			$this->db->where('project.project_id',$project_id);
		}
		if($people_id!='') {
			$this->db->where('people.people_id',$people_id);
		}
		if($project_title!='') {
			$this->db->like('project.project_title',$project_title);
		}
		if($from_date!='') {
			$this->db->where('date(project.start_date) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(project.start_date) <=',$to_date);
		}
		if($lead_owner!='') {
			$this->db->like('p2.first_name',$lead_owner);
			$this->db->or_like('p2.last_name',$lead_owner);
		}
		if($lead_id!='') {
			$this->db->where('project.lead_id',$lead_id);
		}
		if($project_status!='') {
			$this->db->where('project.project_status',$project_status);
		}		
 		$this->db->select('project.*,project_status.project_status_color,project_status.project_status as pstatus,p1.*,project.project_id as prid,project.lead_id as pr_lead_id,p2.first_name as pfname,p2.last_name as plname');
		$this->db->join('customer','project.custid=customer.custid','left');	
		$this->db->join('people p1','p1.people_id=customer.people_id','left');
		$this->db->join('project_status','project_status.project_status_id=project.project_status');
		$this->db->join('users','users.uid=project.created_by','left');
		$this->db->join('people p2','p2.people_id=users.people_id');
/*		$this->db->join('people p1','p1.people_id=lead.people_id');	
		$this->db->join('lead_source','lead_source.lead_source_id=lead.lead_source');	
		$this->db->join('lead_status','lead_status.lead_status_id=lead.lead_status');	
		$this->db->join('product','product.product_id=lead.product');	
		$this->db->join('employee','lead.lead_owner=employee.emp_id');
		$this->db->join('people p2','p2.people_id=employee.people_id'); */
		$res=$this->db->get('project');
		return $res->result_array();	
	}

	function get_project_activity($project_id=false,$activity_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('project.companyid',$this->session->userdata('companyid'));
		}		
		if($project_id!='') {
			$this->db->where('project.project_id',$project_id);
		}
		if($activity_id!='') {
			$this->db->where('activity.activity_id',$activity_id);
		}
		$this->db->select('project.*,p1.*,project_status.project_status as project_status_title,project_status.project_status_color,employee.*,p2.first_name as emp_first,p2.last_name as emp_secound,activity.*');
		$this->db->join('project','activity.project_id=project.project_id');
		$this->db->join('customer','project.custid=customer.custid');	
		$this->db->join('people p1','p1.people_id=customer.people_id');		
		$this->db->join('project_status','project_status.project_status_id=activity.project_status');
		$this->db->join('employee','project.lead_id=employee.emp_id');
		$this->db->join('people p2','p2.people_id=employee.people_id');
		$this->db->order_by('activity.activity_id','desc');
		$res=$this->db->get('activity');
		return $res->result_array();		
	}
	
	function get_file($lead_id=false,$project_id=false) {
		if($project_id!='') {
			$this->db->where('project.project_id',$project_id);
			$this->db->join('project','file.project_id=project.project_id','left');
		}
		if($lead_id!='') {
			$this->db->where('lead.lead_id',$lead_id);
			$this->db->join('lead','file.lead_id=lead.lead_id','left');
		}		
		$res=$this->db->get('file');
		return $res->result_array();
	}
	
	function add_project($project_data) {
		return $this->db->insert('project',$project_data);
	}
	
	function update_project($project_data,$project_id) {
		$this->db->where('project_id',$project_id);
		return $this->db->update('project',$project_data);
	}
	
	function count_project($lead_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('project.companyid',$this->session->userdata('companyid'));
		}	
		if($lead_id!='') {
			$this->db->where('lead_id',$lead_id);
		}
		$this->db->select('count(*) as cnt');
		$res=$this->db->get('project');
		return (array)$res->row(1);	
	}
	
	function save_file($file_data) {
		return $this->db->insert('file',$file_data);
	}
	
	function add_project_activity($activity_data) {
		return $this->db->insert('activity',$activity_data);
	}
	
	function update_project_activity($activity_data,$activity_id) {
		$this->db->where('activity_id',$activity_id);
		return $this->db->update('activity',$activity_data);
	}	
	
	function del_project_activity($id) {
		$this->db->where('activity_id',$id);
		return $this->db->delete('activity');		
	}

	function get_project_team($project_id) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('employee.companyid',$this->session->userdata('companyid'));
		}	
		$this->db->select('project_team.*, people.first_name, people.last_name, people.email');
		$this->db->where('project_id',$project_id);
		$this->db->join('employee','employee.emp_id=project_team.emp_id','left');
		$this->db->join('people','people.people_id=employee.people_id','left');
		$rs=$this->db->get('project_team');
		return $rs->result_array();
	}
	
	function get_project_comment($project_id=false,$comment_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('employee.companyid',$this->session->userdata('companyid'));
		}	
		if($comment_id!='') {
			$this->db->where('comment.comment_id',$comment_id);
			$this->db->where_in('project_team.emp_id',$this->session->userdata('emp_id'));		
		}
		if($project_id!='') {
			$this->db->where('comment.project_id',$project_id);
			$this->db->where_in('project_team.emp_id',$this->session->userdata('emp_id'));
		}
		$this->db->select('comment.*, p1.first_name, p1.last_name, p1.email, project_status.project_status as pstatus,project_status.project_status_color');		
		$this->db->join('project','project.project_id=comment.project_id','left');
		$this->db->join('project_team','project_team.project_id=project.project_id','left');
		$this->db->join('project_status','project_status.project_status_id=comment.project_status','left');		
		$this->db->join('employee','employee.emp_id=comment.user_id','left');
		$this->db->join('people p1','p1.people_id=employee.people_id','left');
		$this->db->order_by('comment.comment_id','desc');
		$rs=$this->db->get('comment');
		return $rs->result_array();		
	}
	
	function get_task_comment($task_id=false,$comment_id=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('employee.companyid',$this->session->userdata('companyid'));
		}	
		if($comment_id!='') {
			$this->db->where('comment.comment_id',$comment_id);
		}
		if($task_id!='') {
			$this->db->where('comment.task_id',$task_id);	
		}
		$this->db->select('comment.*, p1.first_name, p1.last_name, p1.email, task_status.task_status as kstatus, task_status.task_status_color');		
		$this->db->join('project_task','project_task.project_task_id=comment.task_id');		
		$this->db->join('task_status','task_status.task_status_id=comment.task_status');		
		$this->db->join('employee','employee.emp_id=comment.user_id','left');
		$this->db->join('people p1','p1.people_id=employee.people_id','left');
		$this->db->order_by('comment.comment_id','desc');
		$rs=$this->db->get('comment');
		return $rs->result_array();		
	}	
	
	function add_comment($comment_data) {
		return $this->db->insert('comment',$comment_data);
	}
	
	function update_comment($comment_data,$comment_id) {
		$this->db->where('comment_id',$comment_id);
		return $this->db->update('comment',$comment_data);
	}	
	
	function del_comment($id) {
		$this->db->where('comment_id',$id);
		return $this->db->delete('comment');		
	}	
	
	function get_task_status() {
		$res=$this->db->get('task_status');
		return $res->result_array();	
	}

	function get_task_priority() {
		$res=$this->db->get('task_priority');
		return $res->result_array();	
	}

	function get_task_label() {
		$res=$this->db->get('task_label');
		return $res->result_array();	
	}	
	
	function get_task($project_id=false,$project_task_id=false,$project_task_title=false,$from_date=false,$to_date=false,$task_status=false) {
		if($this->session->userdata('role')!='admin') {
			$this->db->where('users.companyid',$this->session->userdata('companyid'));
		}	
		$this->db->select('project_task.*, p1.first_name, p1.last_name, p1.email, task_status.task_status as task_status_title,task_status.task_status_color,task_priority.task_priority as task_priority_title, p2.first_name as efname, p2.last_name as elname, p2.email as eemail');
		if($project_task_id!='') {
			$this->db->where('project_task.project_task_id',$project_task_id);
		}
		if($project_id!='') {
			$this->db->where('project_task.project_id',$project_id);
		}
		if($project_task_title!='') {
			$this->db->like('project_task.project_task_title',$project_task_title);
		}
		if($from_date!='') {
			$this->db->where('date(project_task.start_date) >= ',$from_date);
		}		
		if($to_date!='') {
			$this->db->where('date(project_task.start_date) <=',$to_date);
		}
		if($task_status!='') {
			$this->db->where('project_task.task_status',$task_status);
		}		
		$this->db->join('project','project.project_id=project_task.project_id');
		$this->db->join('project_status','project_status.project_status_id=project_task.project_status_id');
		$this->db->join('task_status','task_status.task_status_id=project_task.task_status');
		$this->db->join('task_label','task_label.task_label=project_task.project_task_label');
		$this->db->join('task_priority','task_priority.task_priority=project_task.project_task_priority');
		$this->db->join('comment','comment.task_id=project_task.project_task_id','left');
		$this->db->join('users','users.uid=project_task.created_by','left');
		$this->db->join('people p1','p1.people_id=users.people_id','left');
		$this->db->join('employee','employee.emp_id=project_task.employee_id','left');
		$this->db->join('people p2','p2.people_id=employee.people_id','left');		
		$this->db->order_by('project_task.project_task_id','desc');
		$rs=$this->db->get('project_task');
		return $rs->result_array();		
	}	
	function add_project_task($task_data) {
		return $this->db->insert('project_task',$task_data);
	}
	
	function update_project_task($task_data,$project_task_id) {
		$this->db->where('project_task_id',$project_task_id);
		return $this->db->update('project_task',$task_data);
	}		
	
}