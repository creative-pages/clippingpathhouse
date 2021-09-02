<?php require_once "inc/header.php"; ?>


<section class="py-4 mt-3">
    <div class="container">
        <ul class="breadcumbs">
            <li><a href="/">Home</a></li>
            <li>
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.59003 16.59L13.17 12L8.59003 7.41L10 6L16 12L10 18L8.59003 16.59Z" fill="#1D2951"></path>
                </svg>
            </li>
            <li><a href="services.php">Contact Us</a></li>
        </ul>
    </div>
</section>


<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['contact'])) {
  $insert_result = $contact->insertContact($_POST);
}

?>

<section class="mb-5 py-5">
  <div class="container">
    <div class="row">
      <div class="col-md-6 mb-4">
          <h4 class="text-uppercase text-muted">Contact Details</h4>
          <br>
          <h5 class="text-uppercase text-success mt-4 mt-md-0">Email for any query</h5>
          <br>
          <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            <input type="text" name="name" placeholder="Your Name*" required="" class="form-control bg-white mb-2">
            <input type="email" name="email" placeholder="Your Email*" required="" class="form-control bg-white mb-2">
            <input type="text" name="subject" placeholder="Your Subject*" required="" class="form-control bg-white mb-2">
            <textarea name="message" rows="3" required="" placeholder="Message*" required="" class="form-control mb-2"></textarea>
            <div class="form-row mb-2">
              <div class="col-6">
                <?php 
                $num1 = rand(1,9);
                $num2 = rand(1,9);
                ?>
                <input type="hidden" id="num1" value="<?= $num1; ?>">
                <input type="hidden" id="num2" value="<?= $num2; ?>">

                <input type="text" id="captcha_fill" value="<?= $num1 . '+' . $num2; ?>" class="form-control text-center" readonly="">
              </div>
              <div class="col-6">
                <input type="number" id="captcha" class="form-control text-center" required="">
              </div>
            </div>
            <input type="submit" name="contact" id="contact" class="btn btn-success btn-sm" disabled="disabled">
          </form>
          <?= isset($insert_result) ? $insert_result : ''; ?>
          <br>
      </div>
      <div class="col-md-6">
        <div class="text-center">
            <img class="mt-n5" src="assets/img/contact-us.png" alt="Clpping Path House">
        </div>
      </div>
    </div>
    
    <br>
    <br>
    <br>

    <div class="row">
        <div class="col-sm-4">
            <h2 class="font-weight-bold">Production House</h2>
            <p style="line-height: 30px;">548, Mirpur-14, Kafrul<br>
                Dhaka- 1206, Bangladesh<br>
                <i class="fa fa-envelope text-success mr-2"></i> Email: info(at)clippingpathhouse.com<br>
                <i class="fa fa-phone text-success mr-2"></i> Phone: +88-01741906076<br>
                <i class="fa fa-skype text-success mr-2"></i> Skype: cph.graphics
            </p>
        </div>
        <div class="col-sm-4">
            <h2 class="font-weight-bold">Production House</h2>
            <p style="line-height: 30px;">548, Mirpur-14, Kafrul<br>
                Dhaka- 1206, Bangladesh<br>
                <i class="fa fa-envelope text-success mr-2"></i> Email: info(at)clippingpathhouse.com<br>
                <i class="fa fa-phone text-success mr-2"></i> Phone: +88-01741906076<br>
                <i class="fa fa-skype text-success mr-2"></i> Skype: cph.graphics
            </p>
        </div>
        <div class="col-sm-4">
            <h2 class="font-weight-bold">Production House</h2>
            <p style="line-height: 30px;">548, Mirpur-14, Kafrul<br>
                Dhaka- 1206, Bangladesh<br>
                <i class="fa fa-envelope text-success mr-2"></i> Email: info(at)clippingpathhouse.com<br>
                <i class="fa fa-phone text-success mr-2"></i> Phone: +88-01741906076<br>
                <i class="fa fa-skype text-success mr-2"></i> Skype: cph.graphics
            </p>
        </div>
    </div>
  </div>
</section>


<?php require_once "inc/footer.php"; ?>