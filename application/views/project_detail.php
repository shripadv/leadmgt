<?php
	if(isset($project_detail)) {
		$project=$project_detail[0];
		echo "<input type='hidden' name='project_id' id='project_id' value=".$project['project_id'].">";
	}
?>
<div class="row">
	<div class="col-md-7">
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-fw fa-hdd-o"></i>
				<h3 class="box-title">Project Details</h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-6">
							<label>Project Title: </label>
							<?php if(isset($project)) { echo $project['project_title'];}?>
						</div>
						<div class="col-md-6">
							<label>Start Date: </label>
							<?php if(isset($project)) { echo dateformat($project['start_date'], "d M Y");}?>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-6">
							<label>Approx. End Date: </label>
							<?php if(isset($project)) { echo dateformat($project['apporx_end'], "d M Y");}?>
						</div>
						<div class="col-md-6">
							<label>Status: </label>
							<?php if(isset($project)) { echo $project['pstatus'];}?>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-12">
							<label>Created By: </label>
							<?php if(isset($project)) { echo $project['pfname']." ".$project['plname'];}?>
						</div>
					</div>
					<div class="col-md-12"><br/>
						<?php $this->load->view('project_comment');?>
					</div>						
					<div class="col-md-12">
						<br/>
						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<?php
								foreach($project_comment as $row) {
							?>
							<!-- /.timeline-label -->
							<!-- timeline item -->
							<li id="<?php echo 'cotr'.$row['comment_id'];?>">
								<i class="fa fa-fw fa-code-fork bg-blue"></i>
								<div class="timeline-item">
									<span class="time"><i class="fa fa-clock-o"></i>
										<?php echo dateformat($row['created_at'], "d M Y"); ?>
									</span>
									<h3 class="timeline-header"><a href="<?php echo base_url().'user/view_employee';?>">
									<?php echo $row['first_name']." ".$row['last_name'];?>
									</a> <?php echo $row['comment_title'];?></h3>
									<div class="timeline-body">
										<?php echo $row['comment_descriptio'];?><br/><span class="btn btn-danger btn-xs" style="background-color:<?php echo $row['project_status_color'];?>; border-color:<?php echo $row['project_status_color'];?>"><?php echo $row['pstatus'];?></span>
										<a href="#"  onClick="delprojectcomment(<?php echo $row['comment_id'];?>)" class="fa fa-fw fa-trash-o" data-toggle="tooltip" data-placement="bottom" title="Delete Comment" style="float:right;"></a>
										<a href="#" class="fa fa-fw fa-edit" onClick="editprojectcomment(<?php echo $row['comment_id'];?>)" data-toggle="tooltip" data-placement="bottom" title="Edit Comment" style="float:right;"></a>
									</div>
								</div>
							</li>
							<!-- END timeline item -->
							<?php } ?>	
							<li>
								<i class="fa fa-clock-o"></i>
							</li>
						</ul>
					</div>									
				</div>
			</div><!-- /.box-body -->
		</div><!-- /.box -->	
	</div>
	<div class="col-md-5">
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-fw fa-home"></i>
				<h3 class="box-title"><?php if(isset($project['company_name'])) { echo $project['company_name'];}?></h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
					<dt>Conatct Person</dt>
					<dd><?php if(isset($project)) { echo $project['company_name'];}?></dd>
					<dt>Mobile/Phone</dt>
					<dd>
						<?php 
							if(isset($project)) { 
							echo $project['mobile']; 
							if(!empty($project['phone'])) { 
							echo "/".$project['phone'];
							} } 
						?>
					</dd>
					<dt>Email</dt>
					<dd>
						<?php 
							if(isset($project)) { 
							echo $project['email'];
							if(!empty($project['phone'])) { 
							echo "/".$project['sec_email'];
							} }
						?>
					</dd>
					<?php if(isset($project['website'])) { ?>
					<dt>Website</dt>
					<dd><?php if(isset($project['website'])) { echo $project['website'];}?></dd>
					<?php } ?>
					<dt>Industry</dt>
					<dd><?php if(isset($project)) { echo $project['industry'];}?></dd>
					<dt>Address</dt>
					<dd><?php if(isset($project)) { echo $project['address1'];}?></dd>
					<dd><?php if(isset($project)) { echo $project['address2'];}?></dd>
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->	
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-user"></i>
				<h3 class="box-title">Assigned To</h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
					<?php foreach($project_team as $row) { ?>
						<dt>User Name</dt>
						<dd><?php echo $row['first_name']." ".$row['last_name']; ?></dd>
						<dt>Email</dt>
						<dd><?php echo $row['email']; ?></dd>
					<?php } ?>
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->
		<div class="box box-solid">
			<div class="box-header">
				<i class="fa fa-clock-o"></i>
				<h3 class="box-title">Activities</h3>
			</div><!-- /.box-header -->
			<div class="box-body">
				<dl class="dl-horizontal">
						<dt>Last Activity </dt>
						<dd>
							<?php 
								if(!empty($project_comment)) {
									echo dateformat($project_comment[0]['created_at'], "d M Y H:i a"); 
								}
								else {
									echo "";
								}
							?>
						</dd>
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
					<dt>Download File</dt>
					<dd><a href="<?php echo base_url().$row['file_path']; ?>" target="_blank"><?php echo $row['file_title']; ?></a></dd>
					<?php } ?>
				</dl>
			</div><!-- /.box-body -->
		</div><!-- /.box -->	
		<?php } ?>			
	</div>	
</div><!-- ./row -->

<style>
.dl-horizontal dd {
  margin-left: 106px;
}
.dl-horizontal dt {
  float: left;
  width: 100px;
  overflow: hidden;
  clear: left;
  text-align: right;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
<script type="text/JavaScript">

function editprojectcomment(id) {
	var url=base_url+"project/edit_project_comment/"+id;	
	get_modaldata('Edit Project comment',url);
}

function delprojectcomment(id) {
	var x=confirm("Are you sure to delete record?");
	if (x) {
		$.ajax({
			  url     : base_url+"project/del_comment/",
			  type    : 'POST',
			  data    : {'id':id},
			  success : function(data){
				data=$.parseJSON(data);
				if(data.status == '1') {
					alert(data.message);
					$('#cotr'+id).remove();
				}
				else {
					alert(data.message);
				}
			  }
		});
	} 
}
</script>