const db = require("./mydb.js");

// 查询
exports.allComments = (req,res)=>{
    let sql = "select * from comment";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}

exports.allLunBoImages = (req,res)=>{
    let sql = "select * from images";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allBgVideo = (req,res)=>{
    let sql = "select * from video";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allRecVideo = (req,res)=>{
    let sql = "select * from rec_video";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allList = (req,res)=>{
    let sql = "select * from list_item";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allHeroCon = (req,res)=>{
    let sql = "select * from hero_station";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allBlueStick = (req,res)=>{
    let sql = "select * from blue_stickers";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allGameData = (req,res)=>{
    let sql = "select * from game_data";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
// 轮播图分页
exports.imgPage = (req,res)=>{
    let pageNo = req.params.pageNo;  //页码
    let pageSize = req.params.pageSize; //  显示条数
    let start = (pageNo - 1) * pageSize;
    let sql = 'SELECT * FROM images limit ' + start +','+ pageSize; 
    let data = [pageNo,pageSize]
    db.base(sql,data,(result)=>{
        res.json(result)
    })
}
// 游戏资讯分页
exports.listPage = (req,res)=>{
    let pageNo = req.params.pageNo;  //页码
    let pageSize = req.params.pageSize; //  显示条数
    let start = (pageNo - 1) * pageSize;
    let sql = 'SELECT * FROM list_item limit ' + start +','+ pageSize; 
    let data = [pageNo,pageSize]
    db.base(sql,data,(result)=>{
        res.json(result)
    })
}
// 游戏蓝贴数据分页
exports.blueStickPage = (req,res)=>{
    let pageNo = req.params.pageNo;  //页码
    let pageSize = req.params.pageSize; //  显示条数
    let start = (pageNo - 1) * pageSize;
    let sql = 'SELECT * FROM blue_stickers limit ' + start +','+ pageSize; 
    let data = [pageNo,pageSize]
    db.base(sql,data,(result)=>{
        res.json(result)
    })
}
exports.allUser = (req,res)=>{
    let sql = "select * from user";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
exports.allHeroism = (req,res)=>{
    let sql = "select * from heroism";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
// 获取评论信息
exports.allcom = (req,res)=>{
    let sql = "select * from comments";
    db.base(sql,null,(result)=>{
        res.json(result)
    })
}
// 根据id拿到list-info的详细数据
exports.getListInfo = (req,res)=>{
    let id = req.params.id;
    let sql = "select * from list_info where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
        res.json(result[0])
    })
}
// 根据id拿到list-item的详细数据
exports.getListItemInfo = (req,res)=>{
    let id = req.params.id;
    let sql = "select * from list_item where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
        res.json(result[0])
    })
}
// 修改list_item信息
exports.editList=(req,res)=>{
    let info = req.body
    let sql = "update list_item set title=?,contents=?,img_url=? where id =?";
    let data = [info.title,info.contents,info.img_url,info.id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 根据id拿到banner信息
exports.getbannerInfo = (req,res)=>{
    let id = req.params.id;
    let sql = "select * from images where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
        res.json(result[0])
    })
}
// 修改
exports.editBanner=(req,res)=>{
    let info = req.body
    let sql = "update images set img_url=?,title=? where id =?";
    let data = [info.img_url,info.title,info.id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 编辑(根据id拿到对应蓝贴信息)
exports.getStickById=(req,res)=>{
    let id = req.params.id;
    let sql = "select * from blue_stickers where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
       res.json(result[0]);
    })
}

exports.editStick=(req,res)=>{
    let info = req.body
    let sql = "update blue_stickers set title=?,contents=? where id =?";
    let data = [info.title,info.contents,info.id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 用户表操作
// 编辑（根据id获取对应数据）
exports.getUserById=(req,res)=>{
    let id = req.params.id;
    let sql = "select * from user where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
       res.json(result[0]);
    })
}

exports.editUser=(req,res)=>{
    let info = req.body
    let sql = "update user set password=? where id =?";
    let data = [info.password,info.id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 删除用户
exports.delUser=(req,res)=>{
    let id = req.params.id;
    let sql = "delete from user where id =?";
    let data = [id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 用户添加
exports.addUser=(req,res)=>{
    let info = req.body;
    let sql = "insert into user set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}

// 添加
exports.addComment=(req,res)=>{
    let info = req.body;
    let sql = "insert into comment set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}

// 评论添加
exports.addComments=(req,res)=>{
    let info = req.body;
    let sql = "insert into comments set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 添加banner
exports.addBanners=(req,res)=>{
    let info = req.body;
    let sql = "insert into images set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 添加游戏资讯
exports.addList=(req,res)=>{
    let info = req.body;
    let sql = "insert into list_item set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 添加游戏蓝贴
exports.addBlueStick=(req,res)=>{
    let info = req.body;
    let sql = "insert into blue_stickers set ?"
    if(info.id==""||info.id){
        info.id = undefined;
    }
    db.base(sql,info,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 编辑
exports.getCommentById=(req,res)=>{
    let id = req.params.id;
    let sql = "select * from comment where id = ?";
    let data = [id];
    db.base(sql,data,(result)=>{
       res.json(result[0]);
    })
}

exports.editComment=(req,res)=>{
    let info = req.body
    let sql = "update comment set title=?,author=?,txttype=? where id =?";
    let data = [info.title,info.author,info.txttype,info.id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 删除
exports.deleteComment=(req,res)=>{
    let id = req.params.id;
    let sql = "delete from comment where id =?";
    let data = [id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 删除banner
exports.deleteBanner=(req,res)=>{
    let id = req.params.id;
    let sql = "delete from images where id =?";
    let data = [id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 删除游戏资讯
exports.deleteList=(req,res)=>{
    let id = req.params.id;
    let sql = "delete from list_item where id =?";
    let data = [id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}
// 删除游戏蓝贴
exports.delBlueStick=(req,res)=>{
    let id = req.params.id;
    let sql = "delete from blue_stickers where id =?";
    let data = [id];
    db.base(sql,data,(result)=>{
        if(result.affectedRows>0){
            res.json({flag:1})
        }else{
            res.json({flag:0})
        }
    })
}

