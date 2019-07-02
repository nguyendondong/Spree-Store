$(function() {
  $("#address-state").on("change", function(e) {
    var name, state_id, city_name;
    state_id = $(this).val();
    name = $("#address-district").attr("name");
    city_name = $("#address-state option:selected").text();
    $("#address-city").val(city_name);
    return $.ajax({
      type: "GET",
      url: "/districts",
      dataType: "text",
      data: "state_id=" + state_id + "&name=" + name,
      error: function(xhr, status) {
        return console.log(status);
      },
      success: function(html) {
        $("#address-district").html(html);
        if($("#buy_at_shop").is(':checked')) {
          $("#address-district").val("Quận 11");
        }
      }
    });
  });
  $("#buy_at_shop").on("change", function(e){
    if($("#buy_at_shop").is(':checked')) {
      $("#order_bill_address_attributes_firstname").val("Khách mua trực tiếp");
      $("#order_bill_address_attributes_phone").val("090-8482-804");
      $("#address-state").val(29).change();
      $("#address-district").val("Quận 11");
      $("#order_bill_address_attributes_address1").val("22/4 cư xá Lữ Gia, P15")
    }
  });
});