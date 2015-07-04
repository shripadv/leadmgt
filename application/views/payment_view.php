<div class="box box-success">
	<div class="box-header">
		<h3 class="box-title"><i class="fa fa-fw fa-list-alt"></i> Payment Details</h3>
	</div><!-- /.box-header -->		
	<div class="header" style="margin-left:15px;">
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchPayment).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>	
		<a href="#" id="editPayment" class="fa fa-fw fa-edit" data-toggle="tooltip" data-placement="bottom" title="Edit Payment"></a>	
	  	<a href="#"  id="deleteall" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Payment"></a>
	</div>
	<div class="box-body table-responsive">
		<table class='table table-bordered table-striped dataTable'>
			<thead>
				<tr>
					<th>#</th>
					<th>Invoice</th>
					<th>Client	</th> 
					<th>Payment By</th> 
					<th>Note</th>
					<th>date</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$total_amount=0;
				foreach ($payments as $row)
				{
			?>					
				<tr id="itr<?php echo $row['prid']?>">
					<td>
						<label>
							<input type="checkbox"  id="paymentId[]" name="paymentId[]" value="<?php echo $row['prid']; ?>" class="selectAll">
						</label>							
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
					<td><?php echo $row['payment_type']; ?></td>
					<td><?php echo wordwrap($row['note'],44,'<br/>',true); ?></td>
					<td><?php $date = date_create($row['date']); echo date_format($date,"d-m-Y");?></td>
					<td><?php echo $row['amount']; ?></td>
					<?php $total_amount+=$row['amount']; ?>
				</tr>	
			<?php } ?>								
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" align="right" class="warning"> 
						<label>Total</label>
					</td>
					<td>
						<?php echo $total_amount; ?>
					</td>
				</tr>
			<tfoot>
		</table>
	</div>
</div>	

<!-- Modal -->
<div class="modal fade" id="searchPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Payments</h4>
			</div>
			<div class="modal-body">
				<form name="search_invoice" method="post" action="<?php echo base_url().'payment/search_payments';?>">
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
						<input type="text" class="form-control" name="invoice_no" placeholder="Enter Invoice No."/> 
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<br/>
						<label class="checkbox-inline">
							<input type="radio" name="payment_type" value=""/> All
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="payment_type" value="cash"/> Cash
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="payment_type" value="chaque"/> Chaque
						</label>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>Ref. No.</label>
						<input type="text" class="form-control" name="ref_no" placeholder="Payment Reference Number"/>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>From Date</label>
						<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
					</div>
					<div class="form-group col-md-6 col-lg-6">
						<label>To Date</label>
						<input type="text" class="form-control" id="to_date" name="to_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
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
$(document).ready(function() {
	$('.chosen-container').css('width','250px');
});

function get_selected() {
	var slvals = []
	$('input:checkbox[name^=paymentId]:checked').each(function() {
		slvals.push($(this).val())
	})
	id=slvals;
	return id;
}

$('#print').click(function () {
	var id=get_selected();
	if(id.length>1 || id.length<1) {
	alert ('Select 1 record at a time!');
	}
	else {
		window.location=base_url+"invoice/print_rec/"+id; 
	}
});

$('#editPayment').click(function () {
	var id=get_selected();
	if(id.length>1 || id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		/*$.ajax(
			{
				url     : base_url+"payment/edit_payment/"+id,
	            type    : 'POST',
	            success : function(data) {
		            	$('#commanModal .modal-title').html("Enter Payment");
		                $('#commanModal .modal-body').html(data);
		                $('#commanModal').modal('show');
		            }
       		}
       	);*/
		var url=base_url+"payment/edit_payment/"+id;
		get_modaldata("Enter Payment",url);
	}
});

$('#deleteall').click(function () {
	var id=get_selected();
	if(id.length<1) {
		alert ('Select 1 record at a time!');
	}
	else {
		var x=confirm("Are you sure to delete record permanently?");
		if (x) {
			$.ajax({
				  url     : base_url+"payment/del_payment/",
				  type    : 'POST',
				  data    : {'id':id},
				  success : function(data){
					data=$.parseJSON(data);
					if(data.status == '1') {
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
	"scrollY": "510px",
	"aaSorting": [] 	
});

$('#from_date').datepicker();
$('#to_date').datepicker();
</script>	