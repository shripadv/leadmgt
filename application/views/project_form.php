<?php
	if(isset($project)) {
		$project=$project[0];
	}
?>

<div class="col-md-12">
	<div class="col-md-6">	
		<label>Project Title <span class="text-danger">*</span></label>
		<input type="text" class="form-control" name="project_title" value="<?php if(isset($project)) { echo $project['project_title']; } ?>"/>
	</div>
	<div class="col-md-6">
		<label>Start Date <span class="text-danger">*</span></label>
		<input type="text" class="form-control" id="start_date" name="start_date" placeholder="Enter Project Start Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($project)) { echo $project['start_date']; } else { echo date('Y-m-d'); } ?>"/> 
	</div>			
</div>
<div class="col-md-12">
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
		<label>Approx End Date<span class="text-danger">*</span></label>
		<input type="text" class="form-control" id="apporx_end" name="apporx_end" placeholder="Enter Approx End Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($project)) { echo $project['start_date']; } ?>"/> 
	</div>	
</div>

<script type="text/javascript">
$("#start_date").datepicker();
$('#apporx_end').datepicker();
</script>