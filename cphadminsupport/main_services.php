<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_service'])) {
    $value = $_POST['fld_service_name'];

  $insert_result = $service->addService('tbl_main_services', 'fld_service_name', $value);
  if ($insert_result == 'empty') {
      $insert_result = '<div class="alert alert-warning mb-0">Please enter service name!</div>';
  } elseif ($insert_result == 'exist') {
      $insert_result = '<div class="alert alert-warning mb-0">This service has already exist!</div>';
  } elseif ($insert_result == 'success') {
      $insert_result = '<div class="alert alert-success mb-0">Service added successfully.</div>';
  } elseif ($insert_result == 'failed') {
      $insert_result = '<div class="alert alert-warning mb-0">Service does not added!</div>';
  }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_service'])) {
  $value = $_POST['fld_service_name'];
  $id = $_POST['id'];

  $update_result = $service->updateService('tbl_main_services', 'fld_service_name', $value, $id);
  if ($update_result == 'empty') {
      $update_result = '<div class="alert alert-warning mb-0">Please enter service name!</div>';
  } elseif ($update_result == 'exist') {
      $update_result = '<div class="alert alert-warning mb-0">This service has already exist!</div>';
  } elseif ($update_result == 'success') {
      $update_result = '<div class="alert alert-success mb-0">Service added successfully.</div>';
  } elseif ($update_result == 'failed') {
      $update_result = '<div class="alert alert-warning mb-0">Service does not added!</div>';
  }
}

if (isset($_GET['update_service'])) {
    $id = base64_decode($_GET['update_service']);
    $single_result = $service->singleService('tbl_main_services', $id);
    if ($single_result) {
        $single_results = mysqli_fetch_assoc($single_result);
    }
}

$all_service = $service->allServices('tbl_main_services');

if (isset($_GET['delete_service'])) {
    $delete_id = base64_decode($_GET['delete_service']);
    $delete_result = $service->deleteService('tbl_main_services', $delete_id);
    if ($delete_result) {
        header("Location: main_services.php");
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
                  <div class="card-header">Settings
                    <?= isset($_GET['update_service']) ? '<a href="main_services.php" class="btn btn-light btn-sm float-right">Add Service</a>' : ''; ?>
                    <a href="settings.php" class="btn btn-warning btn-sm float-right mr-2">Back To Settings</a>
                  </div>
                  <div class="card-body bg-white text-dark">
                    <?php 
                    if (isset($_GET['update_service'])) {
                    ?>
                    <form action="<?= $_SERVER['PHP_SELF']; ?>?update_service=<?= $_GET['update_service']; ?>" method="POST">
                        <div class="form-row">
                            <div class="col">
                              <div class="form-group">
                                <label for="fld_service_name">Service Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_service_name" name="fld_service_name" value="<?= isset($single_results['fld_service_name']) ? $single_results['fld_service_name'] : ''; ?>" placeholder="Enter service name" required="">
                                <input type="hidden" value="<?= isset($single_results['id']) ? $single_results['id'] : ''; ?>" name="id">
                              </div>
                              <?php 
                                if (isset($update_result)) {
                                    echo $update_result;
                                }
                              ?>
                            </div>
                            <div class="col">
                              <br>
                              <input type="submit" class="mt-2 btn bg-cyan text-white" name="update_service" value="Udpate">
                            </div>
                        </div>
                    </form>
                    <?php
                    } else {
                    ?>
                    <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
                        <div class="form-row">
                            <div class="col">
                              <div class="form-group">
                                <label for="fld_service_name">Service Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_service_name" name="fld_service_name" placeholder="Enter service name" required="">
                              </div>
                              <?php 
                                if (isset($insert_result)) {
                                    echo $insert_result;
                                }
                              ?>
                            </div>
                            <div class="col">
                              <br>
                              <input type="submit" class="mt-2 btn bg-cyan text-white" name="add_service" value="Add">
                            </div>
                        </div>
                    </form>
                    <?php
                    }
                    ?>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <div class="card text-white bg-cyan mb-3 rounded_shadow">
                  <div class="card-header">Main Services List</div>
                  <div class="card-body bg-white text-dark">
                    <table class="table table-dark table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><b>Service Name</b></th>
                                <th><b>Action</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <tr>
                                    <td><?= $row['fld_service_name']; ?></td>
                                    <td>
                                        <a href="?update_service=<?= base64_encode($row['id']); ?>" class="d-inline-block mr-2">
                                            <i class="fas fa-pencil-alt fa-1x"></i>
                                        </a>
                                        <a href="?delete_service=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="d-inline-block">
                                            <i class="fas fa-trash-alt fa-1x"></i>
                                        </a>
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
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
<?php require_once "inc/footer.php"; ?>