<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

$all_users = $user->allUsers();

if (isset($_GET['delete_user'])) {
    $delete_id = base64_decode($_GET['delete_user']);
    $delete_result = $user->deleteUser($delete_id);
    if ($delete_result) {
        header("Location: manage_user.php");
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
                                    <li class="breadcrumb-item active" aria-current="page">Register User</li>
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
                  <div class="card-header">Register User</div>
                  <div class="card-body bg-white text-dark">
                    <div class="table-responsive">
                      <table id="zero_config" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th><b>SL No.</b></th>
                                    <th><b>Full Name</b></th>
                                    <th><b>Country</b></th>
                                    <th><b>Email</b></th>
                                    <th><b>Phone</b></th>
                                    <th><b>Source</b></th>
                                    <th><b>Address</b></th>
                                    <th><b>Action</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                if ($all_users) {
                                  $sl = 1;
                                    while ($row = mysqli_fetch_assoc($all_users)) {
                                    ?>
                                    <tr>
                                        <td><?= $sl; ?></td>
                                        <td><?= $row['fld_fullname']; ?></td>
                                        <td><?= $row['fld_country']; ?> <span class="text-success font-weight-bold"><?= $row['real_country']; ?></span></td>
                                        <td><?= $row['fld_email']; ?></td>
                                        <td><?= $row['fld_phone']; ?></td>
                                        <td><?= $row['fld_source']; ?></td>
                                        <td><?= $row['fld_address']; ?></td>
                                        <td>
                                            <a href="job_by_client.php?user_id=<?= base64_encode($row['id']); ?>" class="btn btn-info btn-sm">
                                                Job List
                                            </a>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#id-<?= $row['id']; ?>">
                                              <i class="fas fa-info-circle fa-1x"></i>
                                            </button>
                                            <a href="?delete_user=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger btn-sm mt-1">
                                                <i class="fas fa-trash-alt fa-1x"></i>
                                            </a>
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

<?php 

$all_users = $user->allUsers();

if ($all_users) {
  while ($user_info = mysqli_fetch_assoc($all_users)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="id-<?= $user_info['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">User ID#<?= $user_info['id']; ?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table table-dark table-striped talbe-hover">
              <tbody>
                <tr>
                  <td>Full Name</td>
                  <td><?= isset($user_info['fld_fullname']) ? $user_info['fld_fullname'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Country</td>
                  <td><?= isset($user_info['fld_country']) ? $user_info['fld_country'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Real Country</td>
                  <td><?= isset($user_info['real_country']) ? $user_info['real_country'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Email</td>
                  <td><?= isset($user_info['fld_email']) ? $user_info['fld_email'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Phone</td>
                  <td><?= isset($user_info['fld_phone']) ? $user_info['fld_phone'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Source</td>
                  <td><?= isset($user_info['fld_source']) ? $user_info['fld_source'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Address</td>
                  <td><?= isset($user_info['fld_address']) ? $user_info['fld_address'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Website</td>
                  <td><?= isset($user_info['fld_website']) ? $user_info['fld_website'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Payment Method</td>
                  <td><?= isset($user_info['fld_payment_method']) ? $user_info['fld_payment_method'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Payment Policy</td>
                  <td><?= isset($user_info['fld_payment_policy']) ? $user_info['fld_payment_policy'] : ''; ?></td>
                </tr>
                <tr>
                  <td>Photo</td>
                  <td>
                    <?php 
                    if (isset($user_info['fld_photo']) && $user_info['fld_photo'] != NULL) {
                    ?>
                    <img src="../uploadFiles/users/<?= $user_info['fld_photo']; ?>" alt="" width="100" height="80">
                    <?php
                    }
                    ?>
                  </td>
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