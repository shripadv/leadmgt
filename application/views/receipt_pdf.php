<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Invoice</title>
<style type="text/css">
body{ margin:0; padding:0; font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif
		}
pre {font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif; font-size:12px; }
#contener{ width:675px; margin:5px 0 0 0;
}
pre{ margin:0; padding:0; font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif
}
#article{}
header{ margin:10px 5px 10px 5px;
}
header img{ padding-left:10px; float:left;
}	
header div.title{ float:left; margin-left:20px; color:#000; line-height:1.5; font-size:25px; text-align:center
}
header div.title span{ color:#000;font-size:18px
}
header div.address{ float:right; margin-left:20px; text-align:right; font-size:12px; color:#434343; line-height:1.4;
}

.border{
background-color:#000; height:0px; margin:4px; width:670px; border:1px solid #000}
article{margin:10px;

}
article div.bill_date{ float:right; font-size:13px;}
article div.bill_date span{ text-align:right; font-size:13px; padding-left:100px;}
article div.address{text-align:left; width:75%; font-size:12px; line-height:1.5; max-height:150px;}
.table{
margin-top:5px; font-size:12px; line-height:1.5; }
table{ border:0px solid #000000;
}
table tr th{ font-size:14px; border:1px solid #000000; background-color:#d3d3d3;
}
table tr td{border-bottom:1px solid #8f8989;border-left:1px solid #000000;border-right:1px solid #000000; padding:0px 10px;
}
table tfoot{
border-bottom:1px solid #000000;
}
.t_a_right{
text-align:right; padding-right:5px;}
b{
font-weight:bold;}
.rupee_word{line-height:2; font-size:12px;}
.paninfo{
float:left; text-align:left; line-height:1.5; font-size:12px;}
.Stamp{
float:right; text-align:right; font-size:12px; font-weight:bold;margin-top:-15px;
}
.Stamp div.sign{
height:50px; border:1px solid #FDFDFD; width:200px;}
.CB{clear:both}
pre {font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif; font-size:12px; }
@media print {
	pre {font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif; font-size:12px; }
	body{ margin:0; padding:0; font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif
		}
	#contener{ width:675px; margin:5px 0 0 0;
		}	
		#article{}
	header{ margin:10px 5px 10px 5px;
		}
	header img{ padding-left:10px; float:left;
		}	
		header div.title{ float:left; margin-left:20px; color:#000; line-height:1.5; font-size:25px; text-align:center
		}
		header div.title span{ color:#000;font-size:18px
		}
		header div.address{ float:right; margin-left:20px; text-align:right; font-size:12px; color:#000; line-height:1.4;
		}
		
		.border{
			background-color:#000; height:0px; margin:4px; width:670px; border:1px solid #136f8f}
			article{margin:10px;

				}
				article div.bill_date{ float:right; font-size:13px;}
				article div.bill_date span{ text-align:right; font-size:13px; padding-left:100px;}
				article div.address{text-align:left; width:75%; font-size:12px; line-height:1.5 ; max-height:150px;}
.table{
	margin-top:5px; font-size:12px; line-height:1.5; }
table{ border:0px solid #000000;
	}
table tr th{ font-size:14px; border:1px solid #000000; background-color:#d3d3d3;   
	}
		 
table tr td{border-bottom:1px solid #8f8989;border-left:1px solid #000000;border-right:1px solid #000000; padding:0px 10px;
	}
table tfoot{
	border-bottom:1px solid #000000;
	}
	.t_a_right{
		text-align:right; padding-right:5px;}
		b{
			font-weight:bold;}
.rupee_word{line-height:2; font-size:12px;}
.paninfo{
	float:left; text-align:left; line-height:1.5; font-size:12px;}
.Stamp{
	float:right; text-align:right; font-size:12px; font-weight:bold;margin-top:-15px;
	}
.Stamp div.sign{
	height:50px; border:1px solid #FDFDFD; width:200px;}

		.CB{
			clear:both}
	pre {font-family:Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", serif; font-size:12px; }
   
}

a { text-decoration: none;}
.btn {
  font-weight: 500;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  border: 1px solid transparent;
  -webkit-box-shadow: inset 0px -2px 0px 0px rgba(0, 0, 0, 0.09);
  -moz-box-shadow: inset 0px -2px 0px 0px rgba(0, 0, 0, 0.09);
  box-shadow: inset 0px -1px 0px 0px rgba(0, 0, 0, 0.09);
  margin-top: 50px;
  padding: 10px;
  width: 100px;
  color: #fff;
}
.btn-primary {
  background-color: #3c8dbc;
  border-color: #367fa9;	
} 
</style>
<style type="text/css" media="print">
      @page 
      {
          size: auto;   /* auto is the current printer page size */
          /* margin: 1mm 2mm 2mm 1mm;  this affects the margin in the printer settings */
		  margin-top:1.5mm; 
      }
  input[type='textbox'] {
    display:none;
  }
   input[type='button'] {
    display:none;
  }
      body 
      {
          background-color:#FFFFFF;
          margin: 5px;  /* the margin on the content before printing */
     }
	 table tr th{  font-size:14px; border:1px solid #000000; }
     .printNono {
        display: None;
     } 

</style>
</head>

<body>
	<div id="contener" class="">
		<?php if($invoice[0]['invoice_template']=="1") { ?>
		<header>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="23%"><img src="<?php echo base_url()."logo/".$invoice[0]['clogo']; ?>" alt="" height="50" width="120"/></td>
				<td align="center" class="title" width="47%"> 
					<b><?php echo $invoice[0]['companyname'];?></b><br>
					<span><b><?php echo $invoice[0]['tag_line'];?></b></span>
				</td>
				<td class="address" width="30%">
					Address: <?php 
					$caddress = wordwrap($invoice[0]['caddress'], 30, "<br />\n", true);
					echo $caddress;
					?><br>
					Mob: <?php echo $invoice[0]['cmobile'];?> / Tel: <?php if($invoice[0]['ctel']!="0") {echo $invoice[0]['ctel'];}else { echo "";}?><br>
					Email: <?php echo $invoice[0]['cemail'];?>					
				</td>
			</tr>
		</table>
		</header>
		<div class="border"></div>
		<?php } else { echo "<br/><br/><br/><br/><br/><br/><br/>";}?>
		<div class="CB"></div>
		<div id="article">
			<article>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="address" width="75%" valign="top"> To,<br>
							<?php 
								if($invoice[0]['company_name']!=''){
									echo $invoice[0]['company_name']; 
								}
								else {
									echo $invoice[0]['first_name']." ".$invoice[0]['last_name']; 
								}	
							?><br>
							<?php 
								/* $cust_address = wordwrap($invoice[0]['cust_address'], 80, "<br />\n", true);
								echo $cust_address; 
								."<br/>".$invoice[0]['state']."<br/>".$invoice[0]['country']
								*/
								echo '<pre>'.$invoice[0]['address1']." ".$invoice[0]['address2']."<br/>".$invoice[0]['city'].'</pre>';
							?><br>
						</td>
						<td width="25%" class="bill_date" valign="top">
							Bill No : <?php echo $invoice[0]['invoice_no'];?> <br/>
							Date : <?php echo date('d-m-Y',strtotime($invoice[0]['bill_date']));?>
						</td>
					</tr>
				</table>			
				<div class="CB"><br/><br/></div>
				<div class="table">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th style="text-align:center;" width="10%">Sr. No.</th>
							<th style="text-align:center;" width="70%">Particulars</th>
							<th class="t_a_right" width="20%">Amount</th>
						</tr>
						<?php for($i=0;$i<=7;$i++) { 
							if(isset($invoice[$i])) {
							?> 
						<tr height="15px">
							<td style="text-align:center;"><?php if(isset($invoice[$i]['particular'])) { echo $i+1; }?></td>
							<td><pre><?php echo $invoice[$i]['particular'];?></pre></td>
							<td class="t_a_right"><?php echo $invoice[$i]['amount']."/-";?></td>
						</tr>
						<?php } else { ?>
						<tr height="15px">
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<?php } } ?>
						<tfoot>
							<tr>
								<td></td>
								<td class="t_a_right "><b>Gross Amount</b></td>
								<td  class="t_a_right"><b><?php echo $invoice[0]['total_amount']."/-";?></b></td>
							</tr>
							<tr>
								<td></td>
								<td class="t_a_right "><b>Paid Amount</b></td>
								<td  class="t_a_right"><b><?php echo $paid_amount."/-";?></b></td>
							</tr>
							<tr>
								<td></td>
								<td class="t_a_right "><b>Due Amount</b></td>
								<td  class="t_a_right"><b>
									<?php
										echo $due_amount."/-";	
									?>
									</b>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="CB"></div>
				<div class="rupee_word">Fig In Words&nbsp;&nbsp;&nbsp;&nbsp;<?php echo convert_number_to_words($invoice[0]['total_amount']); ?> ONLY</div>
				<div class="CB"></div>
				<div class="paninfo">
					<?php 
						if($invoice[0]['pan']!='') { echo "PAN : ".$invoice[0]['pan']."<br>"; }
						if($invoice[0]['sertexno']!='') { echo "SERVICE TAX REGN NO : ".$invoice[0]['sertexno']."<br>"; }
					?>
				</div>
				
				<?php 
					if($invoice[0]['terms_condition']!='') {
						echo '<div class="CB"></div><pre>'.$invoice[0]['terms_condition'].'</pre>';
					}
					?>
				<div class="Stamp">
					For <?php echo $invoice[0]['companyname'];?><br>
					<div class="sign">&nbsp;</div>
					<?php //echo $invoice[0]['owner'];?>
					<br/>
					<br/>Authorized Signature
				</div>
				<div class="CB"></div>
			</article>
		</div>
	</div>
</body>
</html>
