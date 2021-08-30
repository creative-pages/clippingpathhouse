<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

$service->updateSeenService('tbl_free_trial', 'fld_read', '1');

$free_trial = $service->allServices('tbl_free_trial');

if (isset($_GET['delete_free_trial'])) {
    $delete_id = base64_decode($_GET['delete_free_trial']);
    $delete_result = $service->deleteService('tbl_free_trial', $delete_id);
    if ($delete_result) {
        header("Location: free_trial_job.php");
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
                                    <li class="breadcrumb-item active" aria-current="page">Free Trial Jobs</li>
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
                  <div class="card-header">Free Trial Jobs 
                    <a href="job_details.php" class="btn btn-warning btn-sm float-right">Back To Job Details</a>
                  </div>
                  <div class="card-body bg-white text-dark">
                    <div class="table-responsive">
                      <table id="zero_config" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th><b>SL No.</b></th>
                                    <th><b>Name</b></th>
                                    <?php 
                                    if (Session::get('admin_type') == 'Super Admin') {
                                    ?>
                                    <th><b>Company</b></th>
                                    <?php
                                    }
                                    ?>
                                    <th><b>Country</b></th>
                                    <!--<th><b>Return File</b></th>-->
                                    <th><b>Instruction</b></th>
                                    <th><b>Action</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                if ($free_trial) {
                                    while ($row = mysqli_fetch_assoc($free_trial)) {
                                    ?>
                                    <tr>
                                        <td><?= $row['fld_submission_datetime']; ?></td>
                                        <td><?= $row['fld_name']; ?></td>
                                        <?php 
                                        if (Session::get('admin_type') == 'Super Admin') {
                                        ?>
                                        <td><?= $row['fld_company']; ?></td>
                                        <?php
                                        }
                                        ?>
                                        <td><?= $row['fld_country']; ?> <br><span class="text-success font-weight-bold"><?= $row['real_country']; ?></span></td>
                                        <!--<td>-->
                                            <?php
                                            // echo $row['fld_format'];
                                            ?>
                                        <!--</td>-->
                                        <td><?= $row['fld_job_instruction']; ?></td>
                                        <td>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#id-<?= $row['id']; ?>">
                                              <i class="fas fa-info-circle fa-1x"></i>
                                            </button>
                                          <?php 
                                          if (Session::get('admin_type') == 'Super Admin') {
                                          ?>
                                          
                                            <a href="?delete_free_trial=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash-alt fa-1x"></i>
                                            </a>
                                          <?php
                                          }
                                          ?>
                                        </td>
                                    </tr>
                                    <?php
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

<?php 

$free_trial = $service->allServices('tbl_free_trial');

if ($free_trial) {
  while ($free_trial_result = mysqli_fetch_assoc($free_trial)) {
      $format_id = $free_trial_result['fld_format'];
      $format = $service->singleService('tbl_file_format', $format_id);
      if ($format) {
          $formats = mysqli_fetch_assoc($format);
          $formated = $formats['fld_format'];
      }
    ?>
    <!-- Modal -->
    <div class="modal fade" id="id-<?= $free_trial_result['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Free Trial ID#<?= $free_trial_result['id']; ?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table table-dark table-striped talbe-hover">
              <tbody>
                <tr>
                  <td>Full Name</td>
                  <td><?= isset($free_trial_result['fld_name']) ? $free_trial_result['fld_name'] : ''; ?></td>
                </tr>
                <?php 
                if (Session::get('admin_type') == 'Super Admin') {
                ?>
                <tr>
                  <td>Email</td>
                  <td><?= isset($free_trial_result['fld_email']) ? $free_trial_result['fld_email'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Compay</td>
                  <td><?= isset($free_trial_result['fld_company']) ? $free_trial_result['fld_company'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Website</td>
                  <td><?= isset($free_trial_result['fld_website']) ? $free_trial_result['fld_website'] : ''; ?></td>
                </tr>
                <?php
                }
                ?>
                
                <tr>
                  <td>Country</td>
                  <td><?= isset($free_trial_result['fld_country']) ? $free_trial_result['fld_country'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Real Country</td>
                  <td><?= isset($free_trial_result['real_country']) ? $free_trial_result['real_country'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Format</td>
                  <td><?= isset($formated) ? $formated : ''; ?></td>
                </tr>
                <tr>
                  <td>Source</td>
                  <td><?= isset($free_trial_result['fld_source']) ? $free_trial_result['fld_source'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Instruction</td>
                  <td><?= isset($free_trial_result['fld_job_instruction']) ? $free_trial_result['fld_job_instruction'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Submission Date</td>
                  <td><?= isset($free_trial_result['fld_submission_datetime']) ? $free_trial_result['fld_submission_datetime'] : ''; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <?php
  }
}

?>


<?php require_once "inc/footer.php"; ?>