<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-check" id="checkall" data-toggle="tooltip" data-placement="bottom" title="Select All"></a>  	
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchexpense).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
  		<a href="#" onclick="get_modaldata('Add Expense','<?php echo base_url()."expense/add_expense"; ?>')" class="fa fa-fw fa-plus" data-toggle="tooltip" data-placement="bottom" title="Add Expense"></a>		
  		<a href="#" class="fa fa-fw fa-edit"  id="editexpense" data-toggle="tooltip" data-placement="bottom" title="Edit Expense"></a>
		<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Expense"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table id='tab1' class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th>
							<th>sr no.</th>
							<th>Date</th>
							<th>Expense Head</th>
							<th>Particular</th>
							<th>Amount</th>
							<th>Payment Type</th>
							<th>Ref No</th>
						</tr>
					</thead>
 					<tbody>
					<?php
						$i=1;
						$total_expense=0;
						if(empty($expense)):
						else :
						foreach ($expense as $row)
						{
							$total_expense+=$row['amount'];
					?>					
						<tr id="etr<?php echo $row['exid']; ?>">
							<td>
								<label>
									<input type="checkbox"  id="etypeID[]" name="etypeID[]" value="<?php echo $row['exid']; ?>" class="selectAll">
								</label>				
							</td>
							<td><?php echo $i;?></td>
							<td><?php echo $row['date']; ?></td>
							<td><?php echo $row['extTitle']; ?></td>
							<td><?php echo $row['note']; ?></td>
							<td><?php echo $row['amount']; ?></td>
							<td><?php echo $row['payment_type']; ?></td>
							<td><?php echo $row['ref_no']; ?></td>
						</tr>	
					<?php $i++; } endif; ?>								
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">Total Expenses</td>
							<td><?php echo $total_expense; ?></td>
							<td colspan="2"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchexpense" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Expense</h4>
			</div>
			<div class="modal-body">
				<?php
				$this->load->helper('form');
				echo form_open('expense/search_expense', array('name' => 'searchexpenses'));    
				?>
				<div class="form-group">
					<div class="col-md-6">
						<label>Expense Type</label>
						<?php 
							echo generate_combobox('extid',$expensetype,'extid','title','','class="form-control" id="exid"');								
					    ?>
					</div>
					<div class="col-md-6">
						<label>Payment Type</label>
						<select name="payment_type" class="form-control">
							<option value="">All</option>
							<option value="cheque">Cheque</option>
							<option value="cash">Cash</option>		
						</select>						
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
						<label>Ref. No.</label>
						<input type="text" class="form-control" id="ref_no" name="ref_no" placeholder="Enter Ref. No." />
					</div>	
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

	$('#editexpense').click(function () {
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
	            url     : base_url+"expense/edit_expense/"+exid,
	            type    : 'POST',
	            "dataType":"json",
	            success : function(data){
		            if(data.status == '1') {
		            	$('#commanModal .modal-title').html("Edit Expense");
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
		      url     : base_url+"expense/delete_expense/",
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

$('#from_date').datepicker();
$('#to_date').datepicker();
</script>