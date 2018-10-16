// user模块
var express=require("express");
var router=express.Router();
// 引入连接池
const pool=require("../config/pool");

router.get("/signin", (req, res) => {
  var {uname,upwd} = req.query;
  var sql = "select * from user where uname=? and upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(result.length>0){
      req.session.uid = result[0].uid;
      res.send({ok:1})
    }else{
      res.send({ok:0,msg:"用户名或密码错误"});
      // 测试地址：http://localhost:5000/users/signin?uname=qwer&upwd=123456
    } 
  })
});

router.get("/islogin",(req,res)=>{
  if(req.session.uid==null)
  res.send({ok:0});
  else{
    var sql = "select * from user where uid=?";
    pool.query(sql,[req.session.uid],(err,result)=>{
      res.send({ok:1,uname:result[0].uname});
    })
    
  }
});
router.get("/signout",(req,res)=>{
  delete req.session.uid;
  res.send();
})

module.exports=router;