<div class="row">
	<form name="file_add" action="<?php echo base_url().'dashboard/save_file';?>" method="POST" enctype="multipart/form-data">
		<div class="col-md-12">
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
					$op_title='company_name';
					foreach($customer as $row) {
						if($row['company_name']!=''){
							$op_title='company_name';
						}
						else {
							$op_title=array('first_name','last_name');
						}
					}
					echo generate_combobox('custid',$customer,'custid',$op_title,'','class="form-control chosen" id="custid"');
				?>
			</div>	
		</div>	
		<div class="col-md-12">
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
		<div class="col-md-12">
			<div class="col-md-12">
				<div class="col-md-4" style="padding-left:0px">
					<label>Title</label><br/>
					<input type="text" class="form-control" id="file_title" name="file_title[]" />
				</div>				
				<div class="col-md-6">
					<label>File</label>		
					<input type="file" class="form-control" id="file" name="file[]" />
				</div>
				<div class="col-md-2">
					<input type="button" value="+ Files" id="add_more" class="btn btn-sm btn-primary" style="margin-top:25px;"/>
				</div>
			</div>
		</div>
		<div class="col-md-12" id="addFile"></div>
		<div class="col-md-12"><br/>
			<div class="modal-footer">
				<input type="submit" name="submit"  class="btn btn-primary" value="Submit" style="margin-top:25px;">
				<input type="reset" name="reset"  class="btn btn-default" value="Reset" style="margin-top:25px;">
				<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-top:25px;">Close</button>
			</div>
		</div>
	</form>	
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.chosen').chosen();
		$('.chosen-container').css('width','300px;');
		$('#add_more').click(function(e){
			e.preventDefault();
			var clone_div='<div class="col-md-12"><div class="col-md-4" style="padding-left:0px"><label>Title</label><br/><input type="text" class="form-control" id="file_title" name="file_title[]" /></div><div class="col-md-6" ><label>File</label><br/><input type="file" class="form-control" id="file" name="file[]"/></div></div>';
			$("#addFile").append(clone_div);			
			//$('#file').after("<br/><input name='file[]' class='form-control' type='file' />");
		});
	});	
</script>