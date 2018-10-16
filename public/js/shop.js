$(function(){
  // 轮播图
  $.ajax({
    url:"http://localhost:5000/index/carousel",
    type:"get",
    dataType:"json" //JSON.parse(res)
  })
  .then(result=>{
    new Vue({
      el:"#main>#myCarousel",
     data:{result}
    })
  });

  // 商品列表
  $.ajax({
    url:"http://localhost:5000/product/list?pno=1",
    type:"get",
    dataType:"json",
  })
  .then(product=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:nth-child(1)>div:first-child",
      data:{product}
      
    })
  });
//   // 楼层滚动
//   var $divLift=$("#main>div:last-child");
//   $(window).scroll(function(){
//     var $fs=$("#main>div:nth-child(2)>div");
//     var $f1=$fs.first();
//     var scrollTop=$("html,body").scrollTop();
//     var offsetTop=$f1.offset().top;
//     // 输出查看距顶部的距离
//     //console.log(scrollTop,offsetTop);
//     // 页面的二分之一+滚动距离>向顶部偏移的距离
//     if(innerHeight/2+scrollTop>offsetTop){
//       $divLift.removeClass("d-none");
//     }else{
//       $divLift.addClass("d-none");
//     }
//     $fs.each((i,f)=>{
//       // console.log(i);
//       // console.log(f);
//       offsetTop=$(f).offset().top;
//       //console.log(offsetTop);
//       if(innerHeight/2+scrollTop>offsetTop){
//         $divLift.children(`:eq(${i})`).addClass("btn-danger").siblings().removeClass("btn-danger");
//       }
//     });
//   });
//   $divLift.on("click","button",function(){
//     var i=$(this).index();
//     var offsetTop = $(`#main>div:nth-child(2)>div:eq(${i})`).offset().top;
//     $("html").animate({
//       scrollTop:offsetTop
//     },500);
//   });

// });
