window.postComment = (product_slug, response) ->
  console.log "product comment"
  console.log $.extend({product_slug: product_slug}, response)
  $.ajax({
    	type: "POST",
    	url: "/comments",
    	data: $.extend({product_slug: product_slug}, response),
    	error: (xhr, status) ->
      	console.log (status)
      ,
    	success: (html)->

    })
  return