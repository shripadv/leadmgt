<div class="panel-body">
	<?php if($this->session->userdata('role')=="admin") {?>
	<div class="col-md-6">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title"><i class="fa fa-fw fa-building-o"></i> Companies Details</h3>
			</div><!-- /.box-header -->		
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>Name</th> 
							<th>Establish Date</th>
							<th>Email</th> 
							<th>Mobile</th> 
						</tr>
					</thead>
					<tbody>
					<?php
						foreach ($company as $row)
						{
					?>					
						<tr>
							<td><?php echo $row['companyname']; ?></td>
							<td><?php $date = date_create($row['establishdate']); echo date_format($date,"d-m-Y h:i:s");?></td>
							<td><?php echo $row['cemail']; ?></td>
							<td><?php echo $row['cmobile']; ?></td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title"><i class="ion ion-android-social-user"></i> User's Details</h3>
			</div><!-- /.box-header --> 		
			<div class="box-body table-responsive">
				<table class='table table-bordered table-striped dataTable'>
					<thead>
						<tr>
							<th>Name</th> 
							<th>Company</th>
							<th>Mobile</th>
							<th>Email</th>  			
						</tr>
					</thead>
					<tbody>
					<?php
						foreach ($user as $row)
						{
					?>					
						<tr>
							<td><?php echo $row['first_name']." ".$row['last_name']; ?></td>
							<td><?php echo $row['companyname']; ?></td>
							<td><?php echo $row['mobile']; ?></td>
							<td><?php echo $row['email']; ?></td>
						</tr>	
					<?php } ?>								
					</tbody>
				</table>
			</div>
		</div>		
	</div>
	<?php } if($this->session->userdata('role')=="user") {?>
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>
							<?php  echo $cnttotal['cnt'];  ?>
						</h3>
						<p>
							Total Client
						</p>
					</div>
					<div class="icon">
						<i class="ion ion-person"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."user/view_client"; ?>">View Client</a>
				</div>
			</div><!-- ./col -->
			
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>
							<?php  echo $leadtotal['cnt'];  ?>
						</h3>
						<p>
							Total Lead
						</p>
					</div>
					<div class="icon">
						<i class="ion-ios7-personadd"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."lead"; ?>">View Lead</a>
				</div>
			</div><!-- ./col -->
			
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>
							<?php  echo $myleadtotal['cnt'];  ?>
						</h3>
						<p>
							My Lead
						</p>
					</div>
					<div class="icon">
						<i class="ion-ios7-personadd"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."lead"; ?>" >View Lead</a>
				</div>
			</div><!-- ./col -->
		</div>
	<?php } if($this->session->userdata('role')=="employee") { ?>
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>
							<?php  echo $leadtotal['cnt'];  ?>
						</h3>
						<p>
							Total Lead
						</p>
					</div>
					<div class="icon">
						<i class="ion-ios7-personadd"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."lead"; ?>">View Lead</a>
				</div>
			</div><!-- ./col -->
			
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>
							<?php  echo $myleadtotal['cnt'];  ?>
						</h3>
						<p>
							My Lead
						</p>
					</div>
					<div class="icon">
						<i class="ion-ios7-personadd"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."lead"; ?>" >View Lead</a>
				</div>
			</div><!-- ./col -->

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
							<?php  echo $projecttotal['cnt'];  ?>
						</h3>
						<p>
							Total Project
						</p>
					</div>
					<div class="icon">
						<i class="fa fa-fw fa-hdd-o"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."project"; ?>" >View Project</a>
				</div>
			</div><!-- ./col -->

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-orange">
					<div class="inner">
						<h3>
							<?php  echo $myprojecttotal['cnt'];  ?>
						</h3>
						<p>
							My Project
						</p>
					</div>
					<div class="icon">
						<i class="fa fa-fw fa-hdd-o"></i>
					</div>
					<a class="small-box-footer" href="<?php echo base_url()."project"; ?>" >View Project</a>
				</div>
			</div><!-- ./col -->			
		</div>
	<?php } ?>
	<?php if($this->session->userdata('role')!="admin") { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title"><i class="ion ion-android-social-user"></i> Last 10 updated lead Details</h3>
					</div><!-- /.box-header --> 		
					<div class="box-body table-responsive">
						<table class='table table-bordered table-striped dataTable'>
							<thead>
								<tr>
									<th>Company</th> 
									<th>Name</th>
									<th>Mobile</th>
									<th>Activities</th>  			
									<th>Updated On</th>  			
								</tr>
							</thead>
							<tbody>
							<?php foreach ($lead_data as $row) { ?>					
								<tr>
									<td><a href="<?php echo base_url().'lead/lead_detail/'.$row['lead_id'];?>"><?php echo $row['company_name']; ?></a></td>
									<td><?php echo $row['first_name']." ".$row['last_name']; ?></td>
									<td><?php echo $row['mobile']; ?></td>
									<td>
										<?php 
											if(isset($new_arr[$row['lead_id']])) { 
												echo $new_arr[$row['lead_id']]; 
											} 
											else { echo "0"; } 			
										?>
									</td>									
									<td><?php if($row['lupdate']!='0000-00-00 00:00:00' && $row['lupdate']!='') { echo dateformat($row['lupdate'],'d M Y h:i A'); } else { echo dateformat($row['lcreatedate'],'d M Y h:i A'); } ?></td>
								</tr>	
							<?php } ?>								
							</tbody>
						</table>
					</div>
				</div>		
			</div>		
		</div>
	<?php } ?>
</div>	

<!-- Modal -->
<div class="modal fade" id="searchinvoice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Search Invoice</h4>
			</div>
			<div class="modal-body">
				<form name="search_invoice" method="post" action="<?php echo base_url().'dashboard/search_invoice';?>">
					<div class="form-group">
						<label>Customer Name</label>
						<input type="text" class="form-control" id="custname" name="custname" placeholder="Enter Customer Name"/> 
					</div>
					<div class="form-group">
						<label>From Date</label>
						<input type="text" class="form-control" id="from_date" name="from_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
					</div>
					<div class="form-group">
						<label>To Date</label>
						<input type="text" class="form-control" id="to_date" name="to_date" data-date-format="yyyy-mm-dd" placeholder="1990-01-01" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
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

<script type="text/javascript">
$('.dataTable').dataTable({
	"bPaginate": false,
	"bsort": true,
	"scrollY": "450px",
	"aaSorting": [] 	
});
</script>	
		

