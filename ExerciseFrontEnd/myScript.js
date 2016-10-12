var app = angular.module("MyApp", ["ngRoute"]);

app.controller("mainCtrl", ['$http', function($http) {
		}])
		
app.config(['$routeProvider', function($routeProvider) {

		$routeProvider
		.when('/', {
			templateUrl: 'home.html'

		})
		.when('/about', {
		templateUrl : "/about.html"
		
		})
		.when('/addUser', {
		templateUrl : "/createUser.html"
		
		})
		.when('/login', {
		templateUrl : "/loginUser.html"
		
		})
		
		.otherwise({redirectTo: '/'});

	}]); // end config
  
  

// Add Student logic 

app.controller('addCtrl', function($scope, $http) {
		 $scope.createUser = function(){
		   $("#FName").prop("disabled", true);
		   $("#LName").prop("disabled", true);
		   $("#UserId").prop("disabled", true);
		   $("#PassWord").prop("disabled", true);
		   $("#ConPwd").prop("disabled", true);
		
		$scope.addLink = "http://localhost:8080/user/add/" +$scope.fname+"/"+$scope.lname+"/"+$scope.userId+
			"/"+$scope.passWord;
			
			$http({
				  url: $scope.addLink,
				  method: 'POST',
				  transformResponse: [function (data) {
					  // Do whatever you want!
					  console.log("data=",data);
					  return data;
				  }]
				});
			
		}
	
	});		

app.controller('loginCtrl', function($scope, $http) {
		
		$scope.loginUser = function(){
		 		
			$scope.addLink = "http://localhost:8080/login/" +$scope.userId+ "/"+$scope.passWord;
							
				$http({
					  url: $scope.addLink,
					  method: 'POST',
					  transformResponse: [function (data) {
						  // Do whatever you want!
						  console.log("data=",data);
						  return data;
					  }]
					}).success(function(data){
						console.log("Success login");
						$scope.loginFlag = "true";
						$scope.loginResult = data;						
					});
				
		}
	
	});		

