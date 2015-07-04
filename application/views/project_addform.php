<form name="activity_add" action="<?php echo base_url().'project/save_project';?>" method="POST" enctype="multipart/form-data">
	<?php
		if(isset($project)) {
			$project=$project[0];
			echo "<input type='hidden' name='project_id' value=".$project['project_id'].">";
		}
	?>
	<div class="col-md-6">
		<label>Customer</label>
		<?php
			$op_title='company_name';
			foreach($customer as $row) {
				if($row['company_name']!=''){
					$op_title='company_name';
				}
				else {
					$op_title=array('first_name','last_name');
				}
			}
			if(isset($project)) {
				$option=$project['custid'];
			}
			else {
				$option='';
			}			
			echo generate_combobox('custid',$customer,'custid',$op_title,$option,'class="form-control chosen" id="custid"');
		?>
	</div>
	<div class="col-md-6">	
		<label>Project Title <span class="text-danger">*</span></label>
		<input type="text" class="form-control" name="project_title" value="<?php if(isset($project)) { echo $project['project_title']; } ?>"/>
	</div>

	<div class="col-md-6">	
		<label>Live Url</label>
		<input type="text" class="form-control" name="live_url" value="<?php if(isset($project)) { echo $project['live_url']; } ?>"/>
	</div>

	<div class="col-md-6">	
		<label>Testing url</label>
		<input type="text" class="form-control" name="test_url" value="<?php if(isset($project)) { echo $project['test_url']; } ?>"/>
	</div>

	<div class="col-md-6">
		<label>Start Date</label>
		<input type="text" class="form-control" id="start_date" name="start_date" placeholder="Enter Project Start Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($project)) { echo $project['start_date']; } else { echo date('Y-m-d'); } ?>"/> 
	</div>	

	<div class="col-md-6">
		<label>Approx End Date</label>
		<input type="text" class="form-control" id="apporx_end" name="apporx_end" placeholder="Enter Approx End Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($project)) { echo $project['start_date']; } ?>"/> 
	</div>

	<div class="col-md-6">	
		<label>Project Status <span class="text-danger">*</span></label>
		<?php
			if(isset($project)) {
				$option=$project['project_status'];
			}
			else {
				$option='';
			}			
			echo generate_combobox('project_status',$project_status,'project_status_id','project_status',$option,'class="form-control" id="project_status"');
		?>
	</div>

	<div class="col-md-6">
		<label>Project Team<span class="text-danger">*</span></label>
		<?php $op_title=array('first_name','last_name');
			if(isset($project)) {
				$option=array_column($project_team,'emp_id');
			}
			else {
				$option='';
			}			
			echo generate_combobox('emp_id[]',$employee,'emp_id',$op_title,$option,'class="form-control chosen" id="custid" multiple required');
		?>
	</div>
	<div class="col-md-12">	
		<label>Description <span class="text-danger">*</span></label>
		<textarea name="project_description" class="form-control" required><?php if(isset($project)) { echo $project['project_description']; } ?></textarea>
	</div>
	<div class="col-md-12">
		<h4>Documents <input type="button" value="Add More" id="add_more" class="btn btn-sm btn-primary" /></h4>
		<div class="col-md-6" style="padding-left:0px">
			<label>Title</label><br/>
			<input type="text" class="form-control" id="file_title" name="file_title[]" />
		</div>
		<div class="col-md-6" style="padding-left:0px">
			<label>File</label><br/>
			<input type="file" class="form-control" id="file" name="file[]"/>
		</div>
	</div>
	<div class="col-md-12" id="addFile"></div>

	<div class="modal-footer">
		<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
		<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
		<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:10px;">Close</button>
	</div>
</form>
<link rel="stylesheet" type="text/css" href="<?php echo base_url()."public/chosen/chosen.min.css"; ?>"/>
<script type="text/javascript" src="<?php echo base_url()."public/chosen/chosen.jquery.min.js"; ?>"></script>
<script src="<?php echo base_url()."public/js/ckeditor/ckeditor.js" ?>"></script>
<script>
	CKEDITOR.replace( 'project_description' , {
 toolbar: [
  { name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] }, // Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
  [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],   // Defines toolbar group without name.
   // Line break - next group will be placed in new line.
  { name: 'basicstyles', items: [ 'Bold', 'Italic' ] }
 ]
});
</script>
<script type="text/javascript">
	$('#end_date').datepicker({
		autoclose:true
	});
	$("#start_date").datepicker({
		autoclose:true
	});
	$('#apporx_end').datepicker({
		autoclose:true
	});
	$(document).ready(function(){
		$('#add_more').click(function(e){
			e.preventDefault();
			var clone_div='<div class="col-md-6" style="padding-left:0px"><label>Title</label><br/><input type="text" class="form-control" id="file_title" name="file_title[]" /></div><div class="col-md-6" style="padding-left:0px"><label>File</label><br/><input type="file" class="form-control" id="file" name="file[]"/></div>';
			$("#addFile").append(clone_div);
		});
		$('.chosen').chosen();
	});	
</script>