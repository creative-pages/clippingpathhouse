<?php
include_once "../lib/Session.php";
Session::init();
include_once '../lib/Database.php';
include_once '../helper/Format.php';

$db = new Database();
$fm = new Format();


// get user country name start--------------------------------------------------
// IP address 
$userIP = $_SERVER['REMOTE_ADDR']; 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://ip-api.com/json/" . $userIP);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$result = curl_exec($ch);
$result = json_decode($result);

if($result->status == 'success') {
    $country_name = $result->country;
} else {
    echo 'API Problem!';
}
// get user country name end----------------------------------------------------



if($_POST['freetrial']==1){
	$folder="free_trial";
	}
else{
	$folder="get_quote";
	}
$historia = $_POST['txt_file_dir'];
if(is_array($_FILES)) {
	$totalfiles=count($_FILES['userImage']['name']);
if($totalfiles>3){
	echo "Total 3 File can be uploaded at a time!!! Your Total file exceed";
	}
	else{
	$name = $_POST['fld_name'];
	$date = (gmstrftime("%d_%m_%Y_%H.%M.%S"));
	
	$directory=mkdir('../uploadFiles/'.$folder.'/'.$historia, 0777);
	$allsize=0;
	$maxfullsize=47185920;
foreach ($_FILES['userImage']['name'] as $name => $value){
	$errors     = array();
	//1MB=1048576 KB
	//15MB=15728640 KB
	//45MB=47185920 KB
	$singlesize=$_FILES['userImage']['size'][$name];
    $maxsize    = 15728640;
	$allsize= $singlesize+$allsize;
    $acceptable = array(
	'application/postscript',
	'application/postscript',
	'application/postscript',
	'application/photoshop',
	'application/nappdf',
	'application/pdf',
	'application/illustrator',
	'application/x-photoshop',
        'image/psd',
        'image/jpeg',
        'image/jpg',
        'image/gif',
		'image/tif',
		'image/tiff',
		'image/iff',
		'image/x-icon',
		'image/bmp',
        'image/png',
        'image/x-adobe-dng',
        'image/x-canon-cr2',
        'image/x-nikon-nef',
        'image/epd'
    );
    if(($_FILES['userImage']['size'][$name] >= $maxsize) || ($_FILES["userImage"]["size"][$name] == 0)) {
        $errors[] = 'File too large. File must be less than 15 megabytes.';
    }

    elseif((!in_array($_FILES['userImage']['type'][$name], $acceptable)) && (!empty($_FILES["userImage"]["type"][$name]))) {
        $errors[] = 'Invalid file type. Only PDF, JPG, nef, dng, phd, GIF and PNG types are accepted.';
    }
   }
   if($allsize>=$maxfullsize){
	    $errors[] = 'All Image Size Must be Less Then 45MB';
		exit;
	   }
    if(count($errors) === 0) {
foreach ($_FILES['userImage']['name'] as $name => $value){
	
if(is_uploaded_file($_FILES['userImage']['tmp_name'][$name])) {
$sourcePath = $_FILES['userImage']['tmp_name'][$name];
$targetPath ='../uploadFiles/'.$folder.'/'.$historia."/".$_FILES['userImage']['name'][$name];
if(move_uploaded_file($sourcePath,$targetPath)) {
	$getsize=$_FILES['userImage']['size'][$name]/1024;
	
	if($getsize<1024){
		$imagesize=number_format($getsize,2)." KB";
		}
	else{
		$imagesize2=$getsize/1024;
		if($imagesize2<1024){
			$imagesize=number_format($imagesize2,2)." MB";
			}
		}

		
?>
<!--<table role="presentation" style="margin-bottom:0;" class="table table-bordered table-hover" id="success_show">-->
<!--    <tbody id="files_table" class="files">-->
<!--    <tr class="template-upload fade show">-->
<!--            <td style="width:8%;">-->
<!--                <img src="<?php echo 'uploadFiles/'.$folder.'/'.$historia.'/'.$_FILES['userImage']['name'][$name]; ?>" width="60px" height="60px" />-->
<!--            </td>-->
<!--            <td style="width:77%;">-->
<!--                <p class="name"><?php echo $_FILES['userImage']['name'][$name];?></p>-->
<!--            </td>-->
<!--            <td style="width:15%;">-->
<!--                <p class="size"><?php echo $imagesize;?></p>-->
<!--            </td>-->
<!--        </tr>-->
<!--    </tbody>-->
<!-- </table>-->
<?php
	
}}
	$upload_complete = 'done';
}
	if ($upload_complete == 'done') {
		if ($folder == "free_trial") {
			$fld_name = $fm->validation($_POST["fld_name"]);
			$fld_email = $fm->validation($_POST["fld_email"]);
			$fld_company = $fm->validation($_POST["fld_company"]);
			$fld_website = $fm->validation($_POST["fld_website"]);
			$fld_country = $fm->validation($_POST["fld_country"]);
			$fld_main_service = $fm->validation($_POST["fld_main_service"]);
			$fld_add_service = $fm->validation($_POST["fld_add_service"]);
			$fld_format = $fm->validation($_POST["fld_format"]);
			$fld_source = $fm->validation($_POST["fld_source"]);
			$fld_job_instruction = $_POST["fld_job_instruction"];
			$fld_directory = $fm->validation($_POST['txt_file_dir']);
			
			
			$m_service_q ="select fld_service_name from tbl_main_services where id='$fld_main_service'";
        	$query = $db->select($m_service_q);
        	$m_service_r = mysqli_fetch_assoc($query);
        	$main_service_text = $m_service_r['fld_service_name'];
        	
        	$a_service_q = "select fld_service_name from tbl_additional_services where id='$fld_add_service'";
        	$query2 = $db->select($a_service_q);
        	if ($query2) {
        	    $a_service_r = mysqli_fetch_assoc($query2);
        	    $add_service_text = $a_service_r['fld_service_name'];
        	} else {
        	    $add_service_text = '';
        	}
			
			$file_formats ="select fld_format from tbl_file_format where id='$fld_format'";
        	$query3 = $db->select($file_formats);
        	$file_formats_r = mysqli_fetch_assoc($query3);
        	$file_formats_text = $file_formats_r['fld_format'];
        	
        	

			$sql = "INSERT INTO `tbl_free_trial`(`fld_name`, `fld_email`, `fld_company`, `fld_website`, `fld_country`, `real_country`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_source`, `fld_job_instruction`, `fld_directory`) VALUES ('$fld_name', '$fld_email', '$fld_company', '$fld_website', '$fld_country', '$country_name', '$fld_main_service', '$fld_add_service', '$fld_format', '$fld_source', '$fld_job_instruction', '$fld_directory')";

			$result = $db->insert($sql);
			if ($result) {
				echo '<div class="alert alert-success mt-3">Free trial submitted successfully.</div>';
				//---------------Email sender---------------

				$recipient = $db->recipient_email; //recipient 
				$email = $fld_email; //senders e-mail adress 

				$Name = $fld_name; //senders name 

				$mail_body  = "Name: $Name \r\n";
				$mail_body .= "Email: $email \r\n";
				$mail_body .= "Company: $fld_company \r\n";
				$mail_body .= "Website: $fld_website \r\n";
				$mail_body .= "Country: $fld_country \r\n";
				$mail_body .= "Real Country: $country_name \r\n";
				$mail_body .= "Source: $fld_source \r\n\n";
				$mail_body .= "------------------------------------------- \r\n\n";
				$mail_body .= "Job Details:\r\n\n";
				$mail_body .= "Main Service: $main_service_text \r\n";
				$mail_body .= "Additional Service: $add_service_text \r\n";
				$mail_body .= "Return Format: $file_formats_text \r\n";
				$mail_body .= "Job Instruction: $fld_job_instruction \r\n";
				$mail_body .= "File Location: $fld_directory \r\n";

				$subject = "1 Free trial has been submitted"; //subject 
				$header = "From: Free_Trial_Job"; //optional headerfields 

				mail($recipient, $subject, $mail_body, $header); //mail command :) 

				//-------------Email Sender Ends------------
				
				
				//---------------Email sender - Client---------------

				$recipient = $fld_email; //recipient 
				$email = $fld_email; //senders e-mail adress 

				$Name = $fld_name; //senders name 
				$admin_mail = $db->recipient_email;

				$client_mail_body = "Dear $Name\r\n\n";
				$client_mail_body .= "Thanks for your free trial job.\r\n";
				$client_mail_body .= "After done your job as per your instructions we will be back soon with a competitive quote for you.\r\n";
				$client_mail_body .= "Hope you will like our quality and the quote also.\r\n";
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

				$subject = "Thanks for the free trial submission"; //subject 
				$header = "From: CPH_Graphics_Media"; //optional headerfields 

				mail($recipient, $subject, $client_mail_body, $header); //mail command :) 

				//-------------Email Sender - Client Ends------------
			}
		} else {
			$fld_name = $fm->validation($_POST["fld_name"]);
			$fld_email = $fm->validation($_POST["fld_email"]);
			$fld_company = $fm->validation($_POST["fld_company"]);
			$fld_website = $fm->validation($_POST["fld_website"]);
			$fld_country = $fm->validation($_POST["fld_country"]);
			$fld_main_service = $fm->validation($_POST["fld_main_service"]);
			$fld_add_service = $fm->validation($_POST["fld_add_service"]);
			$fld_format = $fm->validation($_POST["fld_format"]);
			$fld_quantity = $fm->validation($_POST["fld_quantity"]);
			$fld_source = $fm->validation($_POST["fld_source"]);
			$fld_job_instruction = $_POST["fld_job_instruction"];
	
			$fld_directory = $fm->validation($_POST['txt_file_dir']);
			
			
			
			$m_service_q ="select fld_service_name from tbl_main_services where id='$fld_main_service'";
        	$query = $db->select($m_service_q);
        	$m_service_r = mysqli_fetch_assoc($query);
        	$main_service_text = $m_service_r['fld_service_name'];
        	
        	$a_service_q = "select fld_service_name from tbl_additional_services where id='$fld_add_service'";
        	$query2 = $db->select($a_service_q);
        	if ($query2) {
        	    $a_service_r = mysqli_fetch_assoc($query2);
        	    $add_service_text = $a_service_r['fld_service_name'];
        	} else {
        	    $add_service_text = '';
        	}
			
			$file_formats ="select fld_format from tbl_file_format where id='$fld_format'";
        	$query3 = $db->select($file_formats);
        	$file_formats_r = mysqli_fetch_assoc($query3);
        	$file_formats_text = $file_formats_r['fld_format'];
			
			

			$sql = "INSERT INTO `tbl_free_quote`(`fld_name`, `fld_email`, `fld_company`, `fld_website`, `fld_country`, `real_country`, `fld_main_service`, `fld_add_service`, `fld_format`, `fld_quantity`, `fld_source`, `fld_job_instruction`, `fld_directory`) VALUES ('$fld_name', '$fld_email', '$fld_company', '$fld_website', '$fld_country', '$country_name', '$fld_main_service', '$fld_add_service', '$fld_format', '$fld_quantity', '$fld_source', '$fld_job_instruction', '$fld_directory')";

			$result = $db->insert($sql);
			if ($result) {
				echo '<div class="alert alert-success mt-3">Get quote submitted successfully.</div>';
				//---------------Email sender---------------

				$recipient = $db->recipient_email; //recipient 
				$email = $fld_email; //senders e-mail adress 
				$admin_mail = $db->recipient_email;

				$Name = $fld_name; //senders name 

				$mail_body  = "Name: $Name \r\n";
				$mail_body .= "Email: $email \r\n";
				$mail_body .= "Company: $fld_company \r\n";
				$mail_body .= "Website: $fld_website \r\n";
				$mail_body .= "Country: $fld_country \r\n";
				$mail_body .= "Real Country: $country_name \r\n";
				$mail_body .= "Source: $fld_source \r\n\n";
				$mail_body .= "------------------------------------------- \r\n\n";
				$mail_body .= "Job Details:\r\n\n";
				$mail_body .= "Main Service: $main_service_text \r\n";
				$mail_body .= "Additional Service: $add_service_text \r\n";
				$mail_body .= "Return Format: $file_formats_text \r\n";
				$mail_body .= "Job Instruction: $fld_job_instruction \r\n";
				$mail_body .= "File Location: $fld_directory \r\n";

				$subject = "1 Get Quote has been submitted"; //subject 
				$header = "From: Free_Trial_Job"; //optional headerfields 

				mail($recipient, $subject, $mail_body, $header); //mail command :) 

				//-------------Email Sender Ends------------
				
				
				//---------------Email sender - Client---------------

				$recipient = $fld_email; //recipient 
				$email = $fld_email; //senders e-mail adress 

				$Name = $fld_name; //senders name 

				$client_mail_body = "Dear $Name\r\n\n";
				$client_mail_body .= "Thanks for your get quote job.\r\n";
				$client_mail_body .= "After done your job as per your instructions we will be back soon with a competitive quote for you.\r\n";
				$client_mail_body .= "Hope you will like our quality and the quote also.\r\n";
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

				$subject = "Thanks for the get quote submission"; //subject 
				$header = "From: CPH_Graphics_Media"; //optional headerfields 

				mail($recipient, $subject, $client_mail_body, $header); //mail command :) 

				//-------------Email Sender - Client Ends------------
			}
		}
	}
}
	else{
		foreach($errors as $error) {
		echo $error;
		}
		}
	}
}
?>