<form name="activity_add" action="<?php echo base_url().'lead/save_activity';?>" method="POST" enctype="multipart/form-data">	
	<div class="col-md-12">
		<?php
			if(isset($lead_id)) {
				echo "<input type='hidden' name='lead_id' id='lead_id' value=".$lead_id.">";
			}
			if(isset($activity)){
				$activity=$activity[0];
				echo "<input type='hidden' name='activity_id' id='lead_id' value=".$activity['activity_id'].">";
			}
		?>					
		<div class="col-md-6">
			<label>Activity Owner <span class="text-danger">*</span></label>
			<?php
				$op_title=array('first_name','last_name');
				if(isset($activity)) {
					$option=$activity['emp_id'];
				}
				else {
					$option=$this->session->userdata('emp_id');
				}
				echo generate_combobox('activity_owner',$employee,'emp_id',$op_title,$option,'class="form-control" id="activity_owner" required');							
			?>
		</div>
		<div class="col-md-6">	
			<label>Activity Title <span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="activity_title" required value="<?php if(isset($activity)) { echo $activity['activity_title']; } ?>"/>
		</div>							
	</div>	
	<div class="col-md-12">				
		<div class="col-md-6">
			<label>Date <span class="text-danger">*</span></label>
			<input type="text" class="form-control" id="datetime" name="datetime" placeholder="Enter Activity Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($activity)) { $date = date_create($activity['datetime']); echo date_format($date,"Y-m-d"); } else { echo date('Y-m-d'); } ?>"/> 
		</div>
		<div class="col-md-6">	
			<label>Lead Status <span class="text-danger">*</span></label>
			<?php
				if(isset($activity)) {
					$option=$activity['lead_status'];
				}
				else {
					$option='';
				}			
				echo generate_combobox('lead_status',$lead_status,'lead_status_id','lead_status',$option,'class="form-control" id="lead_status" required');
			?>
		</div>							
	</div>	
	<div class="col-md-12">				
		<div class="col-md-6">	
			<label>Activity Type <span class="text-danger">*</span></label>
			<select name="activity_type" class="form-control" required>
				<option value="" <?php if(isset($activity)) { if($activity['activity_type']=="") { echo "selected"; }} ?>>Select</option>
				<option value="meeting" <?php if(isset($activity)) { if($activity['activity_type']=="meeting") { echo "selected"; } } ?> >Meeting</option>
				<option value="other" <?php if(isset($activity)) { if($activity['activity_type']=="other") { echo "selected"; } } ?> >Other</option>
			</select>
		</div>							
	</div>	
	<div class="col-md-12">				
		<div class="col-md-12">
			<label>Comment <span class="text-danger">*</span></label>
			<textarea name="comment" class="form-control"><?php if(isset($activity)) { echo $activity['comment']; } ?></textarea>
		</div>	
	</div>	
	<!--<div id="project">
		<div class="col-md-12">
			<div class="box-header">
				<h3 class="box-title">Project Details</h3>
			</div>		
		</div>	
		<?php //$this->load->view('project_form'); ?>
	</div>-->
	<div class="modal-footer">
		<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
		<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
		<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:10px;">Close</button>
	</div>
</form>

<script type="text/javascript">
$('#datetime').datepicker(); 

/*jQuery(document).ready(function () {
	$('#project').hide();
});
$('#lead_status').change(function () {
	var lead_status=$('#lead_status').val();
	if(lead_status=="1") {
		$('#project').show();
		$("#project_title").attr("required", "true");
		$("#start_date").attr("required", "true");
		$("#project_status").attr("required", "true");
		$("#apporx_end").attr("required", "true");
	}
	else {
		$('#project').hide();
	}
});*/
</script>