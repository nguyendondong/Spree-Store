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
    //format currecy
    function formatPrice(number){
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(number);
    }



    // function draw chart slaes
    function salesOT(cate, val1, val2, val3, val4, val5, val6){
        var salesChart = Highcharts.chart('chart-sales-over',{
            chart: {
                type: 'column'
            },
            title: {
                text: 'Orders Over Time'
            },
            xAxis: {
                categories: cate
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Số đơn hàng'
                }
            },
            legend: {
                align: 'right',
                x: -30,
                verticalAlign: 'top',
                y: 25,
                floating: true,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },
            tooltip: {
                headerFormat: '<b>{point.x}</b><br/>',
                pointFormat: '{series.name}: {point.y}<br/>Tổng: {point.stackTotal}'
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'Đặt Hàng',
                data: val1,
            }, {
                name: 'Sẵn Sàng',
                data: val2,
                visible: false
            }, {
                name: 'Đang Ship',
                data: val3,
                visible: false
            },{
                name: 'Ship Thành Công',
                data: val4
            }, {
                name: 'Hủy',
                data: val5,
                visible: false
            }, {
                name: 'Trả Về',
                data: val6,
                visible: false
            }]
        
    });
    }

    //function draw chart orders
    function ordersOT(cate, val1, val2, val3, val4, val5, val6){
        var salesChart = Highcharts.chart('chart-sales-over-orders',{
            chart: {
                type: 'column'
            },
            title: {
                text: 'Sales Over Time'
            },
            xAxis: {
                categories: cate
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Giá Trị'
                }
            },
            legend: {
                align: 'right',
                x: -30,
                verticalAlign: 'top',
                y: 25,
                floating: true,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },
            tooltip: {
                formatter: function() {
                    return "<b>" + this.x +"</b><br/>" + this.series.name + ": " + formatPrice(this.y) + "<br/>Tổng: " + formatPrice(this.total);
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: false
                    }
                }
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'Đặt Hàng',
                data: val1,
                visible: false,
            }, {
                name: 'Sẵn Sàng',
                data: val2,
                visible: false
            }, {
                name: 'Đang Ship',
                data: val3,
                visible: false
            },{
                name: 'Ship Thành Công',
                data: val4
            }, {
                name: 'Hủy',
                data: val5,
                visible: false
            }, {
                name: 'Trả Về',
                data: val6,
                visible: false                
            }]
        
    });
    }


    //demo data
    // salesOT(['25/06', '26/06', '27/06', '28/06', '29/06', '30/06', '01/07', '02/07', '03/07', '04/07', '05/07', '06/07', '07/07', '08/07'],
    // [5, 3, 4, 7, 2,5,6,7,8,9,6,7,8,9,6],
    // [2, 2, 3, 2, 1,5,3,2,1,5,6,7,8,5,4],
    // [3, 4, 4, 2, 5,5,3,7,8,2,5,7,5,3,6],
    // [5, 3, 4, 7, 2,7,9,4,5,0,5,6,7,3,3],
    // [2, 2, 3, 2, 1,1,5,7,8,3,3,5,6,7,8],
    // [3, 4, 4, 2, 5,1,5,7,3,0,4,5,6,7,8]
    // );
    // ordersOT(['25/06', '26/06', '27/06', '28/06', '29/06', '30/06', '01/07', '02/07', '03/07', '04/07', '05/07', '06/07', '07/07', '08/07'],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000],
    // [500000, 300000, 400000, 700000, 200000,500000,600000,700000,800000,900000,600000,700000,800000,900000,600000]
    // );
















































    // toggle show custom pick date
    $("#date-range .list-date-range >select").change(function(){
        if($(this).val() == 0){
            $("#date-range .date-range-filter").addClass("active");
        }
        else{
            $("#date-range .date-range-filter").removeClass("active");
        }
    })
    function getDataChartServer(a, b, c){
        a = a || 0;
        b = b || 0;
        c = c || 0;
        $.ajax({
          type: "GET",
          url: "/admin/reports/sales_total",
          dataType: "json",
          data: {
            val1 : a,
            val2 : b,
            val3 : c
            },
          success: function(data){
            ab = data.dataSearch;
            valueChart1 = data.data1;
            valueChart2 = data.data2;
            valueChart3 = data.data3;

            $('#sales-ot-details').bootstrapTable('load', ab)
            $(".background-load").removeClass("active");
            ordersOT(valueChart3, valueChart1[0],valueChart1[1],valueChart1[2],valueChart1[3],valueChart1[4],valueChart1[5],);
            salesOT(valueChart3, valueChart2[0],valueChart2[1],valueChart2[2],valueChart2[3],valueChart2[4],valueChart2[5],);
            
        }
        })
    };
    getDataChartServer($("#d_time_report_gteq").val(), 0);
    function callGetData(){
        if($("#d_time_report_gteq").val() != 0){
            a = $("#d_time_report_gteq").val();
            b = 0;  
        }
        else{
            a = $("#date-range .datepicker-from").val();
            b = $("#date-range .datepicker-to").val();

        }
        c = $("#groupFilter").val();
            getDataChartServer(a, b, c);
    };

    // call get data when user change option
    $("#d_time_report_gteq").change(()=>{
        if($("#d_time_report_gteq").val() != 0){
            callGetData();  
        }
    })
    $("#groupFilter").change(()=>{
        callGetData();
    })
    $('.date-range-filter .datepicker-from').datepicker('option', 'onSelect', function(selectedDate) {
        callGetData(); 
    });
    $('.date-range-filter .datepicker-to').datepicker('option', 'onSelect', function(selectedDate) {
        callGetData(); 
    });
       
})
// table details
$('#sales-ot-details').bootstrapTable({
    columns: [{
        field: 'date_report',
        title: 'Mục',
        sortable: true
       }, {
           field: 'order_counts',
           title: 'Đơn Hàng',
           sortable: true
       }, {
        dataFormatter: "priceFormatter",
           field: 'item_total',
           title: 'Doanh thu gộp',
           sortable: true,
           
       }, {
           field: 'promo_total',
           title: 'Giảm giá'
       }, {
           field: 'item_return',
           title: 'Trả lại'
       }, {
           field: 'net_total',
           title: 'Doanh thu thuần'
       }, {
           field: 'shipment_total',
           title: 'Phí ship'
       }, {
           field: 'tax_total',
           title: 'Thuế'
       }, {
           field: 'total',
           title: 'Tổng doanh thu',
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
