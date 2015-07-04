<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchfile).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="#" class="fa fa-fw fa-plus" onclick="get_modaldata('Add File','<?php echo base_url()."dashboard/file_upload"; ?>')" data-toggle="tooltip" data-placement="bottom" title="Add file"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>Upload Date</th>		  			
							<th>File Title</th> 
							<th>Project/Lead/Client/Employee</th>
							<th>Type</th>								
							<th>Upload By</th>								
						</tr>
					</thead>
 					<tbody>
					<?php
						foreach ($files as $row)
						{
					?>					
						<tr id="ftr<?php echo $row['file_id']; ?>">
							<!--<td>
								<label>
									<input type="checkbox"  id="prID[]" name="prID[]" value="<?php echo $row['prid']; ?>" class="selectAll">
								</label>				
							</td>-->
							<td><?php echo dateformat($row['created_at']); ?></td>
							<td><a href="<?php echo base_url().$row['file_path']; ?>" target="_blank"><?php echo $row['file_title']; ?></a></td>
							<td>
								<?php 
									if($row['project_id']!='') { 
										echo "<a href=".base_url().'project/project_detail/'.$row['project_id'].">".$row['project_title']."</a>"; 
									} 
									if($row['lead_id']!='') { 
										echo "<a href=".base_url().'lead/lead_detail/'.$row['lead_id'].">".$row['lead_fname']." ".$row['lead_lname']."</a>"; 
									} 
									if($row['client_id']!='') { 
										echo "<a href=".base_url().'user/view_client'.">".$row['client_fname']." ".$row['client_lname']."</a>"; 
									} 
									if($row['emp_id']!='') { 
										echo "<a href=".base_url().'user/view_employee'.">".$row['emp_fname']." ".$row['emp_lname']."</a>"; 
									} 
								?>
							</td>
							<td><?php echo $row['file_type']; ?></td>
							<td><?php echo $row['user_fname']." ".$row['user_lname']; ?></td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search File</h4>
			</div>
			<div class="modal-body">
				<form name="search_file" method="post" action="<?php echo base_url().'dashboard/search_file';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Employee</label>
							<?php
								$op_title=array('first_name','last_name');		
								echo generate_combobox('emp_id',$employee,'emp_id',$op_title,'','class="form-control chosen" id="emp_id"');
							?>						
						</div>
						<div class="col-md-6">
							<label>Customer</label>
							<?php
								$op_title=array('first_name','last_name');	
								echo generate_combobox('client_id',$customer,'custid',$op_title,'','class="form-control chosen" id="client_id"');
							?>										
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>Lead</label>
							<?php
								$op_title=array('first_name','last_name');	
								echo generate_combobox('lead_id',$lead,'lead_id',$op_title,'','class="form-control chosen" id="lead_id"');
							?>											
						</div>
						<div class="col-md-6">
							<label>Project</label>
							<?php	
								echo generate_combobox('project_id',$project,'project_id','project_title','','class="form-control chosen" id="custid"');
							?>																	
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>File Title</label>
							<input type="text" class="form-control" id="file_title" name="file_title" />
						</div>
						<div class="col-md-6">
							<label>File Extension</label>
							<input type="text" class="form-control" id="file_type" name="file_type" />
						</div>						
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>From Date</label>
							<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>											
						</div>
						<div class="col-md-6">
							<label>To Date</label>
							<input type="text" class="form-control" id="to_date" name="to_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>					
						</div>
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
<style>
.datepicker {
	z-index:9999;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.chosen').chosen();
	$('.chosen-container').css('width','250px');
	
	$('.dataTable').dataTable({
		"bPaginate": false,
		"bsort": true,
		"scrollY": "510px",
		"aaSorting": [] 	
	});

	$('#from_date').datepicker({
		autoclose:true
	});
	$('#to_date').datepicker({
		autoclose:true
	});
});
</script>