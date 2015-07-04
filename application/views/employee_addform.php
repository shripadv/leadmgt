
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">
				<form name="user" action="<?php echo base_url().'user/save_employee';?>" method="POST" enctype="multipart/form-data">
					<div class="col-md-12">
						<?php $this->load->view('personal_info'); ?>
					</div>
					<div class="col-md-12">
						<div class="box-header">
							<h3 class="box-title">Employee Details</h3>
						</div><!-- /.box-header -->						
						<div class="col-md-6">
							<label>Join Date</label>
							<input type="text" class="form-control" id="join_date" name="join_date" placeholder="Enter Join Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($edit_people)) { echo $edit_people[0]['join_date']; } ?>"/> 
						</div>
						<div class="col-md-6">	
							<label>Date of Birth</label>
							<input type="text" class="form-control" id="dob" name="dob" placeholder="Enter Join Date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($edit_people)) { echo $edit_people[0]['dob']; } ?>"/> 
						</div>							
					</div>	
					<div class="col-md-12">
						<div class="col-md-6">	
							<label>Designation</label>
							<input type="text" class="form-control" id="designation" name="designation" placeholder="Enter Designation" value="<?php if(isset($edit_people)) { echo $edit_people[0]['designation']; } ?>"/> 
						</div>
						<?php if(empty($edit_people)) { ?>
						<div class="col-md-6">	
							<div class="col-md-6" style="margin-left:-15px">	
								<label>Password</label>
								<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" /> 
							</div>
							<div class="col-md-6" style="margin-left:-15px">	
								<label>Confirm Password</label>
								<input type="password" class="form-control" id="cfpassword" name="cfpassword" placeholder="Enter Password" /> 
							</div>						
						</div>	
						<?php } ?>
					</div>						
					<div class="col-md-12">
						<div class="col-md-12">
							<label>Note</label>
							<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edit_people)) { echo $edit_people[0]['note']; } ?></textarea>
							<br/>
							<?php 
								if(isset($edit_people)) {
									echo "<input type='hidden' name='emp_id' value='".$edit_people[0]['emp_id']."'>";
								}
							?>							
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
	</div>

<script type="text/javascript">
	$('#join_date').datepicker();
	$('#dob').datepicker();
</script>