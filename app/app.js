const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
app.listen(4399,()=>{
    console.log('4399...');
});
app.use(bodyParser.urlencoded({
    extended:false
}));
const pool = mysql.createPool({
    host:'127.0.0.1',
    port:3306,
    user:'root',
    password:'',
    database:'xp',
    connectionLimit:20,
    charset:'utf8'
});
app.use(cors({
    origin:['http://localhost:8080','http://127.0.0.1:8080']
}));
// app.get('/guide',(req,res)=>{
//     let sql = 'select * from xp_guide';
//     pool.query(sql,(err,res1)=>{
//         if(err) throw err;
//         res.send({status:'ok',code:200,results:res1});
//     });
// });
app.post('/register',(req,res)=>{
    let uname = req.body.uname;
    let e_upwd = [];
    for(var i = 1;i <= 6;i++){
        let n = Math.ceil(Math.random()*9);
        e_upwd.push(n);
    }
    let upwd = e_upwd.join('');
    let sql = 'insert into xp_user(uname,upwd,user_name) values(?,?,"未认证用户")';
    pool.query(sql,[uname,upwd],(err,res1)=>{
        if(err) throw err;
        if(res1.affectedRows > 0){
            res.send({code:200,message:'reg suc',check_code:upwd});
        }else{
            res.send({code:201,message:'reg err'});
        };
    })
});
app.post('/login',(req,res)=>{
    let uname = req.body.uname;
    let upwd = req.body.upwd;
    let sql = 'select * from xp_user where uname = ? and upwd = ?'
    pool.query(sql,[uname,upwd],(err,res1)=>{
        if(err) throw err;
        if(res1.length > 0){
            res.send({code:200,message:'log suc',results:res1});
        }else{
            res.send({code:201,message:'log err'});
        }
    });
});
app.get('/setcar',(req,res)=>{
    let car = req.query.car;
    let sql = 'select * from xp_car where car_name=?';
    pool.query(sql,[car],(err,res1)=>{
        if(err) throw err;
        if(res1.length > 0){
            res.send({code:200,message:'car_info',results:res1});
        }else{
            res.send({code:201,message:'car_info get err'});
        }
    });
});
app.get('/setver',(req,res)=>{
    let ver_name = req.query.carver;
    let sql = 'select * from car_ver where ver_name=?';
    pool.query(sql,[ver_name],(err,res1)=>{
        if(err) throw err;
        if(res1.length > 0){
            res.send({code:200,message:'car_ver',results:res1});
        }else{
            res.send({code:201,message:'car_ver get err'});
        }
    })
    
})
app.get('/setnum',(req,res)=>{
    let car_num = req.query.carnum;
    let sql = 'select * from car_num where car_num=?';
    pool.query(sql,[car_num],(err,res1)=>{
        if(err) throw err;
        if(res1.length > 0){
            res.send({code:200,message:'car_num set suc',results:res1});
        }else{
            res.send({code:201,message:'car_num set err'});
        }
    })
});