<?php require_once "inc/header.php"; ?>
<section>
    <div class="container">
        <h2 class="mt-4 text-muted">Request Free Quote</h2>
            <p class="pb-3">
                <strong class="main_color fs_20">Send us your free quote request today.</strong>
                <br>
              <span class="font-weight-normal">We ensure you 30 mins turnaround time for inform a cheap price quote for your order. We never use client's image for personal or business purpose.
            </p>
        </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 mb-4">
                <form id="uploadForm" action="upload_plugin/upload_free.php" method="POST" enctype="multipart/form-data" name="free_trial_form">
                    <!-- from cph -->
                    <input type="hidden" name="txt_check">
                    <input type="hidden" name="freetrial" value="2">
                    <input type="hidden" name="txt_file_dir">
                    <!-- from cph -->
                    <div class="form-group row">
                        <label for="fld_name" class="col-sm-4 col-form-label">Name <code class="text-danger">*</code></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="fld_name" name="fld_name" placeholder="Enter Name" required="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_email" class="col-sm-4 col-form-label">Email <code class="text-danger">*</code></label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="fld_email" name="fld_email" value="<?= isset($_GET['email']) ? $_GET['email'] : ''; ?>" placeholder="Enter Email" required="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_company" class="col-sm-4 col-form-label">Company</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="fld_company" name="fld_company" placeholder="Enter Company">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_website" class="col-sm-4 col-form-label">Website</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="fld_website" name="fld_website" placeholder="Enter Website">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_country" class="col-sm-4 col-form-label">Country <code class="text-danger">*</code></label>
                        <div class="col-sm-8">
                            <select class="form-control" name="fld_country" id="fld_country" required="">
                                <option value="" selected>Select</option>
                                <option>Afghanistan</option>
                                <option>Aland Islands</option>
                                <option>Albania</option>
                                <option>Algeria</option>
                                <option>American Samoa</option>
                                <option>Andorra</option>
                                <option>Angola</option>
                                <option>Anguilla</option>
                                <option>Antarctica</option>
                                <option>Antigua And Barbuda</option>
                                <option>Argentina</option>
                                <option>Armenia</option>
                                <option>Aruba</option>
                                <option>Australia</option>
                                <option>Austria</option>
                                <option>Azerbaijan</option>
                                <option>Bahamas</option>
                                <option>Bahrain</option>
                                <option>Bangladesh</option>
                                <option>Barbados</option>
                                <option>Belarus</option>
                                <option>Belgium</option>
                                <option>Belize</option>
                                <option>Benin</option>
                                <option>Bermuda</option>
                                <option>Bhutan</option>
                                <option>Bolivia</option>
                                <option>Bosnia And Herzegovina</option>
                                <option>Botswana</option>
                                <option>Bouvet Island</option>
                                <option>Brazil</option>
                                <option>British Indian Ocean Territory</option>
                                <option>Brunei Darussalam</option>
                                <option>Bulgaria</option>
                                <option>Burkina Faso</option>
                                <option>Burundi</option>
                                <option>Cambodia</option>
                                <option>Cameroon</option>
                                <option>Canada</option>
                                <option>Cape Verde</option>
                                <option>Cayman Islands</option>
                                <option>Central African Republic</option>
                                <option>Chad</option>
                                <option>Chile</option>
                                <option>China</option>
                                <option>Christmas Island</option>
                                <option>Cocos (keeling) Islands</option>
                                <option>Colombia</option>
                                <option>Comoros</option>
                                <option>Congo</option>
                                <option>Congo, Democratic Republic</option>
                                <option>Cook Islands</option>
                                <option>Costa Rica</option>
                                <option>Cote D'ivoire</option>
                                <option>Croatia</option>
                                <option>Cuba</option>
                                <option>Cyprus</option>
                                <option>Czech Republic</option>
                                <option>Denmark</option>
                                <option>Djibouti</option>
                                <option>Dominica</option>
                                <option>Dominican Republic</option>
                                <option>Ecuador</option>
                                <option>Egypt</option>
                                <option>El Salvador</option>
                                <option>Equatorial Guinea</option>
                                <option>Eritrea</option>
                                <option>Estonia</option>
                                <option>Ethiopia</option>
                                <option>Falkland Islands (malvinas)</option>
                                <option>Faroe Islands</option>
                                <option>Fiji</option>
                                <option>Finland</option>
                                <option>France</option>
                                <option>French Guiana</option>
                                <option>French Polynesia</option>
                                <option>French Southern Territories</option>
                                <option>Gabon</option>
                                <option>Gambia</option>
                                <option>Georgia</option>
                                <option>Germany</option>
                                <option>Ghana</option>
                                <option>Gibraltar</option>
                                <option>Greece</option>
                                <option>Greenland</option>
                                <option>Grenada</option>
                                <option>Guadeloupe</option>
                                <option>Guam</option>
                                <option>Guatemala</option>
                                <option>Guinea</option>
                                <option>Guinea-bissau</option>
                                <option>Guyana</option>
                                <option>Haiti</option>
                                <option>Heard Island/mcdonald Islands</option>
                                <option>Holy See (vatican City State)</option>
                                <option>Honduras</option>
                                <option>Hong Kong</option>
                                <option>Hungary</option>
                                <option>Iceland</option>
                                <option>India</option>
                                <option>Indonesia</option>
                                <option>Iran</option>
                                <option>Iraq</option>
                                <option>Ireland</option>
                                <option>Israel</option>
                                <option>Italy</option>
                                <option>Jamaica</option>
                                <option>Japan</option>
                                <option>Jordan</option>
                                <option>Kazakhstan</option>
                                <option>Kenya</option>
                                <option>Kiribati</option>
                                <option>Korea, Democratic Republic</option>
                                <option>Korea, Republic Of</option>
                                <option>Kuwait</option>
                                <option>Kyrgyzstan</option>
                                <option>Lao Democratic Republic</option>
                                <option>Latvia</option>
                                <option>Lebanon</option>
                                <option>Lesotho</option>
                                <option>Liberia</option>
                                <option>Libyan Arab Jamahiriya</option>
                                <option>Liechtenstein</option>
                                <option>Lithuania</option>
                                <option>Luxembourg</option>
                                <option>Macao</option>
                                <option>Macedonia</option>
                                <option>Madagascar</option>
                                <option>Malawi</option>
                                <option>Malaysia</option>
                                <option>Maldives</option>
                                <option>Mali</option>
                                <option>Malta</option>
                                <option>Marshall Islands</option>
                                <option>Martinique</option>
                                <option>Mauritania</option>
                                <option>Mauritius</option>
                                <option>Mayotte</option>
                                <option>Mexico</option>
                                <option>Micronesia</option>
                                <option>Moldova</option>
                                <option>Monaco</option>
                                <option>Mongolia</option>
                                <option>Montserrat</option>
                                <option>Morocco</option>
                                <option>Mozambique</option>
                                <option>Myanmar</option>
                                <option>Namibia</option>
                                <option>Nauru</option>
                                <option>Nepal</option>
                                <option>Netherlands</option>
                                <option>Netherlands Antilles</option>
                                <option>New Caledonia</option>
                                <option>New Zealand</option>
                                <option>Nicaragua</option>
                                <option>Niger</option>
                                <option>Nigeria</option>
                                <option>Niue</option>
                                <option>Norfolk Island</option>
                                <option>Northern Mariana Islands</option>
                                <option>Norway</option>
                                <option>Oman</option>
                                <option>Pakistan</option>
                                <option>Palau</option>
                                <option>Palestinian Territory</option>
                                <option>Panama</option>
                                <option>Papua New Guinea</option>
                                <option>Paraguay</option>
                                <option>Peru</option>
                                <option>Philippines</option>
                                <option>Pitcairn</option>
                                <option>Poland</option>
                                <option>Portugal</option>
                                <option>Puerto Rico</option>
                                <option>Qatar</option>
                                <option>Reunion</option>
                                <option>Romania</option>
                                <option>Russian Federation</option>
                                <option>Rwanda</option>
                                <option>Saint Helena</option>
                                <option>Saint Kitts And Nevis</option>
                                <option>Saint Lucia</option>
                                <option>Saint Pierre And Miquelon</option>
                                <option>Samoa</option>
                                <option>San Marino</option>
                                <option>Sao Tome And Principe</option>
                                <option>Saudi Arabia</option>
                                <option>Senegal</option>
                                <option>Serbia And Montenegro</option>
                                <option>Seychelles</option>
                                <option>Sierra Leone</option>
                                <option>Singapore</option>
                                <option>Slovakia</option>
                                <option>Slovenia</option>
                                <option>Solomon Islands</option>
                                <option>Somalia</option>
                                <option>South Africa</option>
                                <option>South Georgia/sandwich Isles</option>
                                <option>Spain</option>
                                <option>Sri Lanka</option>
                                <option>St Vincent &amp; The Grenadines</option>
                                <option>Sudan</option>
                                <option>Suriname</option>
                                <option>Svalbard And Jan Mayen</option>
                                <option>Swaziland</option>
                                <option>Sweden</option>
                                <option>Switzerland</option>
                                <option>Syrian Arab Republic</option>
                                <option>Taiwan</option>
                                <option>Tajikistan</option>
                                <option>Tanzania</option>
                                <option>Thailand</option>
                                <option>Timor-leste</option>
                                <option>Togo</option>
                                <option>Tokelau</option>
                                <option>Tonga</option>
                                <option>Trinidad And Tobago</option>
                                <option>Tunisia</option>
                                <option>Turkey</option>
                                <option>Turkmenistan</option>
                                <option>Turks And Caicos Islands</option>
                                <option>Tuvalu</option>
                                <option>Uganda</option>
                                <option>Ukraine</option>
                                <option>United Arab Emirates</option>
                                <option>United Kingdom</option>
                                <option>United States</option>
                                <option>Uruguay</option>
                                <option>Us Minor Outlying Islands</option>
                                <option>Uzbekistan</option>
                                <option>Vanuatu</option>
                                <option>Venezuela</option>
                                <option>Viet Nam</option>
                                <option>Virgin Islands, British</option>
                                <option>Virgin Islands, U.s.</option>
                                <option>Wallis And Futuna</option>
                                <option>Western Sahara</option>
                                <option>Yemen</option>
                                <option>Zambia</option>
                                <option>Zimbabwe</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_main_service" class="col-sm-4 col-form-label">Main Service You Require <code class="text-danger">*</code></label>
                        <div class="col-sm-8">
                            <select name="fld_main_service" id="fld_main_service" class="form-control" required="">
                                <option value="">Select</option>
                                <?php
                                $all_service = $service->allServices('tbl_main_services');
                                if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <option <?= isset($_GET['service']) && $_GET['service'] == $row['id'] ? 'selected' : ''; ?> value="<?= isset($row['id']) ? $row['id'] : ''; ?>"><?= isset($row['fld_service_name']) ? $row['fld_service_name'] : ''; ?></option>
                                <?php
                                }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_add_service" class="col-sm-4 col-form-label">Additional Service</label>
                        <div class="col-sm-8">
                            <select name="fld_add_service" id="fld_add_service" class="form-control">
                                <option value="">Select</option>
                                <?php
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
                    </div>
                    <div class="form-group row">
                        <label for="fld_format" class="col-sm-4 col-form-label">Return File Format <code class="text-danger">*</code></label>
                        <div class="col-sm-8">
                            <select name="fld_format" id="fld_format" class="form-control" required="">
                                <option value="">Select</option>
                                <?php
                                $all_service = $service->allServices('tbl_file_format');
                                if ($all_service) {
                                while ($row = mysqli_fetch_assoc($all_service)) {
                                ?>
                                <option value="<?= isset($row['id']) ? $row['id'] : ''; ?>"><?= isset($row['fld_format']) ? $row['fld_format'] : ''; ?></option>
                                <?php
                                }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_quantity" class="col-sm-4 col-form-label">Quantity (Number of images)</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="fld_quantity" name="fld_quantity" value="<?= isset($_GET['quantity']) ? $_GET['quantity'] : ''; ?>" placeholder="Enter Quantity">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_source" class="col-sm-4 col-form-label">How did you find us?</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="fld_source" id="fld_source">
                                <option value="">Select</option>
                                <option value="Google">Google</option>
                                <option value="Yahoo">Yahoo</option>
                                <option value="Bing">Bing</option>
                                <option value="E-mail">E-mail</option>
                                <option value="Blog">Blog</option>
                                <option value="Social Site">Social Site</option>
                                <option value="Recomandation">Recomandation</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fld_job_instruction" class="col-sm-4 col-form-label">Job Instruction</label>
                        <div class="col-sm-8">
                            <small class="text-muted">Just for promotional purpose</small>
                            <textarea class="form-control" name="fld_job_instruction" id="fld_job_instruction" rows="5"></textarea>
                        </div>
                    </div>
                    <!-- form cph -->
                    <div class="row fileupload-buttonbar">
                        <div class="col-lg-12">
                            <div class="container">
                                <div class="row">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <div class="col-sm-3 mb-3">
                                        <span class="btn btn-success fileinput-button" style="color:#FFF !important;">
                                            <i class="fa fa-plus"></i>
                                            <span>Add Files...</span>
                                            <input onClick="if(document.getElementsByName('txt_name')[0].value == ''){alert('Fill up required data first');this.type='text';  location.reload();}" type="file" id="userImage" name="userImage[]" multiple accept="image/*" style="color:#FFF !important;" required="">
                                        </span>
                                    </div>
                                    <div class="col-sm-3 mb-3">
                                        <button type="submit" class="btn btn-primary start" id="btnSubmit" style="color:#FFF !important;" onClick="file_dir();upload_check();" name="free_trial">
                                        <i class="fa fa-upload"></i>
                                        <span>Start upload</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- form cph -->
                </form>
                <!-- from cph -->
                <span class="fileupload-process my-3 py-3" id="onprogr" style="padding-left: 20px;color: #ff0000; font-weight: bold; display:none;">Please Wait Until Process is complete....</span>
                <span class="fileupload-process my-3 py-3" id="onprogr2" style="padding-left: 20px;color: #469c10; font-weight: bold; display:none;">Upload is Completed</span>
                <div id="progress-div"><div id="progress-bar"></div></div>
                <br>
                <div id="targetLayer"></div>
                <!-- from cph -->
            </div>
            <div class="col-md-4">
                <font style="font-size:20px;" class="text-muted">Submit your job by 4 easy steps...!!!</font><br>
                1. Fill up required data<br>
                <font style="color:#696969;">2. +Add Files from your pc.</font><br>
                <font style="color:#3378B7;">3. Press "Start Upload" button.</font><br>
                <font style="color:#459C45;">Your order will auto submit after complete upload</font><br><br>
                <h4 style="font-size: 20px !important;color: #0e6f3a !important;padding-top: 5px;">Conditions:</h4>
                <h3 style="font-size: 20px !important;color: #0e6f3a !important;padding-top: 5px;">Upload 3 Images Maximum</h3>
                <h3 style="font-size: 20px !important;padding-top: 5px;">Per Image size 10 MB Maximum</h3><br>
                <p>For More big size file please email us to <br>info@clippingpathhouse.com</p>
            </div>
        </div>
    </div>
</section>
<br>
<br>
<?php require_once "inc/footer.php"; ?>