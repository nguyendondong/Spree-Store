$(document).ready ->	
	#handle save click
  $('a.select-color-line-item').click ->
    save = $ this
    line_item_id = save.data('line-item-id')
    variant_id = save.data('variant-id')
    action_url = save.data('action-url')
    adjustLineItemVariant(action_url, variant_id)
    false

	adjustLineItemVariant = (url, variant_id) ->
	  $.ajax(
	    type: "PUT",
	    url: url,
	    data:
	      variant_id: variant_id
	  ).done (msg) ->
	    advanceOrder()