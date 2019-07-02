$(document).ready ->
  if $("#ask-to-invite-modal").html() != undefined
    $.fancybox.open({
      'href': '#ask-to-invite-modal',
      'width': 800,
      'height': 420,
      'autoSize' : false
    })

    $("#ask-to-invite-modal .cancel-invite").on "click", ->
      $.fancybox.close(true)

    $("#ask-to-invite-modal .accept-invite").on "click", ->
      InviteF()
      $.fancybox.close(true)

    return