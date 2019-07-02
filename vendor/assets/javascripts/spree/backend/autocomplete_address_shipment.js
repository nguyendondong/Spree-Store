var classli = ['list-group-item-success', 'list-group-item-info']
$( document ).ready(function() {
    
    var intervalName;
    $('#search').keyup(function(){
        let search = $(this).val();
        clearInterval(intervalName);
        if(search.length >= 3){
            intervalName = setInterval(function(){
                $("#ani-search-lead").addClass("active");
                $.ajax({
                    url: "/admin/addresses/"+ search +"/get_addresses",
                    type: 'Get',
                    data: {},
                    dataType: 'json',
                    success:function(response){
                       var len = response.length;
                        if(len >= 1){
                            var nameArray = []
                            var phoneArray = []
                            var altPhoneArray = []
                            var addrArray = []
                            var stateArray = []
                            var distArray = []
                            var sexArray = []
                            $("#searchResult").empty();
                            for( var i = 0; i<len; i++){
                                var fname = response[i]['firstname'] + ' / ' + (response[i]['sex']?response[i]['sex'] + ' / ' : ""  )  +
                                (response[i]['phone']?response[i]['phone'] + ' / ' : "") +
                                (response[i]['address1']?response[i]['address1'] + ' / ' : "") +
                                (response[i]['state_name'] ? (response[i]['state_name'] + (response[i]['district_name'] ? ' / ' + response[i]['district_name']  : "" )) : "");
                                $("#searchResult").append("<li style='cursor: pointer' class='invisible unit-result list-group-item fullwidth " + classli[parseInt(i%2)] + "' value='"+ i +"'>"+fname+"</li>");
                                nameArray.push(response[i].firstname);
                                phoneArray.push(response[i].phone);
                                sexArray.push(response[i].sex)
                                addrArray.push(response[i].address1)
                                altPhoneArray.push(response[i].alternative_phone);
                                stateArray.push(response[i].state_id);
                                distArray.push(response[i].district_id);
                            }
                            $("#ani-search-lead").removeClass("active");
                            $("#searchResult li").removeClass("invisible");
                            // binding click event to li
                            $("#searchResult li").bind("click",function(){ 
                                setText(this, nameArray,addrArray, phoneArray, altPhoneArray, stateArray, distArray, sexArray);
                            });
                        }
                        else{
                            $("#searchResult").empty();
                            $("#ani-search-lead").removeClass("active");
                            $("#searchResult").append("<li style='cursor: pointer; color: red;' class='unit-result list-group-item fullwidth'>Không tìm thấy kết quả nào!</li>");
                        }
                    },
                    error: function(response){
                        $("#searchResult").empty();
                        $("#searchResult").append("<li style='cursor: pointer; color: red;' class='unit-result list-group-item fullwidth'>Có lỗi xảy ra vui lòng thử lại sau!</li>");
                        $("#ani-search-lead").removeClass("active");
                    }
                });
              clearInterval(intervalName)
            }, 600);
        }
        else{
            $("#searchResult").empty();
            $("#searchResult").append("<li style='cursor: pointer; color: red;' class='unit-result list-group-item fullwidth'>Vui lòng nhập tối thiểu 3 ký tự!</li>");
        }
    })

    $(document).click(function (e){
        if(!$(event.target).hasClass('unit-result'))
            $("#searchResult").empty();
    })
});
function setText(element, nameArray,addrArray, phoneArray, altPhoneArray, stateArray, distArray, sexArray){
        index = $(element).val();
        $("#searchResult").empty();
        $('input#order_bill_address_attributes_firstname').val(nameArray[index]);
        $('input#order_bill_address_attributes_phone').val(phoneArray[index]);
        $('input#order_bill_address_attributes_alternative_phone').val(altPhoneArray[index]);
        $('input#order_bill_address_attributes_address1').val(addrArray[index]);
        $('#order_bill_address_attributes_sex').val(sexArray[index]).change();
        $('#order_bill_address_attributes_state_id').val(stateArray[index]).change();
        setTimeout(function(){$('#order_bill_address_attributes_district_id').val(distArray[index]).change();},3000);
}