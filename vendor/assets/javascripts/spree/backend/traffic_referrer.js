$(document).ready(()=>{
    $("#str-date-range").change(function(){
        $(this).next().removeClass("active");
        if($(this).val() == "tuyChinh"){
            $(this).next().addClass("active");
        }
    })

    // active link
    site = window.location.pathname.split('/').pop();
    $("#top-link .menu-link >a").each(function(){
        site2 = $(this).attr("href").split('/').pop();
        if(site == site2){
                $(this).addClass("selected");
                return false;
        }
    });
})
$("#table-sales-tr").bootstrapTable({
    columns: [{
        field: 'tra_re_sou',
        title: 'Traffic Referrer Source',
        sortable: true
       }, {
           field: 'otra_re_name',
           title: 'Traffic Referrer Name',
           sortable: true
       }, {
           field: 'orders',
           title: 'Số Đơn Hàng',
           sortable: true
       }, {
           field: 'total_sales',
           title: 'Giá Trị Sales',
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