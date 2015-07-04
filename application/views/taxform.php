<div class="col-md-6">
	<div class="box box-primary">
		<div class="box-body">
			<form name="taxes" action="<?php echo base_url().'invoice/save_taxes'; ?>" method="POST" enctype="multipart/form-data">
				<?php
					if(isset($edit_tax)) {
						$edittax=$edit_tax[0];
						echo "<input type='hidden' name='taxid' value='".$edittax['taxid']."'/>";
					}
				?>
				<div class="box-header">
					<h3 class="box-title"><i class="fa fa-money"></i> Tax Details</h3>
				</div><!-- /.box-header --> 			
				<div class="form-group">
					<label>Tax Particular<span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="name" name="name" placeholder="Enter Tax Particular" required value="<?php if(isset($edittax)) { echo $edittax['name']; }?>"/> 
				</div>	
				<div class="form-group">
					<label>Tax(In %) <span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="tax" name="tax" placeholder="Enter Tax" required value="<?php if(isset($edittax)) { echo $edittax['tax']; }?>"/> 	
				</div>
				<div class="form-group">	
					<label>Note</label>
					<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edittax)) { echo $edittax['note']; }?></textarea>
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
				<h3 class="box-title"><i class="fa fa-money"></i> Tax List</h3>
			</div><!-- /.box-header --> 
			<div class="header" style="margin-left:15px;">
				<a href="#" id="edittax" class="fa fa-fw fa-edit" data-toggle="tooltip" data-placement="bottom" title="Edit Tax"></a>
				<a href="#" id="deletetax" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Tax"></a>				
			</div>			
			<table class='table table-bordered table-striped dataTable'>
				<thead>
					<tr>
						<th>#</th> 
						<th>Tax Particular</th> 
						<th>Tax</th>
					</tr>
				</thead>
				<tbody>
				<?php
					foreach ($tax as $row)
					{
				?>					
					<tr id="ttr<?php echo $row['taxid']?>">
						<td>
							<label>
								<input type="checkbox"  id="taxID[]" name="taxID[]" value="<?php echo $row['taxid']; ?>" class="selectAll">
							</label>							
						</td>					
						<td><?php echo $row['name']; ?></td>
						<td><?php echo $row['tax']; ?></td>
					</tr>	
				<?php } ?>								
				</tbody>
			</table>
		</div><!-- /.box-body -->
	</div>
</div>
<script type="text/javascript">
$('#edittax').click(function () {
	var slvals = []
	$('input:checkbox[name^=taxID]:checked').each(function() {
	slvals.push($(this).val())
	})
	id=slvals;
	if(id.length>1 || id.length<1) {
	alert ('Select 1 record at a time!');
	}
	else {
		window.location=base_url+"invoice/add_taxes/"+id; 
	}
});
$('#deletetax').click(function () {
	var slvals = [];
	$('input:checkbox[name^=taxID]:checked').each(function() {
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
				url     : base_url+"invoice/del_taxes/",
				type    : 'POST',
				data    : {'id':id},
				success : function(data){
					data=$.parseJSON(data);
					if(data.status == '1') {
						alert(data.message);
						$.each(id,function( item,value ) {
						   $('#ttr'+value).remove();
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