// 引入结构件
const bodyParser = require("body-parser");
const express = require("express");
const session = require("express-session");
const mysql = require("mysql");
const cors = require("cors");

// 引入路由器
var index = require("./router/index");
var users = require("./router/users");
var photos = require("./router/photos");
var movie = require("./router/movie");
var product = require("./router/product");
// 使用express构建web服务器
var app = express();
var server = app.listen(5000,()=>{
  console.log("服务器启动成功...");
});

// 配置跨域模块，允许那个地址可以跨域访问
app.use(cors({
  orign: ["http://127.0.0.1:8080",
          "http://localhost:8080",
          "http://127.0.0.1:8100",
          "http://localhost:8100",
          "http://localhost:5000",
        ],
  credentials:true
}));

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));

// 托管静态文件
app.use(express.static("public"));
app.use(express.static("view"));
app.use(express.static("public/admin"));
// 重定向URL到主页index
app.get("/",(req,res)=>{
  res.sendFile(__dirname+"/view/index.html");
})

app.use(session({
  secret:'随机字符串',
  cookie:{maxAge:60*1000*30}, // 过期时间ms
  resave:false,
  saveUninitialized:true
}));

//使用路由器来管理路由
app.use("/index",index);
app.use("/users",users);
app.use("/photos",photos);
app.use("/movie",movie);
app.use("/product",product);