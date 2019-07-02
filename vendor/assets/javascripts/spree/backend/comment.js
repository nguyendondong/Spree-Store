$(function() {
	$(".mark-as-read").click(function(e){
		_this = this;
		$.ajax({
        type: "PUT",
        url: $(this).attr('href'), //sumbits it to the given url of the form
        data: {comment: {read: true}},
        dataType: "json" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
    	//console.log("aaaaa");
      //act on result.
      //$("#spree_comment_" + $(_this).attr("data")).remove();  
    });
    $("#spree_comment_" + $(_this).attr("data")).remove();  
		return false; // prevents normal behaviour
	});
});