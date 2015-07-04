<form name="expensetypeform" action="<?php echo base_url()."expense/save_expensetype" ?>" method="post">
<?php
	if(isset($edit_etype)) {						
		echo '<input type="hidden" name="extid" value="'.$edit_etype['extid'].'"/>';
	}
?>
<div class="form-group">	
	<label>Expense Head <span class="text-danger">*</span></label>
	<input type="text" class="form-control" id="title" name="title" value="<?php if(isset($edit_etype)) { echo $edit_etype['title']; } ?>" placeholder="Enter Expense Title" required/>
</div>
<div class="form-group">	
	<label>Note</label>
	<textarea class="form-control" id="note" name="note" placeholder="Enter Note"><?php if(isset($edit_etype)) { echo $edit_etype['note']; } ?></textarea>
</div>
<div class="modal-footer">
	<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:0px;">
	<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:0px;">
	<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:0px;">Close</button>
</div>		
</form>					      			
