<?php 
include_once "../lib/Session.php";
Session::init();
include_once '../lib/Database.php';
include_once '../helper/Format.php';

$db = new Database();
$fm = new Format();


$filedirectory=$_POST['txt_file_dir'];
if(is_array($_FILES)) {
    $totalfiles=count($_FILES['userImage']['name']);
    if($totalfiles>200){
    	echo "Total 200 File can be uploaded at a time!!! Your Total file exceed";
    } else {
    
    		$directory=mkdir('../uploadFiles/job_order/'.$filedirectory, 0777);
    	$allsize=0;
    	$maxfullsize=3221225472;
    foreach ($_FILES['userImage']['name'] as $name => $value){
    	$errors     = array();
    	//1MB=1048576 KB
    	//300MB=314572800 KB
    	//500MB=524288000 KB
    	//200MB=209715200 KB
    	//1GB=1073741824 KB
    	//2GB=2147483648 KB
    	//3GB=3221225472 KB
    	$singlesize=$_FILES['userImage']['size'][$name];
        $maxsize    = 3221225472;
    	$allsize= $singlesize+$allsize;
        $acceptable = array(
    	'application/postscript',
    	'application/photoshop',
    	'application/nappdf',
    	'application/pdf',
    	'application/illustrator',
    	'application/x-photoshop',
    	'application/octet-stream',
    	'image/vnd.adobe.photoshop',
    	'image/photoshop',
    	'image/x-photoshop',
    	'zz-application/zz-winassoc-psd',
    	'application/psd',
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
            'image/epd',
            'image/zip'
        );
        if(($_FILES['userImage']['size'][$name] >= $maxsize) || ($_FILES["userImage"]["size"][$name] == 0)) {
            $errors[] = 'File too large. File must be less than 500 megabytes.';
        }
    
        elseif((!in_array($_FILES['userImage']['type'][$name], $acceptable)) && (!empty($_FILES["userImage"]["type"][$name]))) {
            $errors[] = 'Invalid file type. Only PDF, JPG,nef,dng, GIF and PNG types are accepted.';
        }
       }
       if($allsize>=$maxfullsize){
    	    $errors[] = 'All Image Size Must be Less Then 3GB';
    		exit;
    	   }
        if(count($errors) === 0) {
    foreach ($_FILES['userImage']['name'] as $name => $value){
    	
    if(is_uploaded_file($_FILES['userImage']['tmp_name'][$name])) {
    $sourcePath = $_FILES['userImage']['tmp_name'][$name];
    $targetPath ='../uploadFiles/job_order/'.$filedirectory."/".$_FILES['userImage']['name'][$name];
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
    		else{
    			$imagesize3=number_format($imagesize2/1024,2);
    			$imagesize=$imagesize3." GB";
    			}
    		}
    ?>
    <input type="hidden" id="numberoffile" name="numberoffile" value="<?php echo $totalfiles;?>">
    <table role="presentation" style="margin-bottom:0;" class="table table-bordered table-hover">
        <tbody id="files_table" class="files">
        <tr class="template-upload fade show">
                <td style="width:8%;">
                    <img src="<?php echo '../uploadFiles/job_order/'.$filedirectory."/".$_FILES['userImage']['name'][$name]; ?>" width="60px" height="60px" />
                </td>
                <td style="width:77%;">
                    <p class="name"><?php echo $_FILES['userImage']['name'][$name];?></p>
                </td>
                <td style="width:15%;">
                    <p class="size"><?php echo $imagesize;?></p>
                </td>
            </tr>
        </tbody>
     </table>
    <?php
    }}}
    	}
    	else{
    		foreach($errors as $error) {
    		echo $error;
    		}
    		}
    	}
}
?>