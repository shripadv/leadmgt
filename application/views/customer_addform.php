<div class="col-md-12">
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">
				<form name="user" action="<?php echo base_url().'user/save_customer';?>" method="POST" enctype="multipart/form-data">
					<div class="col-md-12">
						<?php $this->load->view('personal_info'); ?>
					</div>
					<div class="col-md-12">
						<div class="col-md-12">
							<label>Note</label>
							<textarea class="form-control" id="note" name="note" placeholder="Enter Note"></textarea>
							<br/>
							<?php 
								if(isset($edit_people)) {
									echo "<input type='hidden' name='custid' value='".$edit_people[0]['custid']."'>";
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
</div>