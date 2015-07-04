<meta charset="UTF-8">
<title>
	<?php 
		if(isset($pageTitle)):
			echo "Lead Management APP | ".$pageTitle;
		else:
			echo "Lead Management APP";
		endif;
	?>
</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link href="<?php echo base_url().'public/css/bootstrap.min.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/css/font-awesome.min.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/css/ionicons.min.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/css/AdminLTE.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/css/skins/_all-skins.min.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/datepicker/datepicker.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/chosen/chosen.min.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url().'public/css/datatables/dataTables.bootstrap.css'; ?>" rel="stylesheet" type="text/css"/>
<?php
	/*to load css in header pass url of css in $loadCss variable as array*/
	if(isset($loadCss)):
		if(is_array($loadCss)):
			foreach($$loadCss as $css):
				echo '<link href="'.$css.'" rel="stylesheet" type="text/css" />';
			endforeach;
		endif;
	endif;
?>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
	<script type="text/javascript">
		var base_url = "<?php echo base_url(); ?>";	
	</script>
	
	<script src="<?php echo base_url().'public/js/jquery.min.js'; ?>"></script>

	<!-- Bootstrap -->
	<script src="<?php echo base_url().'public/js/bootstrap.min.js'; ?>" type="text/javascript"></script>
	<script src="<?php echo base_url().'public/js/app.js'; ?>" type="text/javascript"></script>
	<script src="<?php echo base_url().'public/datepicker/bootstrap-datepicker.js'; ?>" type="text/javascript"></script>	
  	<script src="<?php echo base_url()."public/chosen/chosen.jquery.min.js"; ?>"></script>	
  	<script src="<?php echo base_url()."public/chosen/chosen.proto.min.js"; ?>"></script>	
  	<script src="<?php echo base_url()."public/js/datatables/jquery.dataTables.min.js"; ?>"></script>
	<?php 
		/* to load javascript file pass url of css in $loadJs variable as array */
		if(isset($loadJs)):
			if(is_array($loadJs)):
				foreach($loadJs as $js):
					echo '<script type="text/javascript" src="'.$js.'"></script>';
				endforeach;
			endif;
		endif;
	?>
<script src="<?php echo base_url()."public/js/script.js"; ?>"></script>