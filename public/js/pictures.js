$(function(){
  // 客照列表
  $.ajax({
    url:"http://localhost:5000/photos",
    type:"get",
    dataType:"json" 
  })
  .then(photos=>{
    new Vue({
      el:"#main>div:nth-child(2)>div:first-child",
      data:{photos}
    })
  });
  new Vue({
    el:"#app",
    data:{ count:1 },
    //第一种：
    //methods:{
      //all(){
      //  this.count--;
      //},
      //add(){
      //  //rhis-当前的vm对象
      //  this.count++;
      //},
      //}
      //第二种
      methods:{
        all(){
          this.count--;
        },

        add(e){
          e.preventDefault();
          //rhis-当前的vm对象
          this.count++;
        }
      }
  })
})
