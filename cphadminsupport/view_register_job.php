<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_job'])) {
    $udpate_result = $job->updateRegisterJob($_POST);
}

if (isset($_GET['rjid'])) {
    $id = base64_decode($_GET['rjid']);
    $single_result = $service->singleService('tbl_register_job', $id);
    if ($single_result) {
        $single_results = mysqli_fetch_assoc($single_result);

        $user_id = $single_results['fld_user_id'];
        $single_user_result = $service->singleService('tbl_user_info', $user_id);
        if ($single_user_result) {
            $single_user_results = mysqli_fetch_assoc($single_user_result);
        }
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
                                    <li class="breadcrumb-item active" aria-current="page">Job Details</li>
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
                  <div class="card-header">Job Details</div>
                  <div class="card-body bg-white text-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-4">
                                <div class="profile_intro bg-white p-3 rounded">
                                    <div class="text-center">
                                        <?php 
                                        if (isset($single_user_results['fld_photo']) && $single_user_results['fld_photo'] != '') {
                                        ?>
                                        <img src="../uploadFiles/users/<?= $single_user_results['fld_photo']; ?>" width="150" height="100" class="rounded-circle" alt="User Photo">
                                        <?php
                                        } else {
                                        ?>
                                        <img src="assets/images/users/1.jpg" width="150" height="100" class="rounded-circle" alt="User Photo">
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <h3 class="text-center mt-3"><?= isset($single_user_results['fld_fullname']) ? $single_user_results['fld_fullname'] : ''; ?></h3>
                                    <?php 
                                    if (Session::get('admin_type') == 'Super Admin') {
                                    ?>
                                    <hr>
                                    <p class="px-3 mb-2"><b>Email:</b> <?= isset($single_user_results['fld_email']) ? $single_user_results['fld_email'] : ''; ?></p>
                                    <p class="px-3 mb-2"><b>Phone:</b> <?= isset($single_user_results['fld_phone']) ? $single_user_results['fld_phone'] : ''; ?></p>
                                    <p class="px-3 mb-2"><b>Address:</b> <?= isset($single_user_results['fld_country']) ? $single_user_results['fld_country'] : ''; ?></p>
                                    <?php
                                    }
                                    ?>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">
                            
                                <?= isset($udpate_result) ? $udpate_result : ''; ?>
                                <table class="table table-bordered table-dark table-striped table-hover">
                                  <tbody>
                                    <tr>
                                      <td>Job ID</td>
                                      <td>#<?= isset($single_results['id']) ? $single_results['id'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Date - Time</td>
                                      <td><?= isset($single_results['fld_datetime']) ? $single_results['fld_datetime'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Job Title</td>
                                      <td><?= isset($single_results['fld_job_title']) ? $single_results['fld_job_title'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Format</td>
                                      <td><?= isset($single_results['fld_format']) ? $single_results['fld_format'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>File Quantity</td>
                                      <td><?= isset($single_results['fld_total_files']) ? $single_results['fld_total_files'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Amount ($ USD)</td>
                                      <td><?= isset($single_results['fld_amount']) ? $single_results['fld_amount'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Transaction Charge ($ USD)</td>
                                      <td><?= isset($single_results['fld_charge']) ? $single_results['fld_charge'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Total Charge ($ USD)</td>
                                      <td><?= $single_results['fld_amount'] + $single_results['fld_charge']; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Payment Status</td>
                                      <td><?= isset($single_results['fld_payment_status']) ? $single_results['fld_payment_status'] : ''; ?></td>
                                    </tr>
                                    <tr>
                                      <td>Action</td>
                                      <td>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-cyan btn-sm" data-toggle="modal" data-target="#edit">
                                          Update
                                        </button>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->

<!-- Modal -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Update Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="<?= $_SERVER['PHP_SELF']; ?>?rjid=<?= base64_encode($single_results['id']); ?>" method="POST">
            <input type="hidden" value="<?= isset($single_results['id']) ? $single_results['id'] : ''; ?>" name="update_id">
             <div class="form-group">
                <label for="fld_job_title">Job Title</label>
                <input type="text" class="form-control input_green_border" id="fld_job_title" name="fld_job_title" value="<?= isset($single_results['fld_job_title']) ? $single_results['fld_job_title'] : ''; ?>" placeholder="Enter job title" readonly="">
              </div>
             <div class="form-group">
                <label for="fld_payment_type">Job Status <code class="text-danger">*</code></label>
                <select class="form-control input_green_border" name="fld_payment_type" id="fld_payment_type" required="">
                    <option value="">Select One</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_type']) && $single_results['fld_payment_type'] == 'Waiting for process') {
                        echo 'selected';
                    }
                    ?> value="Waiting for process">Waiting for process</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_type']) && $single_results['fld_payment_type'] == 'Processing') {
                        echo 'selected';
                    }
                    ?> value="Processing">Processing</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_type']) && $single_results['fld_payment_type'] == 'Waiting for payment') {
                        echo 'selected';
                    }
                    ?> value="Waiting for payment">Waiting for payment</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_type']) && $single_results['fld_payment_type'] == 'Done') {
                        echo 'selected';
                    }
                    ?> value="Done">Done</option>
                </select>
              </div>
              <div class="form-group">
                <label for="fld_amount">Amount <code class="text-danger">*</code></label>
                <input type="number" class="form-control input_green_border" id="fld_amount" name="fld_amount" value="<?= isset($single_results['fld_amount']) ? $single_results['fld_amount'] : ''; ?>" placeholder="Enter job amount" required="">
              </div>
              <div class="form-group">
                <label for="fld_charge">Transaction Charge</label>
                <input type="number" class="form-control input_green_border" id="fld_charge" name="fld_charge" value="<?= isset($single_results['fld_charge']) ? $single_results['fld_charge'] : ''; ?>" placeholder="Enter transaction charge">
              </div>
              <div class="form-group">
                <label for="fld_total_files">File Quantity</label>
                <input type="number" class="form-control input_green_border" id="fld_total_files" name="fld_total_files" value="<?= isset($single_results['fld_total_files']) ? $single_results['fld_total_files'] : ''; ?>" placeholder="Enter file quantity">
              </div>

             <div class="form-group">
                <label for="fld_payment_status">Job Status</label>
                <select class="form-control input_green_border" name="fld_payment_status" id="fld_payment_status">
                    <option value="">All</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_status']) && $single_results['fld_payment_status'] == 'Paid') {
                        echo 'selected';
                    }
                    ?> value="Paid">Paid</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_status']) && $single_results['fld_payment_status'] == 'Due') {
                        echo 'selected';
                    }
                    ?> value="Due">Due</option>
                    <option <?php 
                    if (isset($single_results['fld_payment_status']) && $single_results['fld_payment_status'] == 'Free') {
                        echo 'selected';
                    }
                    ?> value="Free">Free</option>
                </select>
              </div>
              <input type="submit" name="update_job" class="btn btn-cyan" value="Update">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<?php require_once "inc/footer.php"; ?>