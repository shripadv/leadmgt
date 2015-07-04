<form name="product_add" action="<?php echo base_url().'lead/save_product';?>" method="POST" enctype="multipart/form-data">	
	<div class="col-md-12">
		<?php
			if(isset($product)){
				$product=$product[0];
				echo "<input type='hidden' name='product_id' id='product_id' value=".$product['product_id'].">";
			}
		?>					
		<div class="col-md-6">
			<label>Product Title <span class="text-danger">*</span></label>
			<input type="text" name="product_title" id="product_title" class="form-control" required value="<?php if(isset($product)) { echo $product['product_title']; } ?>"/>
		</div>
		<div class="col-md-6">	
			<label>Price </label>
			<input type="text" class="form-control" name="price" value="<?php if(isset($product)) { echo $product['price']; } ?>"/>
		</div>							
	</div>	
	<div class="col-md-12">				
		<div class="col-md-12">
			<label>Note </label>
			<textarea name="note" class="form-control"><?php if(isset($product)) { echo $product['note']; } ?></textarea>
		</div>	
	</div>	
	<div class="modal-footer">
		<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:10px;">
		<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:10px;">
		<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:10px;">Close</button>
	</div>
</form>