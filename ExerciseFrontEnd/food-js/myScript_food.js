//Getting food from ID
//search.$inject = ["foods"]
app.controller('foodCtrl', function($scope, $http, $filter) {

	//not sure why but this is the way to make default buttons with AngularJS (checked="checked" doesn't work)
	$scope.selectedMeal="";

	//this will get all the food categories
	$scope.getLink = "http://localhost:8080/foodcategories/";
		$http({
			url: $scope.getLink,
			method: 'GET',
				
			}).success(function(data){
				$scope.foodcategorylist = data;
			});
				
	//this will get the entire food list
	$scope.getLink = "http://localhost:8080/food/";
		$http({
			url: $scope.getLink,
			method: 'GET',
				
			}).success(function(data){
				$scope.fullfoodlist = data;
			});

				
	this.search= function(id){
		console.log("d passed:",id); 
	
		$scope.getLink = "http://localhost:8080/food/"+id;
				$http({
					  url: $scope.getLink,
					  method: 'GET',
				
					}).success(function(data){
						$scope.foodlist = data;						
					});
	}
});