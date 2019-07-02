
        $(document).ready(()=>{
            let arrText = ["Hôm Nay", "Tuần Này", "Tháng Này", "Quý Này", "Năm Này"];
            $(".general >select").change(()=>{
                let va = $(".general >select").val();
                $(".total-sale .head-item-title >h4").text("Doanh Thu " + arrText[va]);
                $(".total-order .head-item-title >h4").text("Đơn Hàng " + arrText[va]);
                $(".total-visit .head-item-title >h4").text("Lượt Xem " + arrText[va]);
                $(".total-sale .head-item-title .total-value").css("display", "none");
                $(".total-sale .list-value .item-value").css("display", "none");
                $(".total-order .head-item-title .total-value").css("display", "none");
                $(".total-order .list-value .item-value").css("display", "none");
                $(".total-visit .head-item-title .total-value").css("display", "none");
                $(".total-visit .list-value .item-value").css("display", "none");
                $(".total-sale .head-item-title .total-value").eq(va).slideDown();
                $(".total-sale .list-value .item-value").eq(va).css("display", "block");
                $(".total-order .head-item-title .total-value").eq(va).slideDown();
                $(".total-order .list-value .item-value").eq(va).css("display", "block");
                $(".total-visit .head-item-title .total-value").eq(va).slideDown();
                $(".total-visit .list-value .item-value").eq(va).css("display", "block");
   
            })




            // chart
            function sales(firstKey,firstValue,secondKey,secondValue){
                var salesChart = Highcharts.chart('sales-chart',{
                    chart: {
                        backgroundColor: 'white',
                    },
                    title: {
                        text: 'DOANH THU THEO THÁNG',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6',
                            '7', '8', '9', '10', '11', '11', '12', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26','27','28', '29', '30','31']
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
                        formatter: function() {
                            return 'Tháng: ' + this.series.name + '<br/>' + 'Doang thu ngày ' + this.x + '</b><b>: ' + this.y + '</b> VNĐ. ';
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white",},
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
                        name: firstKey,
                        data: firstValue,
                        color: '#c5bfbf',
                        lineWidth: 4,
                        borderRadius: 0
                    }, {
                        name: secondKey,
                        data: secondValue,
                        lineWidth: 4,
                        color: '#af88e2',
                    }]
                });
                $("#sales-btn").click(function(){
                
                    if($('.b-sales').hasClass('zoom')){
                        $('.b-sales').removeClass("zoom");
                        let widthEl = $('.db-content-chart').width()/100*49;
                        salesChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Mở rộng");
                    }
                    else{
                    $('.b-sales').addClass("zoom");
                        let widthEl = $('.db-content-chart').width();
                        salesChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Thu nhỏ");
                    }
                })
            }
            function orders(firstKey,firstValue,secondKey,secondValue){
                var odersChart = Highcharts.chart('total-order-chart',{
                    chart: {
                        backgroundColor: 'white',
                    },
                    title: {
                        text: 'ĐƠN HÀNG THEO THÁNG',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6',
                            '7', '8', '9', '10', '11', '11', '12', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26','27','28', '29', '30','31']
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
                        formatter: function() {
                            return 'Tháng: ' + this.series.name + '<br/>' + 'Ngày ' + this.x + '</b>: có <b>' + this.y + '</b> đơn hàng. ';
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white",},
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
                        name: firstKey,
                        data: firstValue,
                        color: '#c5bfbf',
                        lineWidth: 4,
                        borderRadius: 0
                    }, {
                        name: secondKey,
                        data: secondValue,
                        lineWidth: 4,
                        color: '#af88e2',
                    }]
                });
                $("#oders-btn").click(function(){
                
                    if($('.b-total-order').hasClass('zoom')){
                        $('.b-total-order').removeClass("zoom");
                        let widthEl = $('.db-content-chart').width()/100*49;
                        odersChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Mở rộng");
                    }
                    else{
                    $('.b-total-order').addClass("zoom");
                        let widthEl = $('.db-content-chart').width();
                        odersChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Thu nhỏ");
                    }
                })
            }
            function averageOrderValue(firstKey,firstValue,secondKey,secondValue){
                var averageOrderValueChart = Highcharts.chart('average-order-value-chart',{
                    chart: {
                        backgroundColor: 'white',
                    },
                    title: {
                        text: 'GIÁ TRỊ TRUNG BÌNH ĐƠN HÀNG THEO THÁNG',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6',
                            '7', '8', '9', '10', '11', '11', '12', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26','27','28', '29', '30','31']
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
                        formatter: function() {
                            return 'Tháng: ' + this.series.name + '<br/>' + 'GTTB đơn hàng ngày ' + this.x + '</b><b>: ' + this.y + '</b> VNĐ. ';
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white",},
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
                        name: firstKey,
                        data: firstValue,
                        color: '#c5bfbf',
                        lineWidth: 4,
                        borderRadius: 0
                    }, {
                        name: secondKey,
                        data: secondValue,
                        lineWidth: 4,
                        color: '#af88e2',
                    }]
                });
                $("#average-order-value-btn").click(function(){
                
                    if($('.b-average-order-value').hasClass('zoom')){
                        $('.b-average-order-value').removeClass("zoom");
                        let widthEl = $('.db-content-chart').width()/100*49;
                        averageOrderValueChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Mở rộng");
                    }
                    else{
                    $('.b-average-order-value').addClass("zoom");
                        let widthEl = $('.db-content-chart').width();
                        averageOrderValueChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Thu nhỏ");
                    }
                })
            }
            function onlineStoreSections(firstKey,firstValue,secondKey,secondValue){
                var onlineStoreSectionsChart = Highcharts.chart('online-store-sections-chart',{
                    chart: {
                        backgroundColor: 'white',
                    },
                    title: {
                        text: 'TỔNG LƯỢT TRUY CẬP CỬA HÀNG THEO THÁNG',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6',
                            '7', '8', '9', '10', '11', '11', '12', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26','27','28', '29', '30','31']
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
                        formatter: function() {
                            return 'Tháng: ' + this.series.name + '<br/>' + 'SLTC ngày ' + this.x + '</b><b>: ' + this.y + '</b> lượt. ';
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white",},
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
                        name: firstKey,
                        data: firstValue,
                        color: '#c5bfbf',
                        lineWidth: 4,
                        borderRadius: 0
                    }, {
                        name: secondKey,
                        data: secondValue,
                        lineWidth: 4,
                        color: '#af88e2',
                    }]
                });
                $("#online-store-sections-btn").click(function(){
                
                    if($('.b-online-store-sections').hasClass('zoom')){
                        $('.b-online-store-sections').removeClass("zoom");
                        let widthEl = $('.db-content-chart').width()/100*49;
                        onlineStoreSectionsChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Mở rộng");
                    }
                    else{
                    $('.b-online-store-sections').addClass("zoom");
                        let widthEl = $('.db-content-chart').width();
                        onlineStoreSectionsChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Thu nhỏ");
                    }
                })
            }
            function reCusRate(firstKey,firstValue,secondKey,secondValue){
                var reCusRateChart = Highcharts.chart('re-cus-rate-chart',{
                    chart: {
                        type: 'area',
                        backgroundColor: 'white',
                    },
                    title: {
                        text: 'TỶ LỆ NGƯỜI DÙNG MỚI VÀ NGƯỜI DÙNG QUAY TRỞ LẠI',
                        style: {
                            color: '#1b2947',
                            fontWeight: 'bold',
                            fontSize: '16px',
                        }
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6',
                            '7', '8', '9', '10', '11', '11', '12', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26','27','28', '29', '30','31']
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
                        formatter: function() {
                            return 'Người Dùng ' + this.series.name + '<br/>' + 'Ngày ' + this.x + '</b><b>: ' + this.y + '</b> lượt. ';
                        },
                        backgroundColor: '#1b2947',
                        style: {"color":"white",},
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
                        name: firstKey,
                        data: firstValue,
                        color: '#c5bfbf',
                        lineWidth: 4,
                        borderRadius: 0
                    }, {
                        name: secondKey,
                        data: secondValue,
                        lineWidth: 4,
                        color: '#af88e2',
                    }]
                });
                $("#re-cus-rate-btn").click(function(){
                
                    if($('.b-re-cus-rate').hasClass('zoom')){
                        $('.b-re-cus-rate').removeClass("zoom");
                        let widthEl = $('.db-content-chart').width()/100*49;
                        reCusRateChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Mở rộng");
                    }
                    else{
                    $('.b-re-cus-rate').addClass("zoom");
                        let widthEl = $('.db-content-chart').width();
                        reCusRateChart.update({
                            chart: {
                                width: widthEl
                            }
                        });
                        $(this).text("Thu nhỏ");
                    }
                })
            }
          sales("4/2019",[900000, 750000, 1800000,0,2300000,900000,0,800000,1290000,2000000,2100000,0,2300000,900000,0,800000,1290000,2000000,2100000,900000,0,800000,1290000,2000000,2100000, 2400000, 1500000, 900000, 1000000, 1200000, 2000000],"5/2019",[0, 0, 0, 760000, 1200000, 1800000,3800000, 900000]);
          orders("4/2019",[9, 5, 10, 3, 6, 8, 7, 8, 12, 11, 6, 4, 11, 9, 6, 8, 4, 2, 0, 1, 0, 8, 12, 15, 11, 5, 6, 9, 10, 5, 7],"5/2019",[0, 5, 6, 3, 8, 9, 7, 5]);
          averageOrderValue("4/2019",[900000, 750000, 1800000,0,2300000,900000,0,800000,1290000,2000000,2100000,0,2700000,1200000,0,700000,1490000,2000000,2100000,900000,0,800000,1290000,2000000,2100000, 2400000, 1500000, 900000, 1000000, 1200000, 2000000],"5/2019",[0, 0, 0, 980000, 190000, 1200000,2700000, 800000]);
          onlineStoreSections("4/2019",[40, 76, 50,90, 30, 40, 50, 70, 68, 73, 78, 75, 80, 74, 74, 72, 60, 68, 72, 77, 80, 77, 50, 55, 80, 76, 73, 70, 65, 60, 55],"5/2019",[0, 60, 40, 35, 40, 46, 48, 50, 50, 30,35, 46, 50, 59, 63, 69, 74]);
          reCusRate("Quay Trở Lại",[9, 5, 10, 3, 6, 8, 7, 8, 12, 11, 6, 4, 11, 9, 6, 8, 4, 2, 0, 1, 0, 8, 12, 15, 11, 5, 6, 9, 10, 5, 7],"Lần Đầu",[0, 5, 6, 3, 8, 9, 7, 5]);
        });
