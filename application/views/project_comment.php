<div class="panel panel-success">
	<div class="panel-body">
		<form name="activity_add" action="<?php echo base_url().'project/save_comment';?>" method="POST" enctype="multipart/form-data">	
			<div class="col-md-12">
				<?php
					if(isset($project_id)) {
						echo "<input type='hidden' name='project_id' id='project_id' value=".$project_id.">";
					}
					if(isset($comment)) {
						$comment=$comment[0];
						echo "<input type='hidden' name='comment_id' id='comment_id' value=".$comment['comment_id'].">";
					}			
				?>					
				<div class="col-md-6">	
					<label>Comment Title <span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="comment_title" required value="<?php if(isset($comment['comment_title'])) { echo $comment['comment_title'];}?>"/>
				</div>	
				<div class="col-md-6">	
					<label>Project Status <span class="text-danger">*</span></label>
					<?php
						if(isset($comment['project_status'])) {
							$option=$comment['project_status'];
						}
						else {
							$option='1';
						}
						echo generate_combobox('project_status',$project_status,'project_status_id','project_status',$option,'class="form-control" id="project_status" required');
					?>
				</div>			
			</div>	
			<div class="col-md-12">
				<div class="col-md-12">
					<label>Comment <span class="text-danger">*</span></label>
					<textarea name="comment_descriptio" class="form-control"><?php if(isset($comment['comment_descriptio'])) { echo $comment['comment_descriptio'];}?></textarea>
				</div>
			</div>
			<div class="col-md-12">
				<div class="modal-footer">
					<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
					<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$('#datetime').datepicker(); 
</script>