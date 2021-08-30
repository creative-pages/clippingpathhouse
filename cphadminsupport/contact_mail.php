<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

$service->updateSeenService('tbl_contact', 'fld_read', '1');

$quick_query = $service->allServices('tbl_contact');

if (isset($_GET['delete_contact_mail'])) {
    $delete_id = base64_decode($_GET['delete_contact_mail']);
    $delete_result = $service->deleteService('tbl_contact', $delete_id);
    if ($delete_result) {
        header("Location: contact_mail.php");
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
                                    <li class="breadcrumb-item active" aria-current="page">Contact Mail</li>
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
                  <div class="card-header">Contact Mail 
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
                                    <th><b>Email</b></th>
                                    <?php
                                      }
                                    ?>
                                    <th><b>Subject</b></th>
                                    <th><b>Message</b></th>
                                    <th><b>Action</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                if ($quick_query) {
                                    while ($row = mysqli_fetch_assoc($quick_query)) {
                                    ?>
                                    <tr>
                                        <td><?= $row['fld_datetime']; ?></td>
                                        <td><?= $row['fld_name']; ?></td>
                                        <?php 
                                          if (Session::get('admin_type') == 'Super Admin') {
                                          ?>
                                        <td><?= $row['fld_email']; ?></td>
                                        <?php
                                          }
                                        ?>
                                        
                                        <td><?= $row['fld_subject']; ?></td>
                                        <td><?= $row['fld_message']; ?></td>
                                        <td>
                                          <?php 
                                          if (Session::get('admin_type') == 'Super Admin') {
                                          ?>
                                            <a href="?delete_contact_mail=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash-alt fa-1x"></i>
                                            </a>
                                          <?php
                                          } else {
                                            echo '<span class="text-center">N/A</span>';
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
<?php require_once "inc/footer.php"; ?>