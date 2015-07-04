<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchproduct).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="#" id="add_product" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="ADD Product"></a>
		<a href="#" class="fa fa-fw fa-edit" id="editproduct" data-toggle="tooltip" data-placement="bottom" title="Edit Product"></a>
	  	<a href="#" id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Product"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th width="5%">#</th>
							<th width="10%">Sr.No.</th>
							<th width="30%">Product</th>
							<th width="12%">Price</th> 
							<th width="30%">Note</th>
							<th width="13%">Added On</th> 			
						</tr>
					</thead>
 					<tbody>
					<?php
						$i=1;
						foreach ($product as $row)
						{
					?>					
						<tr id="ptr<?php echo $row['product_id']; ?>">
							<td width="5%">
								<label>
									<input type="checkbox"  id="checkID[]" name="checkID[]" value="<?php echo $row['product_id']; ?>" class="selectAll">
								</label>				
							</td>
							<td width="10%"><?php echo $i;?></td>
							<td width="30%"><?php echo $row['product_title']; ?></td>
							<td width="12%"><?php echo $row['price']; ?></td>
							<td width="30%"><?php echo $row['note']; ?></td>
							<td width="13%"><?php echo dateformat($row['created_at']); ?></td>
						</tr>	
					<?php $i++; } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Product</h4>
			</div>
			<div class="modal-body">
				<form name="search_user" method="post" action="<?php echo base_url().'lead/search_product';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Product Title </label>
							<input type="text" class="form-control" id="product_title" name="product_title" placeholder="Enter Product Title" />
						</div>
						<div class="col-md-6">
							<label>Price</label>
							<input type="text" class="form-control" id="price" name="price" placeholder="Enter Price"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>From Date</label>
							<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
						</div>
						<div class="col-md-6">
							<label>End Date</label>
							<input type="text" class="form-control" id="to_date" name="to_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
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
<style>
.datepicker {
	z-index:9999;
}
</style>
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
	$('#add_product').click(function() {
		var url=base_url+"lead/add_product";
		get_modaldata('Add Product',url);		
	});

	$('#editproduct').click(function () {
		var slvals = []
		$('input:checkbox[name^=checkID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			var url=base_url+"lead/add_product/"+id;
			get_modaldata('Edit Product',url);
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
					  url     : base_url+"lead/del_product/",
					  type    : 'POST',
					  data    : {'id':id},
					  success : function(data){
						data=$.parseJSON(data);
						if(data.status == '1') {
							alert(data.message);
							$.each(id,function( item,value ) {
							   $('#ptr'+value).remove();
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