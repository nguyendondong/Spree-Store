$(document).ready(()=>{
    //show and hide date range
    $("#sbp-date-range").change(function(){
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

    //format currency
    function formatPrice(number){
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(number);
    }

    //draw chart 
    function salesBP(title, data){
                    valueSelect = $("#s-content").val();
                    link = [];
                    name1 = [];
                    price = [];
                    sku = [];
                    for(let ob of data){
                      name1.push(ob.data2);
                      link.push(ob.data3);
                      sku.push(ob.data1);
                      price.push(ob.data4);
                    }
                    var salesChart = Highcharts.chart('chart-sales-bp',{
                    chart: {
                        backgroundColor: '#eff5fc',
                        type: "column"
                    },
                    title: {
                        text: 'TOP PRODUCTS',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: sku,
                        labels: {
                                formatter: function () {
                                    var indexT = sku.indexOf(this.value);
                                    return '<a href="' + link[indexT] + '">' + this.value + '</a>';
                                }  
                        },
                        useHTML: true
                    },
                    yAxis: {
                        title:{
                            text: null
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        useHTML: true,
                        formatter: function() {
                            var indexT = sku.indexOf(this.x);
                            if(valueSelect == 1 || valueSelect == 4){
                                return name1[indexT] + "<br /> <br />" + "Số lượng bán ra: " + this.y + " cái";
                            } 
                            else{

                                return name1[indexT] + "<br /> <br />" + "Giá Trị: " + formatPrice(this.y);
                            }
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white", "width":"160px"},
                        borderWidth: 0,
                    },
                    credits: {
                        enabled: false
                    },
                    legend: {
                        align: 'center',
                        verticalAlign: 'top',
                        floating: false,
                        x: 0,
                        y: 30
                    },
                    plotOptions: {
                        line: {
                            marker: {
                                enabled: false
                            }
                        }
                    },
                    series: [{
                        name: title,
                        data: price,
                        color: '#eecf53',
                        lineWidth: 4,
                        borderRadius: 0,
                    }]
    })
    };
    function typeProducts(date, data){
        var typeChart = Highcharts.chart('chart-type-products',{
            chart: {
                backgroundColor: '#eff5fc',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie',
            },
            title: {
                text: 'SALES BY TYPES PRODUCTS',
                style: {
                    color: '#1b2947',
                    fontWeight: 'bold',
                    fontSize: '16px',
                }
            },
            subtitle: {
                text: date,
                style: {
                    color: '#1b2947',
                    fontWeight: 'bold',
                    fontSize: '13px',
                }
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

    // draw chart and demo change select
    salesBP("Top Bán Chạy Nhất Hôm Nay",[{data1: "DHSK-001", data2: "Đồng hồ nam abc bac diong hyuw khdaw kahwdi ahwdi akdwh", data3: "https://google.com", data4: 8}, {data1: "DHSK-002", data2: "Đồng hồ nữ conflict", data3: "https://google.com", data4: 4}, {data1: "DHSK-003", data2: "Đồng hồ  plict tutu", data3: "https://google.com", data4: 6}, {data1: "DHSK-004", data2: "Đồng hồ nam abc bac diong hyuw khdaw kahwdi ahwdi akdwh", data3: "https://google.com", data4: 8}, {data1: "DHSK-005", data2: "Đồng hồ nữ conflict", data3: "https://google.com", data4: 4}]);
    typeProducts(" HÔM NAY",[{
        name: 'Đồng Hồ Nam',
        y: 10,
    }, {
        name: 'Đồng Hồ Nữ',
        y: 5
    }, {
        name: 'Đồng Hồ Cặp',
        y: 9
    }, {
        name: 'ĐH Thông Minh',
        y: 3
    }, {
        name: 'ĐH Khác',
        y: 4.18
    }]);    
});
//table
$("#sales-bp-details").bootstrapTable({
        columns: [{
            field: 'sku',
            title: 'SKU',
           }, {
               field: 'product-title',
               title: 'Tên'
           }, {
               field: 'product-type',
               title: 'Loại Sản Phẩm'
           }, {
               field: 'gia-von',
               title: 'Giá Vốn',
               sortable: true
           }, {
               field: 'gia-ban',
               title: 'Giá Bán',
               sortable: true
           }, {
               field: 'on-hand',
               title: 'Tồn Kho',
               sortable: true
           }, {
               field: 'ban-ra',
               title: 'Bán Ra',
               sortable: true
           }, {
               field: 'Sl-nhap',
               title: 'Số Lượng Cần Nhập',
               sortable: true
           }, {
               field: 'sales',
               title: 'Doanh Thu',
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
