var myApp = angular.module('myApp', []);
/*
  myApp.factory('myService',function(){
  var savedData = "";
  function set(data) {
   savedData = data;
   alert(savedData);
  }
  function get() {
   return savedData;
  }

  return {
   set: set,
   get: get
  }
  });
*/

myApp.controller('subjectCtrl', function($scope, $http, $window, $location) {
  $http.post('getsubject.jsp').then(function (response) {
    //console.log(response);
    $scope.subject = response.data.Responsemsg;
  });

  $scope.sendID = function(subid) {
    $scope.subid=subid;
    //myService.set($scope.subid);
    window.open("getmsg_print.jsp?subindex="+$scope.subid);

  };
});
