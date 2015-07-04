
	<div class="box box-primary">
		<div class="box-body">
			<form name="customer" action="<?php echo base_url().'lead/save_lead';?>" method="POST" enctype="multipart/form-data">	
				<div class="col-md-12">
					<?php $this->load->view('personal_info'); ?>
				</div>
				<div class="col-md-12">
					<div class="box-header">
						<h3 class="box-title">Lead Details</h3>
					</div><!-- /.box-header -->						
					<div class="col-md-6">
						<label>Lead Owner <span class="text-danger">*</span></label>
						<?php
							if(isset($edit_people)) {
								$option=$edit_people[0]['emp_id'];
							}
							else {
								$option='';
							}
							echo generate_combobox('lead_owner',$employee,'emp_id','first_name',$option,'class="form-control" id="lead_owner" required');							
						?>
					</div>
					<div class="col-md-6">	
						<label>Lead Source</label>
						<?php
							if(isset($edit_people)) {
								$option=$edit_people[0]['lead_source_id'];
							}
							else {
								$option='';
							}						
							echo generate_combobox('lead_source',$lead_source,'lead_source_id','lead_source',$option,'class="form-control" id="lead_source" required');
						?> 	
					</div>							
				</div>	
				<div class="col-md-12">				
					<div class="col-md-6">
						<label>Lead Status</label>
						<?php
							if(isset($edit_people)) {
								$option=$edit_people[0]['lead_status_id'];
							}
							else {
								$option='';
							}						
							echo generate_combobox('lead_status',$lead_status,'lead_status_id','lead_status',$option,'class="form-control" id="lead_status" ');
						?>
					</div>
					<div class="col-md-6">	
						<label>Product</label>
						<?php
							if(isset($edit_people)) {
								$option=$edit_people[0]['product'];
								if(strpos($option,',')!== FALSE) {
									$option=explode(',',$option);
								}
								else {
									$option=$option;
								}								
							}
							else {
								$option='';
							}						
							echo generate_combobox('product[]',$product,'product_title','product_title',$option,'class="form-control chosen" id="product" multiple');
						?>
						<br/>
						<?php 
							if(isset($edit_people)) {
								echo "<input type='hidden' name='lead_id' value='".$edit_people[0]['lead_id']."'>";
							}
						?>							
					</div>							
				</div>					
				<div class="modal-footer">
					<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
					<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
				</div>
			</form>
		</div><!-- /.box-body -->
	</div>

<script type="text/javascript">
$('.chosen').chosen();
</script>