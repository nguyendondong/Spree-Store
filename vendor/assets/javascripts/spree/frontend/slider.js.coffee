$(document).ready ->
  if $("#home-slider").size() != 0
    $("#home-slider").imagesLoaded( ->
      $("#home-slider").carouFredSel(
        width: "100%"
        scroll:
          fx: 'swing'
          items: 1
          pauseOnHover: true

        circle: false
        infinite: false
        responsive: true
        items:
          visible: 1
        auto:
          play: true

        prev:
          button: "#home-slider-carousel-prev"
          key: "left"

        next:
          button: "#home-slider-carousel-next"
          key: "right"
        pagination	: "#home-slider-pagination"
      )
    )

    $("#home-slider img").on "click", ->
      if $(this).data("href") != ""
        window.open($(this).data("href"), '_blank');