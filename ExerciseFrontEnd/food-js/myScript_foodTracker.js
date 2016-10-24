app.controller('foodTrackerCtrl', function($scope, $http, filterFilter) {

	//not sure why but this is the way to make default buttons with AngularJS (checked="checked" doesn't work)
	$scope.selectedMeal="";

	
	//button to add selected foods to the summary table
	//note all foods selected will be added, only way to remove them now is to uncheck
	$scope.showSelected = function showSelected()
	{
		$scope.selected = filterFilter($scope.fullfoodlist, {selected:true});
		$scope.total = 0;
		for (var i = 0; i < $scope.selected.length;i++)
		{
			console.log($scope.selected[i]);
			$scope.total = $scope.total + $scope.selected[i].calories;
			console.log($scope.total);
		}	
	}
	
	//will take the items added in scope.selected and store in database
	$scope.addFoodDay = function()
	{
		
		console.log($scope.selected[0].description)
		var data=
		{
			description:$scope.selected[0].description,
			calories:$scope.selected[0].calories,
			protein:$scope.selected[0].protein,
			fat:$scope.selected[0].fat,
			carbs:$scope.selected[0].carbs,
			category_id:$scope.selected[0].client_id
		};
		
		data1 = $scope.selected;
		
		$http({
			url: "http://localhost:8080/storeFood/",
			method: 'POST',
			data: data1,
			}).success(function(data)
			{
				console.log(data.description);
			});
	}
	
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