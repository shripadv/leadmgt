
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">
			<form name="user" action="<?php echo base_url().'user/save_user';?>" method="POST" enctype="multipart/form-data">
				<div class="col-md-12">
					<div class="col-md-12">
						<?php $this->load->view('personal_info'); ?>
					</div>			
					<div class="col-md-12">	
						<div class="box-header">
							<h3 class="box-title">User's Details</h3>
						</div><!-- /.box-header -->	
						<div class="form-group">
							<div class="col-md-6">
								<label>Date of Birth<span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="dob" name="dob" placeholder="Enter Date of Birth" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($edit_people)) { echo $edit_people[0]['dob']; } ?>"/>
							</div>	
							<div class="col-md-3">
								<label>Password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required value="<?php if(isset($edit_people)) { echo $edit_people[0]['temp']; } ?>" <?php if(isset($edit_people)) { echo "readonly"; } ?>/> 
							</div>
							<div class="col-md-3">
								<label>Confirm Password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" id="cfpassword" name="cfpassword" placeholder="Enter confirm Password" required value="<?php if(isset($edit_people)) { echo $edit_people[0]['temp']; } ?>" <?php if(isset($edit_people)) { echo "readonly"; } ?>/> 
							</div>								
						</div>
						<div class="form-group">
							<?php if($this->session->userdata('role')=="admin") {?>
								<div class="col-md-6">
									<label>User's Company <span class="text-danger">*</span></label>
									<?php 
									if(isset($edit_people)) { 
										$option=$edit_people[0]['companyid'];
									}
									else {
										$option='';
									}
									echo generate_combobox('companyid',$company,'companyid','companyname',$option,'class="form-control" id="companyid" required');
									?>
								</div>							
							<?php } ?>
							<?php if(isset($edit_people)) {  $editmodules = $edit_people['edit_modules'];?>
								<div class="col-md-6"><br/>	
									<label>Modules <span class="text-danger">*</span></label>&nbsp;&nbsp;
		                            <?php foreach($modules as $module) { ?>
			                            <label class="radio-inline">
			                                <input type="checkbox" name="cmodules[<?php if(isset($editmodules[$module['module_id']])) { echo $editmodules[$module['module_id']]['user_module_id'];} ?>]" value="<?php if(isset($editmodules[$module['module_id']])) { echo $editmodules[$module['module_id']]['module_id']; } else { echo $module['module_id']; }?>" <?php if(isset($editmodules[$module['module_id']])) { echo "checked"; } ?>>
			                                <?php echo $module['module_name'];?>                   
			                            </label>
									<?php } ?>                                                     
								</div>								
							<?php } else { ?>						
							<div class="col-md-6" id="module_det"><br/>
								<label>Modules <span class="text-danger">*</span></label>&nbsp;&nbsp;
							</div>
							<?php } ?>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-12">
							<label>Note</label>
							<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edit_people)) { echo $edit_people[0]['note']; } ?></textarea>	
							<br/><span class="text-danger"><b>(Email id will be used as login id)</b></span>
							<?php 
								if(isset($edit_people)) {
									echo "<input type='hidden' name='uid' value='".$edit_people[0]['uid']."'>";
								}
							?>
						</div>					
					</div>				
					<div class="modal-footer">
						<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
						<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
					</div>
				</div>
			</form>
			</div>
		</div><!-- /.box-body -->
	</div>


<script type="text/javascript">
	$(document).ready(function() {
		$('#dob').datepicker({ autoclose:true });
		$('#module_det').hide();
		var companyid=$('select[name="companyid"]').val();
		modules(companyid);
	});
	$('select[name="companyid"]').change(function(){
		var companyid=$('select[name="companyid"]').val();
		modules(companyid);
	});

	function modules(companyid) {
		if(companyid!='') {
			$.ajax({
				  url     : base_url+"company/company_modules/",
				  type    : 'POST',
				  data    : {'id':companyid},
				  success : function(data){
					data=$.parseJSON(data);
					$('#module_det').show();
					var option="";
					$.each(data,function( item,value ) {
	                    option='<label class="radio-inline"><input type="checkbox" name="cmodules[]" value="'+value.module_id+'">'+value.module_name+'</label>';
	                	$('#module_det').append(option);
					});				
			    }
			});	
		}		
	}
</script>