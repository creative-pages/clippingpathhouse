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
    $row2 = mysqli_fetch_assoc($user_details);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $startdate = $_POST['startdate'];
    $enddate = $_POST['enddate'];
    $paymmentst = $_POST['paymmentst'];

    $filterJob = $job->filteredJob($startdate, $enddate, $paymmentst);
    if ($filterJob) {
        $list = '';
        while ($row = $filterJob->fetch_assoc()) {
            $list .= '<tr><td>' . $row['fld_datetime'] . '</td>
                          <td>' . $row['fld_job_title'] . '</td>
                          <td>' . $row['fld_service_name'] . '</td>
                          <td>' . $row['fld_additional_service'] . '</td>
                          <td>' . $row['fld_format'] . '</td>
                          <td>' . $row['fld_total_files'] . '</td>
                          <td>' . $row['fld_payment_type'] . '</td>
                          <td>' . $row['fld_amount'] . '</td>
                          <td>' . $row['fld_payment_status'] . '</td></tr>';
        }
        echo $list;
    } else {
        echo '<tr><td colspan="9" class="text-center">No match found!</td></tr>';
    }
}

?>