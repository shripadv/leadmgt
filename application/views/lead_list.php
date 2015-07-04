<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchlead).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="<?php echo base_url().'lead/add_lead'; ?>" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="ADD Lead"></a>
		<a href="#" class="fa fa-fw fa-edit" id="editlead" data-toggle="tooltip" data-placement="bottom" title="Edit Lead"></a>
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Lead"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th width="2%">#</th>
							<th width="2%">Sr.No.</th>
							<th width="20%">Company</th>
							<th width="20%">Name</th> 
							<th width="15%">Lead Owner</th>
							<th width="10%">Mobile</th>
							<th width="16%">Product</th>								
							<th width="5%">Activities</th>	  			
							<th width="10%">Status</th>		  			
						</tr>
					</thead>
 					<tbody>
					<?php
						$i=1;
						foreach ($lead as $row)
						{
					?>					
						<tr id="ltr<?php echo $row['lead_people']; ?>">
							<td width="2%">
								<label>
									<input type="checkbox"  id="checkID[]" name="checkID[]" value="<?php echo $row['lead_people']; ?>" class="selectAll">
								</label>				
							</td>
							<td width="2%"><?php echo $i;?></td>
							<td width="20%"><a href="<?php echo base_url().'lead/lead_detail/'.$row['lead_id'];?>"><?php echo $row['company_name']; ?></a></td>
							<td width="20%"><?php echo $row['first_name']." ".$row['last_name']; ?></td>
							<td width="15%"><?php echo $row['emp_first']." ".$row['emp_secound']; ?></td>
							<td width="10%"><?php echo $row['mobile']; ?></td>
							<td width="16%"><?php echo $row['product']; ?></td>
							<td width="5%">
								<?php 
									if(isset($new_arr[$row['lead_id']])) { 
										echo $new_arr[$row['lead_id']]; 
									} 
									else { echo "0"; } 			
								?>
							</td>
							<td width="10%">
							<span class="btn btn-danger btn-xs" style="background-color:<?php echo $row['color'];?>; border-color:<?php echo $row['color'];?>"><?php echo $row['lead_status'];?></span>
							</td>
						</tr>	
					<?php $i++; } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchlead" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Lead</h4>
			</div>
			<div class="modal-body">
				<form name="search_user" method="post" action="<?php echo base_url().'lead/search_lead';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Name </label>
							<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" />						
						</div>
						<div class="col-md-6">
							<label>Mobile</label>
							<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Company Mobile"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>Lead Owner</label>
							<input type="text" class="form-control" id="lead_owner" name="lead_owner" placeholder="Enter Lead Owner Name" />											
						</div>
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
	$('#editlead').click(function () {
		var slvals = []
		$('input:checkbox[name^=checkID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			window.location=base_url+"lead/edit_lead/"+id;	
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
					  url     : base_url+"lead/del_lead/",
					  type    : 'POST',
					  data    : {'id':id},
					  success : function(data){
						data=$.parseJSON(data);
						if(data.status == '1') {
							alert(data.message);
							$.each(id,function( item,value ) {
							   $('#ltr'+value).remove();
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