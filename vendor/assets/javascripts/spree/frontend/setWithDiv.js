	$(document).ready(function(){
  	var divWidth = $('.product-image').width(); 
    $('.product-button').width(divWidth);
    var top = divWidth - 100;
		top = top + "px";
		var top2 = divWidth - 55;
		top2 = top2 + "px";
		$('.product-button').css('top', top);
		$('.product-button.top2').css('top', top2);
	});

