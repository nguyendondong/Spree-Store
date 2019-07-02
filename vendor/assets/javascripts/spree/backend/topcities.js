$(document).ready(()=>{
    //show and hide date range
    $("#sct-date-range").change(function(){
        $(this).next().removeClass("active");
        if($(this).val() == "tuyChinh"){
            $(this).next().addClass("active");
        }
    })
    //active link
    site = window.location.pathname.split('/').pop();
    $("#top-link .menu-link >a").each(function(){
        site2 = $(this).attr("href").split('/').pop();
        if(site == site2){
                $(this).addClass("selected");
                return false;
        }
    });
})
//table
$("#table-sales-ct").bootstrapTable({
    columns: [{
        field: 'country',
        title: 'Tỉnh/Thành Phố',
        sortable: true
       }, {
           field: 'orders',
           title: 'Đơn Hàng',
           sortable: true
       }, {
           field: 'products',
           title: 'Sản Phẩm',
           sortable: true
       }, {
           field: 'vulue',
           title: 'Giá Trị',
           sortable: true
       }, {
           field: 'total-success',
           title: 'Giá Trị Thành Công',
           sortable: true
       }, {
           field: 'total-success-percent',
           title: 'Phần trăm giá trị thành công',
           sortable: true
       }],
    pagination: true,
    search: true,
    sortable: true,
    showColumns: true,
    showToggle: true,
    searchAlign: 'left',
    formatSearch: function () {
        return 'Tìm kiếm'
    }
});