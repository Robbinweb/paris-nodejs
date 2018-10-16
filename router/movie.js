// movie模块
const express=require("express");
var router=express.Router();
// 引入连接池
const pool=require("../config/pool");

router.get("/",(req,res)=>{
  var sql="SELECT * FROM `movie` where mid!=0 order by mid";
  pool.query(sql,[],(err,result)=>{
    //console.log(result);
    res.send(result);
  })
})

module.exports=router;
//http://localhost:5000/movie