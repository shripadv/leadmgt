<div class="col-md-6">
	<div class="box box-primary">
		<div class="box-body">
			<form name="customer" action="<?php echo base_url().'user/save_customer';?>" method="POST" enctype="multipart/form-data">	
					<?php 
						if(isset($edit_customer)) {
							$cust=$edit_customer[0];					
							echo '<input type="hidden" name="custid" value="'.$cust['custid'].'"/>';
						}					
					?>					
				<div class="form-group">
					<div class="col-md-6">
						<label>Client Name <span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Customer Name" required value="<?php if(isset($cust)) { echo $cust['cust_name']; } ?>"/>
					</div>	
					<div class="col-md-6">
						<label>Contact Person. <span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="cperson" name="cperson" placeholder="Enter Contact Person" value="<?php if(isset($cust)) { echo $cust['cperson']; } ?>" required/> 	
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6">
						<label>Contact No.</label>
						<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Contact No." pattern="[789][0-9]{9}" value="<?php if(isset($cust)) { if($cust['cust_mobile']!="0"){ echo $cust['cust_mobile']; } else { echo ""; } } ?>"/> 	
					</div>
					<div class="col-md-6">	
						<label>Email</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" value="<?php if(isset($cust)) { echo $cust['cust_email']; } ?>"/>
					</div>	
				</div>	
				<div class="col-md-12">	
					<label>Address <span class="text-danger">*</span></label>
					<textarea class="form-control" id="address" rows="5" name="address" placeholder="Enter Address" required ><?php if(isset($cust)) { echo $cust['cust_address']; } ?></textarea>
					<p class="help-block" style="color:red;"> (will be print on invoice same as above)</p>
				</div>
				<div class="col-md-12">	
					<label>Note</label>
					<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($cust)) { echo $cust['note']; } ?></textarea>
				</div>					
				<div class="modal-footer">
					<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
					<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
				</div>
			</form>
		</div><!-- /.box-body -->
	</div>
</div>

<div class="col-md-6">
	<div class="box box-primary">
		<div class="box-body">
			<div class="box-header">
				<h3 class="box-title"><i class="ion ion-person-stalker"></i> Client's Details</h3>
			</div><!-- /.box-header --> 			
			<table class='table table-bordered table-striped dataTable'>
				<thead>
					<tr>
						<th>Name</th> 
						<th>Mobile</th>
						<th>Email</th> 
					</tr>
				</thead>
				<tbody>
				<?php
					foreach ($customer as $row)
					{
				?>					
					<tr>
						<td><?php echo $row['cust_name']; ?></td>
						<td><?php echo $row['cust_mobile']; ?></td>
						<td><?php echo $row['cust_email']; ?></td>
					</tr>	
				<?php } ?>								
				</tbody>
			</table>
		</div><!-- /.box-body -->
	</div>
</div>
<script type="text/javascript">
	$('#dob').datepicker();
</script>