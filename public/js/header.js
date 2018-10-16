//ajax("http://localhost:3000/header.html")
$(function(){
  $.ajax({
    url:"http://localhost:5000/header.html",
    type:"get",
  })
  .then(res=>{
    document.getElementById("header").innerHTML=res;
    //console.log(res);

    // 登录与退出
    $.ajax({
      url:"http://localhost:5000/users/islogin",
      type:"get",
      dataType:"json",
      success: function(data) {
        if(data.ok==0){
          $("#signout").show().next().hide();
        }else{
          $("#signout").hide().next().show();
          $("#uname").html(data.uname);
        }
      }
    });
    // 登录跳转
    $("#btnLogin").click(function(e){
      e.preventDefault();
      location.href="http://localhost:5000/login.html?back="+location.href;
    })


  });
})






































