window.myApp.controller('myController',['$scope','$http','$resource','$route','UpdateAddress','CheckoutUpdate',function($scope,$http,$resource,$route,UpdateAddress,CheckoutUpdate){
	$scope.tinh=[];
	$scope.variant_id =null;
	$scope.quantity = null;
	$scope.state = null;
	$scope.districts = null;
	$scope.order = null;
	$scope.bill_address_attributes = {
		firstname: "",
		phone: "",
		state_id : "",
		address1 : "",
		district_id : "",
		email : "",
		country_id : 84,
		lastname : 'AB',
		zipcode : 70000,
		city : ""
	}

	$scope.toMoney = function(n, currency) {
    return parseFloat(n).toFixed(1).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") + ' ' + currency;
	}

	$scope.selectState = function() {

      $http({method: "GET", url: '../districts.json?state_id='+$scope.bill_address_attributes.state_id}).
        success(function(data, status) {
          $scope.districts = data;
        }).
        error(function(data, status) {
      });
    };

    $scope.updateAddress = function(){

    	console.log($scope.bill_address_attributes);
    	UpdateAddress.create({utf8: "✓", authenticity_token: "UnLilYjKz8F8gUXHMFLtz2Ky2tlKGTRX4h2bR3NF0UA=",order: { bill_address_attributes: $scope.bill_address_attributes }},
			function(data){
				if(data.status ==  "success")
					window.location.replace('/orders/'+data.order.number+'/token/'+ data.order.guest_token);
				}
			);
		return false;
    };

	$scope.getOrder = function(){
		console.log($scope.variant_id + "-" + $scope.quantity);
		CheckoutUpdate.create({variant_id: $scope.variant_id, quantity: $scope.quantity, utf8: "✓", authenticity_token: "AQTExwaaLU9ACQXobnRtjKmygcrjBfCGeVZXAFDdPBU="},
			function(data){
				$scope.state = data.state;
				$scope.order = JSON.parse(data.order);
				}
			);
		return false;
	};
}])

