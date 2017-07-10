/**
 * Controller for profile page
 */
(function() {
    'use strict';

    angular
        .module('app')
        .controller('ProfileController', ProfileController);
    
    ProfileController.$inject = ['isLoggedInService', 'alertModalService', 'forceLogInModalService', '$location', 'isMobileService', 'profileService', '$routeParams'];

    function ProfileController(isLoggedInService, alertModalService, forceLogInModalService, $location, isMobileService, profileService, $routeParams) {
    	var self = this;
        self.isLoggedIn = false;

        self.defaultProfile = 'static/img/user/default_user.png';
        self.userId = $routeParams.userId;
        self.following = 12;
        self.follower = 20;

        
        self.followBtn = "FOLLOW";
        self.isMobile = isMobileService.isMobile();

        if(self.userId){
            self.isPrivate = false;
        }else{
            self.isPrivate = true;
        }

        self.changeFollow = changeFollow;

        self.deletePost = deletePost;

        getUserInfo();

        checkLoggedIn();


        function changeFollow(){
            if(self.followBtn == "FOLLOW"){
                self.followBtn = "FOLLOWING";
            }else{
                self.followBtn ="FOLLOW";
            }
            
        }

        function deletePost(){

        }

        function getUserInfo() {
            profileService.getUserInfo().then(success, failed);
            function success(response) {
                self.userInfo = response.data;
            }
            function failed(errResponse) {
                console.error('Fail to get user info.');
            }
        }


        if (window.addEventListener) {
            window.addEventListener("storage", getLoginStatus, false);
        } else {
            window.attachEvent("onstorage", getLoginStatus);
        };
        function getLoginStatus(ev) {
            if (ev.key == 'loginStatus') {
                 if(ev.newValue === "true") {
                    self.isLoggedIn = true;
                }else {
                    self.isLoggedIn = false;
                    $location.url('/home');
                }
            }
        }

        /**
		 * Check if user is logged in 
		 */
		function checkLoggedIn(){
			isLoggedInService.isLoggedIn().then(checkIsLoggedInSuccess, checkIsLoggedInFailed);
   			function checkIsLoggedInSuccess(response) {
                if (response.isLoggedIn === true) {
                    self.isLoggedIn = true;
                } else {
                    forceLogInModalService.openForceLogInModal();
                }
   			}
   			function checkIsLoggedInFailed(errResponse) {
                console.error('Fail to check if the user is logged in or not.');
            }
		}
    }
})();
