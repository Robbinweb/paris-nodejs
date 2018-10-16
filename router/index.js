// index模块
const express=require("express");
var router=express.Router();
// 引入连接池
const pool=require("../config/pool");

router.get("/",(req,res)=>{
  var sql="SELECT * FROM `navbar` where navid!=0 order by navid";
  pool.query(sql,[],(err,result)=>{
    //console.log(result); //服务器端显示数据
    res.send(result);
  })
})

// 轮播图
router.get("/carousel",(req,res)=>{
  var sql="SELECT * FROM `carousel` where cid!=0 order by cid";
  pool.query(sql,[],(err,result)=>{
    res.send(result);
    //http://localhost:5000/index/carousel
  })
})
// 查询客照
router.get("/photos",(req,res)=>{
  var sql="SELECT * FROM `photos_details` where pid!=0 order by pid";
  pool.query(sql,[],(err,result)=>{
    //console.log(result);
    res.send(result);
    //http://localhost:5000/index/photos
  })
})
// 查询商品列表
router.get("/product",(req,res)=>{
  var sql="SELECT * FROM `product_details` where pid!=0 order by pid";
  pool.query(sql,[],(err,result)=>{
    res.send(result);
    //http://localhost:5000/index/product
  })
})

module.exports=router;
//http://localhost:5000/index