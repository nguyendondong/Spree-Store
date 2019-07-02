$(document).ready(function () {
    $('#transfer_variant').on('change', function (){
      if(!$('#transfer_receive_stock')[0].checked){
      source_name  = $('#transfer_source_location_id_field').find('span:eq(0)').text()
      source_id = $('#transfer_source_location_id_field option:contains('+ source_name + ')').val()
      item_id = $(this).val()
      $.ajax({
        type: "GET",
        url: "/admin/stock_items",
        dataType: "JSON",
        data: {variant_id: item_id, stock_location_id: source_id} ,
        success: function(data) {
          console.log(data)
          find_in_table(data.count_on_hand, item_id)
        }
      });
      }
    })

  function find_in_table(amount, id){
    $('#transfer_variants_tbody tr').each(function (){
      if (parseInt($(this).find('input:eq(0)').val()) == id){
        amount = amount - parseInt($(this).find('input:eq(1)').val())
        return true;
      }
    })
      $('#item_quantity').val(amount)
  }
  })