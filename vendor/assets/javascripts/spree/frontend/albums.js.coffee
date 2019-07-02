$(document).ready ->
  $("#album-slider").royalSlider
    fullscreen:
      enabled: true
      nativeFS: true

  controlNavigation: "bullets"
  autoScaleSlider: true
  autoScaleSliderWidth: 960
  autoScaleSliderHeight: 661.2
  loop: true
  imageScaleMode: "fit-if-smaller"
  navigateByClick: true
  numImagesToPreload: 2
  arrowsNav: true
  arrowsNavAutoHide: true
  arrowsNavHideOnTouch: true
  globalCaption: true
  keyboardNavEnabled: true
  fadeinLoadedSlide: true

  $(document).on "click", "#photos-album .delete", ->
    id = $(this).parents(".photo").data("id")
    if confirm "Xóa hình ảnh này. Bạn có chắc không?"
      $.ajax
        url: '/photos/' + id
        type: 'delete'
        dataType : 'script'

  $(document).on "click", "#photos-album .select-cover-photo", ->
    album_id = $("#photos-album").data("album_id")
    photo_id = $(this).parents(".photo").data("id")
    $.ajax
      url: '/albums/' + album_id + '/set_cover?photo_id=' + photo_id
      type: 'post'
      dataType : 'script'


  $("#about-albums-competition #competition-rules").on "click", ->
    window.scrollTo(0, $("#competition-rules-content").offset().top - 50)
  $("#about-albums-competition #participants").on "click", ->
    window.scrollTo(0, $("#participants-content").offset().top - 50)
  $("#about-albums-competition #award-structures").on "click", ->
    window.scrollTo(0, $("#award-structures-content").offset().top - 50)

  if $("#ask-to-share-album-modal").html() != undefined
    $.fancybox.open({
      'href': '#ask-to-share-album-modal',
      'width': 500,
      'height': 50,
      'autoSize' : false
    })

    $("#ask-to-share-album-modal .accept-share").on "click", ->
      shareAlbum()
      $.fancybox.close(true)

    return

  $("#join-competition").on "click", ->
    if $(this).data("signed")
      unless $(this).data("phone")
        $.fancybox.open({
          'href': '#ask-to-update-phone-modal',
          'width': 300,
          'height': 130,
          'autoSize' : false
        })
        return false

  $("#ask-to-update-phone-modal .update-phone").on "click", ->
    $("#ask-to-update-phone-modal .error").hide()
    $.ajax({
      type: "POST",
      url: "/users/update_phone?phone=" + $("#ask-to-update-phone-modal .phone").val(),
      error: (xhr, status) ->
        console.log (status)
      ,
      success: (html)->
        if html.result == "invalid"
          $("#ask-to-update-phone-modal .error").show()
          $("#ask-to-update-phone-modal .error").text("Số điện thoại không hợp lệ")
        else
          $("#ask-to-update-phone-modal .success").show()
          $("#ask-to-update-phone-modal .success").text("Cập nhật số điện thoại thành công")
          setTimeout ->
            window.location = "/my-albums"
          , 1500
    })
    return

window.likeAlbum = (album_tag, response) ->
  $.ajax({
    type: "POST",
    url: "/albums/"+album_tag+"/like",
    error: (xhr, status) ->
      console.log (status)
    ,
    success: (html)->

    })
  return

window.unlikeAlbum = (album_tag, response) ->
  $.ajax({
    type: "POST",
    url: "/albums/"+album_tag+"/unlike",
    error: (xhr, status) ->
      console.log (status)
    ,
    success: (html)->

    })
  return
