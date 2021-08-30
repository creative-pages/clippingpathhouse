<?php 
include_once "../lib/Session.php";
Session::init();
include_once '../lib/Database.php';
include_once '../helper/Format.php';

require_once("../vendor/autoload.php");

spl_autoload_register(function($class_name) {
    include_once "../classes/" . $class_name . ".php";
});

$db = new Database();
$fm = new Format();
$user = new User();
$job = new Job();

$user_details = $user->userProfile(Session::get('user_id'));
if ($user_details) {
    $user_info = mysqli_fetch_assoc($user_details);

    $clientname=$user_info['fld_fullname'];
	$caddress=$user_info['fld_address'];
	$clientemail=$user_info['fld_email'];
	$clientphone=$user_info['fld_phone'];
	$clientcountry=$user_info['fld_country'];
}

function numberTowords($num)
{

$ones = array(
0 =>"ZERO",
1 => "ONE",
2 => "TWO",
3 => "THREE",
4 => "FOUR",
5 => "FIVE",
6 => "SIX",
7 => "SEVEN",
8 => "EIGHT",
9 => "NINE",
10 => "TEN",
11 => "ELEVEN",
12 => "TWELVE",
13 => "THIRTEEN",
14 => "FOURTEEN",
15 => "FIFTEEN",
16 => "SIXTEEN",
17 => "SEVENTEEN",
18 => "EIGHTEEN",
19 => "NINETEEN",
"014" => "FOURTEEN"
);
$tens = array( 
0 => "ZERO",
1 => "TEN",
2 => "TWENTY",
3 => "THIRTY", 
4 => "FORTY", 
5 => "FIFTY", 
6 => "SIXTY", 
7 => "SEVENTY", 
8 => "EIGHTY", 
9 => "NINETY" 
); 
$hundreds = array( 
"HUNDRED", 
"THOUSAND", 
"MILLION", 
"BILLION", 
"TRILLION", 
"QUARDRILLION" 
); /*limit t quadrillion */
$num = number_format($num,2,".",","); 
$num_arr = explode(".",$num); 
$wholenum = $num_arr[0]; 
$decnum = $num_arr[1]; 
$whole_arr = array_reverse(explode(",",$wholenum)); 
krsort($whole_arr,1); 
$rettxt = ""; 
foreach($whole_arr as $key => $i){
	
while(substr($i,0,1)=="0")
		$i=substr($i,1,5);
if($i < 20){ 
/* echo "getting:".$i; */
$rettxt .= $ones[$i]; 
}elseif($i < 100){ 
if(substr($i,0,1)!="0")  $rettxt .= $tens[substr($i,0,1)]; 
if(substr($i,1,1)!="0") $rettxt .= " ".$ones[substr($i,1,1)]; 
}else{ 
if(substr($i,0,1)!="0") $rettxt .= $ones[substr($i,0,1)]." ".$hundreds[0]; 
if(substr($i,1,1)!="0")$rettxt .= " ".$tens[substr($i,1,1)]; 
if(substr($i,2,1)!="0")$rettxt .= " ".$ones[substr($i,2,1)]; 
} 
if($key > 0){ 
$rettxt .= " ".$hundreds[$key]." "; 
}
} 
if($decnum > 0){
$rettxt .= " and ";
if($decnum < 20){
$rettxt .= $ones[$decnum];
}elseif($decnum < 100){
$rettxt .= $tens[substr($decnum,0,1)];
$rettxt .= " ".$ones[substr($decnum,1,1)];
}
}
return $rettxt;
}
$mystring='';
$murl =  "../assets/img/Clipping-Path-House-final.png";
$logo2 = "../assets/img/Clipping-Path-House-final.png";

$startdate = $_POST['startdate'];
$enddate = $_POST['enddate'];
$paymmentst = $_POST['paymmentst'];

$filterJob = $job->filteredJob($startdate, $enddate, $paymmentst);


$invdate=date('Y-m-d');	
$invoicenum=date('mdYHs');
$i=0;
$total_qty = 0;
$total_amount = 0;


$total_amount_amount = 0;
$total_chanrge_amount = 0;

$maintbl = '';
if ($filterJob) {
	while( $row=mysqli_fetch_assoc($filterJob) ) {
	$i++;
	
	$total_single_amount = $row['fld_amount'] + $row['fld_charge'];
	
	$total_qty = $total_qty + $row['fld_total_files'];
	$total_amount = (int)$total_amount + (int)$total_single_amount;
	
	
	$total_amount_amount = (int)$total_amount_amount + (int)$row['fld_amount'];
	$total_chanrge_amount = (int)$total_chanrge_amount + (int)$row['fld_charge'];
	
	
	$maintbl.= '<tr class="odd gradeX" style="background:#FFC;">
	<td align="center">'.$i.'</td>
	<td align="center">'.$row['fld_datetime'].'</td>
	<td align="center">'.$row['fld_job_title'].'</td>
	<td align="center">'.$unitpr =  (int)$row['fld_amount']/(int)$row['fld_total_files'].'</td>
	<td align="center">'.$row['fld_total_files'].'<br/></td>
	<td align="center">$'.$row['fld_amount'].'<br/></td>
	<td align="center">$'.$row['fld_charge'].'<br/></td>
	<td align="center">$'.$total_single_amount.'<br/></td>
	</tr>';
	}
} else {
		$maintbl.= '<tr class="odd gradeX" style="background:#FFC;">
	<td align="center" colspan="6">Nothing Found</td></tr>';
}

	$maintbl.='<tr class="odd gradeX" style="background:#FFC;">
<td colspan="4" align="right"><strong>Grand Total</strong></td>
<td align="center"><strong>'.$total_qty.' Pcs</strong></td>
<td align="center"><strong>$'.$total_amount_amount.'</strong></td>
<td align="center"><strong>$'.$total_chanrge_amount.'</strong></td>
<td align="center"><strong>$'.$total_amount.' USD</strong></td>
</tr>
<tr class="odd gradeX" style="background:#FFC;">
<td colspan="6" align="left" class="noborder" style="border-right:none;">In Word: <strong>'.numberTowords($total_amount).'</strong></td>
<td align="right"><strong>Net Total</strong></td>
<td align="center"><strong>$'.$total_amount.' USD</strong></td>
</tr>';
$mytb='<p></p><table class="bpmTopnTail" style="width:100%; padding-top:20px;">
  <tr>
    <td><h1 style="font-size:40px; text-align:left; width:100%; color:#cecece; font-family:Open Sans,sans-serif;">INVOICE</h1></td>
     <td align:right><p style="text-align:right;"><strong>Date:</strong> '.$invdate.'<br /><strong>INVOICE NO.</strong> '.$invoicenum.'</p></td>
  </tr>
  <tr>
    <td><div style="padding-left:10px; font-size:15px; color:#000;"><p><strong>From:</strong></p><p><span style="padding-left:50px;"><strong>Clipping Path House Graphics Media</strong></span></p><p style="padding-left:40px; padding-top:0px; font-size:15px; color:#333;"><span style="font-size:15px; color:#3d85c6;">548, Mirpur-14, Kafrul</span><br>P.S: Kafrul, P.O: Cantonment<br>Dhaka – 1206, Dhaka – Bangladesh<br><br> Email: <a href="mailto:info@clippingpathhouse.com"><span style="color:#1155cc;">info@clippingpathhouse.com</span></a><br> Skype: <span style="color:#073763;"><strong>cph.graphics</strong></span></p></div></td>
    <td><div style="padding-left:10px; font-size:15px; color:#000; float:right;"><p align="right"><strong>To:</strong></p><p align="right"><span style="padding-left:50px;"><strong>'.$clientname.'</strong></span></p><p style="padding-left:40px; padding-top:0px; font-size:15px; color:#333;"><span style="font-size:15px; color:#3d85c6;">'.$caddress.'<br><br> Email: <span style="color:#1155cc;">'.$clientemail.'</span><br> Phone: <span style="color:#073763;"><strong>'.$clientphone.'</strong></span></p></div></td>
  </tr>
</table>
<p style="width:100%; color:#000; font-size:12px; padding:0 0 0 10px; margin:0;"><strong>This Invoice bill for Image Editing Services (Graphics Design) Outsource Work</strong></p>
<p>&nbsp;</p>
';
$html='<style>
table {
	border-collapse:collapse;
	margin-bottom:30px;
	font-family: "Open Sans",sans-serif;
	color:#333;
	vertical-align: middle;
	font-size:12px;
}
.table-bordered {
    border: 1px solid #ddd;
	margin-bottom: 20px;
    width: 100%;
}

.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border: 1px solid #ddd;
}
.table > thead > tr > th {
    border-bottom: 2px solid #ddd;
}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    border-top: 1px solid #ddd;
    padding: 8px;
}
td {
	padding:5px;
	border:1px solid #ddd;
}
th {
	padding:5px;
	border:1px solid #ddd;
	font-weight:bold;
	margin-top: 8px;
}
.noborder {
	border: none;
}
.row{
	width:100%;
	}
.col-sm-6 {
    width: 50%;
}
</style>
<div class="row" style="width:100%; float:left;">
<div class="col-lg-12" style="width:100%; float:left;">
<img src="'.$murl.'" height="70"><br/>
'.$mytb.'
</div>
</div>
<table class="table table-bordered">
<thead>
<tr>
<th style="text-align:center;">Qty</th>
<th style="text-align:center;">Item / Order Name</th>
<th style="text-align:center;">Description</th>
<th style="text-align:center;">Unit Price</th>
<th style="text-align:center;">Total image</th>
<th style="text-align:center;">Amount</th>
<th style="text-align:center;">Charge</th>
<th style="text-align:center;">Total $ USD</th>
</tr>
</thead>
<tbody>'.$maintbl.'
</tbody>
</table>
<h3 style="font-size:18px; text-align:left; width:100%; color:#000; font-family:Open Sans,sans-serif;">Payment Information –</h3>
<p>Kindly pay your due bill to our verified PayPal Account.</p>
<p><strong>PayPal ID: <a href="mailto:info@clippingpathhouse.com">pay2cphgm@gmail.com</a></strong></p>
<p><strong>If you want to pay via bank please contact with our admin for bank details.</strong></p>
<h4><strong>Condition:</strong></h4>
<div class="condition">
<ul style="margin:0 0 10px 70px; padding:0;">
<li list-style-type:none; font-size:16px; font-family: "Open Sans",sans-serif;><i class="fa fa-check">&nbsp;&nbsp;Payment should be made within 7th working days after get invoice</i></li>
<li list-style-type:none; font-size:16px; font-family: "Open Sans",sans-serif;><i class="fa fa-check">Please mention the word “Image Editing Outsource Bill” & Invoice No. both at bank transfer Note
Or PayPal note.
</i></li>
<li list-style-type:none; font-size:16px; font-family: "Open Sans",sans-serif;><i class="fa fa-check">&nbsp;&nbsp;Always select <strong>"service"</strong> payment method and select <strong>"no shipping required"</strong> option</i></li>
</ul>
</div>
<p style="font-size:12px; color:#999; text-align:center;">Make all checks payable to <a href="http://www.clippingpathhouse.com/">www.clippingpathhouse.com</a></p>
<p style="font-size:13px; color:#363636; text-align:center;"><strong><span style="font-size:12px; color:#333;">Thank you for your business! </span><a href="http://www.clippingpathhouse.com/">www.clippingpathhouse.com</a>, 548, Mirpur-14, Kafrul
Dhaka- 1206, Bangladesh<br>+88-01741906076 Email: <a href="mailto:info@clippingpathhouse.com">info@clippingpathhouse.com</a></strong></p>
';
//echo $html;
$mpdf = new \Mpdf\Mpdf();
$mpdf->WriteHTML($html);
$mpdf->Output();
?>