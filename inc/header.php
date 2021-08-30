<?php
ob_start();
$filepath = realpath(dirname(__FILE__));
include_once ($filepath . '/../lib/Database.php');
include_once ($filepath . '/../lib/Session.php');
include_once ($filepath . '/../helper/Format.php');
spl_autoload_register(function($class_name) {
	include_once "classes/" . $class_name . ".php";
});

$database = new Database();
$format = new Format();

$user = new User();
$service = new Service();
$contact = new Contact();

$page = $_SERVER['PHP_SELF'];
$page = explode('/', $page);
$page_path = end($page);


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['quick_query'])) {
  $query_result = $contact->insertQuickQuery($_POST);
}


?>
<?php

$page_link = $_SERVER['PHP_SELF'];
$page_link = ltrim($page_link,"/");

switch ($page_link) {
  case "index.php":
    $title = '';
    $keyword = '';
    $description = '';
    $robots = "index, follow";
    break;
      default:
    $title = '';
    $keyword = '';
    $description = '';
    $robots = "index, follow";
    
}

header("Cache-Control: no-cache, must-revalidate");
header("Pragma: no-cache");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: max-age=2592000");
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><?= $title; ?></title>
		<meta name="keywords" content="<?= $keyword; ?>" />
        <meta name="description" content="<?= $description; ?>" />
        <meta name="robots" content="<?= $robots; ?>" />
        <meta name="google-site-verification" content="" />
				<link rel="icon" type="img/icon" href="assets/img/">
				<link rel="stylesheet" href="assets/css/bootstrap.css">
				<link rel="stylesheet" href="assets/css/owl-slider/owl.carousel.min.css">
				<link rel="stylesheet" href="assets/css/owl-slider/owl.theme.default.min.css">
				<link rel="stylesheet" href="assets/css/twentytwenty.css">
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<link rel="stylesheet" href="assets/css/style.css">
				<meta name="language" content="en-us" />
				<meta name="distribution" content="Global" />
				<meta name="rating" content="General" />
				<meta name="author" content="">
				<meta name="classification" content="" />
			    <style>
				#progress-bar {background-color: #12CC1A;height:20px;color: #FFFFFF;width:0%;-webkit-transition: width .3s;-moz-transition: width .3s;transition: width .3s;}
				#progress-div {border:#0FA015 1px solid;padding:0px;margin:0px 0px;border-radius:4px;text-align:center; display:none;}

				</style>
				<!-- <style type="text/css">body * :not(input):not(textarea){user-select:none !important; -webkit-touch-callout: none !important;  -webkit-user-select: none !important; -moz-user-select:none !important; -khtml-user-select:none !important; -ms-user-select: none !important;}#amm_drcfw_toast_msg{visibility:hidden;min-width:250px;margin-left:-125px;background-color:#333;color:#fff;text-align:center;border-radius:2px;padding:16px;position:fixed;z-index:999;left:50%;bottom:30px;font-size:17px}#amm_drcfw_toast_msg.show{visibility:visible;-webkit-animation:fadein .5s,fadeout .5s 2.5s;animation:fadein .5s,fadeout .5s 2.5s}@-webkit-keyframes fadein{from{bottom:0;opacity:0}to{bottom:30px;opacity:1}}@keyframes fadein{from{bottom:0;opacity:0}to{bottom:30px;opacity:1}}@-webkit-keyframes fadeout{from{bottom:30px;opacity:1}to{bottom:0;opacity:0}}@keyframes fadeout{from{bottom:30px;opacity:1}to{bottom:0;opacity:0}}</style> -->
	</head>
	<body class="d-flex flex-column min-vh-100">
		<!-- header part start -->
		<header class="d-none d-lg-block">
			<div class="header_top border-bottom">
				<div class="container">
					<div class="row">
					    <div class="col-6">
							<!--<div class="float-right social_icon">-->
							<!--	<a class="d-inline-block px-1 text-white" href="https://www.facebook.com/Wardrobedacca" title="Wardrobedacca | Facebook" target="_blank">-->
							<!--		<i class="fa fa-facebook-f"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Twitter" target="_blank">-->
							<!--		<i class="fa fa-twitter"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Pinterest" target="_blank">-->
							<!--		<i class="fa fa-pinterest-p"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Linkedin" target="_blank">-->
							<!--		<i class="fa fa-linkedin"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Whatsapp" target="_blank">-->
							<!--		<i class="fa fa-whatsapp"></i>-->
							<!--	</a>-->
							<!--</div>-->
						</div>
						<div class="col-6 d-flex align-items-center justify-content-end">
							<div class="small py-1">
								<a href="authentication.php" class="text-muted mr-2 font-weight-bold text-decoration-none login_signup">Login</a> |
								<a href="authentication.php" class="text-muted ml-2 font-weight-bold text-decoration-none login_signup">Sign Up</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header_middle border-bottom">
				<div class="container-fluid px-5">
					<div class="row">
						<div class="col-md-3">
							<a href="/" title="Clipping Path Photo">
								<img class="" src="assets/img/clipping-path-service-site.png" alt="Clipping Path Photo | Logo" style="width: 300px;">
							</a>
						</div>
						<div class="col-md-9 d-flex align-items-center justify-content-end">
							<div class="user_cart">
								<div class="menu d-flex align-items-center">
									<ul class="d-inline-block">
										<li>
											<a href="/">Home</a>
										</li>
										<li class="position-relative services">
											<a href="photo-editing-service-for-photographers.php">Services</a>
											<div class="services_menu">
												<a href="image-clipping-path-services-provider-company.php">Clipping Path Service</a>
												<a href="photoshop-image-multi-clipping-path-services.php">Multi Clipping Path Service</a>
												<a href="image-background-removal-services.php">Background Removal Service</a>
												<a href="photoshop-image-masking-service.php">Photoshop Image Masking Service</a>
												<a href="photoshop-image-retouching-service.php">Image Retouching Service</a>
												<a href="ghost-mannequin-effect-photoshop.php">Mannequin Remove Neck Joint</a>
												<a href="photoshop-photo-shadow-effect.php">Image Shadow Effect</a>
												<a href="image-enhancement-services.php">Image Enhancement Services</a>
												<a href="photoshop-Color-variant-changing.php">Color Variants & Color Changing</a>
												<a href="eCommerce-product-image-editing-services.php">eCommerce Product Image Edit</a>
											</div>
										</li>
										<li>
											<a href="image-editing-price.php">Pricing</a>
										</li>
										<li class="position-relative resources">
											<a href="javascript:void(0)">Resources</a>
											<div class="resources_menu">
												<a href="free-quote.php">Get a Free Quote</a>
												<a href="how-it-work.php">How It Works - FAQ</a>
												<a href="photoshop-image-editing-work.php">Gallery</a>
												<a href="privacy-policy.php">Privacy Policy</a>
												<a href="photo-editor-service-provider-terms-and-conditions.php">Terms and Conditions</a>
												<a href="https://www.clippingpathphoto.com/blog/" target="_block">Blog</a>
											</div>
										</li>
										<li>
                    						<a href="photo-editing-service-provider-in-bangladesh.php">About Us</a>
                    					</li>
										<li>
											<a href="contact-us.php">Contact</a>
										</li>
										<li>
											<a href="free-trial.php" class="free_trial btn btn-primary btn-sm text-white py-1 mx-3" style="margin-top: 4px;letter-spacing: 1.2px;font-size: 16px;"><b>Free Trial</b></a>
										</li>
										<li>
											<a href="javascript:void(Tawk_API.toggle())">Live Chat</a>
										</li>
									</ul>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- sticky header start -->
			<div class="sticky" id="navbar">
			    <div class="header_top border-bottom">
				<div class="container">
					<div class="row">
						<div class="col-6">
							<!--<div class="float-right social_icon">-->
							<!--	<a class="d-inline-block px-1 text-white" href="https://www.facebook.com/Wardrobedacca" title="Wardrobedacca | Facebook" target="_blank">-->
							<!--		<i class="fa fa-facebook-f"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Twitter" target="_blank">-->
							<!--		<i class="fa fa-twitter"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Pinterest" target="_blank">-->
							<!--		<i class="fa fa-pinterest-p"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Linkedin" target="_blank">-->
							<!--		<i class="fa fa-linkedin"></i>-->
							<!--	</a>-->
							<!--	<a class="d-inline-block px-1 text-white" href="" title="Wardrobebd | Whatsapp" target="_blank">-->
							<!--		<i class="fa fa-whatsapp"></i>-->
							<!--	</a>-->
							<!--</div>-->
						</div>
						
						<div class="col-6 d-flex align-items-center justify-content-end">
							<div class="small py-1">
								<a href="authentication.php" class="mr-2 font-weight-bold text-decoration-none login_signup">Login</a> |
								<a href="authentication.php" class="ml-2 font-weight-bold text-decoration-none login_signup">Sign Up</a>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="container-fluid px-5">
					<div class="row">
						<div class="col-md-3">
							<a href="/" title="Clipping Path Photo">
								<img class="" src="assets/img/image-editing-service-company.png" alt="Clipping Path Photo | Logo" height="42">
							</a>
						</div>
						<div class="col-md-9 d-flex align-items-center justify-content-end">
							<div class="user_cart">
								<div class="menu d-flex align-items-center">
									<ul class="d-inline-block">
										<li>
											<a href="/">Home</a>
										</li>
										<li class="position-relative services">
											<a href="photo-editing-service-for-photographers.php">Services</a>
											<div class="services_menu">
												<a href="image-clipping-path-services-provider-company.php">Clipping Path Service</a>
												<a href="photoshop-image-multi-clipping-path-services.php">Multi Clipping Path Service</a>
												<a href="image-background-removal-services.php">Background Removal Service</a>
												<a href="photoshop-image-masking-service.php">Photoshop Image Masking Service</a>
												<a href="photoshop-image-retouching-service.php">Image Retouching Service</a>
												<a href="ghost-mannequin-effect-photoshop.php">Mannequin Remove Neck Joint</a>
												<a href="photoshop-photo-shadow-effect.php">Image Shadow Effect</a>
												<a href="image-enhancement-services.php">Image Enhancement Services</a>
												<a href="photoshop-Color-variant-changing.php">Color Variants & Color Changing</a>
												<a href="eCommerce-product-image-editing-services.php">eCommerce Product Image Edit</a>
											</div>
										</li>
										<li>
											<a href="image-editing-price.php">Pricing</a>
										</li>
										<li class="position-relative resources">
											<a href="javascript:void(0)">Resources</a>
											<div class="resources_menu">
												<a href="free-quote.php">Get a Free Quote</a>
												<a href="how-it-work.php">How It Works - FAQ</a>
												<a href="photoshop-image-editing-work.php">Gallery</a>
												<a href="privacy-policy.php">Privacy Policy</a>
												<a href="photo-editor-service-provider-terms-and-conditions.php">Terms and Conditions</a>
												<a href="https://www.clippingpathphoto.com/blog/" target="_block">Blog</a>
											</div>
										</li>
										<li>
                    						<a href="photo-editing-service-provider-in-bangladesh.php">About Us</a>
                    					</li>
										<li>
											<a href="contact-us.php">Contact</a>
										</li>
										<li>
											<a href="free-trial.php" class="free_trial btn btn-primary btn-sm text-white py-1 mx-3" style="margin-top: 4px;letter-spacing: 1.2px;font-size: 16px;"><b>Free Trial</b></a>
										</li>
										<li>
											<a href="javascript:void(Tawk_API.toggle())">Live Chat</a>
										</li>
									</ul>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- sticky header end -->
		</header>
		<!-- mobile device start -->
		<div class="mobile_device d-lg-none">
			<div class="container-fluid">
				<div class="row">
					<div class="col-3">
						<a href="javascript:void(0)" onclick="openNav()" class="d-flex align-items-center text-muted text-decoration-none" style="height: 60px;">
							<i class="fa fa-bars mr-2"></i>
							<span class="text-uppercase dn_320">Menu</span>
						</a>
					</div>
					<div class="col-6 d-flex justify-content-center align-items-center">
						<a href="/">
							<img class="" src="assets/img/image-editing-service-company.png" alt="Logo">
						</a>
					</div>
					<div class="col-3">
						<a href="authentication.php" class="d-flex align-items-center justify-content-center text-muted text-decoration-none h-100">
							<i class="fa fa-user"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="menu_layer" id="menu_layer" onclick="closeNav()">
			<div class="mobile_menu">
				<a class="float-right px-3 py-1 m-1 bg-danger text-white text-decoration-none" onclick="closeNav()" href="javascript:void(0)">X</a>
				<div class="clearfix"></div>
				<ul class="mobile_menus">
					<li>
						<a href="/">Home</a>
					</li>
					<li class="position-relative">
						<a class="border-bottom" href="photo-editing-service-for-photographers.php">Services</a>
						<div class="services_mobile_menu pl-3">
						    <a class="border-bottom" href="image-clipping-path-services-provider-company.php">Clipping Path Service</a>
							<a class="border-bottom" href="photoshop-image-multi-clipping-path-services.php">Multi Clipping Path Service</a>
							<a class="border-bottom" href="image-background-removal-services.php">Background Removal Service</a>
							<a class="border-bottom" href="photoshop-image-masking-service.php">Photoshop Image Masking Service</a>
							<a class="border-bottom" href="photoshop-image-retouching-service.php">Image Retouching Service</a>
							<a class="border-bottom" href="ghost-mannequin-effect-photoshop.php">Mannequin Remove Neck Joint</a>
							<a class="border-bottom" href="photoshop-photo-shadow-effect.php">Image Shadow Effect</a>
							<a class="border-bottom" href="image-enhancement-services.php">Image Enhancement Services</a>
							<a class="border-bottom" href="photoshop-Color-variant-changing.php">Color Variants & Color Changing</a>
							<a class="border-bottom" href="eCommerce-product-image-editing-services.php">eCommerce Product Image Edit</a>
						</div>
					</li>
					<li>
						<a href="image-editing-price.php">Pricing</a>
					</li>
					
					<li class="position-relative">
						<a class="border-bottom" href="javascript:void(0)">Resources</a>
						<div class="services_mobile_menu pl-3">
							<a class="border-bottom" href="free-quote.php">Get a Free Quote</a>
							<a class="border-bottom" href="how-it-work.php">How It Works - FAQ</a>
							<a class="border-bottom" href="photoshop-image-editing-work.php">Gallery</a>
							<a class="border-bottom" href="privacy-policy.php">Privacy Policy</a>
							<a class="border-bottom" href="photo-editor-service-provider-terms-and-conditions.php">Terms and Conditions</a>
							<a href="https://www.clippingpathphoto.com/blog/" target="_block">Blog</a>
						</div>
					</li>
					<li>
						<a href="photo-editing-service-provider-in-bangladesh.php">About Us</a>
					</li>
					<li>
						<a href="contact-us.php">Contact</a>
					</li>
					<li>
						<a href="free-trial.php">Free Trial</a>
					</li>
					<li>
						<a href="javascript:void(Tawk_API.toggle())">Live Chat</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- mobile device end -->
		<!-- header part end -->