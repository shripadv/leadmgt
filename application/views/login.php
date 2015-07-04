<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
		<title>Sign me in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="<?php echo base_url().'public/css/bootstrap.min.css'; ?>" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="<?php echo base_url().'public/css/font-awesome.min.css'; ?>" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<?php echo base_url().'public/css/AdminLTE.css'; ?>" rel="stylesheet" type="text/css" />

    </head>
    <body class="login-page">
		<div class="login-box">
	      <div class="login-logo">
	        <a href="../../index2.html"><b>Lead</b> Management</a>
	      </div><!-- /.login-logo -->
	      <div class="login-box-body">
	        <p class="login-box-msg">Sign in to start your session</p>
			   <?php
					echo form_open('login/check', array('name' => 'loginform'));    
				?>
	          <div class="form-group has-feedback">
	            <input type="text" name="username" class="form-control" placeholder="Email"/>
	            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	          </div>
	          <div class="form-group has-feedback">
	            <input type="password" name="password" class="form-control" placeholder="Password"/>
	            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	          </div>
	          <div class="row">
	            <div class="col-xs-8"></div><!-- /.col -->
	            <div class="col-xs-4">
	              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
	            </div><!-- /.col -->
	          </div>
	       <?php echo form_close(); ?>
	      </div><!-- /.login-box-body -->
	    </div><!-- /.login-box -->
        <!-- jQuery 2.0.2 -->
        <script src="<?php echo base_url().'public/js/jquery.min.js'; ?>"></script>
        <!-- Bootstrap -->
        <script src="<?php echo base_url().'public/js/bootstrap.min.js'; ?>" type="text/javascript"></script>        

    </body>
</html>	