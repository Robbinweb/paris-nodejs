//http://localhost:5000/photos
$(function(){
  // 客照列表
  $.ajax({
    url:"http://localhost:5000/index/photos",
    type:"get",
    dataType:"json" 
  })
  .then(photos=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:first-child",
      data:{photos}
    })
  });



});