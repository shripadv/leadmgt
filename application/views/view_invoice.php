<div class="box box-success">
	<div class="box-header">
		<h3 class="box-title"></h3>
	</div><!-- /.box-header -->		
	<div class="header" style="margin-left:15px;">
		<a href="#" id="enterPayment" class="fa fa-fw fa-money" data-toggle="tooltip" data-placement="bottom" title="Enter Payment"></a>	
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchinvoice).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>	
		<a href="#" id="editinvoice" class="fa fa-fw fa-edit" data-toggle="tooltip" data-placement="bottom" title="Edit Invoice"></a>	
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Invoice"></a>		
	</div>
	<div class="box-body table-responsive">
		<table class='table table-bordered table-striped dataTable'>
			<thead>
				<tr>
					<th>#</th>
					<th>Invoice No</th> 
					<th>Client Name</th> 
					<th>Date</th>
					<th>Total</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$total_amount=0;
				$paid_amount=0;
				foreach ($invoice as $row)
				{
			?>					
				<tr id="itr<?php echo $row['inid']?>">
					<td>
						<label>
							<input type="checkbox"  id="invoiceID[]" name="invoiceID[]" value="<?php echo $row['inid']; ?>" class="selectAll">
						</label> &nbsp;&nbsp;
						<a target="_blank" href="<?php echo base_url()."invoice/print_rec/".$row['inid']; ?>" class="fa fa-fw fa-print" data-toggle="tooltip" data-placement="bottom" title="Print Invoice"></a>			
					</td>
					<td><?php echo $row['invoice_no']; ?></td>
					<td>
						<?php 
							if($row['company_name']!=''){
								echo $row['company_name']; 
							}
							else {
								echo $row['first_name']." ".$row['last_name']; 
							}	
						?>
					</td>
					<td><?php echo dateformat($row['bill_date']);?></td>
					<td><?php echo $row['total_amount']; ?></td>
					<td>
						<?php 
							if($row['paid_amount']!='') { 
								if($row['paid_amount']==$row['total_amount']) {
									echo '<span class="label label-success" role="button" data-toggle="popover" data-placement="left" data-content="Fully paid" data-html="true" data-trigger="hover">Paid</span>';
								}
								else {
									echo '<div class="label label-warning" role="button" data-toggle="popover" data-placement="left" data-content="Total Amount: '.$row['total_amount'].'<br/> Paid Amount: '.$row['paid_amount'].'<br/> Due Amount: '.($row['total_amount']-$row['paid_amount']).'" data-html="true" data-trigger="hover">Partial</span>';
								}
							} 
							else {
								 echo '<span class="label label-danger" role="button" data-toggle="popover" data-placement="left" data-content="Not Yet paid" data-html="true" data-trigger="hover">Drafted</span>';
							 }; 
						?>
					</td>
					<?php 
						$total_amount+=$row['total_amount']; 
						if($row['paid_amount']!='') {
							$paid_amount+=$row['paid_amount'];
						}
					?>
				</tr>	
			<?php } ?>								
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="right"> Invoice Total</td>
					<td>
						<?php echo $total_amount; ?>
					</td>
					<td>
						<?php echo $paid_amount; ?>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>	

<!-- Modal -->
<div class="modal fade" id="searchinvoice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Invoice</h4>
			</div>
			<div class="modal-body">
				<form name="search_invoice" method="post" action="<?php echo base_url().'invoice/search_invoice';?>">
					<div class="form-group col-md-6 col-lg-6">
						<label>Customer Name</label>
						<?php 
							foreach($customer_list as $row) {
								if($row['company_name']!=''){
									$op_title='company_name';
								}
								else {
									$op_title='first_name';
								}
							}						
							echo generate_combobox('custid',$customer_list,'custid',$op_title,'','class="form-control chosen"'); 
						?>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>Invoice NO</label>
						<input type="text" class="form-control" id="invoice_no" name="invoice_no" placeholder="Enter Invoice No."/> 
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>Pay Status</label>
						<select name="payment_status" class="form-control">
							<option value="">All</option>
							<option value="drafted">Drafted</option>
							<option value="partial">Partial</option>
							<option value="paid">Paid</option>
						</select>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>From Date</label>
						<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>To Date</label>
						<input type="text" class="form-control" id="to_date" name="to_date" value="<?php echo date('Y-m-d'); ?>" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
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

$(function () {
  $('[data-toggle="popover"]').popover()
})

function get_selected() {
	var slvals = []
	$('input:checkbox[name^=invoiceID]:checked').each(function() {
	slvals.push($(this).val())
	})
	id=slvals;
	return id;
}


$('#editinvoice').click(function () {
	var id=get_selected();
	if(id.length>1 || id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		window.location=base_url+"invoice/edit_invoice/"+id; 
	}
});

/* show model of enter payment */
$('#enterPayment').click(function() {
	var id=get_selected();
	if(id.length>1 || id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		/*$.ajax(
			{
				url     : base_url+"payment/add_payment/"+id,
	            type    : 'POST',
	            success : function(data) {
		            	$('#commanModal .modal-title').html("Enter Payment");
		                $('#commanModal .modal-body').html(data);
		                $('#commanModal').modal('show');
		            }
       		}
       	);*/
       	var url=base_url+"payment/add_payment/"+id;
       	get_modaldata("Enter Payment",url);
	}
});


$('#deleteall').click(function () {
	var id=get_selected();
	if(id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		var x=confirm("Are you sure to delete record?");
		if (x) {
			loading();
			$.ajax({
				  url     : base_url+"invoice/del_invoice/",
				  type    : 'POST',
				  data    : {'id':id},
				  success : function(data){
					data=$.parseJSON(data);
					if(data.status == '1') {
						remove_loading();
						alert(data.message);
						$.each(id,function( item,value ) {
						   $('#itr'+value).remove();
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

$('.dataTable').dataTable({
	"bPaginate": false,
	"bsort": true,
	"scrollY": "450px",
	"aaSorting": [] 	
});
$('#from_date').datepicker();
$('#to_date').datepicker();
$(document).ready(function() {
	$('.chosen-container').css('width','250px');
});
</script>	