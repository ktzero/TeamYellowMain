	
// Survey for user

app.controller('surveyCtrl', function($scope,$rootScope, $http) {
	$rootScope.getUserInfo();
	
	console.log("desc = ",$rootScope.userId);	
	$scope.getRoutine = function(intensity){
		
		var d = new Date($scope.date);
		var dateVal = d.format("MM/DD/YYYY");
	     
		 console.log("Selected date =",dateVal);
		 
			$scope.intensity = intensity;
	//		$scope.getLink = "http://localhost:8080/exerciseTracking/" + $rootScope.userId + "/" + $scope.intensity;
			$scope.getLink = "http://localhost:8080/dateMap/" + $rootScope.userId + "/" + dateVal + "/" + $scope.intensity;
				$http({
				  url: $scope.getLink,
				  method: 'POST',
				  transformResponse: [function (data) {
					  console.log("data=",data);
					  return data;
						}]
					}).success(function(data){
						$scope.surveyDone ="true";
					});
									
	}
	

				
	});	