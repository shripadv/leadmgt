<?php if($this->session->flashdata('success') != '') { ?>
<div class="alert alert-success alert-dismissable">
	<button aria-hidden="true" data-dismiss="alert" class="close" type="button">x</button>
	<?php echo "<ul>".$this->session->flashdata('success')."</ul>"; ?>
</div>
<?php } ?>
<?php if($this->session->flashdata('error') != '') { ?>
<div class="alert alert-danger alert-dismissable">
	<button aria-hidden="true" data-dismiss="alert" class="close" type="button">x</button>
	<?php echo "<ul>".$this->session->flashdata('error')."</ul>"; ?>
</div>
<?php } ?>