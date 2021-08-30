<?php 
include_once "../lib/Session.php";
Session::init();
include_once '../lib/Database.php';
include_once '../helper/Format.php';

$db = new Database();
$fm = new Format();

	$mail_body="";
	$client_mail_body="";
	$user_id = "$_POST[user_id]";
	$job_title = $fm->validation($_POST["job_title"]);
	$main_service = "$_POST[main_service]";
	$add_service = "$_POST[add_service]";
	$format = "$_POST[format]";
	$delivery_time = "$_POST[delivery_time]";
	$total_files = "$_POST[total_files]";
	$job_instruction = $_POST['job_instruction'];
	$file_dir_name = "$_POST[file_dir_name]";
	$datetime = (gmstrftime("%Y-%m-%d %H:%M:%S"));
	
	$m_service_q ="select fld_service_name from tbl_main_services where id='$main_service'";
	$query = $db->select($m_service_q);
	$m_service_r = mysqli_fetch_assoc($query);
	$main_service_text = $m_service_r['fld_service_name'];
	
	$a_service_q = "select fld_service_name from tbl_additional_services where id='$add_service'";
	$query2 = $db->select($a_service_q);
	if ($query2) {
	    $a_service_r = mysqli_fetch_assoc($query2);
	    $add_service_text = $a_service_r['fld_service_name'];
	} else {
	    $add_service_text = '';
	}
	
	$req="INSERT INTO tbl_register_job (
	fld_user_id,
	fld_job_title,
	fld_main_service,
	fld_add_service,
	fld_format,
	fld_delivery_time,
	fld_total_files,
	fld_job_instruction,
	fld_datetime
	) VALUES (
	'$user_id',
	'$job_title',
	'$main_service',
	'$add_service',
	'$format',
	'$delivery_time',
	'$total_files',
	'$job_instruction',
	'$datetime'
	)";
	$result = $db->insert($req);
	if($result) {
	echo "Your job has been submitted";
	}
	else {
echo "Error: <br>" . $connect->error;
}
	
	//---------------Email sender---------------
	$recipient = $db->recipient_email; //recipient 
	$client_name = Session::get('user_fullname');
	$client_email = Session::get('user_email');

	$mail_body .= "Client Name: $client_name\r\n";
	$mail_body .= "Client Email: $client_email\r\n\n";
	$mail_body .= "Job Title: $job_title\r\n\n";
	$mail_body .= "Main Service: $main_service_text \r\n";
	$mail_body .= "Additional Service: $add_service_text \r\n";
	$mail_body .= "Return Format: $format \r\n";
	$mail_body .= "Delivery Time: $delivery_time \r\n";
	$mail_body .= "Job Instruction: $job_instruction \r\n";
	$mail_body .= "File Location: $file_dir_name \r\n";

	$subject = "New Register job has been submitted by $client_name"; //subject 
	$header = "From: Register_Job"; //optional headerfields 

	mail($recipient, $subject, $mail_body, $header); //mail command :) 

	//-------------Email Sender Ends------------
	
	
	//---------------Email sender - Client---------------

	$recipient = $client_email; //recipient
	$admin_mail = $db->recipient_email;

	$client_mail_body .= "Dear $client_name\r\n\n";
	$client_mail_body .= "Job Title: $job_title\r\n\n";
	$client_mail_body .= "Thanks for your new job submission.\r\n";
	$client_mail_body .= "After done your job as per your instructions we will be back on time.\r\n";
	$client_mail_body .= "If you have any query about anything, please inform us.\r\n";
	$client_mail_body .= "Have a nice time.\r\n\n\n";
	$client_mail_body .= "------------------------------------------- \r\n";
	$client_mail_body .= "Thanks & Regards\r\n";
	$client_mail_body .= "Support Team of\r\n";
	$client_mail_body .= "CPH Graphics Media\r\n\n";
	$client_mail_body .= "Email: info@clippingpathhouse.com\r\n";
	$client_mail_body .= "Skype: CPH Graphics Media\r\n";
	$client_mail_body .= "Call: +88-01741906076\r\n";
	$client_mail_body .= "24/7 Support & Service\r\n";
	$client_mail_body .= "Web: www.clippingpathhouse.com\r\n";

	$subject = "Thanks for the job submission"; //subject 
	$header = "From: CPH_Graphics_Media"; //optional headerfields 

	mail($recipient, $subject, $client_mail_body, $header); //mail command :) 

	//-------------Email Sender - Client Ends------------
?>