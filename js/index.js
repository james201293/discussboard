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

myApp.controller('subjectCtrl', function($scope, $http) {

  $http.post('getsubject.jsp').then(function (response) {
    //console.log(response);
    $scope.subject = response.data.Responsemsg;
  });

  $scope.sendID = function(subid) {
    $scope.subid=subid;
    //myService.set($scope.subid);
    window.open("getmsg_print.jsp?subindex="+$scope.subid);
  };

  $scope.remove = function($index,subID) {
    //直接刪除陣列
    $scope.subject.splice( $index, 1 );

    //丟id到後端進行刪除資料庫
    $scope.subID=subID;
    var data = {"deleteindex" : $scope.subID};
    $http.post('deletesub.jsp', data );
  };
});
