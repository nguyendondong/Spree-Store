$(document).ready ->
  $("#change_variant_id").change ->
    variant_id = $(this).val()
    $("#lead_variant_id").val(variant_id)
    return
