
var app = angular.module("MyApp", ["youtube-embed","ngRoute","ng-fusioncharts"]);

app.controller("mainCtrl", function($scope, $rootScope, $http) {
	
	
	
	$scope.logout = function(){
		
	if(sessionStorage.userId !== "null"){		
	    $rootScope.clearUserInfo();
		 $rootScope.userId = "null";
		   $rootScope.userName = "null";
	   	 $rootScope.loggedInFlag = false;
	//	$rootScope.loggedInFlag = loggedIn;
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
		.when('/food', {
		templateUrl : "/food-html/food.html"
		
		})
		.when('/foodTracking', {
		templateUrl : "/food-html/foodTracking.html"
		
		})
		
		.otherwise({redirectTo: '/'});

	}]); // end config
  
  

// Add New user logic 

app.controller('addCtrl', function($scope, $rootScope,$http) {
//	$rootScope.getUserInfo();
	
		 $scope.createUser = function(){
		   $("#FName").prop("disabled", true);
		   $("#LName").prop("disabled", true);
		   $("#UserId").prop("disabled", true);
		   $("#PassWord").prop("disabled", true);
		   $("#ConPwd").prop("disabled", true);
		
		$scope.addLink = "http://localhost:8080/user/add/" +$scope.fname+"/"+$scope.lname+"/"+$scope.UserId+
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
		

		
		$rootScope.loginUser = function(){
		 	$rootScope.userId = $scope.userId;	
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
							$rootScope.storeUserInfo($scope.userId,name);
						//	  $rootScope.userId = $scope.userId;
						//	   $rootScope.userName = name;
						//	 $rootScope.loggedInFlag = true;
							
							console.log("Name =",name);
							$scope.loginSuccess = true;
							
		// this logic is to skip survey page if the user took survey already 					
							$scope.getLink = "http://localhost:8080/exerciseTracking/"+$rootScope.userId
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
							$rootScope.clearUserInfo();
								
						}
						
						$scope.loginFlag = "true";
						$scope.loginResult = data;	
						$rootScope.loggedInFlag = true;;	
					
					});
				
		}
	
	});		
	

// Listing muscle group categories
	
	app.controller('catCtrl', function($scope,$rootScope, $http) {
	
	$rootScope.getUserInfo();
	
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
	$rootScope.getUserInfo();
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
	$rootScope.getUserInfo();

	console.log("desc = ",$rootScope.userId);	
	$scope.getRoutine = function(intensity){
			$scope.intensity = intensity;
			$scope.getLink = "http://localhost:8080/exerciseTracking/" + $rootScope.userId + "/" + $scope.intensity;
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
	
	$rootScope.getUserInfo();
	console.log("desc = ",$rootScope.userId);	
	$scope.dailyFlag = [];
			
		$scope.getLink = "http://localhost:8080/exerciseTracking/"+$rootScope.userId
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
	
	console.log("desc = ",$rootScope.userId);	
			$scope.delLink = "http://localhost:8080/deleteRoutine/" + $rootScope.userId;
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
	
	$scope.downloadPDF = function(){
	  html2canvas(document.getElementById('exportthis'), {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500,
                    }]
                };
                pdfMake.createPdf(docDefinition).download("Workout_Routine.pdf");
            }
        });
	}
	
	
	});

	

app.controller('oneDayCtrl', function($scope, $rootScope,$http, $location) {
	
	$rootScope.getUserInfo();

	console.log("Id = ",$rootScope.userId);	
	$scope.dayno = sessionStorage.dayno;
	console.log("dayno = ",$scope.dayno);
	
			$scope.getLink = "http://localhost:8080/trackThisDay/" + $rootScope.userId + "/" + $scope.dayno;
				$http({
				  url: $scope.getLink,
				  method: 'POST'
					}).success(function(data){
						
							$scope.exercises = data;
									console.log("data = ",$scope.exercises);
									$scope.count =  $scope.exercises.length;
										for (var desc in $scope.exercises){
											console.log("Exercise Names : ",$scope.exercises[desc].ex_name);
										}
										
					});
	
	$scope.getPercent = function(){
		$scope.currentVal = 0;
		for (var desc in $scope.exercises){
			if($scope.exercises[desc].complete === true)
				$scope.currentVal += 1;
		}
		$scope.oneVal = 100 / $scope.count ;
		$scope.percent = Math.round($scope.currentVal * $scope.oneVal);
		console.log("Percent = ",$scope.percent);
		$scope.width = "width:" + $scope.percent +"%";
		$scope.percentVal = $scope.percent +"%";
	}
	
		$scope.getRowVal = function(){
			for (var desc in $scope.exercises){
				console.log("Exercise Names : ",$scope.exercises[desc].ex_name);
				console.log("Exercise Complete?? : ",$scope.exercises[desc].complete);
					$scope.getLink = "http://localhost:8080/updateThisDay/" + $rootScope.userId + "/" + $scope.dayno
									  + "/" + $scope.exercises[desc].ex_name + "/" + $scope.exercises[desc].complete ;
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

		// To list workouts for users to add from screen 
	$scope.showExList = function(){	
	$scope.selectFlag = false;
	$scope.getLink = "http://localhost:8080/exercisesList/"+$scope.exercises[0].ex_name;
	console.log("$scope.exercises[0].ex_name =",$scope.exercises[0].ex_name);
	$scope.exNames =[];
				$http({
					  url: $scope.getLink,
					  method: 'POST'
				
					}).success(function(data){
						$scope.exList = data;
						console.log("Success getting workouts");
						console.log("data = ",$scope.exList);
						for (var desc in $scope.exList){
							console.log("Exercises : ",$scope.exList[desc].exercise_name);
							$scope.exNames.push($scope.exList[desc].exercise_name);
						}					
					});
	$scope.selectFlag = true;

	}

   $scope.addExToList = function(selectedEx){
	   console.log("$scope.selectedEx = ",selectedEx);
	   	var flag = "string";
		$scope.updateLink = "http://localhost:8080/addExToRoutine/"+$rootScope.userId + "/" + $scope.dayno + "/" + selectedEx;
	
				$http({
					  url: $scope.updateLink,
					  method: 'POST'
				
					}).success(function(data){
						console.log("Success updating workouts");
						console.log("data = ",data);
						flag = "success";
						if (flag == "success"){
								location.reload();
								console.log("reload");
						}
						
					}).error(function(data){
						console.log("Failed updating workouts");
						console.log("data = ",data);
					});
				
 console.log("here ---");				
			
	   
   }

		});
	
	
	app.controller('weeklyProgCtrl', function($http,$scope,$rootScope,$parse) {
	
		$rootScope.getUserInfo();	
				console.log("desc = ",$rootScope.userId);	
	
		$scope.myDataSource = {};
		$scope.myDataSource0 = {};
		$scope.myDataSource1 = {};
		$scope.myDataSource2 = {};
		$scope.myDataSource3 = {};
		$scope.data=[];
		
			$scope.getLink = "http://localhost:8080/weeklyProgress/" + $rootScope.userId ;
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
	
	

app.run(function($rootScope){
	$rootScope.storeUserInfo = function(userid,username){
		   sessionStorage.setItem("userName", username);
			sessionStorage.setItem("userId", userid);
			sessionStorage.setItem("loginflag", true);
		   $rootScope.userId = userid;
		   $rootScope.userName = username;
	   	  $rootScope.loggedInFlag = true;
	}
	 $rootScope.getUserInfo = function(){
			$rootScope.userId = sessionStorage.userId;
			$rootScope.userName = sessionStorage.userName;
			$rootScope.loggedInFlag = (sessionStorage.loginflag == 'true');
	    console.log("$rootScope.userId =",$rootScope.userId);
		console.log("$rootScope.userName =",$rootScope.userName);
		console.log("$rootScope.loggedInFlag =",$rootScope.loggedInFlag);
		
	 }

	 $rootScope.clearUserInfo = function(){
		   $rootScope.userId = " ";
		   $rootScope.userName = " ";
		   $rootScope.loggedInFlag = false;
		   sessionStorage.setItem("userName", " ");
		   sessionStorage.setItem("userId", " ");
		   sessionStorage.setItem("loginflag", false);
	}
	
});