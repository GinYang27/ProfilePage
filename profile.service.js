(function() {
    'use strict';

    angular
        .module('app')
        .factory('profileService', profileService);

    profileService.$inject = ['$http', '$q'];

    function profileService($http, $q) {
        return {
            getUserInfo: getUserInfo,
        };

        /**
         * Get user information, including profile, notification, liked items
         */
        function getUserInfo () {
            return $http({
                method: 'GET',
                url: '/webapp/user/profile/getInfo'
            })
            .then(getInfoSuccess, getInfoFailed);

            function getInfoSuccess(response) {
                return response;
            }
            function getInfoFailed(errResponse) {
                return $q.reject(errResponse); 
            }
        }
    }

})();
