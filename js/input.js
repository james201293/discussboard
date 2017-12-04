$(document).ready(function(){

    $("#clear").click(function(e){  //清除表單
      $("#user, #subID, #content").val('');
    });

    $("#submit").click(function(e){ //送出表單

       $.ajax({
         type: "POST",
         url: "oldsub.jsp",
         dataType: "json",
         data: {"user": $("#user").val(), "subID": $("#subID").val(), "content":$("#content").val()},
         cache: false,
         success: function(response){
           window.location.href = "display_newmsg.jsp";
         },
         error: function(xhr){
           alert(xhr.status);
         }


       });
     });

});
