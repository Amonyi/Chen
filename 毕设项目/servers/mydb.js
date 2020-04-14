//封装操作数据库的通用API
const mysql  = require('mysql');
exports.base =(sql,data,callback)=>{
        //创建数据库连接
        var connection = mysql.createConnection({
        host     : 'localhost', 
        port     :  3306,   //数据库端口号
        user     : 'root',  //数据库用户名
        password : '123',   //数据库密码
        database : 'diablo' //  所使用的数据库名称
        });
        //执行连接操作
        connection.connect();

        //操作数据库
connection.query(sql,data,function(error,results,fields){
    if(error){
        throw error
    }
    callback(results);        
})

connection.end();
}