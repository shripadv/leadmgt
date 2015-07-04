<div class="row">
	<form name="activity_add" action="<?php echo base_url().'project/save_task';?>" method="POST" enctype="multipart/form-data">
		<?php
			if(isset($task)) {
				$task=$task[0];
				echo "<input type='hidden' name='project_task_id' value=".$task['project_task_id'].">";
			}
		?>
		<div class="col-md-12">
			<div class="col-md-6">
				<label>Project <span class="text-danger">*</span></label>
				<?php
					if(isset($task)) {
						$option=$task['project_id'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('project_id',$project,'project_id','project_title',$option,'class="form-control chosen" id="project_id" required');
				?>
			</div>
			<div class="col-md-6">
				<label>Employee <span class="text-danger">*</span></label>
				<?php
					$op_title=array('first_name','last_name');
					if(isset($task)) {
						$option=$task['employee_id'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('employee_id',$employee,'emp_id',$op_title,$option,'class="form-control chosen" id="employee_id" required');
				?>
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-6">
				<label>Task Priority <span class="text-danger">*</span></label>
				<?php
					if(isset($task)) {
						$option=$task['project_task_priority'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('project_task_priority',$task_priority,'task_priority','task_priority',$option,'class="form-control chosen" id="project_task_priority" required');
				?>
			</div>
			<div class="col-md-6">
				<label>Task Label <span class="text-danger">*</span></label>
				<?php
					if(isset($task)) {
						$option=$task['project_task_label'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('project_task_label',$task_label,'task_label','task_label',$option,'class="form-control chosen" id="project_task_label" required');
				?>
			</div>	
		</div>	
		<div class="col-md-12">
			<div class="col-md-6">	
				<label>Project Status <span class="text-danger">*</span></label>
				<?php
					if(isset($task)) {
						$option=$task['project_status_id'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('project_status_id',$project_status,'project_status_id','project_status',$option,'class="form-control chosen" id="project_status_id" required');
				?>
			</div>
			<div class="col-md-6">	
				<label>Task Status <span class="text-danger">*</span></label>
				<?php
					if(isset($task)) {
						$option=$task['task_status'];
					}
					else {
						$option='';
					}			
					echo generate_combobox('task_status',$task_status,'task_status_id','task_status',$option,'class="form-control chosen" id="task_status" required');
				?>
			</div>	
		</div>	
		<div class="col-md-12">
			<div class="col-md-6">	
				<label>Project Task Title <span class="text-danger">*</span></label>
				<input type="text" class="form-control" name="project_task_title" value="<?php if(isset($task)) { echo $task['project_task_title']; } ?>" required/>
			</div>
			<div class="col-md-6">	
				<label>Project Task Progress</label>
				<input type="text" class="form-control" name="project_task_progress" value="<?php if(isset($task)) { echo $task['project_task_progress']; } ?>"/>
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-6">	
				<label>Project Task Estimate</label>
				<input type="text" class="form-control" name="project_task_estimate" value="<?php if(isset($task)) { echo $task['project_task_estimate']; } ?>"/>
			</div>

			<div class="col-md-6">
				<label>Start Date</label>
				<input type="text" class="form-control" id="start_date" name="start_date" placeholder="Enter Project Start Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($task)) { echo $task['start_date']; } else { echo date('Y-m-d'); } ?>"/> 
			</div>	
		</div>	
		<div class="col-md-12">
			<div class="col-md-6">
				<label>Approx Due Date</label>
				<input type="text" class="form-control" id="due_date" name="due_date" placeholder="Enter Approx Due Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($task)) { echo $task['due_date']; } ?>"/> 
			</div>	
			<div class="col-md-6">	
				<label>Description <span class="text-danger">*</span></label>
				<textarea name="project_task_description" class="form-control" required><?php if(isset($task)) { echo $task['project_task_description']; } ?></textarea>
			</div>
		</div>
		<div class="col-md-12"><br/>
			<div class="modal-footer">
				<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
				<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
				<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:10px;">Close</button>
			</div>
		</div>
	</form>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo base_url()."public/chosen/chosen.min.css"; ?>"/>
<script type="text/javascript" src="<?php echo base_url()."public/chosen/chosen.jquery.min.js"; ?>"></script>
<script type="text/javascript">
	$('#end_date').datepicker();
	$("#start_date").datepicker();
	$('#due_date').datepicker();
	$(document).ready(function(){
		$('.chosen').chosen();
	});	
</script>