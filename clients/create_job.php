<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 
$user_details = $user->userProfile(Session::get('user_id'));
if ($user_details) {
    $user_info = mysqli_fetch_assoc($user_details);
}
$user_id=$user_info['id'];
$name = "";
$date = "";
$job_title = "";
     if(isset($_POST['txt_job_title'])){
        $job_title =$_POST['txt_job_title'];
        }
        
    $name = $user_info['fld_fullname'];
    $date = (gmstrftime("%d_%m_%Y_%H.%M.%S"));
    $historia = "{$date}_{$name}";
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
                <h4 class="page-title">Job Sumbition Form</h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Create Job</li>
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
        <!-- Sales Cards  -->
        <!-- ============================================================== -->
        <form id="uploadForm" class="bg-white p-3" action="../upload_plugin/upload.php" method="POST" enctype="multipart/form-data" name="job_submit_form">
            <input type="hidden" name="txt_check" value="1">
            <input type="hidden" name="txt_file_dir" id="txt_file_dir" value="<?php echo $historia;?>">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txt_name">Job Title <code>*</code></label>
                        <input type="text" class="form-control input_green_border" name="txt_job_title" id="txt_name" placeholder="Enter job title" required="">
                    </div>
                    <div class="form-group is-empty">
                        <label>Service <code>*</code></label>
                        <select id="service" name="cmb_service" class="form-control select2 select2-hidden-accessible input_green_border" style="width: 100%;" required="" tabindex="-1" aria-hidden="true">
                            <option value="" selected="">Select</option>
                            <?php
                                $all_service = $service->allServices('tbl_main_services');
                                if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <option value="<?= isset($row['id']) ? $row['id'] : ''; ?>"><?= isset($row['fld_service_name']) ? $row['fld_service_name'] : ''; ?></option>
                                <?php
                                }
                                }
                                ?>
                        </select>
                        </div>
                        <!-- /.form-group -->
                        <div class="form-group is-empty">
                            <label>Additional Service</label>
                            <select id="additionalservice" name="cmb_add_service" class="form-control select2 select2-hidden-accessible input_green_border" style="width: 100%;" tabindex="-1" aria-hidden="true">
                                <option value="" selected="">Select</option><?php
                                $all_service = $service->allServices('tbl_additional_services');
                                if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <option value="<?= isset($row['id']) ? $row['id'] : ''; ?>"><?= isset($row['fld_service_name']) ? $row['fld_service_name'] : ''; ?></option>
                                <?php
                                }
                                }
                                ?>
                            </select>
                            </div>
                            <div class="form-group is-empty">
                                <label>Format return file as <code>*</code></label>
                                <select id="fileformate" name="cmb_file_format" onchange="show_control('cmb_file_format', 'tr_offormat', 'tr_br_offormat')" class="form-control select2 select2-hidden-accessible input_green_border" style="width: 100%;" required="" tabindex="-1" aria-hidden="true">
                                    <option value="" selected="">Select</option>
                                    <?php
                                    $all_service = $service->allServices('tbl_file_format');
                                    if ($all_service) {
                                    while ($row = mysqli_fetch_assoc($all_service)) {
                                    ?>
                                    <option value="<?= isset($row['fld_format']) ? $row['fld_format'] : ''; ?>"><?= isset($row['fld_format']) ? $row['fld_format'] : ''; ?></option>
                                    <?php
                                    }
                                    }
                                    ?>
                                    </select>
                                </div>
                                <div class="form-group is-empty" id="tr_offormat" style="display:none;">
                                    <input type="text" name="txt_file_format" class="form-control input_green_border" placeholder="Other File Format">
                                </div>
                                <div id="tr_br_offormat" style="display:none;">&nbsp;</div>
                                <div class="form-group is-empty">
                                    <label>Delivery Time <code>*</code></label>
                                    <select id="delivarytime" name="cmb_delivery_time" onchange="show_control('cmb_delivery_time', 'tr_other_d_time', 'tr_br_other_d_time')" class="form-control select2 select2-hidden-accessible input_green_border" style="width: 100%;" required="" tabindex="-1" aria-hidden="true">
                                        <option value="" selected="">Select</option>
                                            <?php
                                            $all_service = $service->allServices('tbl_delivery_time');
                                            if ($all_service) {
                                            while ($row = mysqli_fetch_assoc($all_service)) {
                                            ?>
                                            <option value="<?= isset($row['fld_delivery_time']) ? $row['fld_delivery_time'] : ''; ?>"><?= isset($row['fld_delivery_time']) ? $row['fld_delivery_time'] : ''; ?></option>
                                            <?php
                                            }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group is-empty" id="tr_other_d_time" style="display:none;">
                                        <input type="text" name="txt_delivery_time" class="form-control input_green_border" placeholder="Delivery Time">
                                    </div>
                                    <div id="tr_br_other_d_time" style="display:none;">&nbsp;</div>
                                    <div class="form-group is-empty">
                                        <label>Instruction</label>
                                        <textarea class="form-control input_green_border" name="txt_job_instruction" id="txt_job_instruction" rows="3" placeholder="Enter job instruction"></textarea>
                                    </div>
                                    
                                    <!-- /.form-group -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-6" style="padding-top:100px;">
                                    <p class="lead font-weight-bold" style="color: #f15f3c;">Submit your job by 5 easy steps...!!!</p>
                                    <p class="text-info" style="font-size: 16px;">1. Fill up required data</p>
                                    <p class="text-info" style="font-size: 16px;">2. +Add Files from your pc.</p>
                                    <p class="text-info" style="font-size: 16px;">3. Press Start Upload button.</p>
                                    <p class="text-info">Do not refresh or cut the page when see <span class="text-danger" style="color: red!important;">"Please Wait Until Process is complete"</span></p>
                                    <p class="text-info">After complete upload your files, You will see the "Submit" button, wait 30 sec after seeing that.</p>
                                    <p class="text-info" style="font-size: 16px;">4. Press "<span class="text-success">Submit Job</span>" button</p>
                                    <p class="text-success" style="font-size: 16px;">5. Press OK</p>
                                    <h4 class="box-title text-success">Conditions:</h4>
                                    <h4 class="text-cyan" style="margin-bottom:0px;">1. Maximum File Upload 150 pcs at one order</h4><br>
                                    <h4 class="text-cyan" style="margin-bottom:0px;">2. Image maximum size 300 MB each</h4><br>
                                    <h4 class="text-cyan">3. Total image maximum size 2 GB at onece order</h4><br>
                                    <p class="text-cyan">If your order is maximum more than our panel transfer limitation,<br>kindly email us for secure FTP access log-in details.<br>Email ID: info@clippingpathhouse.com,<br>You may also send your images via Dropbox / Wetransfer to use same email ID.</p>
                                </div>
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="row fileupload-buttonbar">
                                            <div class="col-md-4">
                                                <!-- The fileinput-button span is used to style the file input field as button -->
                                                <span class="btn bg-navy btn-raised fileinput-button" id="upload_section" style="pointer-events: cursor;">
                                                    <i class="glyphicon glyphicon-plus"></i>
                                                    <span>Add files...</span>
                                                    <input id="userImage" onclick="if(document.getElementsByName('txt_job_title')[0].value == ''){alert('Fill up required data first'); return false;}" type="file" name="userImage[]" multiple="" accept="">
                                                </span>
                                                <input type="hidden" id="numberoffile" >
                                                <button type="reset" style="display:none;" class="btn btn-warning cancel">
                                                <i class="glyphicon glyphicon-ban-circle"></i>
                                                <span>Reload Panel</span>
                                                </button>
                                                <input type="button" id="btn_job_submit" name="btn_job_submit" value="Submit Job" onclick="job_submit()" style="background:#4DAE4D;font-size:15px;border:1px solid green;border-radius:5px;color:white;width:120px;height:35px;box-shadow: 3px 3px 5px #888888;margin:-2px 0 0 0px;display: none;">
                                                <!-- The global file processing state -->
                                            </div>
                                            <div class="col-md-8">
                                                <button type="submit" class="btn btn-info btn-raised start" id="btnSubmit">
                                                <i class="glyphicon glyphicon-upload"></i>
                                                <span>Start upload</span>
                                                </button>
                                            </div>
                                            <div class="col-12">
                                                <br>
                                                <span class="fileupload-process" id="onprogr" style="padding-left: 20px;color: #ff0000; font-weight: bold; display:none;">Please Wait Until Process is complete....</span>
                                                <span class="fileupload-process" id="onprogr2" style="padding-left: 20px;color: #469c10; font-weight: bold; display:none;">Upload is Completed. Please enter Submit Job button.</span>
                                            </div>
                                            <!-- The global progress state -->
                                        </div>
                                    </div>
                                    <div id="progress-div"><div id="progress-bar"></div></div>
                                    <div id="targetLayer"></div>
                                </div>
                            </div>
                        </form>
                        <!-- ============================================================== -->
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
<?php require_once "inc/footer.php"; ?>