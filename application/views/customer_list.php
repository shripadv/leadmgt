<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchcustomer).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="<?php echo base_url().'user/add_client'; ?>" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="ADD Customer"></a>		
		<a href="#" class="fa fa-fw fa-edit" id="editcustomer" data-toggle="tooltip" data-placement="bottom" title="Edit Client"></a>
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Client"></a>		
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th> 
							<th>ClientID</th> 
							<th>Client Name</th> 
							<th>Company Name</th>
							<th>Contact</th>
							<th>Email</th> 
							<th>Address</th>	
							<th>City</th>	
						</tr>
					</thead>
 					<tbody>
					<?php
						foreach ($customer as $row)
						{
					?>					
						<tr id="custtr<?php echo $row['people_id']; ?>">
							<td>
								<label>
									<input type="checkbox"  id="checkID[]" name="checkID[]" value="<?php echo $row['people_id']; ?>" class="selectAll">
								</label>				
							</td>
							<td><?php echo $row['custid']; ?></td>
							<td><?php echo $row['first_name']." ".$row['last_name']; ?></td>
							<td><?php echo $row['company_name']; ?></td>
							<td><?php if($row['mobile']!="0") { echo $row['mobile']; } else { echo "";} ?></td>
							<td><?php echo $row['email']; ?></td>
							<td><?php 
								echo wordwrap($row['address1'],40,'<br/>');
								echo wordwrap($row['address2'],40,'<br/>');	
							?></td>
							<td><?php echo wordwrap($row['city'],40,'<br/>'); ?></td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchcustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Client</h4>
			</div>
			<div class="modal-body">
				<form name="search_customer" method="post" action="<?php echo base_url().'user/search_client';?>">
					
					<div class="col-md-6">
						<label>Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" />
						<span class="help-block">Client name, email</span>
					</div>
					<div class="col-md-6">
						<label>Mobile</label>
						<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Company Mobile"/>
					</div>

					<div class="modal-footer">
						<input type="submit" name="submit"  class="btn btn-primary" value="Search" style="margin-top:25px;">
						<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:25px;">
						<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:25px;">Close</button>
					</div>							      			
				</form>
			</div>
		</div>
	</div>
</div>	

<script type="text/javascript">
$('.dataTable').dataTable({
	"bPaginate": false,
	"bsort": true,
	"scrollY": "510px",
	"aaSorting": [] 	
});

$('#from_date').datepicker();
$('#to_date').datepicker();

$(document).ready(function(){
	$('#editcustomer').click(function () {
		var slvals = []
		$('input:checkbox[name^=checkID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			window.location=base_url+"user/edit_client/"+id;	
		}
	});
	
	$('#deleteall').click(function () {
		var slvals = [];
		$('input:checkbox[name^=checkID]:checked').each(function() {
			slvals.push($(this).val())
		});
		id=slvals;
		if(id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			var x=confirm("Are you sure to delete record?");
			if (x) {
				$.ajax({
					  url     : base_url+"user/del_client/",
					  type    : 'POST',
					  data    : {'id':id},
					  success : function(data){
						data=$.parseJSON(data);
						if(data.status == '1') {
							alert(data.message);
							$.each(id,function( item,value ) {
							   $('#custtr'+value).remove();
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
});
</script>