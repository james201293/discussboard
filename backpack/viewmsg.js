var myApp2 = angular.module('myApp2', ['myApp']);

myApp2.controller('articleCtrl', function($scope, $http, myService) {
  $scope.subid = myService.get();
  //alert($scope.subid);
  var sub = {"subjectid" : $scope.subi};
  $http.post("getmsg.jsp", sub).then(function (response) {
    //console.log(response);
    $scope.msg = response.data.Responsemsg;
  });

});
