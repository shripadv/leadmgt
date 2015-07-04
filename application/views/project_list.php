<div class="panel panel-default">
	<div class="panel-heading">
		<a href="#" class="fa fa-fw fa-refresh" onclick="window.location.reload( true );" data-toggle="tooltip" data-placement="bottom" title="Refresh"></a>
		<a href="#" class="fa fa-fw fa-filter" onclick="$(searchproject).modal('show');" data-toggle="tooltip" data-placement="bottom" title="Filter Data"></a>
		<a href="#" class="fa fa-fw fa-plus" id="addproject" data-toggle="tooltip" data-placement="bottom" title="Add Project"></a>
		<a href="#" class="fa fa-fw fa-edit" id="editproject" data-toggle="tooltip" data-placement="bottom" title="Edit Project"></a>
	</div>	
	<div class="panel-body">
		<div class="box box-success">
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>#</th>
							<th>Project Title</th> 
							<th>Start Date</th>
							<th>Approx End</th>								
							<th>Status</th>		  			
						</tr>
					</thead>
 					<tbody>
					<?php
						foreach ($project as $row)
						{
					?>					
						<tr id="prtr<?php echo $row['prid']; ?>">
							<td>
								<label>
									<input type="checkbox"  id="prID[]" name="prID[]" value="<?php echo $row['prid']; ?>" class="selectAll">
								</label>				
							</td>
							<td><a href="<?php echo base_url().'project/project_detail/'.$row['prid']; ?>"><?php echo $row['project_title']; ?></a></td>
							
							<td><?php echo dateformat($row['start_date']); ?></td>
							<td><?php echo dateformat($row['apporx_end']); ?></td>
							<td>
								<span class="btn btn-danger btn-xs" style="background-color:<?php echo $row['project_status_color'];?>; border-color:<?php echo $row['project_status_color'];?>"><?php echo $row['pstatus'];?></span>
								
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
<div class="modal fade" id="searchproject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Project</h4>
			</div>
			<div class="modal-body">
				<form name="search_project" method="post" action="<?php echo base_url().'project/search_project';?>">
					<div class="form-group">
						<div class="col-md-6">
							<label>Project Title </label>
							<input type="text" class="form-control" id="project_title" name="project_title" placeholder="Enter Project Title" />						
						</div>
						<div class="col-md-6">
							<label>Lead Owner</label>
							<input type="text" class="form-control" id="lead_owner" name="lead_owner" placeholder="Enter Lead Owner Name" />											
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
					<div class="form-group">
						<div class="col-md-6">
							<label>Project Status</label>
							<?php	
								echo generate_combobox('project_status',$project_status,'project_status_id','project_status','','class="form-control" id="project_status"');
							?>
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
	$('#addproject').click(function () {
		var url=base_url+"project/add_project";	
		get_modaldata('Add Project',url);	
	});
	
	$('#editproject').click(function () {
		var slvals = []
		$('input:checkbox[name^=prID]:checked').each(function() {
		slvals.push($(this).val())
		})
		id=slvals;
		if(id.length>1 || id.length<1) {
			alert ('Select 1 record at a time!');
		}
		else {
			var url=base_url+"project/edit_project/"+id;	
			get_modaldata('Edit Project',url);
		}
	});	
});
</script>