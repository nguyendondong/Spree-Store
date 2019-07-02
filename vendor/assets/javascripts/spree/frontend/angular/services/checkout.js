myApp.factory('CheckoutUpdate',['$resource', function($resource){
	return $resource('/orders/populate.json', {},{create: {method: 'POST', headers: {'Content-Type': 'application/json'}}});
}]);

myApp.factory('UpdateAddress',['$resource', function($resource){
	return $resource('/checkout/update/address.json', {},{create:  {method:'PATCH', headers: {'Content-Type': 'application/json'}}});
}]);

