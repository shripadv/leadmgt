<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-check" id="checkall" data-toggle="tooltip" data-placement="bottom" title="Select All"></a>  	
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchexpensetype).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
  		<a href="#" onclick="get_modaldata('Add Expense Type','<?php echo base_url()."expense/add_expensetype"; ?>')" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="Add Expense Type"></a>		
  		<a href="#" class="fa fa-fw fa-edit"  id="editetype" data-toggle="tooltip" data-placement="bottom" title="Edit Expense Type"></a>
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Expense Type"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table id='tab1' class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th>
							<th>Expense Head</th>
							<th>Note</th>		  			  			
						</tr>
					</thead>
 					<tbody>
					<?php
						if(empty($expensetype)):
						else :
						foreach ($expensetype as $row)
						{
					?>					
						<tr id="etr">
							<td>
								<label>
									<input type="checkbox"  id="etypeID[]" name="etypeID[]" value="<?php echo $row['extid']; ?>" class="selectAll">
								</label>				
							</td>							
							<td><?php echo $row['title']; ?></td>
							<td><?php echo $row['note']; ?></td>
						</tr>	
					<?php } endif; ?>								
					</tbody>
				</table>
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

$(document).ready(function(){
	$('#checkall').click(function(){
		$('.selectAll').each(function(event) {
			if(this.checked) {
				this.checked = false;
			}
			else {       
				this.checked = true;
			}
		});
	});

	$('#editetype').click(function () {
		var slvals = []
		$('input:checkbox[name^=etypeID]:checked').each(function() {
		slvals.push($(this).val())
		})
		exid=slvals;
		if(exid.length>1 || exid.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			$.ajax({
	            url     : base_url+"expense/edit_etype/"+exid,
	            type    : 'POST',
	            "dataType":"json",
	            success : function(data){
		            if(data.status == '1') {
		            	$('#commanModal .modal-title').html("Edit Expense Type");
		                $('#commanModal .modal-body').html(data.view);
		                $('#commanModal').modal('show');
		            }
		            else {
		                alert(data.view);
		            }
	            }
            });
		}
	});	

    $('#deleteall').click(function () {
		var slvals = []
		$('input:checkbox[name^=etypeID]:checked').each(function() {
			slvals.push($(this).val())
		})
		id=slvals;
		if(id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
		 var x=confirm("Are you sure to delete record?")
		  if (x) {
			$.ajax({
		      url     : base_url+"expense/delete_etype/",
		      type    : 'POST',
		      data    : {'id':id},
		      success : function(data){
		      	data=$.parseJSON(data);
		      	if(data.status == '1') {
		      		alert(data.message);
		      		$('#etr'+id).remove();
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

<!-- Modal -->
<div class="modal fade" id="searchexpensetype" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Expense Head</h4>
			</div>
			<div class="modal-body">
				<?php
				$this->load->helper('form');
				echo form_open('expense/search_etype', array('name' => 'searchetype'));    
				?>
				<div class="form-group">
					<label>Expense Head </label>
					<input type="text" class="form-control" id="title" name="title" placeholder="Enter Expense Head"  />
				</div>
				<div class="modal-footer">
					<input type="submit" name="submit"  class="btn btn-primary" value="Search" style="margin-top:25px;">
					<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:25px;">
					<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:25px;">Close</button>
				</div>							      			
				<?php
				echo form_close();
				?>
			</div>
		</div>
	</div>
</div>	