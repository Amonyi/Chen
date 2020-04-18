const express= require("express");
const router = express.Router();

const service = require("./service.js");

//查询
router.get("/comments",service.allComments);
router.get("/lunboimages",service.allLunBoImages);
router.get("/recvideo",service.allRecVideo);
router.get("/video",service.allBgVideo);
router.get("/list",service.allList);
router.get("/herocon",service.allHeroCon);
router.get("/bluestick",service.allBlueStick);
router.get("/gamedata",service.allGameData);
router.get("/users",service.allUser);
router.get("/heroism",service.allHeroism);
router.get("/getcom",service.allcom);


// 轮播图数据分页
router.get("/imgdata/:pageNo/:pageSize",service.imgPage);
// 游戏资讯分页
router.get("/listdata/:pageNo/:pageSize",service.listPage);
// 游戏蓝贴数据分页
router.get("/bluestickdata/:pageNo/:pageSize",service.blueStickPage);


//添加
router.post("/comments/comment",service.addComment);
router.post("/adduser",service.addUser);
router.post("/addcomments",service.addComments);
router.post("/addBanners",service.addBanners);
router.post("/addlist",service.addList);
router.post("/addbluestick",service.addBlueStick);
// router.post("/adduimg",service.addUserImg);


//编辑（根据id获取对应数据）
router.get("/comments/comment/:id",service.getCommentById)
router.get("/listinfo/:id",service.getListInfo);
router.get("/listiteminfo/:id",service.getListItemInfo);
router.get("/banner/:id",service.getbannerInfo);
router.get("/getbstick/:id",service.getStickById);
router.get("/getuser/:id",service.getUserById);

//提交编辑的数据
router.put("/comments/comment",service.editComment);
router.put("/editbanner",service.editBanner);
router.put("/listitem",service.editList);
router.put("/bstickitem",service.editStick);
router.put("/putuser",service.editUser);
router.put("/puinfo",service.editUserInfo);

//删除
router.delete("/comments/comment/:id",service.deleteComment);
router.delete("/delbanner/:id",service.deleteBanner);
router.delete("/dellist/:id",service.deleteList);
router.delete("/delbluestick/:id",service.delBlueStick);
router.delete("/deluser/:id",service.delUser);






module.exports = router;