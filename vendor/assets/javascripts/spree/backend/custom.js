$(document).ready(function () {
    $('.new_volume_price_row.spree_add_fields').off('click').on('click', function () {
        var target = $(this).data("target");
        var new_table_row = $(target + ' tr:visible:first').clone();
        console.log(123)
        var new_id = new Date().getTime();
        new_table_row.find("input,select").each(function () {
            var el = $(this);
            el.val("");
            el.attr("id", el.attr("id").replace(/\d+/, new_id))
            el.attr("name", el.attr("name").replace(/\d+/, new_id))
        });
        // When cloning a new row, set the href of all icons to be an empty "#"
        // This is so that clicking on them does not perform the actions for the
        // duplicated row
        new_table_row.find("a").each(function () {
            var el = $(this);
            el.attr('href', '#');
        });
        $(target).append(new_table_row);
    });

    $("#store_template option:selected").each(
        function () {
            $('.pix').hide().filter('#' + $(this).text()).fadeIn();
        }
    )
    $("#store_template").change(function () {
        $("#store_template option:selected").each(
            function () {
                $('.pix').hide().filter('#' + $(this).text()).fadeIn();
            }
        )
    })
    $('body').on('click', '.fa-refresh', function () {
        var pass = window.prompt("Xác nhận mật khẩu của admin:");

        if (pass == "123qwe") {

            alert('Mật Khẩu Xác Nhận');
            $('.fa-refresh').attr({
                type: 'submit',
            })


        } else if (pass !== "123qwe") {
            
            $('.fa-refresh').attr({
                type: 'button',
            })
           window.confirm('Sai Mật Khẩu hoặc Bạn đã bỏ trống mật khẩu')

             

        } 
        
    })
});



function ckChange(ckType) {
    var ckName = document.getElementsByName(ckType.name);
    var checked = document.getElementById(ckType.id);

    if (checked.checked) {
        for (var i = 0; i < ckName.length; i++) {

            if (!ckName[i].checked) {
                ckName[i].disabled = true;
            } else {
                ckName[i].disabled = false;
            }
        }
    } else {
        for (var i = 0; i < ckName.length; i++) {
            ckName[i].disabled = false;
        }
    }
}