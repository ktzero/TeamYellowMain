
var app = angular.module("MyApp", ["youtube-embed","ngRoute","ng-fusioncharts"]);

app.controller("mainCtrl", function($scope, $rootScope, $http) {
	
	$rootScope.getUserInfo();
	
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
		
app.directive('bDatepicker', function () {
    return {
        restrict: 'A',
        link: function (scope, el, attr) {
            el.datepicker({});
            var component = el.siblings('[data-toggle="datepicker"]');
            if (component.length) {
                component.on('click', function () {
                    el.trigger('focus');
                });
            }
        }
    };
});
		
		
app.config(['$routeProvider', function($routeProvider) {

		$routeProvider
		.when('/', {
			templateUrl: '/exercise-html/home.html'
		})
		.when('/about', {
		templateUrl : "/exercise-html/about.html"
		
		})
		.when('/addUser', {
		templateUrl : "/exercise-html/createUser.html"
		
		})
		.when('/login', {
		templateUrl : "/exercise-html/loginUser.html"
		
		})
		.when('/exerciseCategories', {
		templateUrl : "/exercise-html/exerciseCategories.html"
		
		})
		.when('/exercise', {
		templateUrl : "/exercise-html/exercises.html"
		
		})
		.when('/survey', {
		templateUrl : "/exercise-html/survey.html"
		
		})
		.when('/exerciseTracking', {
				
		templateUrl : "/exercise-html/routineDisplay.html"
							
		})
		.when('/trackThisDay', {
		templateUrl : "/exercise-html/oneDayAndFoodTrack.html"
		
		})
		.when('/weeklyProgress', {
		templateUrl : "/exercise-html/weeklyProgress.html"
			
		})
		.when('/food', {
		templateUrl : "/food-html/food.html"
		
		})
				
		.otherwise({redirectTo: '/'});

	}]); // end config
  
  	
	
	

app.run(function($rootScope,$location,$anchorScroll){
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
	
	// register listener to watch route changes
    $rootScope.$on( "$routeChangeStart", function(event, next, current) {
		console.log("ROute change");
      if ( $rootScope.loggedInFlag == false ) {
        // no logged user, we should be going to #login
        if ( next.templateUrl == "/exercise-html/routineDisplay.html" ) {
    
          $location.path( "/secondPage.html" );
        }
      }         
    });
	
		$('li.adduser').find('a').click(function(){
		console.log("Inside my scroll logic2");
		var $href = $(this).attr('href');
		if ($href.charAt(1)=== '/') {
				var temp = $href.substr(2,$href.length);
				$location.hash(temp);
			console.log($location.hash());
			$anchorScroll();
		}
	});
	
	$('div.col-xs-4').find('a').click(function(){
		console.log("Inside my scroll logic");
		var $href = $(this).attr('href');
		var temp = $href.substr(2,$href.length);
   $location.hash(temp);
    console.log($location.hash());
    $anchorScroll();
	});
	
});