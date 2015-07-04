<div class="col-md-12">
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">
				<form name="company" action="<?php echo base_url().'company/save_company';?>" method="POST" enctype="multipart/form-data">
					<div class="col-md-12">
						<div class="box-header">
							<h3 class="box-title"><i class="fa fa-fw fa-building-o"></i> Company Details</h3>
						</div><!-- /.box-header --> 
						<?php 
							if(isset($edit_company)) {
								$company=$edit_company[0];					
								echo '<input type="hidden" name="companyid" value="'.$company['companyid'].'"/>';
								if(!empty($edit_company['modules'])) {
									$editmodules=$edit_company['modules'];
								}
							}					
						?>					
						<div class="col-md-12">
							<div class="col-md-6">
								<label>Company Name <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="companyname" name="companyname" placeholder="Enter Company Name" required value="<?php if(isset($company)) { echo $company['companyname']; } ?>"/> 
							</div>
							<div class="col-md-6">	
								<label>Short Name <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="short_name" name="short_name" placeholder="Enter Short Company Name" maxlength="15" required value="<?php if(isset($company)) { echo $company['shortname']; } ?>"/>
							</div>
						</div>	
						<div class="col-md-12">
							<div class="col-md-6">	
								<label>Tag line</label>
								<input type="text" class="form-control" id="tag_line" name="tag_line" placeholder="Enter Short Tag Line" maxlength="50" value="<?php if(isset($company)) { echo $company['tag_line']; } ?>"/>
							</div>
							<div class="col-md-6">	
								<label>Email</label>
								<input type="email" class="form-control" id="cemail" name="cemail" placeholder="Enter Company Email" value="<?php if(isset($company)) { echo $company['cemail']; } ?>"/>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6">	
								<label>Mobile</label>
								<input type="text" class="form-control" id="cmobile" name="cmobile" placeholder="Enter Company Mobile" value="<?php if(isset($company)) { echo $company['cmobile']; } ?>"/>
							</div>
							<div class="col-md-6">	
								<label>Telephone</label>
								<input type="text" class="form-control" id="ctel" name="ctel" placeholder="Enter Company Telephone" value="<?php if(isset($company)) { echo $company['ctel']; } ?>"/>
							</div>
						</div>					
						<div class="col-md-12">
							<div class="col-md-6">	
								<label>Pan Number </label>
								<input type="text" class="form-control" id="pan" name="pan" placeholder="Enter Pan Number" value="<?php if(isset($company)) { echo $company['pan']; } ?>"/>
							</div>
							<div class="col-md-6">	
								<label>Service Tax No. </label>
								<input type="text" class="form-control" id="sertexno" name="sertexno" placeholder="Enter Service Tax No." value="<?php if(isset($company)) { echo $company['sertexno']; } ?>"/>
							</div>
						</div>					
						<div class="col-md-12">
							<div class="col-md-3">	
								<label>Owner Name  <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="owner" name="owner" placeholder="Enter Owner Name" required value="<?php if(isset($company)) { echo $company['owner']; } ?>"/>
							</div>
							<div class="col-md-3">
								<label>Establish Date(YYYY-MM-DD)</label>
								<input type="text" class="form-control" name="edate" id="edate" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" value="<?php if(isset($company)) { echo $company['establishdate']; } ?>">	
							</div>						
							<div class="col-md-6">	
								<label>Logo</label>
								<input type="file" name="file"/><br/>
							</div>				
						</div>	
						<div class="col-md-12">	
							<div class="col-md-6">
								<label>Receipt Header <span class="text-danger">*</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label class="radio-inline">
	                                <input type="radio" name="invoice_template" id="invoice_template" value="1" <?php if(isset($company)) { if($company['invoice_template']=="1") { echo "checked"; }} else { echo "checked";} ?>>
	                                Yes                   
	                            </label>
	                         
	                            <label class="radio-inline">
	                                <input type="radio" name="invoice_template" id="invoice_template" value="0" <?php if(isset($company)) { if($company['invoice_template']=="0") { echo "checked"; } } ?>>
	                                No                   
	                            </label>
							</div>						
							<div class="col-md-6">	
								<label>Modules <span class="text-danger">*</span></label>&nbsp;&nbsp;
	                            <?php foreach($modules as $module) { ?>
		                            <label class="radio-inline">
		                                <input type="checkbox" name="cmodules[<?php if(isset($editmodules[$module['module_id']])) { echo $editmodules[$module['module_id']]['company_modules_id'];} ?>]" value="<?php if(isset($editmodules[$module['module_id']])) { echo $editmodules[$module['module_id']]['module_id']; } else { echo $module['module_id']; }?>" <?php if(isset($editmodules[$module['module_id']])) { echo "checked"; } ?>>
		                                <?php echo $module['module_name'];?>                   
		                            </label>
								<?php } ?>                                                     
							</div>																
						</div>
						<div class="col-md-12">	
							<div class="col-md-6">
								<label>Terms and conditions</label>
								<textarea class="form-control" id="terms_condition" name="terms_condition" placeholder="Enter Terms Condition" rows="5" ><?php if(isset($company)) { echo $company['terms_condition']; } ?></textarea>
							</div>
							<div class="col-md-6">
								<label>Address <span class="text-danger">*</span></label>
								<textarea class="form-control" id="caddress" name="caddress" placeholder="Enter Address"rows="5" required ><?php if(isset($company)) { echo $company['caddress']; } ?></textarea>
							</div>												
						</div>					
						<div class="col-md-12"><br/>
							<div class="modal-footer">
								<input type="submit" name="submit"  class="btn btn-primary" value="Submit">
								<input type="reset" name="reset"  class="btn btn-default" value="Reset">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div><!-- /.box-body -->
	</div>
</div>

<script type="text/javascript">
	$('#edate').datepicker({ autoclose:true });
</script>