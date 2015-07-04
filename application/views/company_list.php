<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchcompany).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
  		<a href="<?php echo base_url().'company/add_company'; ?>" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="Add Company"></a>
		<a href="#" class="fa fa-fw fa-edit" id="editcompany" data-toggle="tooltip" data-placement="bottom" title="Edit Company"></a>
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Company"></a>		
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th>
							<th>Name</th> 
							<th>Display Name</th>
							<th>Email</th> 
							<th>Mobile</th> 
							<th>Address</th>
							<th>Logo</th> 			
						</tr>
					</thead>
 					<tbody>
					<?php
						foreach ($company as $row)
						{
					?>					
						<tr id="ctr<?php echo $row['companyid']; ?>">
							<td>
								<label>
									<input type="checkbox"  id="checkID[]" name="checkID[]" value="<?php echo $row['companyid']; ?>" class="selectAll">
								</label>				
							</td>
							<td><?php echo $row['companyname']; ?></td>
							<td><?php echo $row['shortname']; ?></td>
							<td><?php echo $row['cemail']; ?></td>
							<td><?php echo $row['cmobile']; ?></td>
							<td><?php echo $row['caddress']; ?></td>
							<td>
								<?php if($row['clogo']!='') { ?><img src="<?php echo get_thumb(base_url()."logo/".$row['clogo'],'thumb_150'); ?>" class="img-thumbnail"> <?php } ?>
							</td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchcompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Company</h4>
			</div>
			<div class="modal-body">
				<form name="search_company" method="post" action="<?php echo base_url().'company/search_company';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Company Name</label>
							<input type="text" class="form-control" id="companyname" name="companyname" placeholder="Enter Company Name"/> 
						</div>
						<div class="col-md-6">
							<label>Short Name </label>
							<input type="text" class="form-control" id="short_name" name="short_name" placeholder="Enter Short Company Name" maxlength="15"/>						
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>From Date</label>
							<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>											
						</div>
						<div class="col-md-6">
							<label>To Date</label>
							<input type="text" class="form-control" id="to_date" name="to_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>Mobile</label>
							<input type="text" class="form-control" id="cmobile" name="cmobile" placeholder="Enter Company Mobile"/>
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
	$('#editcompany').click(function () {
		var slvals = []
		$('input:checkbox[name^=checkID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			window.location=base_url+"company/edit_company/"+id;	
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
					  url     : base_url+"company/del_company/",
					  type    : 'POST',
					  data    : {'id':id},
					  success : function(data){
						data=$.parseJSON(data);
						if(data.status == '1') {
							alert(data.message);
							$.each(id,function( item,value ) {
							   $('#ctr'+value).remove();
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