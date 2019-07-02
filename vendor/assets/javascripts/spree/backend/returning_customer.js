$(document).ready(()=>{
    //active link
    site = window.location.pathname.split('/').pop();
    $("#top-link .menu-link >a").each(function(){
        site2 = $(this).attr("href").split('/').pop();
        if(site == site2){
                $(this).addClass("selected");
                return false;
        }
    });
    //show and hide date range
    $("#rc-date-range").change(function(){
        $(this).next().removeClass("active");
        if($(this).val() == "tuyChinh"){
            $(this).next().addClass("active");
        }
    })
    // draw chart
    function reCustomer(data){
        var reCustomerChart = Highcharts.chart('chart-re-customer',{
            chart: {
                backgroundColor: '#eff5fc',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie',
            },
            title: {
                text: '',
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            series: [{
                name: 'Giá Trị',
                colorByPoint: true,
                data: data
            }]
        })
    };
    reCustomer([{
        name: 'Returning',
        y: 40,
    }, {
        name: 'New',
        y: 90
    }]); 
});
//table
$('#returning-cus-details').bootstrapTable({
    columns: [{
        field: 'Name',
        title: 'Tên Khách Hàng',
        sortable: true
       }, {
           field: 'first-order',
           title: 'Đặt Hàng Lần Đầu',
           sortable: true
       }, {
           field: 'last-order',
           title: 'Đặt Hàng Lần Cuối',
           sortable: true
       }, {
           field: 'total-order',
           title: 'Tổng Số Đơn Hàng',
           sortable: true
       }, {
           field: 'average-order',
           title: 'GTTB Đơn Hàng',
           sortable: true
       }, {
           field: 'total-value',
           title: 'Tổng GT Đơn Hàng',
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