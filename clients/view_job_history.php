<?php require_once "inc/header.php"; ?>
<?php require_once "inc/sidebar.php"; ?>
<?php 
$all_service = $service->singleServiceJob('tbl_register_job', Session::get('user_id'));
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
				<h4 class="page-title">All Job History</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.php">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Job History</li>
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
		<div class="filter">
			<form action="invoice.php" method="post" id="pdfgenerator" target="_blank">
				<div class="row">
				  <div class="col-sm-6 col-lg-3">
				    <label for="startdate" class="form-label">From:</label>
				    <input type="date" class="form-control" id="startdate" name="startdate">
				  </div>
				  <div class="col-sm-6 col-lg-3">
				    <label for="enddate" class="form-label">To:</label>
				    <input type="date" class="form-control" id="enddate" name="enddate">
				  </div>
				  <div class="col-sm-6 col-lg-3">
				    <label for="paymmentst" class="form-label">Payment Status:</label>
				    <select class="form-control" id="paymmentst" name="paymmentst" aria-label="paymmentst">
					  <option value="All" selected>N/A</option>
					  <option value="Paid">Paid</option>
					  <option value="Due">Due</option>
					  <option value="Free">Free</option>
					</select>
				  </div>
				  <div class="col-sm-6 col-lg-3">
				    <label for="searchresult" class="form-label"></label>
				    <br>
				    <input type="button" class="btn btn-info mt-2" id="searchresult" value="Search">
				  </div>
				</div>
			</form>
		</div>
		<br>

		<div class="card">
	        <div class="card-body">
	            <button class="btn btn-primary" tabindex="0" type="button" onclick="createpdf()"><span>Invoice Download(PDF)</span></button>
				<br>
				<br>
	            <div class="table-responsive">
	                <table id="zero_config" class="table table-striped table-bordered">
	                    <thead>
	                        <tr>
	                            <th>Date - Time</th>
	                            <th>Job Title</th>
	                            <th>Main Service</th>
	                            <th>Additional Service</th>
	                            <th>Format</th>
	                            <th>Quantity</th>
	                            <th>Job Status</th>
                                <th>Amount ($ USD)</th>
                                <th>Paypal/TransactionCharge ($ USD)</th>
                                <th>Total Charge</th>
	                            <th>Payment Status</th>
	                        </tr>
	                    </thead>
	                    <tbody id="job_data">
	                        <?php 
	                        if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <tr>
                                    <td><?= $row['fld_datetime']; ?></td>
                                    <td><?= $row['fld_job_title']; ?></td>
                                    <td>
                                    <?php
	                                $main_service = $service->allServices('tbl_main_services');
	                                if ($main_service) {
		                                while ($service_row = mysqli_fetch_assoc($main_service)) {
			                                if ($service_row['id'] == $row['fld_main_service']) {
			                                	echo $service_row['fld_service_name'];
			                                }
		                                }
	                                }
	                                ?>
                                    </td>
                                    <td>
                                    <?php
	                                $add_service = $service->allServices('tbl_additional_services');
	                                if ($add_service) {
		                                while ($service_row = mysqli_fetch_assoc($add_service)) {
			                                if ($service_row['id'] == $row['fld_add_service']) {
			                                	echo $service_row['fld_service_name'];
			                                }
		                                }
	                                }
	                                ?>
                                    </td>
                                    <td><?= $row['fld_format']; ?></td>
                                    <td><?= $row['fld_total_files']; ?></td>
                                    <td><?= $row['fld_payment_type']; ?></td>
                                    <td><?= $row['fld_amount']; ?></td>
                                    <td><?= $row['fld_charge']; ?></td>
                                    <td><?= $row['fld_amount'] + $row['fld_charge']; ?></td>
                                    <td><?= $row['fld_payment_status']; ?></td>
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