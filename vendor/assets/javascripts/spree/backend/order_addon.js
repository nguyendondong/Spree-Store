$(function() {
	$("#transfer-order").fancybox({'width': 400});
	$("a.notes").fancybox({'width': 400});
	$("#print-order-address").click(function(event){
		event.preventDefault();
		console.log("print orders");
		var ids = "";
		$(".print_orders:checked").each(function(){
			console.log($(this).val());
			ids = ids + $(this).val() + ","
		});
		if(ids.length > 0) {
			ids = ids.substring(0, ids.length-1);
			window.location = "/admin/print_order_addresses?ids=" + ids;
		}
	});

	$(".new_note").submit(function(){
		console.log("create note");
		console.log($(this).attr("action"));
		var valuesToSubmit = $(this).serialize();
		var content = $("[name='note[content]']", this).val();
		var order_row_id = "#order-" + $("[name='note[notable_id]']", this).val();
		_this = this;
		$.ajax({
        type: "POST",
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "json" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
    	console.log("aaaaa")
        //act on result.
        $(".note-list", _this).append("<div>" + content + "</div>");
        $(order_row_id).append("<div>" + content + "</div>");
    });
    //$(".note-list", _this).append("<div>test" + content + "</div>");
		return false; // prevents normal behaviour
	});
	
  $("#order_bill_address_attributes_state_id").on("change", function(e) {
    $("#order_bill_address_attributes_district_id").prop('disabled', true);
    $('#order_bill_address_attributes_district_id').parents().first().find('div span:eq(0)').text("")
    var state_id, city_name;
    state_id = $(this).val();
    city_name = $("#order_bill_address_attributes_state_id option:selected").text();
    if(state_id != ""){
      return $.ajax({
      type: "GET",
      url: "/districts",
      dataType: "text",
      data: "state_id=" + state_id,
      error: function(xhr, status) {
        return console.log(status);
      },
      success: function(html) {
        $("#order_bill_address_attributes_district_id").html(html);
        $("#order_bill_address_attributes_district_id").prop('disabled', false)
      }
    });
  }
  });
});