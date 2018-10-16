$(function(){
  // 导航
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
  // 轮播图
  $.ajax({
    url:"http://localhost:5000/index/carousel",
    type:"get",
    dataType:"json" //JSON.parse(res)
  })
  .then(carousel=>{
    new Vue({
      el:"#main>div:nth-child(1)",
     data:{carousel}
    })
  });

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
  
  // 旅拍MV
  $.ajax({
    url:"http://localhost:5000/movie",
    type:"get",
    dataType:"json"
  })
  .then(movie=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:nth-child(2)>div:first-child",
      data:{movie}
      
    })
  });
  // 商品列表
  $.ajax({
    url:"http://localhost:5000/index/product",
    type:"get",
    dataType:"json",
  })
  .then(product=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:nth-child(3)>div:first-child",
      data:{product}
      
    })
  });
  // 租车
  $.ajax({
    url:"http://localhost:5000/index/product",
    type:"get",
    dataType:"json",
  })
  .then(product=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:nth-child(4)>div:first-child",
      data:{product}
      
    })
  });
  // 规定描述的字符多少
  Vue.filter("ellipses",function(val,len){
    return val.slice(0,len)+"...";
  })
  // 楼层滚动
  var $divLift=$("#main>div:last-child");
  $(window).scroll(function(){
    var $fs=$("#main>div:nth-child(2)>div");
    var $f1=$fs.first();
    var scrollTop=$("html,body").scrollTop();
    var offsetTop=$f1.offset().top;
    // 输出查看距顶部的距离
    //console.log(scrollTop,offsetTop);
    // 页面的二分之一+滚动距离>向顶部偏移的距离
    if(innerHeight/2+scrollTop>offsetTop){
      $divLift.removeClass("d-none");
    }else{
      $divLift.addClass("d-none");
    }
    $fs.each((i,f)=>{
      // console.log(i);
      // console.log(f);
      offsetTop=$(f).offset().top;
      //console.log(offsetTop);
      if(innerHeight/2+scrollTop>offsetTop){
        $divLift.children(`:eq(${i})`).addClass("btn-danger").siblings().removeClass("btn-danger");
      }
    });
  });
  $divLift.on("click","button",function(){
    var i=$(this).index();
    var offsetTop = $(`#main>div:nth-child(2)>div:eq(${i})`).offset().top;
    $("html").animate({
      scrollTop:offsetTop
    },500);
  });
  

});
