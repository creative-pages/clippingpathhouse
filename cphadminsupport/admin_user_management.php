<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_admin_user'])) {
  $fld_fullname = $_POST['fld_fullname'];
  $fld_username = $_POST['fld_username'];
  $fld_user_type = $_POST['fld_user_type'];

  $insert_result = $user->createAdministrator($_POST);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_admin_user'])) {
  $update_result = $user->updateAdministrator($_POST);
}

if (isset($_GET['update_admin_user'])) {
    $id = base64_decode($_GET['update_admin_user']);
    $single_result = $service->singleService('tbl_admin_user', $id);
    if ($single_result) {
        $single_results = mysqli_fetch_assoc($single_result);
    }
}

$all_service = $service->allServices('tbl_admin_user');

if (isset($_GET['delete_admin_user'])) {
    $delete_id = base64_decode($_GET['delete_admin_user']);
    $delete_result = $service->deleteService('tbl_admin_user', $delete_id);
    if ($delete_result) {
        header("Location: admin_user_management.php");
    }
}
if (isset($_GET['reset_admin_password'])) {
    $reset_id = base64_decode($_GET['reset_admin_password']);
    $reset_password = $user->resetAdminPassword($reset_id);
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
                                    <li class="breadcrumb-item active" aria-current="page">Manage Admin Users
</li>
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
                  <div class="card-header">Manage Admin Users

                    <?= isset($_GET['update_admin_user']) ? '<a href="main_services.php" class="btn btn-light btn-sm float-right">Add Service</a>' : ''; ?>
                    <a href="settings.php" class="btn btn-warning btn-sm float-right mr-2">Back To Settings</a>
                  </div>
                  <div class="card-body bg-white text-dark">
                    <?php 
                    if (isset($reset_password)) {
                        echo $reset_password;
                    }
                  ?>
                  <br>
                    <?php 
                    if (isset($_GET['update_admin_user'])) {
                    ?>
                    <div class="container">
                      <div class="row">
                        <div class="col-md-6 offset-md-3">
                          <form action="<?= $_SERVER['PHP_SELF']; ?>?update_admin_user=<?= $_GET['update_admin_user']; ?>" method="POST">
                            <input type="hidden" value="<?= isset($single_results['id']) ? $single_results['id'] : ''; ?>" name="id">
                            <div class="form-group">
                              <label for="fld_fullname">Full Name <code class="text-danger">*</code></label>
                              <input type="text" class="form-control input_green_border" id="fld_fullname" name="fld_fullname" value="<?= isset($single_results['fld_fullname']) ? $single_results['fld_fullname'] : ''; ?>" placeholder="Enter full name" required="">
                            </div>
                            <div class="form-group">
                              <label for="fld_username">User Name <code class="text-danger">*</code></label>
                              <input type="text" class="form-control input_green_border" id="fld_username" name="fld_username" value="<?= isset($single_results['fld_username']) ? $single_results['fld_username'] : ''; ?>" placeholder="Enter username" required="">
                              <?= isset($user->username) ? $user->username : ''; ?>
                            </div>
                            <div class="form-group">
                              <label for="fld_user_type">User Type  <code class="text-danger">*</code></label>
                              <select name="fld_user_type" id="fld_user_type" class="form-control input_green_border" required="">
                                <option value="" selected="">User Type </option>
                                <option <?php 
                                if (isset($single_results['fld_user_type']) && $single_results['fld_user_type'] = 'Super Admin') {
                                  echo 'selected';
                                }
                                ?> value="Super Admin">Super Admin</option>
                                <option <?php 
                                if (isset($single_results['fld_user_type']) && $single_results['fld_user_type'] = 'General') {
                                  echo 'selected';
                                }
                                ?> value="General">General</option>
                              </select>
                            </div>
                            <?php 
                              if (isset($update_result)) {
                                  echo $update_result;
                              }
                            ?>

                            <input type="submit" class="mt-2 btn bg-cyan text-white" name="update_admin_user" value="Udpate">
                          </form>
                        </div>
                      </div>
                    </div>
                    <?php
                    } else {
                    ?>
                    <div class="container">
                      <div class="row">
                        <div class="col-md-6 offset-md-3">
                          <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
                              <div class="form-group">
                                <label for="fld_fullname">Full Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_fullname" name="fld_fullname" value="<?= isset($fld_fullname) ? $fld_fullname : ''; ?>" placeholder="Enter full name" required="">
                              </div>
                              <div class="form-group">
                                <label for="fld_username">User Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_username" name="fld_username" value="<?= isset($fld_username) ? $fld_username : ''; ?>" placeholder="Enter username" required="">
                                <?= isset($user->username) ? $user->username : ''; ?>
                              </div>
                              <div class="form-group">
                                <label for="fld_password">Password <code class="text-danger">*</code></label>
                                <input type="password" class="form-control input_green_border" id="fld_password" name="fld_password" placeholder="Enter password" required="">
                              </div>
                              <div class="form-group">
                                <label for="confirm_password">Confirm Password <code class="text-danger">*</code></label>
                                <input type="password" class="form-control input_green_border" id="confirm_password" name="confirm_password" placeholder="Enter confirm password" required="">
                                <?= isset($user->password) ? $user->password : ''; ?>
                              </div>
                              <div class="form-group">
                                <label for="fld_user_type">User Type  <code class="text-danger">*</code></label>
                                <select name="fld_user_type" id="fld_user_type" class="form-control input_green_border" required="">
                                  <option value="" selected="">User Type </option>
                                  <option <?php 
                                  if (isset($fld_user_type) && $fld_user_type = 'Super Admin') {
                                    echo 'selected';
                                  }
                                  ?> value="Super Admin">Super Admin</option>
                                  <option <?php 
                                  if (isset($fld_user_type) && $fld_user_type = 'General') {
                                    echo 'selected';
                                  }
                                  ?> value="General">General</option>
                                </select>
                              </div>
                              <?php 
                                if (isset($insert_result)) {
                                    echo $insert_result;
                                }
                              ?>

                              <input type="submit" class="mt-2 btn bg-cyan text-white" name="add_admin_user" value="Create User">
                          </form>
                        </div>
                      </div>
                    </div>
                    <?php
                    }
                    ?>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <div class="card text-white bg-cyan mb-3 rounded_shadow">
                  <div class="card-header">Admin Users List</div>
                  <div class="card-body bg-white text-dark">
                    <table class="table table-dark table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><b>User ID</b></th>
                                <th><b>Full Name</b></th>
                                <th><b>User Name</b></th>
                                <th><b>User Type</b></th>
                                <th><b>Action</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            if ($all_service) {
                                $sl = 1;
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <tr>
                                    <td><?= $sl; ?></td>
                                    <td><?= $row['fld_fullname']; ?></td>
                                    <td><?= $row['fld_username']; ?></td>
                                    <td><?= $row['fld_user_type']; ?></td>
                                    <td>
                                        <a href="?update_admin_user=<?= base64_encode($row['id']); ?>" class="d-inline-block mr-2">
                                            <i class="fas fa-pencil-alt fa-1x"></i>
                                        </a>
                                        <a href="?reset_admin_password=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to reset password?');" class="d-inline-block mr-2">
                                            <i class="far fa-window-restore fa-1x"></i>
                                        </a>
                                        <a href="?delete_admin_user=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="d-inline-block">
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
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
<?php require_once "inc/footer.php"; ?>