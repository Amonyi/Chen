// 入口文件 
//1.导入相应模块
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const router =require('./router.js');
const app = express();
//2.启动静态资源服务
app.use("/chen",express.static(path.join(__dirname,"public")));
//4.处理post请求的参数
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());//处理json格式的参数

// 注意，这个代码一定要，写在注册路由的前面。
app.all('*', (req, res, next) => {
  //设置允许跨域响应报文头
  //设置跨域
  // 启用 Node 服务器端的 cors 跨域
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
  res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By",' 3.2.1')
  if(req.method=="OPTIONS") res.sendStatus(200);/*让options请求快速返回*/
  else  next();
});
//5.配置路由
app.use(router);
//6.启动服务器
app.listen(8080,()=>{
    console.log("running....");
})