<?php
	$action=base_url()."payment/save_payment";
	if(isset($edit_payment)) {	
		$action=base_url()."payment/save_edit_payment";
	}
?>
<form action="<?php echo $action; ?>" method="post" id="paymentForm" class="col-md-12">
<?php 
	if(!isset($edit_payment) && $due_amount < 1) {
		echo '<div class="alert alert-danger" role="alert">This invoice is already paid</div>';
	}
	else {
?>
	<?php
		if(isset($edit_payment)) {						
			echo '<input type="hidden" name="prid" value="'.$edit_payment['prid'].'"/>';
		}
		else {
			echo '<input type="hidden" name="inid" value="'.$invoice[0]['inid'].'" />';
		}
	?>

	<div class="col-md-4">
		<label>Amount <span class="text-danger">*</span></label>
		<input type="number" class="form-control" id="amount" min="1" max="<?php echo $due_amount; ?>" value="<?php if(isset($edit_payment)) { echo $edit_payment['amount']; } ?>" name="amount" placeholder="Enter Amount" required/>
	</div>

	<!-- for showing invoice detail -->
	<?php if(count($payments) < 1 && !isset($edit_payment)) { ?>
	<div class="col-md-4">
		<label>Invoice Amount</label>
		<input type="text" class="form-control" value="<?php echo "Rs. ".$invoice[0]['total_amount']; ?>" readonly/>
	</div>

	<div class="col-md-4">
		<label>Due Amount</label>
		<input type="text" class="form-control" value="<?php echo "Rs. ".$due_amount; ?>" readonly/>
	</div>
	<?php } ?>


	<div class="col-md-4">	
		<label>Payment Method <span class="text-danger">*</span></label>
		<select name="payment_type" class="form-control" required>
			<option value="cheque" <?php if(isset($edit_payment)) { if($edit_payment['payment_type']=="cheque"){ echo "selected"; }} ?>>CHEQUE</option>
			<option value="cash" <?php if(isset($edit_payment)) { if($edit_payment['payment_type']=="cash"){ echo "selected"; } }?>>CASH</option>
		</select>
	</div>

	<div class="col-md-4">	
		<label>Date <span class="text-danger">*</span></label>
		<input type="text" class="form-control" id="date" value="<?php if(isset($edit_payment)) { echo $edit_payment['date']; } else { echo date('Y-m-d'); } ?>" name="date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" required/>
	</div>

	<div class="col-md-4">
		<label>Ref. No.</label>
		<input type="text" class="form-control" id="ref_no" value="<?php if(isset($edit_payment)) { echo $edit_payment['ref_no']; } ?>" name="ref_no" placeholder="Enter Ref. No." />
	</div>
	<div class="col-md-6">	
		<label>Note</label>
		<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edit_payment)) { echo $edit_payment['note']; } ?></textarea>
	</div>
	<div class="modal-footer col-md-12" style="margin:5px;padding-right:20px;">
		<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:25px;">
		<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:25px;">
		<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:25px;">Close</button>
	</div>
	<?php } /* if invoice paid */ ?>
	<?php
	 if(count($payments) > 0 && !isset($edit_payment)) {
	 ?>
	<div class="col-md-12" style="margin-top:5px">
		<table class="table table-bordered">
			<tr class="active">
				<th>Date</th>
				<th>Type</th>
				<th>Note</th>
				<th>Amont</th>
			</tr>
			<?php 
				$pay_total=0;
				foreach($payments as $pay) { 
					echo '<tr>
						<td>'.date('d-m-Y',strtotime($pay['date'])).'</td>
						<td>'.$pay['payment_type'].'</td>
						<td>'.$pay['note'].'</td>
						<td>'.$pay['amount'].'</td>
					</tr>';
					$pay_total+=$pay['amount'];
				}
			?>
			<tfoot>
				<tr>
					<td colspan="3">Total Amount </td>
					<td><?php echo "Rs. ".$pay_total; ?></td>
				</tr>
				<tr>
					<td colspan="3">Invoice Amount</td>
					<td><?php echo "Rs. ".$invoice[0]['total_amount']; ?></td>
				</tr>
				<tr>
					<td colspan="3">Due Amount</td>
					<td><?php echo "Rs. ".$due_amount; ?></td>
				</tr>
			</tfoot>
		</table>
	</div>
	<?php } ?>
</form>

<style>
	.chosen-container {
		width:250px;
	}
</style>

<script>
$('#paymentForm').submit(function() {
	/*var due_amount=<?php echo $due_amount; ?>;
	var amount=parseInt($('input[name="amount"]').val());
	if(amount > due_amount) {
		alert('Payment amount can not graterthan due amount, Due amount is '+due_amount);
		return false;
	}*/

});
$('#date').datepicker();
</script>