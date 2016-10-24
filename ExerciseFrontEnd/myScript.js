var loggedIn;


var app = angular.module("MyApp", ["youtube-embed","ngRoute","ng-fusioncharts"]);

app.controller("mainCtrl", function($scope, $rootScope, $http) {
	
	
	
	$scope.logout = function(){
		
	if(sessionStorage.userId !== "null"){		
		clearUserInfo();
		$rootScope.loggedInFlag = loggedIn;
		alert("You are logged out successfully!!!");	
	}
	else alert(" You are not logged in ");
	}
	
		});
		
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
		templateUrl : "/loginUserTrial.html"
		
		})
		.when('/exerciseCategories', {
		templateUrl : "/exerciseCategories.html"
		
		})
		.when('/exercise', {
		templateUrl : "/exercises.html"
		
		})
		.when('/survey', {
		templateUrl : "/survey.html"
		
		})
		.when('/exerciseTracking', {
		templateUrl : "/routineDisplay2.html"
		
		})
		.when('/trackThisDay', {
		templateUrl : "/trackADay.html"
		
		})
		.when('/weeklyProgress', {
		templateUrl : "/weeklyProgress.html"
		
		})
		
		.otherwise({redirectTo: '/'});

	}]); // end config
  
  

// Add New user logic 

app.controller('addCtrl', function($scope, $http) {
	$scope.loggedInFlag = loggedIn;
	
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

	
	// User login logic 
app.controller('loginCtrl', function($scope,$rootScope, $http) {
		

		
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
						var str = data;
						console.log("String =",str);
						var res = str.search("password");
						console.log("res=",res);
						if (res === -1) {
							var pos1 = str.indexOf("!!");
							var pos2 = str.lastIndexOf("!!");
							var name = data.substring(pos1+2,pos2);
							storeUserInfo($scope.userId,name);
						//	sessionStorage.setItem("userName", name);
						//	sessionStorage.setItem("userId", $scope.userId);
							console.log("Name =",name);
							$scope.loginSuccess = true;
							
		// this logic is to skip survey page if the user took survey already 					
							$scope.getLink = "http://localhost:8080/exerciseTracking/"+$scope.userId
							$http({
									  url: $scope.getLink,
									  method: 'POST'
								}).success(function(data){
									$scope.records = data;
									$scope.surveyDone = false;
									console.log("data = ",$scope.records);
										for (var desc in $scope.records){
											console.log("Exercise Names : ",$scope.records[desc].ex_name);
											if($scope.records[desc].todays_date !== null){
												$scope.records[desc].tracked = true;
											}
											$scope.surveyDone = true;
										}
										
								})
								
							 console.log("$scope.surveyDone =",$scope.surveyDone);
							
						}else {
							clearUserInfo();
								
						}
						
						$scope.loginFlag = "true";
						$scope.loginResult = data;	
						$rootScope.loggedInFlag = loggedIn;	
						$rootScope.loggedInAs = name;
					});
				
		}
	
	});		
	

// Listing muscle group categories
	
	app.controller('catCtrl', function($scope,$rootScope, $http) {
	
	$scope.getLink = "http://localhost:8080/exerciseCategories";
				$http({
					  url: $scope.getLink,
					  method: 'POST',
				
					}).success(function(data){
						$scope.records = data;
						console.log("Success getting list");
						console.log("data = ",$scope.records);
						for (var desc in $scope.records){
							console.log("Categories : ",$scope.records[desc].description);
						}					
					});
					
			$scope.setActiveCat= function(desc){
				console.log("desc clicked",desc);
				sessionStorage.setItem("category", desc);
			}
		
		
	});
	
	
	// Listing workouts for a muscle group 
	
	app.controller('exCtrl', function($scope,$rootScope, $http) {
	
	$scope.cat = sessionStorage.category;
	console.log("desc = ",$scope.cat);	
	
	$scope.getLink = "http://localhost:8080/exercise/"+$scope.cat;
				$http({
					  url: $scope.getLink,
					  method: 'POST',
				
					}).success(function(data){
						$scope.records = data;
						console.log("Success getting workouts");
						console.log("data = ",$scope.records);
						for (var desc in $scope.records){
							console.log("Exercises : ",$scope.records[desc].exercise_name);
							$scope.newUrl = $scope.records[desc].url;
						}					
					});

		
		
	});
	
// Survey for user

app.controller('surveyCtrl', function($scope,$rootScope, $http) {
	
	$scope.userId = sessionStorage.userId;
	console.log("desc = ",$scope.userId);	
	$scope.getRoutine = function(intensity){
			$scope.intensity = intensity;
			$scope.getLink = "http://localhost:8080/exerciseTracking/" + $scope.userId + "/" + $scope.intensity;
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
	
	
// Display workout routine for user


app.controller('routineCtrl', function($scope, $http,$location, $rootScope) {
	$scope.loggedInFlag = loggedIn;
	
	// $scope.userId = sessionStorage.userId;
	$scope.userId = getUserId();
	console.log("desc = ",$scope.userId);	
	
			
		$scope.getLink = "http://localhost:8080/exerciseTracking/"+$scope.userId
		$http({
				  url: $scope.getLink,
				  method: 'POST'
			}).success(function(data){
				$scope.records = data;
				console.log("data = ",$scope.records);
				var len = $scope.records.length;
			
				 
					for (var desc in $scope.records){
												
						if($scope.records[desc].todays_date !== null){
							$scope.records[desc].canTrack = false;
							
						}else {$scope.records[desc].canTrack = true;
						      
						}
						
					}
					
					var j = 0;
					$scope.dailyFlag = [];
					for (var i=0; i< len; i++){
						console.log($scope.records[i].dayNo);
					
						if (i>0){
							if ($scope.records[i].dayNo !== $scope.records[i-1].dayNo){
									$scope.dailyFlag[j] = $scope.records[i-1].canTrack;
										j += 1;
							}
						}
						
						if(i === len-1)
							$scope.dailyFlag[j] = $scope.records[i-1].canTrack;
					}
			 
					console.log("flag = ",$scope.dailyFlag);	
						
			})
						

	
	$scope.getExVal = function(dayno){
		sessionStorage.setItem("dayno",dayno);
		 $location.path('/trackThisDay');
	}

	$scope.delRoutine = function(){
		$scope.userId = getUserId();
	console.log("desc = ",$scope.userId);	
			$scope.delLink = "http://localhost:8080/deleteRoutine/" + $scope.userId;
				$http({
				  url: $scope.delLink,
				  method: 'DELETE',
				  transformResponse: [function (data) {
					  console.log("data=",data);
					  return data;
						}]
					}).success(function(data){
						console.log("data=",data);
						$scope.surveyDone ="false";
						alert("Your workout routine deleted successfully, please fill out survey page to create a new one");
						$location.path('/survey');
					});
	
	}
	
		
	});

	

app.controller('oneDayCtrl', function($scope, $rootScope,$http) {
	$scope.loggedInFlag = loggedIn;
	
	//$scope.userId = sessionStorage.userId;
	$scope.userId = getUserId();
	console.log("Id = ",$scope.userId);	
	$scope.dayno = sessionStorage.dayno;
	console.log("dayno = ",$scope.dayno);
	
			$scope.getLink = "http://localhost:8080/trackThisDay/" + $scope.userId + "/" + $scope.dayno;
				$http({
				  url: $scope.getLink,
				  method: 'POST'
					}).success(function(data){
						
							$scope.records = data;
									console.log("data = ",$scope.records);
									$scope.count =  $scope.records.length;
										for (var desc in $scope.records){
											console.log("Exercise Names : ",$scope.records[desc].ex_name);
										}
										
					});
	
	$scope.getPercent = function(){
		$scope.currentVal = 0;
		for (var desc in $scope.records){
			if($scope.records[desc].complete === true)
				$scope.currentVal += 1;
		}
		$scope.oneVal = 100 / $scope.count ;
		$scope.percent = $scope.currentVal * $scope.oneVal ;
		console.log("Percent = ",$scope.percent);
		$scope.width = "width:" + $scope.percent +"%";
		$scope.percentVal = $scope.percent +"%";
	}
	
		$scope.getRowVal = function(){
			for (var desc in $scope.records){
				console.log("Exercise Names : ",$scope.records[desc].ex_name);
				console.log("Exercise Complete?? : ",$scope.records[desc].complete);
					$scope.getLink = "http://localhost:8080/updateThisDay/" + $scope.userId + "/" + $scope.dayno
									  + "/" + $scope.records[desc].ex_name + "/" + $scope.records[desc].complete ;
				$http({
				  url: $scope.getLink,
				  method: 'POST',
				  transformResponse: [function (data) {
						console.log("data=",data);
						  return data;
					  }]
					}).success(function(data){
						console.log("Track update response ",data);
										if (data === "true")
											console.log("Updated tracking details");
																				
					});
			}	
		}
	});
	
	
	app.controller('weeklyProgCtrl', function($http,$scope,$rootScope,$parse) {
	
				$scope.userId = getUserId();
				console.log("desc = ",$scope.userId);	
	
		$scope.myDataSource = {};
		$scope.myDataSource0 = {};
		$scope.myDataSource1 = {};
		$scope.myDataSource2 = {};
		$scope.myDataSource3 = {};
		$scope.data=[];
		
			$scope.getLink = "http://localhost:8080/weeklyProgress/" + $scope.userId ;
				$http({
				  url: $scope.getLink,
				  method: 'POST'
					}).success(function(response){
						console.log("Data =",response);
						$scope.data  = response;
					
						console.log("day1 =" ,$scope.data[0].day1);
						 val = $scope.data[0].day1;
						 console.log("Val =",val);
				 for (var count in $scope.data){
							console.log("count =" ,count);
							$scope.weekNo = "Week " + ( parseInt(count) + 1 ) + " Progress";
						 $scope.myDataSource = {
						   'chart': {
							   caption: $scope.weekNo,
							   numberSuffix: "%",
							   theme: "fint"
						   },
						   'data':[{
							   label: "Day 1",
							   value: $scope.data[count].day1
						   },
						   {
							   label: "Day 2",
							   value:  $scope.data[count].day2
						   },
						   {
							   label: "Day 3",
							   value: $scope.data[count].day3
						   },
						   {
							   label: "Day 4",
							   value: $scope.data[count].day4
						   },
						   {
							   label: "Day 5",
							   value: $scope.data[count].day5
						   }]
						};	
						
						var the_string = 'myDataSource' + count ;
						console.log("the_string =" ,the_string);
						var model = $parse(the_string);
						model.assign($scope, $scope.myDataSource);
						 console.log("$scope.myDataSource0 =" ,$scope.myDataSource0);
				 }
						 
						 
				});	
				
									
	
				
	});	
	
	
   getUserRoutine = function(userid){
	  var response = false;
		getLink = "http://localhost:8080/exerciseTracking/"+userid;
		$.ajax({
        		url: getLink,
				 method: 'POST'
    		}).then(function(data) {
					records = data;
					for (var desc in records){
						response = true;
						console.log("Exercise Names -->: ",records[desc].ex_name);
						if(records[desc].todays_date !== null){
							records[desc].tracked = true;
							
						}
					}
					return response;
			})
		
	}
	
	
	   storeUserInfo = function(userid,username){
		   $rootScope.userId = userid;
		   $rootScope.userName = username;
			sessionStorage.setItem("userName", username);
			sessionStorage.setItem("userId", userid);
			 $rootScope.loggedIn = true;
			
		
	}
	
	  getUserId = function(){
			return sessionStorage.userId;
	}
	
	   clearUserInfo = function(){
			sessionStorage.setItem("userName", "null");
			sessionStorage.setItem("userId", "null");
			loggedIn = false;
			
			
		
	}
	