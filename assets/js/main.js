
// sticy header start
function openNav() {
    document.getElementById("menu_layer").style.width = "100%";
}

function closeNav() {
  document.getElementById("menu_layer").style.width = "0%";
  $(".mobile_menu").unbind("click");
}

window.onscroll = function() {myFunction()};

var header = document.getElementById("navbar");
var sticky = 180;

function myFunction() {
  if (window.pageYOffset > sticky) {
    // header.classList.add("sticky");
    header.classList.add("sticky_block");
  } else {
    // header.classList.remove("sticky");
    header.classList.remove("sticky_block");
  }
}
// sticy header end

$(document).ready(function(){

  // top to start
    $topOffset=350;
    $('.top_to i').click(function(){
        $('html,body').animate({
            scrollTop: 0
        },800);
    });
    $(window).scroll(function(){
        $scrolling=$(this).scrollTop();
        var width = $(window).width();
        if($scrolling > $topOffset){
            $('.top_to i').fadeIn(500);
        }
         else{
             $('.top_to i').fadeOut(500);
         }
    });

  $('.header_slider').owlCarousel({
      margin:10,
      nav:false,
      dots: false,
      loop:true,
      autoplay:true,
      autoplayTimeout:7000,
      responsiveClass:true,
      smartSpeed:4000,
      animateOut: 'fadeOut',
      responsive:{
          0:{
              items:1,
          },
          400:{
              items:1,
          },
          600:{
              items:1
          },
          1000:{
              items:1
          }
      }
  });
  $('.why_we_perfect').owlCarousel({
      margin:10,
      nav:false,
      dots: false,
      loop:true,
      autoplay:true,
      autoplayTimeout:3000,
      responsiveClass:true,
      smartSpeed:2000,
      animateOut: 'fadeOut',
      responsive:{
          0:{
              items:1,
          },
          400:{
              items:1,
          },
          600:{
              items:1
          },
          1000:{
              items:1
          }
      }
  });
  
  $('.service_page').owlCarousel({
      margin:10,
      nav:false,
      dots: false,
      loop:true,
      autoplay:true,
      autoplayTimeout:2500,
      responsiveClass:true,
      smartSpeed:1000,
      animateOut: 'fadeOut',
      responsive:{
          0:{
              items:1,
          },
          400:{
              items:1,
          },
          600:{
              items:1
          },
          1000:{
              items:1
          }
      }
  });
  
  $(function(){
      $("#twentytwenty1").twentytwenty({
      no_overlay: true,
      move_slider_on_hover: true,
    });
  });
  $(function(){
      $("#twentytwenty2").twentytwenty({
      no_overlay: true,
      move_slider_on_hover: true,
    });
  });
  $(function(){
      $("#twentytwenty3").twentytwenty({
      no_overlay: true,
      move_slider_on_hover: true,
    });
  });
  $(function(){
      $("#twentytwenty4").twentytwenty({
      no_overlay: true,
      move_slider_on_hover: true,
    });
  });
  $(function(){
      $("#twentytwenty5").twentytwenty({
      no_overlay: true,
      move_slider_on_hover: true,
    });
  });
});


(function ($) {
	$('.product-image-thumb').on('click', function () {
    var image_element = $(this).find('img')
    $('.product-image').prop('src', $(image_element).attr('src'))
    $('.product-image-thumb.active').removeClass('active')
    $(this).addClass('active')
  })
})(jQuery)
