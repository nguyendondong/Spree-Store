$(document).ready(()=>{
    { // change layout list store
      var topStr = `<label for="product_stores"><span class="translation_missing" title="translation missing: vi.spree.stores">Stores</span></label>`;
      var a = $('#change-layout-mulple-domain >p').text();
      var b = $('#change-layout-mulple-domain >p').html();
      var res = a.split("\n");
      res.shift();
      res.shift();
      res.pop();
      var x  = res.map((item, index) => {
        return item.trim()
      })
      b = b.replace(topStr, "");
      b = b.replace("<br>", "");
      $.each(x, function( index, value ) {
        b = b.replace(value, `<div>${value}</div></div><div class="list-store-view">`);
      })
      $('#change-layout-mulple-domain >p').html(`${topStr}<div class="list-store-view">${b}</div>`);
    }
    // auto choose default image == first image
    function setFirstImage(){
      var elFirst = $("#list-imapr >li").eq(0);
      $("#product_cover_image_id_field  .hidden-select-main-image").attr("id",`product_cover_image_id_${$(elFirst).data("id")}`);
      $("#product_cover_image_id_field  .hidden-select-main-image").attr("value",$(elFirst).data("id"));
    } 
    setFirstImage();     


    //call ajax when upload image
    $('#new_product_image').on('submit', function(e) {
      e.preventDefault();
      var $data = new FormData(this);
      ulrPa = $(".edit_product").attr("action");
      var indexCh = -1;
      $('.image-ct >input').each(function(index) {
          if ($(".image-ct >input").is(":checked")) {
              return indexCh = index;
          }
      });
  
      $.ajax({
        type: 'POST',
        url: `${ulrPa}/images`,
        data: $data,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
          $("#file_upload").val('');
          var product = JSON.parse(data.product);
          console.log(product);
          appendImage(product);
        },
        error: function (data) {
          console.log("Error");
        }
      });
    });
  
    $('#file_upload').on('change', function () {
      $('#new_product_image').submit();
    });
    //append image and call again ajax
    function appendImage(product){
      var html = '';
      $.each(product.variant_images, function(i, q) {
        html += `<li data-id="${q.id}"><div class="image-ct"><img alt="${product.name}" src="/spree/products/${q.id}/small/${q.attachment_file_name}"><div class="image-act"><a href="#" class="fa fa-arrow-up insert-image" data-url="/spree/products/${q.id}/large/${q.attachment_file_name}"></a><a class="delete-image-pr fa fa-trash icon_link with-tip no-text" data-action="remove" data-confirm="Bạn có chắn chắn không?" href="/admin/products/${product.slug}/images/${q.id}" url="/admin/products/${product.slug}/images/${q.id}"></a></div></div><div class="drop-drag-bg"></div></li>`
      });
      abc = `<li id="add-new-impr">
      <form id="new_product_image">
        <div class="file_upload_btn">
          <input type="file" name="image[attachment][]" id="file_upload" multiple>
            <i class="fa fa-plus"></i>
        </div>
      </form>
    </li>`
      $('#list-imapr').html(html);
      $('#list-imapr').append(abc);
      setFirstImage();
      $('#new_product_image').on('submit', function(e) {
        e.preventDefault();
        var $data = new FormData(this);
        ulrPa = $(".edit_product").attr("action");
        var indexCh = -1;
        $('.image-ct >input').each(function(index) {
            if ($(".image-ct >input").is("checked")) {
                indexCh = index;
                return false; 
            }
        });
        $.ajax({
          type: 'POST',
          url: `${ulrPa}/images`,
          data: $data,
          cache: false,
          contentType: false,
          processData: false,
          success: function (data) {
            $("#file_upload").val('');
            var product = JSON.parse(data.product);
            console.log(product);
            appendImage(product);
          },
          error: function (data) {
            console.log("Error");
          }
        });
      });
      $('#file_upload').on('change', function () {
        $('#new_product_image').submit();
      });
      $(".insert-image").click(function(event){
        event.preventDefault();
        var image_url = $(this).attr("data-url");
        var image_tag="<img src='"+ image_url + "'>";
        var doctarget = CKEDITOR.instances.editable;
        CKEDITOR.instances['product_description'].insertHtml(image_tag);
        //doctarget.insertHtml(image_tag);
        return false;
      })

    };
    //delete image
    $('body').on('click', '.delete-image-pr', function() {
      var el = $(this);
      if (confirm(el.data("confirm"))) {
        $.ajax({
          type: 'POST',
          url: $(this).prop("href"),
          data: {
            _method: 'delete',
            authenticity_token: AUTH_TOKEN
          },
          dataType: 'script',
          success: function(response) {
            el.parent().parent().parent().fadeOut('hide', function() {
              $(this).remove();
            });
          },
          error: function(response, textStatus, errorThrown) {
            show_flash('error', response.responseText);
          }
        });
      }
      return false;
    });
    function updatePosition(){
      let listEl = $("#list-imapr >li");
      var obPositions = {};
      $.each(listEl, function( index, value ) {
        let a = $(value).data("id");
        if(a == undefined){
          return true
        }
        obPositions['positions['+a+']'] = index;
      })
      dataPosition = obPositions
      $.ajax({
        type: 'POST',
        url: $("#list-imapr").data("drag-drop-vs"),
        data: dataPosition,
        success: function () {
          console.log("Insert success");
        }
      });
    }
    $(function() {
      $("#list-imapr").sortable({
      placeholder: 'placeholder',
      distance: 15,
      scroll: false,
      tolerance: "pointer",   
      items: "li:not(#add-new-impr)",
      stop: function() {
        setFirstImage();
        updatePosition();
      }
      });
    });

    
  });