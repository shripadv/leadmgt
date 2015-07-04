<div class="col-md-12">
	<div class="box box-primary">
		<div class="box-body">
			<form name="invoice" id="invoice_form" method="post" action="<?php echo base_url().'invoice/save_invoice'; ?>" onsubmit="return checkcontrol()">
				<input type="hidden" name="deleted_item" value="" />
				<div class="form-group">
					<?php
						if(isset($edit_invoice)) {
							$invoice=$edit_invoice[0];
							echo "<input type='hidden' name='inid' id='inid' value='".$invoice['inid']."'/>";
						}
					?>
					<div class="col-md-6">
						<label>Client Name <span class="text-danger">*</span> </label>
						<?php 
						$op_title='company_name';
						foreach($customer as $row) {
							if($row['company_name']!=''){
								$op_title='company_name';
							}
							else {
								$op_title=array('first_name','last_name');
							}
						}
						if(isset($invoice)) {
							$option=$invoice['custid'];
						}
						else {
							$option='';
						}
						echo generate_combobox('custid',$customer,'custid',$op_title,$option,'class=" form-control chosen" id="custid"');
						?>
						<span class="help-block" style="color:red;"> (will be print on invoice)</span>
					</div>
					<div class="col-md-3">
						<label>Date <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="bill_date" id="bill_date" value="<?php if(isset($invoice)) { echo $invoice['bill_date'];}?>" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}" required >	
					</div>
					<div class="col-md-3">
						<label>Invoice No. <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="invoice_no" id="invoice_no" value="<?php if(isset($invoice)) { echo $invoice['invoice_no'];} else { if(!empty($inid)) { echo $inid;} }?>" readonly required>	
					</div>					
				</div>
				<div class="col-md-12"><br/>
					<div class="form-group">
						<input type="button" name="add_item" value="+" class="btn btn-sm btn-primary" style="float:right;" onClick="addMore();" />		
					</div>
				</div>
				<div class="col-md-12"><br/>
					<table class='table table-bordered' id="item_table">
						<thead>
							<tr class="active">
								<th>REIMB</th> 
								<th>Particular</th> 
								<th>Quantity</th> 
								<th>Rate</th> 
								<th>Amount</th>  			
								<th>#</th>  			
							</tr>
						</thead>
						<tbody>
							<?php 
								if(isset($edit_invoice)) {
									$count=count($edit_invoice);
									for($i=0;$i<$count;$i++) {
									if($edit_invoice[$i]['tax_id']=='0') {
							?>
							<tr>
								<td style="width: 50px;">
									<input type="checkbox" name="reimbursement[<?php echo $edit_invoice[$i]['initid']; ?>]" value="1" <?php if($edit_invoice[$i]['reimbursement']!='0') { echo "checked"; } ?> />
								</td>
								<td>
								<input type='hidden' name='initid[<?php echo $edit_invoice[$i]['initid']; ?>]' value="<?php echo $edit_invoice[$i]['initid'];?>"/>
								<?php 
									 if(isset($invoice)) {
										$option=$edit_invoice[$i]['particular'];
									}
									else {
										$option='';
									}
									//echo generate_combobox('particular['.$edit_invoice[$i]['initid'].']',$service,'servicename','servicename',$option,'class="form-control chosen" required');
								?>
								<!--<input type="text" name="particular[<?php echo $edit_invoice[$i]['initid']; ?>]" class="form-control autocomplete" value="<?php echo $edit_invoice[$i]['particular']; ?>" />-->
								<textarea name="particular[<?php echo $edit_invoice[$i]['initid']; ?>]" class="form-control autocomplete" rows="3" required><?php echo $edit_invoice[$i]['particular']; ?></textarea>
								</td> 
								<td style="width: 50px;">
									<input type="number" min="1" name="quantity[<?php echo $edit_invoice[$i]['initid']; ?>]" onkeyup="calc_amount(this)" class="form-control" value="<?php echo $edit_invoice[$i]['quantity'];?>" required/>
								</td> 
								<td style="width: 100px;">
									<input type="number" min="1" name="rate[<?php echo $edit_invoice[$i]['initid']; ?>]" onkeyup="calc_amount(this)" class="form-control" value="<?php echo $edit_invoice[$i]['rate'];?>" required />
								</td> 
								<td style="width: 100px;">
									<input type="text" name="amount[<?php echo $edit_invoice[$i]['initid']; ?>]" class="form-control" readonly value="<?php echo $edit_invoice[$i]['amount'];?>"/>
								</td>  			
								<td style="width: 30px;"><a href="#" id="value[]"  onClick="deleteRow(this,'<?php echo $edit_invoice[$i]['initid']; ?>');"><span class="glyphicon glyphicon-remove"></span></a></td>  			
							</tr>							
							<?php
									}
									}
								}
								else {
							?>
							<tr>
								<td style="width: 50px;">
									<input type="checkbox" name="reimbursement[0]" value="1" />
								</td>
								<td>
								<?php 
								//echo generate_combobox('particular[]',$service,'servicename','servicename',$option,'class="form-control chosen"');
								?>
								<!--<input type="text" name="particular[0]" class="form-control autocomplete"/>-->
								<textarea name="particular[0]" class="form-control autocomplete" rows="3" required></textarea>
								</td> 
								<td style="width: 80px;">
									<input type="number" min="1" name="quantity[0]" onkeyup="calc_amount(this)" class="form-control" value="1" required/>
								</td> 
								<td style="width: 100px;">
									<input type="number" min="1" name="rate[0]" onkeyup="calc_amount(this)" class="form-control" required/>
								</td> 
								<td style="width: 100px;">
									<input type="text" name="amount[0]" class="form-control" readonly/>
								</td>  			
								<td style="width: 30px;">
									<a href="#" id="value[]"  onClick="deleteRow(this,'0');"><span class="glyphicon glyphicon-remove"></span></a>
								</td>  			
							</tr>
							<?php } ?>
						</tbody>
						<tfoot>
						<?php if(!isset($edit_invoice)) { ?>
							<tr class="success" id="payment_tr">
								<td><label>Payment</label></td>
								<td colspan="3">
									<div class="row">
										<div class="col-md-3 col-sm-6 col-xm-6 ">
											<label>Payment Type </label>
											<select name="payment_type" class="form-control">
												<option value="cash">Cash</option>
												<option value="chaque">Chaque</option>
												<option value="transfer">Transfer</option>
											</select>
										</div>
										<div class="col-md-2 col-sm-6 col-xm-6">
											<label>Amount</label> 
											<input type="number" name="payment_amount" min="1" class="form-control">
										</div>
										<div class="col-md-2 col-sm-6 col-xm-6">
											<label>Ref.No.</label><input type="text" name="ref_no" class="form-control"/>
										</div>
										<div class="col-md-5 col-sm-6 col-xm-6">
											<label>Note</label> <textarea name="payment_note" class="form-control"></textarea>
										</div>
									</div>
								</td>
								<td><input type="text" class="form-control" id="advance_total" readonly /></td>
								<td></td>
							</tr>
							<?php } ?>
							<tr class="warning">
								<td colspan="4"><label>Total Amount<label></td>
								<td style="width: 100px;">
									<input type="text" name="advamount" class="form-control" readonly />
								</td> 
								<td style="width: 30px;"></td>  			
							</tr>
						</tfoot>
					</table><br/>
				</div>
				<?php if(!empty($tax)) { ?>
				<div class="col-md-6">
					<table class='table table-bordered table-striped'>
						<thead>
							<tr>
								<th>#</th> 
								<th>Tax</th> 
								<th>Rate(%)</th> 		
							</tr>
						</thead>
						<tbody>
							<?php
								$particulars=array();
								if(isset($edit_invoice)) {
									$particulars=array_column($edit_invoice,'particular','initid');
								}
								foreach($tax as $row) {
									$rate=$row['tax'];
									if(isset($edit_invoice)) {
										$checked="";
									}
									else {
										$checked="checked";
									}
									$tax_id=$row['taxid'];
									$key_item=checkIfInArrayString($particulars,$row['name']);
									//dsm($edit_invoice[$key_item['index']]);
									if($key_item!==FALSE) {
										$rate=$edit_invoice[$key_item['index']]['rate'];
										$checked="checked";
										$tax_id=$key_item['value'].'_'.$row['taxid'];
									}
							?>
							<tr>
								<td style="width: 30px;">
									<input type="checkbox" name="tax[<?php echo $tax_id; ?>]" value="1" <?php echo $checked; ?>>
								</td> 
								<td><?php echo $row['name'] ?></td> 
								<td style="width: 80px;">
									<input type="number" min="1" class="form-control col-xs-3" name="tax_amount[<?php echo $tax_id; ?>]" value="<?php echo $rate;?>"/>
								</td> 
							</tr>							
							<?php } ?>	  
						</tbody>
					</table>
					<br/>				                  
				</div>
				<?php } ?>
				<div class="modal-footer">
					<input type="submit" name="submit"  class="btn btn-primary" value="Save" style="margin-top:150px;">
					<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:150px;">
				</div>	
			</form>	<!-- /.form-->				
		</div><!-- /.box-body -->
	</div>
</div>
<table style="display:none">
	<tr id="clone-tr">
		<td style="width: 50px;"><input type="checkbox" name="reimbursement[]" value="1" /></td>
		<td >
			<?php
			//echo generate_combobox('particular[]',$service,'servicename','servicename','','class="form-control" required');
			?>
			<!--<input type="text" name="particular[]" class="form-control"/>-->
			<textarea name="particular[]" class="form-control" rows="3" required></textarea>
		</td> 
		<td style="width: 80px;">
			<input type="number" min="1" name="quantity[]" onkeyup="calc_amount(this)" class="form-control" value="1" required/>
		</td> 
		<td style="width: 100px;">
			<input type="number" min="1" name="rate[]" onkeyup="calc_amount(this)" class="form-control " required/>
		</td> 
		<td style="width: 100px;"><input type="text" name="amount[]" class="form-control" readonly/></td>  			
		<td style="width: 30px;">
			<a href="#" id="value[]"  onClick="deleteRow(this,'0');"><span class="glyphicon glyphicon-remove"></span></a>
		</td>  			
	</tr>
</table>
<script src="<?php echo base_url()."public/js/jquery-ui/jquery-ui.min.js"; ?>"></script>
<link href="<?php echo base_url()."public/js/jquery-ui/jquery-ui.min.css"; ?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$('#bill_date').datepicker();
	$('.chosen').chosen();
	var availableTags=<?php echo json_encode(array_column($service,'servicename')); ?>;
	$( ".autocomplete" ).autocomplete({
      source: availableTags
    });
	
	var add_more=0;
	
	jQuery( document ).ready(function($) {
		$('.help-block').hide();
		find_total();
		var val=$('#custid').val();
		if(val==''){
			var d = new Date();
			var currDate = d.getDate();
			var currMonth = d.getMonth()+1;
			var currYear = d.getFullYear();

			if(String(currDate).length=="1") {
				currDate="0"+String(currDate);

			}
			if(String(currMonth).length=="1") {
				currMonth="0"+String(currMonth);	
			}		
			var dateStr = currYear + "-" + currMonth + "-" + currDate;

			$('#bill_date').val(dateStr);
		}
	});		

	var clon_div=$('#clone-tr').html();

	function addMore() {
		add_more++;
		$('#item_table tbody').append('<tr>'+clon_div+'</tr>');
		var tr=$('#item_table tbody tr:last');
		$(tr).find('textarea[name="particular[]"]').addClass('autocomplete');
		$(tr).find('input[name="reimbursement[]"]').attr('name','reimbursement['+add_more+']');
		$(tr).find('textarea[name="particular[]"]').attr('name','particular['+add_more+']');
		$(tr).find('input[name="quantity[]"]').attr('name','quantity['+add_more+']');
		$(tr).find('input[name="rate[]"]').attr('name','rate['+add_more+']');
		$(tr).find('input[name="amount[]"]').attr('name','amount['+add_more+']');
		
		$( ".autocomplete" ).autocomplete({
		  source: availableTags
		});
	}
	function deleteRow(ele,cnf) {
		if(cnf!='0') {
			/*if(confirm("Are You sure to delete this Record..? \nThis action is not Revert back")) {
				$(ele).parent().parent().remove();
				$.ajax({
					"url":base_url+"invoice/del_invoice_item/"+cnf
				});
			}*/
			var deleted=$('input[name="deleted_item"]').val();
			$('input[name="deleted_item"]').val(deleted+cnf+",");
			$(ele).parent().parent().remove();
		}
		else {
			$(ele).parent().parent().remove();
		}

	}		

	function checkcontrol() {
		if($('#custid').val()=="") {
			$('.help-block').show();
			return false;
		}
	}
	
	function calc_amount(ele) {
		var tr=$(ele).parent().parent();
		var cnt=$(tr).html();
		var qty=$(tr).find('td:nth-child(3)').find('input').val();
		var rate=$(tr).find('td:nth-child(4)').find('input').val();
		var amount=qty*rate;
		$(tr).find('td:nth-child(5)').find('input').val(amount);
		find_total();
	}	
	
	$('input[name="payment_amount"]').change(function() {
		$('#advance_total').val(this.value);
		find_total();
	});
	
	function find_total() {
		var total_amount=parseFloat(0);
		$('#item_table tbody input[name^="amount["]').each(function(key,amo) {
			var amt=parseFloat($(amo).val());
			total_amount+=amt;
		});
		
		var advnc=$('input[name="payment_amount"]').val();
		if(advnc!='' && typeof advnc != 'undefined') {
			total_amount-=parseFloat(advnc);
		}
		if(!isNaN(total_amount)) {
			$('input[name="advamount"]').val(total_amount);
		}
	}
	
	$('#payment_tr input,select,textarea').change(function() {
		var payment_amount=$('input[name="payment_amount"]').val();
		var ref_no=$('input[name="ref_no"]').val();
		var payment_note=$('textarea[name="payment_note"]').val();
		
		if(payment_amount!='' || ref_no!='' || payment_note!='') {
			$('input[name="payment_amount"]').attr('required','required');
			$('input[name="payment_amount"]').attr('pattern','[1-9]');
		}
		else {
			$('input[name="payment_type"]').removeAttr('required');
			$('input[name="payment_amount"]').removeAttr('required');
		}
		
	});
</script>