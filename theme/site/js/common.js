$(document).ready(function(){

  $('.footer_menu .navbar-toggler').click(function(){
    if ($('.footer_menu_nav').hasClass("active")){
      $('.footer_menu_nav').removeClass("active").slideUp();
    } else{
      $('.footer_menu_nav ').addClass("active").slideDown();
    }
    return false;
  });

  $('input[type="file"]').change(function(){
    var value = $("input[type='file']").val();
    $('.js-value').text(value);
  });

  if($('.input_box .form-control').val.length >= 1){
    $(this).next('.input_name').addClass('-top');
  }else{
    $(this).next('.input_name').removeClass('-top');
  }


  $('.input_box .form-control').on('keyup',function(){
    if($(this).val.length >= 1){
      $(this).next('.input_name').addClass('-top');
    }else{
      $(this).next('.input_name').removeClass('-top');
    }
  })

    $('.mobheader-toggler').click(function(e){
        e.preventDefault();
        if ($('.mobheader').hasClass('menu-open'))
        {
            $('.mobheader').removeClass('menu-open');
            
            $('.mobheader-menu-nav').removeClass('open');
            
        }
        else
        {
            $('.mobheader').addClass('menu-open');
            
            $('.mobheader-menu-nav').addClass('open');
            
        }
    })


  // mask
  $(function(){
  });





});






