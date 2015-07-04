<div class="col-md-6">
	<div class="box box-primary">
		<div class="box-body">
			<form name="taxes" action="<?php echo base_url().'invoice/save_service'; ?>" method="POST" enctype="multipart/form-data">
				<?php
					if(isset($edit_service)) {
						$editservice=$edit_service[0];
						echo "<input type='hidden' name='serviceid' value='".$editservice['serviceid']."'/>";
					}
				?>
				<div class="box-header">
					<h3 class="box-title"><i class="fa fa-money"></i> Service Details</h3>
				</div><!-- /.box-header --> 			
				<div class="form-group">
					<label>Service Name<span class="text-danger">*</span></label>
					<!--<input type="text" class="form-control" id="servicename" name="servicename" placeholder="Enter Tax Particular" required value="<?php if(isset($editservice)) { echo $editservice['servicename']; }?>"/> -->
					<textarea class="form-control" rows="5" id="servicename" name="servicename" placeholder="Enter Tax Particular" required><?php if(isset($editservice)) { echo $editservice['servicename']; }?></textarea>
				</div>	
				<div class="form-group">	
					<label>Note</label>
					<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($editservice)) { echo $editservice['note']; }?></textarea>
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
				<h3 class="box-title"><i class="fa fa-money"></i> Service List</h3>
			</div><!-- /.box-header --> 
			<div class="header" style="margin-left:15px;">
				<a href="#" id="editservice" class="fa fa-fw fa-edit" data-toggle="tooltip" data-placement="bottom" title="Edit Service"></a>
				<a href="#" id="deleteservice" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Service"></a>				
			</div>			
			<table class='table table-bordered table-striped dataTable'>
				<thead>
					<tr>
						<th>#</th> 
						<th>Service Name</th> 
						<th>Note</th>
					</tr>
				</thead>
				<tbody>
				<?php
					foreach ($service as $row)
					{
				?>					
					<tr id="srtr<?php echo $row['serviceid']?>">
						<td>
							<label>
								<input type="checkbox"  id="serviceID[]" name="serviceID[]" value="<?php echo $row['serviceid']; ?>" class="selectAll">
							</label>							
						</td>					
						<td><?php echo $row['servicename']; ?></td>
						<td><?php echo $row['note']; ?></td>
					</tr>	
				<?php } ?>								
				</tbody>
			</table>
		</div><!-- /.box-body -->
	</div>
</div>
<script type="text/javascript">
$('#editservice').click(function () {
	var slvals = []
	$('input:checkbox[name^=serviceID]:checked').each(function() {
	slvals.push($(this).val())
	})
	id=slvals;
	if(id.length>1 || id.length<1) {
	alert ('Select 1 record at a time!');
	}
	else {
		window.location=base_url+"invoice/add_service/"+id; 
	}
});
$('#deleteservice').click(function () {
	var slvals = [];
	$('input:checkbox[name^=serviceID]:checked').each(function() {
	slvals.push($(this).val());
	})
	id=slvals;
	if(id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		var x=confirm("Are you sure to delete record?")
		if (x) {
			$.ajax({
				url     : base_url+"invoice/del_service/",
				type    : 'POST',
				data    : {'id':id},
				success : function(data){
					data=$.parseJSON(data);
					if(data.status == '1') {
						alert(data.message);
						$.each(id,function( item,value ) {
						   $('#srtr'+value).remove();
						});	
					}
					else {
						alert(data.message);
					}
				}
			});
		} 
	}
});
	
</script>