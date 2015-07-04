<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchtask).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="#" class="fa fa-fw fa-plus" id="addtask" data-toggle="tooltip" data-placement="bottom" title="Add Task"></a>
		<a href="#" class="fa fa-fw fa-edit" id="edittask" data-toggle="tooltip" data-placement="bottom" title="Edit Task"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th>
							<th>Task Title</th> 
							<th>Start Date</th>
							<th>Due Date</th>								
							<th>Task Priority</th>		  			
							<th>Task Label</th>		  			
							<th>Task Status</th>		  			
						</tr>
					</thead>
 					<tbody>
					<?php
						foreach ($task as $row)
						{
					?>					
						<tr id="tasktr<?php echo $row['project_task_id']; ?>">
							<td>
								<label>
									<input type="checkbox"  id="taskID[]" name="taskID[]" value="<?php echo $row['project_task_id']; ?>" class="selectAll">
								</label>				
							</td>
							<td><a href="<?php echo base_url().'project/task_detail/'.$row['project_task_id']; ?>"><?php echo $row['project_task_title']; ?></a></td>
							
							<td><?php if($row['start_date']!='') { echo dateformat($row['start_date']); } else { echo ""; } ?></td>
							<td><?php if($row['due_date']!='') { echo dateformat($row['due_date']); } else { echo ""; } ?></td>
							<td><?php echo $row['task_priority_title']; ?></td>
							<td><?php echo $row['project_task_label']; ?></td>
							<td>
								<span class="btn btn-danger btn-xs" style="background-color:<?php echo $row['task_status_color'];?>; border-color:<?php echo $row['task_status_color'];?>"><?php echo $row['task_status_title'];?></span>
							</td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>			
</div>

<!-- Modal -->
<div class="modal fade" id="searchtask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Task</h4>
			</div>
			<div class="modal-body">
				<form name="search_project" method="post" action="<?php echo base_url().'project/search_task';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Task Title </label>
							<input type="text" class="form-control" id="project_task_title" name="project_task_title" placeholder="Enter Project Title" />						
						</div>
						<div class="col-md-6">
							<label>Task Status</label>
							<?php	
								echo generate_combobox('task_status',$task_status,'task_status_id','task_status','','class="form-control" id="task_status"');
							?>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6">
							<label>Project Start From Date</label>
							<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>											
						</div>
						<div class="col-md-6">
							<label>Project Start To Date</label>
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
$('.dataTable').dataTable({
	"bPaginate": false,
	"bsort": true,
	"scrollY": "510px",
	"aaSorting": [] 	
});

$('#from_date').datepicker();
$('#to_date').datepicker();

$(document).ready(function(){
	$('#addtask').click(function () {
		var url=base_url+"project/add_task";	
		get_modaldata('Add Task',url);	
	});
	
	$('#edittask').click(function () {
		var slvals = []
		$('input:checkbox[name^=taskID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			var url=base_url+"project/add_task/"+id;	
			get_modaldata('Edit Task',url);
		}
	});	
});
</script>