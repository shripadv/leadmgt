<div class="col-md-12">
	<div class="row">
		<?php
			if(isset($edit_people)) {
				$people=$edit_people[0];
				if(isset($people['lead_people'])) {
					echo "<input type='hidden' name='p_id' value='".$people['lead_people']."'>";
				}
				else {
					echo "<input type='hidden' name='p_id' value='".$people['people_id']."'>";
				}
			}
		?>
		<div class="box-header">
			<h3 class="box-title">Personal Details</h3>
		</div><!-- /.box-header -->
		<div class="form-group">
			<div class="col-md-6">
				<label>Company Name</label>
				<input type="text" class="form-control" id="company_name" name="company_name" placeholder="Enter Company Name" value="<?php if(isset($people['company_name'])) { echo $people['company_name']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<br/><br/><br/>
			</div>
		</div>		
		<div class="form-group">
			<div class="col-md-6">
				<label>First Name <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter First Name" required value="<?php if(isset($people['first_name'])) { echo $people['first_name']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<label>Last Name <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter Last Name" required value="<?php if(isset($people['last_name'])) { echo $people['last_name']; }?>"/>
			</div>
		</div>	
	</div>
	<div class="row">
		<div class="box-header">
			<h3 class="box-title">Contact Details</h3>
		</div><!-- /.box-header -->	
		<div class="form-group">
			<div class="col-md-6">	
				<label>Email <span class="text-danger">*</span></label>
				<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required value="<?php if(isset($people['email'])) { echo $people['email']; }?>"/>
			</div>
			<div class="col-md-6">	
				<label>Alternate Email</label>
				<input type="email" class="form-control" id="sec_email" name="sec_email" placeholder="Enter Alternate Email" value="<?php if(isset($people['sec_email'])) { echo $people['sec_email']; }?>"/>
			</div>		
		</div>		
		<div class="form-group">
			<div class="col-md-6">
				<label>Mobile <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile" required pattern="[789][0-9]{9}" value="<?php if(isset($people['mobile'])) { echo $people['mobile']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<label>Phone</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Phone" value="<?php if(isset($people['phone'])) { echo $people['phone']; }?>"/> 
			</div>
		</div>	
		<div class="form-group">
			<div class="col-md-6">
				<label>Website</label>
				<input type="text" class="form-control" id="website" name="website" placeholder="Enter Website" value="<?php if(isset($people['website'])) { echo $people['website']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<label>Skype</label>
				<input type="text" class="form-control" id="skype" name="skype" placeholder="Enter Skype Id" value="<?php if(isset($people['skype'])) { echo $people['skype']; }?>"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-6">
				<label>Industry</label>
				<input type="text" class="form-control" id="industry" name="industry" placeholder="Enter industry" value="<?php if(isset($people['industry'])) { echo $people['industry']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<br/><br/><br/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="box-header">
			<h3 class="box-title">Address Details</h3>
		</div><!-- /.box-header -->	
		<div class="form-group">
			<div class="col-md-6">
				<label>Address1 <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="address1" name="address1" placeholder="Enter Address1" required value="<?php if(isset($people['address1'])) { echo $people['address1']; }?>"/> 
			</div>
			<div class="col-md-6">	
				<label>Address2</label>
				<input type="text" class="form-control" id="address2" name="address2" placeholder="Enter Address2" value="<?php if(isset($people['address2'])) { echo $people['address2']; }?>"/> 
			</div>
		</div>	
		<div class="form-group">
			<div class="col-md-6">
				<label>City <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="city" name="city" placeholder="Enter City" value="<?php if(isset($people['city'])) { echo $people['city']; }?>" required/> 
			</div>
			<div class="col-md-6">	
				<label>State</label>
				<?php
					if(isset($people)) {
						$option=$people['state'];
					}
					else {
						$option='';
					}
					echo generate_combobox('state',$sel_state,'StateName','StateName','','class="form-control" id="state" required');								
				?>					
			</div>
		</div>	
		<div class="form-group">
			<div class="col-md-6">
				<label>Country</label>
				<?php
					if(isset($people)) {
						$option=$people['country'];
					}
					else {
						$option='';
					}
					echo generate_combobox('country',$sel_country,'country_name','country_name','','class="form-control" id="country" required');								
				?>				
			</div>
			<div class="col-md-6">	
				<br/><br/><br/>
			</div>
		</div>
	</div>
</div>
<script>
jQuery( document ).ready(function($) {
	$('select[name="state"]').find('option[value="MAHARASHTRA"]').attr("selected",true);
	$('select[name="country"]').find('option[value="India"]').attr("selected",true);
});
</script>