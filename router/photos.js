// photos模块
const express=require("express");
var router=express.Router();
// 引入连接池
const pool=require("../config/pool");
// 分页查询客照
router.get("/list",(req,res)=>{
  // 参数 pno pageSize
  var pno = req.query.pno; // 当前页码
  var pageSize = req.query.pageSize; //页大小
  // 设置默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 4;
  }
  // sql 语句查询数据库
  var sql = "SELECT pid,title,dices,clientnames,img_url,href,counts,tagsId FROM `photos_details` LIMIT ?,?";
  var offset = parseInt((pno-1)*pageSize);
  pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err)throw err;
    res.send(result);
    //测试地址：http://localhost:5000/photos/list?pno=1
  })
});
module.exports = router;