$routeProvider
   .when('/profile/:userId?',{
        templateUrl: 'getView/gd-userDashboard/profile',
        controller: 'ProfileController',
        controllerAs: 'ctrl'
    })
    
if(self.userId){
    self.isPrivate = false;
}else{
    self.isPrivate = true;
}
