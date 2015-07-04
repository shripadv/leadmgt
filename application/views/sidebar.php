<aside class="main-sidebar sidebar-offcanvas">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li>
				<a href="<?php echo base_url(); ?>">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a>
			</li>
			<?php if($this->session->userdata('role') == 'user') { ?>	
				<li><a href="<?php echo base_url().'user/view_client'; ?>"><i class="fa fa-fw fa-user"></i><span>Client</span></a></li>
			<?php } ?>	
			<?php if($this->session->userdata('role') == 'user' || $this->session->userdata('role') == 'employee') { ?>	
				<li><a href="<?php echo base_url().'lead'; ?>"><i class="fa fa-fw fa-group"></i><span>Lead</span></a></li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-fw fa-sitemap"></i>
						<span>Project Managment</span>
						<i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a href="<?php echo base_url().'project'; ?>"><i class="fa fa-circle-o"></i> Project List</a>
						</li>
						<li>
							<a href="<?php echo base_url().'project/task_list'; ?>"><i class="fa fa-circle-o"></i> Task</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="<?php echo base_url().'dashboard/file_view'; ?>"><i class="fa fa-fw fa-file"></i> File List</a>
				</li>			
			<?php } ?>	
			<?php if($this->session->userdata('role') == 'user') { ?>	
			<!--<li class="treeview">
				<a href="#">
					<i class="fa fa-fw fa-list-alt"></i> 
					<span>Invoice</span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li><a href="<?php //echo base_url().'invoice/create_invoice';?>"><i class="fa fa-circle-o"></i><span>Create Invoice</span></a></li>
					<li><a href="<?php //echo base_url().'invoice/view_invoice';?>"><i class="fa fa-circle-o"></i><span>View Invoice</span></a></li>
					<li><a href="<?php //echo base_url().'payment';?>"><i class="fa fa-circle-o"></i><span>Payments</span></a></li>
				</ul>
			</li>
				
			<li class="treeview">
				<a href="#">
					<i class="fa fa-fw fa-list-alt"></i> 
					<span>Expenses</span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="#" onclick="get_modaldata('Add Expense Head','<?php //echo base_url()."expense/add_expensetype"; ?>')"><i class="fa fa-circle-o"></i><span>Add Expense Head</span></a>
					</li>
					<li>
						<a href="<?php //echo base_url().'expense/view_expensetype'; ?>">
							<i class="fa fa-circle-o"></i><span>View Expense Head</span>
						</a>
					</li>
					<li>
						<a href="#" onclick="get_modaldata('Add Expense','<?php //echo base_url()."expense/add_expense"; ?>')"><i class="fa fa-circle-o"></i><span>Add Expense</span></a>
					</li>
					<li>
						<a href="<?php //echo base_url().'expense/view_expense'; ?>"><i class="fa fa-circle-o"></i><span>View Expense</span></a>
					</li>
				</ul>
			</li>-->	
			<?php } ?>	
			<?php if($this->session->userdata('role') == 'admin' || $this->session->userdata('role') == 'user') { ?>		
			<li class="treeview">
				<a href="#">
					<i class="fa fa-fw fa-wrench"></i>
					<span>Settings</span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<?php if($this->session->userdata('role') == 'admin') { ?>												
					<li><a href="<?php echo base_url().'company/view_company'; ?>"><i class="fa fa-circle-o"></i><span>Company</span></a></li>
					<li><a href="<?php echo base_url().'user/view_user'; ?>"><i class="fa fa-circle-o"></i><span>Company User</span></a></li>					
					<?php } ?>
					<?php if($this->session->userdata('role') == 'user') { ?>
					<li><a href="<?php echo base_url().'user/view_employee'; ?>"><i class="fa fa-circle-o"></i><span>Employee</span></a></li>
					<li><a href="<?php echo base_url().'lead/product'; ?>"><i class="fa fa-circle-o"></i><span>Product</span></a></li>
					<!--<li><a href="<?php //echo base_url().'invoice/add_taxes'; ?>"><i class="fa fa-circle-o"></i><span>Taxes</span></a></li>
					<li><a href="<?php //echo base_url().'invoice/add_service'; ?>"><i class="fa fa-circle-o"></i><span>Service</span></a></li>-->
					<li><a href="<?php echo base_url().'company/edit_company/'.$this->session->userdata('companyid'); ?>"><i class="fa fa-circle-o"></i><span>Edit Company</span></a></li>
					<?php } ?>
				</ul>
			</li>	
			<?php } ?>
		</ul>					
	</section>
	<!-- /.sidebar -->
</aside>
		


<!-- Modal -->
<div class="modal fade" id="commanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body row"></div>
    </div>
  </div>
</div>					