<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_password'])) {
  $update_result = $user->adminChangePassword($_POST);
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
                                    <li class="breadcrumb-item active" aria-current="page">Setting</li>
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
                    <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
                        <br>
                        <div class="row mb-3">
                          <label for="old_password" class="col-sm-3 col-form-label">Current Password</label>
                          <div class="col-sm-7">
                            <input type="password" class="form-control input_green_border" id="old_password" name="old_password" placeholder="Current Password" required="">
                            <?php 
                            if (isset($_GET['change_password']) && $_GET['change_password'] == 'old') {
                                echo '<div class="alert alert-warning mb-0">Old password does not match!</div>';
                            }
                            ?>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="new_password" class="col-sm-3 col-form-label">New Password</label>
                          <div class="col-sm-7">
                            <input type="password" class="form-control input_green_border" id="new_password" name="new_password" placeholder="New Password" required="">
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="confirm_password" class="col-sm-3 col-form-label">Confirm New Password</label>
                          <div class="col-sm-7">
                            <input type="password" class="form-control input_green_border" id="confirm_password" name="confirm_password" placeholder="Confirm New Password" required="">
                            <?php 
                            if (isset($_GET['change_password']) && $_GET['change_password'] == 'confirm') {
                                echo '<div class="alert alert-warning mb-0">Confirm password does not match!</div>';
                            }
                            if (isset($_GET['change_password']) && $_GET['change_password'] == 'fail') {
                                echo '<div class="alert alert-warning mb-0">Password does not updated!</div>';
                            }
                            ?>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="submit" class="col-sm-3 col-form-label"></label>
                          <div class="col-sm-7">
                            <input type="submit" class="btn btn-info" id="submit" name="change_password" value="Submit">
                          </div>
                        </div>
                    </form>
                  </div>
                </div>
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->

<?php require_once "inc/footer.php"; ?>