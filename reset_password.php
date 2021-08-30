<?php require_once "inc/header.php"; ?>
<?php 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['recover_password'])) {
  $result = $user->passwordRecovery($_POST);
}

?>
<br>
<br>
<section>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 offset-sm-4">
        <div id="recoverform" style="display: block;">
          <div class="text-center">
              <span class="text-muted">Enter your e-mail address below and we will send you instructions how to recover a password.</span>
          </div>
          <div class="row mt-4">
              <!-- Form -->
              <form class="col-12" action="reset_password.php" method="POST">
                  <!-- email -->
                  <div class="input-group mb-3">
                      <div class="input-group-prepend">
                          <span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="fa fa-envelope"></i></span>
                      </div>
                      <input type="email" class="form-control form-control-lg" placeholder="Email Address" name="email" required="">
                  </div>
                  <!-- pwd -->
                  <div class="row mt-4 pt-4 border-top border-secondary">
                      <div class="col-12">
                          <a class="btn btn-success" href="authentication.php" id="to-login" name="action">Back To Login</a>
                          <button class="btn btn-info float-right" type="submit" name="recover_password">Recover</button>
                      </div>
                      <div class="col-12">
                        <?= isset($result) ? $result : ''; ?>
                      </div>
                  </div>
              </form>
          </div>
      </div>
      </div>
    </div>
    <br>
  </div>
</section>
<?php require_once "inc/footer.php"; ?>