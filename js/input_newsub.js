$(document).ready(function(){

    $("#clear").click(function(e){  //清除表單
      $("#user, #subname").val('');
    });

    $("#submit").click(function(e){ //送出表單

       $.ajax({
         type: "POST",
         url: "newsub.jsp",
         dataType: "json",
         data: {"user": $("#user").val(), "subname":$("#subname").val()},
         cache: false,
         success: function(response){
           window.location.href = "display_newsub.jsp";
         },
         error: function(xhr){
           alert(xhr.status);
         }
       });

     });

});
