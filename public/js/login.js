$(function(){
  $.ajax({
    url:"http://localhost:5000/index",
    type:"get",
    dataType:"json" //JSON.parse(res)
  })
  .then(navbar=>{
    new Vue({
      el:"#app",
      data:{navbar}
      // navba = [{navid, navname, navurl, navdesc}]
    })
  });

  // 登录
  $(".login").click(function () {
    var uname=$(" .uname").val();
    var upwd=$(" .upwd").val();
    $.ajax({
      url: "http://localhost:5000/users/signin",
      type: "post",
      data: {uname, upwd},
      dataType: "json",
      success: function (data) {
        if (data.ok == 0) {
            alert(data.msg);
        } else {
            var back = location.search.slice(6);
            location.href = back;
        }
      }
    })
  })

})
