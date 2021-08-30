<?php require_once "inc/header.php"; ?>
<?php 
Session::clientCheckLogin();





// get user country name start--------------------------------------------------
// IP address 
$userIP = $_SERVER['REMOTE_ADDR']; 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://ip-api.com/json/" . $userIP);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$result = curl_exec($ch);
$result = json_decode($result);

if($result->status == 'success') {
    $country_name = $result->country;
} else {
    $country_name = '';
    echo 'API Problem!';
}
// get user country name end----------------------------------------------------





if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['registration'])) {
  $insert_result = $user->userRegister($_POST);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login'])) {
  $login_result = $user->userLogin($_POST);
}

?>
<br>
<br>
<section>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div style="padding:0 70px 70px;">
          <h4 class="text-uppercase text-muted">Login</h4>
          <span class="text-muted">Already registered? Just log in below.</span>
          <br>
          <br>
          <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            <?= isset($login_result) ? $login_result : '';?>
            <label for="email" class="mt-2">Email <code class="text-danger">*</code></label>
            <input type="text" id="email" name="email" class="form-control" placeholder="Enter email" required="">
            <label for="password" class="mt-2">Password <code class="text-danger">*</code></label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter password" required="">
            <div class="d-flex aligh-items-center justify-content-between mt-2">
              <input type="submit" name="login" class="free_trial_reverse btn btn-primary btn-sm">
              <a href="reset_password.php" class="text-decoration-none text-info">
                Forgot your password?
              </a>
            </div>
          </form>
          <br>
          <img src="assets/img/getseal.png" alt="" border="0" width="115">
        </div>
      </div>
      <div class="col-md-6">
        <div style="padding:0 70px 70px;">
          <h4 class="text-uppercase text-muted">Registration</h4>
          <span class="text-muted">You don't have an account yet ? Just register below to immediately start using CPP Graphics Media</span><br>
          <br>
          <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            <?= isset($insert_result) ? $insert_result : '';?>
            <div class="form-group">
              <label for="fld_fullname">Full Name <code class="text-danger">*</code></label>
              <input type="text" class="form-control" id="fld_fullname" name="fld_fullname" value="<?= isset($_POST['fld_fullname']) ? $_POST['fld_fullname'] : ''; ?>" placeholder="Enter full name" required="">
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <!--real country start-->
                <input type="hidden" name="real_country" value="<?= $country_name; ?>" >
                <!--real country end-->
                <label for="fld_country">Country <code class="text-danger">*</code></label>
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
              <div class="form-group col-md-6">
                <label for="fld_source">How did you find us?</label>
                <select class="form-control" name="fld_source" id="fld_source">
                  <option value="">Select</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Google') {
                    echo 'selected';
                  }
                  ?> >Google</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Yahoo') {
                    echo 'selected';
                  }
                  ?> >Yahoo</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Bing') {
                    echo 'selected';
                  }
                  ?> >Bing</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'E-mail') {
                    echo 'selected';
                  }
                  ?> >E-mail</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Blog') {
                    echo 'selected';
                  }
                  ?> >Blog</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Social Site') {
                    echo 'selected';
                  }
                  ?> >Social Site</option>
                  <option <?php 
                  if (isset($_POST['fld_source']) && $_POST['fld_source'] == 'Recomandation') {
                    echo 'selected';
                  }
                  ?> >Recomandation</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="fld_email">Email <code class="text-danger">*</code></label>
              <input type="email" class="form-control" id="fld_email" name="fld_email" value="<?= isset($_POST['fld_email']) ? $_POST['fld_email'] : ''; ?>" placeholder="Enter email" required="">
              <?= isset($user->email) ? $user->email : ''; ?>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6 mb-0">
                <label for="fld_password">Password <code class="text-danger">*</code></label>
                <input type="password" class="form-control" id="fld_password" name="fld_password" placeholder="Enter password" required="">
              </div>
              <div class="form-group col-md-6 mb-0">
                <label for="repeat_password">Repeat Password <code class="text-danger">*</code></label>
                <input type="password" class="form-control" id="reapet_password" name="reapet_password" placeholder="Repeat password" required="">
              </div>
            </div>
            <?= isset($user->password) ? $user->password : ''; ?>
            <input type="submit" name="registration" value="Create My Account" class="free_trial_reverse btn btn-primary btn-sm mt-3">
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<?php require_once "inc/footer.php"; ?>