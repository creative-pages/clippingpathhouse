<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_file_format'])) {
    $value = $_POST['fld_format'];

  $insert_result = $service->addService('tbl_file_format', 'fld_format', $value);
  if ($insert_result == 'empty') {
      $insert_result = '<div class="alert alert-warning mb-0">Please enter file format!</div>';
  } elseif ($insert_result == 'exist') {
      $insert_result = '<div class="alert alert-warning mb-0">This file format has already exist!</div>';
  } elseif ($insert_result == 'success') {
      $insert_result = '<div class="alert alert-success mb-0">File format added successfully.</div>';
  } elseif ($insert_result == 'failed') {
      $insert_result = '<div class="alert alert-warning mb-0">File format does not added!</div>';
  }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_file_format'])) {
  $value = $_POST['fld_format'];
  $id = $_POST['id'];

  $update_result = $service->updateService('tbl_file_format', 'fld_format', $value, $id);
  if ($update_result == 'empty') {
      $update_result = '<div class="alert alert-warning mb-0">Please enter file format!</div>';
  } elseif ($update_result == 'exist') {
      $update_result = '<div class="alert alert-warning mb-0">This file format has already exist!</div>';
  } elseif ($update_result == 'success') {
      $update_result = '<div class="alert alert-success mb-0">File format added successfully.</div>';
  } elseif ($update_result == 'failed') {
      $update_result = '<div class="alert alert-warning mb-0">File format does not added!</div>';
  }
}

if (isset($_GET['update_file_format'])) {
    $id = base64_decode($_GET['update_file_format']);
    $single_result = $service->singleService('tbl_file_format', $id);
    if ($single_result) {
        $single_results = mysqli_fetch_assoc($single_result);
    }
}

$all_service = $service->allServices('tbl_file_format');

if (isset($_GET['delete_file_format'])) {
    $delete_id = base64_decode($_GET['delete_file_format']);
    $delete_result = $service->deleteService('tbl_file_format', $delete_id);
    if ($delete_result) {
        header("Location: file_format.php");
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
                                    <li class="breadcrumb-item active" aria-current="page">Manage File Formats
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
                  <div class="card-header">Manage File Formats

                    <?= isset($_GET['update_file_format']) ? '<a href="main_services.php" class="btn btn-light btn-sm float-right">Add Service</a>' : ''; ?>
                    <a href="settings.php" class="btn btn-warning btn-sm float-right mr-2">Back To Settings</a>
                  </div>
                  <div class="card-body bg-white text-dark">
                    <?php 
                    if (isset($_GET['update_file_format'])) {
                    ?>
                    <form action="<?= $_SERVER['PHP_SELF']; ?>?update_file_format=<?= $_GET['update_file_format']; ?>" method="POST">
                        <div class="form-row">
                            <div class="col">
                              <div class="form-group">
                                <label for="fld_format">File Format Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_format" name="fld_format" value="<?= isset($single_results['fld_format']) ? $single_results['fld_format'] : ''; ?>" placeholder="Enter file format" required="">
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
                              <input type="submit" class="mt-2 btn bg-cyan text-white" name="update_file_format" value="Udpate">
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
                                <label for="fld_format">File Format Name <code class="text-danger">*</code></label>
                                <input type="text" class="form-control input_green_border" id="fld_format" name="fld_format" placeholder="Enter file format" required="">
                              </div>
                              <?php 
                                if (isset($insert_result)) {
                                    echo $insert_result;
                                }
                              ?>
                            </div>
                            <div class="col">
                              <br>
                              <input type="submit" class="mt-2 btn bg-cyan text-white" name="add_file_format" value="Add">
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
                  <div class="card-header">File Formats List</div>
                  <div class="card-body bg-white text-dark">
                    <table class="table table-dark table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><b>Format Name</b></th>
                                <th><b>Action</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <tr>
                                    <td><?= $row['fld_format']; ?></td>
                                    <td>
                                        <a href="?update_file_format=<?= base64_encode($row['id']); ?>" class="d-inline-block mr-2">
                                            <i class="fas fa-pencil-alt fa-1x"></i>
                                        </a>
                                        <a href="?delete_file_format=<?= base64_encode($row['id']); ?>" onclick="return confirm('Are you sure to delete?');" class="d-inline-block">
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