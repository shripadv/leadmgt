<?php
	if(isset($lead_detail)) {
		$lead=$lead_detail[0];
		echo "<input type='hidden' name='lead_id' id='lead_id' value=".$lead['lead_id'].">";
	}
?>
<div class="row">
	<div class="col-md-6">
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-fw fa-home"></i>
				<h3 class="box-title"><?php if(isset($lead['company_name'])) { echo $lead['company_name'];}?></h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
					<dt>Conatct Person</dt>
					<dd><?php if(isset($lead)) { echo $lead['company_name'];}?></dd>
					<dt>Mobile/Phone</dt>
					<dd>
						<?php 
							if(isset($lead)) { 
							echo $lead['mobile']; 
							if(!empty($lead['phone'])) { 
							echo "/".$lead['phone'];
							} } 
						?>
					</dd>
					<dt>Email/Alternate Email</dt>
					<dd>
						<?php 
							if(isset($lead)) { 
							echo $lead['email'];
							if(!empty($lead['phone'])) { 
							echo "/".$lead['sec_email'];
							} }
						?>
					</dd>
					<?php if(isset($lead['website'])) { ?>
					<dt>Website</dt>
					<dd><?php if(isset($lead['website'])) { echo $lead['website'];}?></dd>
					<?php } ?>
					<dt>Industry</dt>
					<dd><?php if(isset($lead)) { echo $lead['industry'];}?></dd>
					<dt>Address</dt>
					<dd><?php if(isset($lead)) { echo $lead['address1'];}?></dd>
					<dd><?php if(isset($lead)) { echo $lead['address2'];}?></dd>
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-money"></i>
				<h3 class="box-title">Lead Details</h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
					<dt>Owner</dt>
					<dd><?php if(isset($lead)) { echo $lead['emp_first']." ".$lead['emp_secound'];}?></dd>
					<dt>Source</dt>
					<dd><?php if(isset($lead)) { echo $lead['lead_source'];}?></dd>
					<dt>Product</dt>
					<dd><?php if(isset($lead)) { echo $lead['product'];}?></dd>
					<dt>Status</dt>
					<dd><?php if(isset($lead)) { echo $lead['lead_status'];}?></dd>					
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->
		<?php if(!empty($files)) { ?>
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-fw fa-files-o"></i>
				<h3 class="box-title">File Details</h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
					<?php foreach($files as $row) { ?>
					<dt>File</dt>
					<dd><?php echo $row['file_title']; ?></dd>
					<dt>Download</dt>
					<dd><a href="<?php echo base_url().$row['file_path']; ?>" target="_blank">Download File</a></dd>
					<?php } ?>
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->	
		<?php } ?>	
	</div><!-- ./col -->
	
	<div class="col-md-6">
		<a href="#" id="add_activity" class="btn btn-primary">Add Activity</a>
		<br/>
		<br/>
		<!-- The time line -->
		<ul class="timeline">
			<!-- timeline time label -->
			<?php
				foreach($activity as $row) {
			?>
			<li class="time-label">
				<!--<span class="bg-red">
					<?php //echo dateformat($row['datetime']); ?>
				</span>-->
			</li>
			<!-- /.timeline-label -->
			<!-- timeline item -->
			<li id="<?php echo 'latr'.$row['activity_id'];?>">
				<i class="fa fa-fw fa-code-fork bg-blue"></i>
				<div class="timeline-item">
					<span class="time"><i class="fa fa-clock-o"></i>
						<?php echo dateformat($row['datetime']); ?>
					</span>
					<h3 class="timeline-header"><a href="<?php echo base_url().'user/view_employee';?>">
					<?php echo $row['emp_first']." ".$row['emp_secound'];?>
					</a> <?php echo $row['activity_title'];?></h3>
					<div class="timeline-body">
						<?php echo $row['comment'];?><br/><span class="btn btn-danger btn-xs" style="background-color:<?php echo $row['color'];?>; border-color:<?php echo $row['color'];?>"><?php echo $row['lead_status_title'];?></span>
						<?php
							if($this->session->userdata('uid')==$row['created_by'] || $this->session->userdata('emp_id')==$row['activity_owner']) {
						?>						
						<a href="#"  onClick="delactivity(<?php echo $row['activity_id'];?>)" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Lead Activity" style="float:right;"></a>						
						<a href="#" class="fa fa-fw fa-edit" onClick="editactivity(<?php echo $row['activity_id'];?>)" data-toggle="tooltip" data-placement="bottom" title="Edit Lead Activity" style="float:right;"></a>
						<?php } ?>
					</div>
				</div>
			</li>
			<!-- END timeline item -->
			<?php } ?>	
			<li>
				<i class="fa fa-clock-o"></i>
			</li>
		</ul>
	</div><!-- ./col -->
</div><!-- /.row -->
<script type="text/JavaScript">
jQuery(document).ready(function () {
	$('#add_activity').click(function () {
		var id=$('#lead_id').val();
		var url=base_url+"lead/add_lead_activity/"+id;	
		get_modaldata('Add lead Activity',url);
	});
});

function editactivity(id) {
	var url=base_url+"lead/edit_lead_activity/"+id;	
	get_modaldata('Edit lead Activity',url);
}

function delactivity(id) {
	var x=confirm("Are you sure to delete record?");
	if (x) {
		$.ajax({
			  url     : base_url+"lead/del_lead_activity/",
			  type    : 'POST',
			  data    : {'id':id},
			  success : function(data){
				data=$.parseJSON(data);
				if(data.status == '1') {
					alert(data.message);
					$('#latr'+id).remove();
/* 					$.each(id,function( item,value ) {
					  
					}); */
				}
				else {
					alert(data.message);
				}
			  }
		});
	} 
}
</script>