$(document).ready(function(){


    $(document).on('click','.msg_delbtn',function(){
       $.ajax({
         type: "POST",
         url: "deletemsg.jsp",
         dataType: "json",
         data: {"delmsgindex": $(this).attr('msgid')},
         cache: false,
         success: function(response){
           location.reload();  //刷新網頁
           alert(response.exe_status);
         },
         error: function(xhr){
           alert(xhr.status);
         }


       });
     });

});
