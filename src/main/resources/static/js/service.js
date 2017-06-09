app.service('hiService', function ($http) {
    this.getCluster = function () {
        return $http({
            method: 'GET',
            url: '/kafka/hi'
        });
    }
});
