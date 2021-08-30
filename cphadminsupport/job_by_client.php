<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

$id = base64_decode($_GET['user_id']);
$service->updateSeenServiceByClient('tbl_register_job', 'fld_read', '1', $id);

if (isset($_GET['user_id'])) {
    $id = base64_decode($_GET['user_id']);
    $job_by_client = $service->singleServiceJob('tbl_register_job', $id);
}

if (isset($_GET['delete_register_job'])) {
    $delete_id = base64_decode($_GET['delete_register_job']);
    $delete_result = $service->deleteService('tbl_register_job', $delete_id);
    if ($delete_result) {
        header("Location: job_by_client.php?user_id=" . $_GET['user_id']);
    }
}



?>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" style="margin-top: 64px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Control Panel</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Register Jobs By Client</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">

                <!-- ============================================================== -->
                <div class="card text-white bg-cyan mb-3 rounded_shadow">
                  <div class="card-header">Register Jobs By Client
                    <a href="job_details.php" class="btn btn-warning btn-sm float-right">Back To Job Details</a>
                  </div>
                  <div class="card-body bg-white text-dark">
                    <div class="table-responsive">
                      <table id="zero_config" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th><b>SL No.</b></th>
                                    <th><b>Date - Time</b></th>
                                    <th><b>Client Name</b></th>
                                    <th><b>Job Title</b></th>
                                    <!--<th><b>Format</b></th>-->
                                    <th><b>File Quantity </b></th>
                                    <th><b>Amount ($ USD)</b></th>
                                    <th><b>Paypal/TransactionCharge ($ USD)</b></th>
                                    <th><b>Total Charge</b></th>
                                    <th><b>Payment Status</b></th>
                                    <th><b>Action</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                if ($job_by_client) {
                                  $sl = 1;
                                    while ($row = mysqli_fetch_assoc($job_by_client)) {
                                    ?>
                                    <tr>
                                        <td><?= $sl; ?></td>
                                        <td><?= $row['fld_datetime']; ?></td>
                                        <td>
                                        <?php
                                            $user_id = $row['fld_user_id'];
                                            $single_user_result = $service->singleService('tbl_user_info', $user_id);
                                            if ($single_user_result) {
                                                $single_user_results = mysqli_fetch_assoc($single_user_result);
                                                echo $single_user_results['fld_fullname'];
                                            }
                                        ?>
                                        </td>
                                        <td><?= $row['fld_job_title']; ?></td>
                                        <!--<td>-->
                                            <?php
                                            // echo $row['fld_format'];
                                            ?>
                                        <!--</td>-->
                                        <td><?= $row['fld_total_files']; ?></td>
                                        <td><?= $row['fld_amount']; ?></td>
                                        <td><?= $row['fld_charge']; ?></td>
                                        <td><?= $row['fld_amount'] + $row['fld_charge']; ?></td>
                                        <td><?= $row['fld_payment_status']; ?></td>
                                        <td>
                                            <a href="view_register_job.php?rjid=<?= base64_encode($row['id']); ?>" class="btn btn-cyan btn-sm">
                                                <i class="fas fa-info-circle fa-1x"></i>
                                            </a>
                                            <?php 
                                            if (Session::get('admin_type') == 'Super Admin') {
                                            ?>
                                            <a href="<?= $_SERVER['REQUEST_URI']; ?>&delete_register_job=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash-alt fa-1x"></i>
                                            </a>
                                            <?php
                                            }
                                            ?>
                                            
                                        </td>
                                    </tr>
                                    <?php
                                    $sl++;
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                      </div>
                  </div>
                </div>
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->


<?php require_once "inc/footer.php"; ?>