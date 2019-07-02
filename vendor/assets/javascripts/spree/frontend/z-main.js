$(document).ready(function($) {
  $("input.datetype").datepicker({
    noDefault: true,
    autoclose: true,
    format: 'yyyy-mm-dd',
    weekStart: 1,
    language: "vi"
  });

  // Javascript click filter Button to display filter box
  var el = $('.filter-order'),
  timeout=null;

  //el.height(0);
  $('.filter-btn').click(function(){
    clearTimeout(timeout);

    if (!($(this).hasClass('active'))){
      $(this).addClass('active');
      timeout = setTimeout(function(){el.addClass('active')}, 250);
    } else {
      el.removeClass('active');
      timeout = setTimeout(function(){$('.filter-btn').removeClass('active');}, 500);
    }
  });
});