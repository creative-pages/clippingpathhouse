<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_user'])) {
  $update_result = $user->updateUser($_POST);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_password'])) {
  $update_result = $user->changePassword($_POST);
}


$user_details = $user->userProfile(Session::get('user_id'));

if ($user_details) {
	$user_info = mysqli_fetch_assoc($user_details);
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
				<h4 class="page-title">User Profile</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.php">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Profile</li>
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
		<div class="row">
			<!-- Column -->
			<div class="col-md-6 col-lg-3 col-xlg-3">
				<div class="profile_intro bg-white p-3 rounded">
					<div class="text-center">
						<?php 
						if (isset($user_info['fld_photo']) && $user_info['fld_photo'] != '') {
						?>
						<img src="../uploadFiles/users/<?= $user_info['fld_photo']; ?>" width="150" height="180" class="" alt="User Photo">
						<?php
						} else {
						?>
						<img src="assets/images/users/1.jpg" width="150" height="100" class="rounded-circle" alt="User Photo">
						<?php
						}
						?>
					</div>
					<h3 class="text-center mt-3"><?= isset($user_info['fld_fullname']) ? $user_info['fld_fullname'] : ''; ?></h3>
					<hr>
					<p class="px-3 mb-2"><b>Email:</b> <?= isset($user_info['fld_email']) ? $user_info['fld_email'] : ''; ?></p>
					<p class="px-3 mb-2"><b>Phone:</b> <?= isset($user_info['fld_phone']) ? $user_info['fld_phone'] : ''; ?></p>
					<p class="px-3 mb-2"><b>Address:</b> <?= isset($user_info['fld_address']) ? $user_info['fld_address'] : ''; ?></p>
				</div>
			</div>
			<!-- Column -->
			<div class="col-md-6 col-lg-9 col-xlg-9">
				<div class="bg-white p-3">
					<nav>
			        <div class="nav nav-tabs" id="nav-tab" role="tablist">
			          <a class="nav-item nav-link <?= isset($_GET['change_password']) ? '' : 'active'; ?>" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="<?= isset($_GET['change_password']) ? 'false' : 'true'; ?>">Update Profile</a>
			          <a class="nav-item nav-link <?= isset($_GET['change_password']) ? 'active' : ''; ?>" id="nav-change_password-tab" data-toggle="tab" href="#nav-change_password" role="tab" aria-controls="nav-change_password" aria-selected="<?= isset($_GET['change_password']) ? 'true' : 'false'; ?>">Change Password</a>
			        </div>
			    </nav>
				<div class="tab-content" id="nav-tabContent">
		          <div class="tab-pane fade <?= isset($_GET['change_password']) ? '' : 'active show'; ?>" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	                <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
		          		<br>
		            	<div class="row mb-3">
						  <label for="fld_fullname" class="col-sm-3 col-form-label">Name</label>
						  <div class="col-sm-7">
						    <input type="text" class="form-control input_green_border text-dark font-weight-bold" id="fld_fullname" name="fld_fullname" value="<?= isset($user_info['fld_fullname']) ? $user_info['fld_fullname'] : ''; ?>" placeholder="Enter Name*" required="">
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="fld_phone" class="col-sm-3 col-form-label">Phone</label>
						  <div class="col-sm-7">
						    <input type="text" class="form-control input_green_border text-dark font-weight-bold" id="fld_phone" name="fld_phone" value="<?= isset($user_info['fld_phone']) ? $user_info['fld_phone'] : ''; ?>" placeholder="Enter Phone">
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="fld_address" class="col-sm-3 col-form-label">Address</label>
						  <div class="col-sm-7">
						    <input type="text" class="form-control input_green_border text-dark font-weight-bold" id="fld_address" name="fld_address" value="<?= isset($user_info['fld_address']) ? $user_info['fld_address'] : ''; ?>" placeholder="Enter Address">
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="fld_website" class="col-sm-3 col-form-label">Web</label>
						  <div class="col-sm-7">
						    <input type="text" class="form-control input_green_border text-dark font-weight-bold" id="fld_website" name="fld_website" value="<?= isset($user_info['fld_website']) ? $user_info['fld_website'] : ''; ?>" placeholder="Enter Web">
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="fld_payment_method" class="col-sm-3 col-form-label">Select Payment Method</label>
						  <div class="col-sm-7">
						    <select class="form-control input_green_border" id="fld_payment_method" name="fld_payment_method">
						        <option value="">Select Payment Method</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_method']) && $user_info['fld_payment_method'] == 'Payoneer Direct Money Transfer') {
						                echo 'selected';
						            }
						        ?> value="Payoneer Direct Money Transfer">Payoneer Direct Money Transfer</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_method']) && $user_info['fld_payment_method'] == 'International Bank Transfer') {
						                echo 'selected';
						            }
						        ?> value="International Bank Transfer">International Bank Transfer</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_method']) && $user_info['fld_payment_method'] == 'My Country Local Bank Transfer (Only for Company)') {
						                echo 'selected';
						            }
						        ?> value="My Country Local Bank Transfer (Only for Company)">My Country Local Bank Transfer (Only for Company)</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_method']) && $user_info['fld_payment_method'] == 'Cradit Card Request Transfer') {
						                echo 'selected';
						            }
						        ?> value="Cradit Card Request Transfer">Cradit Card Request Transfer</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_method']) && $user_info['fld_payment_method'] == 'PayPal Transfer (2.5% Transfer charge will be ad)') {
						                echo 'selected';
						            }
						        ?> value="PayPal Transfer (2.5% Transfer charge will be ad)">PayPal Transfer (2.5% Transfer charge will be ad)</option>
						    </select>
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="fld_payment_policy" class="col-sm-3 col-form-label">Payment Policy</label>
						  <div class="col-sm-7">
						    <select class="form-control input_green_border" id="fld_payment_policy" name="fld_payment_policy">
						        <option value="">Select Payment Policy</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_policy']) && $user_info['fld_payment_policy'] == 'Project wise') {
						                echo 'selected';
						            }
						        ?> value="Project wise">Project wise</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_policy']) && $user_info['fld_payment_policy'] == 'Weekly') {
						                echo 'selected';
						            }
						        ?> value="Weekly">Weekly</option>
						        <option <?php 
						            if (isset($user_info['fld_payment_policy']) && $user_info['fld_payment_policy'] == 'Monthly') {
						                echo 'selected';
						            }
						        ?> value="Monthly">Monthly</option>
						    </select>
						  </div>
						</div>
		            	<div class="row mb-3">
						  <label for="profile_picture" class="col-sm-3 col-form-label">Upload Picture</label>
						  <div class="col-sm-7">
						    <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imgInp" name="image">
                                <label class="custom-file-label" for="imgInp">Choose file...</label>
                                <div class="invalid-feedback">Example invalid custom file feedback</div>
                            </div>
                            <img id="blah" src="assets/images/users/1.jpg" style="width: 120px; border-radius: 50%; height: 120px; margin-top: 16px;" >
						  </div>
						  <input type="hidden" id="old_file" name="old_file" value="<?= isset($user_info['fld_photo']) ? $user_info['fld_photo'] : ''; ?>" placeholder="Name">
						</div>

		            	<div class="row mb-3">
						  <label for="" class="col-sm-3 col-form-label"></label>
						  <div class="col-sm-7">
						    <input type="submit" class="btn btn-info" id="" name="update_user" value="Update">
						  </div>
						</div>
		            </form>
		            <?= isset($update_result) ? $update_result : ''; ?>
		          </div>
		          <div class="tab-pane fade <?= isset($_GET['change_password']) ? 'active show' : ''; ?>" id="nav-change_password" role="tabpanel" aria-labelledby="nav-change_password-tab">
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
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<?php require_once "inc/footer.php"; ?>