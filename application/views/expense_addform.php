<form name="expenseform" action="<?php echo base_url()."expense/save_expense"?>" method="post">
<?php
	if(isset($edit_expense)) {						
		echo '<input type="hidden" name="exid" value="'.$edit_expense['exid'].'"/>';
	}
?>	
<div class="col-md-6">
	<label>Expense Head <span class="text-danger">*</span></label>
	<?php 
		if(isset($edit_expense)) { 
			$option=$edit_expense['extid'];
		}
		else {
			$option='';
		}	
		echo generate_combobox('extid',$expensetype,'extid','title',$option,'class="form-control" id="extid" required');								
	?>
</div>
<div class="col-md-6">	
	<label>Payment Type <span class="text-danger">*</span></label>
	<select name="payment_type" class="form-control" required>
		<option value="">SELECT</option>
		<option value="cheque" <?php if(isset($edit_expense)) { if($edit_expense['payment_type']=="cheque"){ echo "selected"; }} ?>>CHEQUE</option>
		<option value="cash" <?php if(isset($edit_expense)) { if($edit_expense['payment_type']=="cash"){ echo "selected"; } }?>>CASH</option>		
	</select>
</div>
<div class="col-md-6">	
	<label>Date <span class="text-danger">*</span></label>
	<input type="text" class="form-control" id="date" value="<?php if(isset($edit_expense)) { echo $edit_expense['date']; } else { echo date('Y-m-d'); } ?>" name="date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" required/>
</div>
<div class="col-md-6">
	<label>Ref. No.</label>
	<input type="text" class="form-control" id="ref_no" value="<?php if(isset($edit_expense)) { echo $edit_expense['ref_no']; } ?>" name="ref_no" placeholder="Enter Ref. No." />
</div>
<div class="col-md-6">	
	<label>Amount <span class="text-danger">*</span></label>
	<input type="text" class="form-control" id="amount" value="<?php if(isset($edit_expense)) { echo $edit_expense['amount']; } ?>" name="amount" placeholder="Enter Amount" required/>
</div>


<div class="col-md-6">	
	<label>Particular/ Note</label>
	<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edit_expense)) { echo $edit_expense['note']; } ?></textarea>
</div>

<div class="modal-footer">
	<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:25px;">
	<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:25px;">
	<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:25px;">Close</button>
</div>		
</form>
<script type="text/javascript">
	$('#date').datepicker();
	$('#cheque_date').datepicker();
</script>			      			
