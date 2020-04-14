<template>
    <div class="app-con">
        <!-- 导航栏 -->
        <div class="cain-topbar">
            <div class="pr center clearfix">
                <ul class="topbar-entry">
                    <li><router-link to="/home" class="link">首页</router-link></li>
                    <li><router-link to="/home/base" class="link">基础</router-link></li>
                    <li><router-link to="/home/heroism" class="link">职业</router-link></li>
                    <li><router-link to="/home/video" class="link">视频</router-link></li>
                </ul>
                <ul class="topbar-entry tar" v-if="login_flag1==true">
                    <li><router-link to="/home/login" class="link">登录</router-link></li>
                    <li><router-link to="/home/register" class="link">注册</router-link></li>
                </ul>
                <ul class="topbar-entry tar" v-if="login_flag2==true">
                    <li class="succlogin">
                        <el-dropdown>
                        <span class="el-dropdown-link">
                            {{succ_user}}<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item><a href="javascript:" @click="log_off">退出登录</a></el-dropdown-item>
                        </el-dropdown-menu>
                        </el-dropdown>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 视频背景部分 -->
                <div id="wrap" >
                    <div class="bg">
                        <video :src="bgvideo.video_src" autoplay muted loop></video>
                    </div>
                    <div class="logo">
                        <img src="../images/logo1.png" alt="logo">
                    </div>
                    <aside></aside>
                </div>
        <!-- 中间主体部分 -->
        <div class="container-fluid con-box">
            <!-- <div class="menu-bg"> </div> -->
            <div class="container box">
                <div class="con-body">
                    <!-- 左边内容 -->
                <div class="left-con">
                    <!-- 轮播 -->
                    <div class="left-banner">
                            <el-carousel :interval="5000" arrow="hover" trigger="click"  height='260px'>
                                <el-carousel-item v-for="item in lunboimg.slice(0,5).reverse()" :key="item.id">
                                    <img :src="item.img_url" alt="">
                                    <div class="banner-txt">{{item.title}}</div>
                                </el-carousel-item>
                            </el-carousel>
                            <!-- 轮播图下部分 -->
                            <div class="d4-content row">
                                <h4 class="col-md-12 col-sm-12">暗黑起源内容汇总</h4>
                                <ul>
                                    <li class="col-md-4 col-sm-4"> <a href="#">暗黑起源概述</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">游戏CG与预告视频</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">游戏试玩体验</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">游戏设计理念</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">装备系统的设计</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">艺术设计讲解</a></li>
                                    <li class="col-md-4 col-sm-4"> <a href="#">嘉年华设计师专访</a></li>
                                    <li class="col-md-4 col-sm-4">
                                        <a href="#">世界BOSS战演示</a>
                                    </li>
                                    <li class="col-md-4 col-sm-4">
                                         <a href="#">高清壁纸分享</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 轮播部分 end -->
                        <!-- 最新资讯部分 -->
                        <div class="list-item row">
                            <ul id="uu">
                                <!-- 只显示15条数据,倒序 -->
                                <li class="list-con col-sm-12 col-md-12" v-for="item in listitem.slice(0,15).reverse()" :key="item.id">
                                    <router-link :to="'/home/tribune/' + item.id" class="detail-banner">
                                        <img :src="item.img_url" alt="">
                                    </router-link>
                                    <h3><router-link :to="'/home/tribune/' + item.id" class="detail-title">{{item.title}}</router-link></h3>
                                    <p>{{item.contents}}</p>
                                    <small>
                                        <i class="com-num" v-if="item.com_num !==null ">{{item.com_num}}</i>
                                        {{item.add_time | dateFormat}}
                                    </small>
                                </li>
                            </ul>
                            <div class="more-box"><a href="#" class="detail-more">查看更多</a></div>
                        </div>
                </div>
                <!-- 右边内容 -->
                <div class="right-con">
                    <!-- 玩家社区 -->
                    <div class="player-community">
                        <h3 class="sidebar-title">
                            <i></i>玩家社区
                            <a href="#">玩家投稿、网站事务及建议反馈</a>
                        </h3>
                        <div>
		                    <ul class="uu row">
                                <li v-for="item in msg.slice(0,6)" :key="item.id" class="col-md-12 col-sm-12 col-xs-12">
                                    <em>{{item.txttype}}</em>
                                    <a href="#" class="ellipsis">{{item.title}}</a>
                                    <span class="ellipsis">{{item.author}}</span>
                                </li>
                            </ul>
	                    </div>
                    </div>
                    <!-- 精选专栏 -->
                    <div class="cain-selected-column  row">
                        <h3 class="sidebar-title ml">
                            <i></i>精选专栏
                        </h3>
                        <ul class="tac">
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/blxp.jpg" alt="">
                                </a>
                                <p class="ellipsis">菠萝学派</p>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/ahsfz.jpg" alt="">
                                </a>
                                <p class="ellipsis">暗黑三分钟</p>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/dmzs.jpg" alt="">
                                </a>
                                <p class="ellipsis">多玛之书</p>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/ahbns.jpg" alt="">
                                </a>
                                <p class="ellipsis">暗黑编年史</p>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/bdah.jpg" alt="">
                                </a>
                                <p class="ellipsis">暴打暗黑</p>
                            </li>
                            <li class="col-md-6 col-sm-6 col-xs-6">
                                <a href="#">
                                    <img src="../images/blxp.jpg" alt="">
                                </a>
                                <p class="ellipsis">暗黑二十四小时</p>
                            </li>
                        </ul>
                    </div>
                    <!-- 推荐视频 -->
                    <div class="cain-rec-video">
                        <h3 class="sidebar-title">
                            <i></i>推荐视频
                            <a href="#">查看更多</a>
                        </h3>
                        <div>
                            <a href="#" class="res-video pr">
                                <img :src="recvideoimg.banner_url" class="video-cover">
                                <img src="../images/video-play-icon.png" class="video-play">
                                <span class="ellipsis">{{recvideoimg.banner_title}}</span>
                            </a>
                            <ul>
                                <li v-for="item in recvideo.slice(0,5).reverse()" :key="item.id">
                                    <a href="#" class="ellipsis">{{item.title}}</a>
                                    <span>{{item.add_time | dateFormat}}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 英雄驿站 -->
                    <div class="cain-hero-station row">
                        <h3 class="sidebar-title">
                            <i></i>英雄驿站
                            <a href="#">查看更多</a>
                        </h3>
                        <div>
                            <ul class="class-link">
                                <li class="heros_bar">
                                    <a href="#" title="野蛮人"></a>
                                </li>
                                <li class="heros_cru">
                                    <a href="#" title="圣教军"></a>
                                </li>
                                <li class="heros_dh">
                                    <a href="#" title="猎魔人"></a>
                                </li>
                                <li class="heros_monk">
                                    <a href="#" title="武僧"></a>
                                </li>
                                <li class="heros_necro">
                                    <a href="#" title="死灵法师"></a>
                                </li>
                                <li class="heros_wd ">
                                    <a href="#" title="巫医"></a>
                                </li>
                                <li class="heros_wid ">
                                    <a href="#" title="法师"></a>
                                </li>
                            </ul>
                            <!-- 职业build部分 -->
                            <ul class="builds">
                                <li v-for="item in herobuild.slice(0,3).reverse()" :key="item.id"> 
                                    <div class="build index_heros_bar">
                                        <a href="#" class="build-head clearfix">
                                            <span class="class-icon">
                                                <img :src="item.hero_icon" alt="">
                                            </span>
                                            <h4 class="build-title ellipsis">{{item.title}}</h4>
                                            <div class="build-meta">
                                                <span class="ellipsis">作者：{{item.author}}</span>
                                            </div>
                                            <a href="#" class="hero-tech">
                                                <img :src="item.hero_tech" alt="">
                                            </a>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 官方蓝贴 -->
                    <div class="cain-official-bluepost">
                        <h3 class="sidebar-title">
                            <i></i>官方蓝贴
                            <a href="#">查看更多</a>
                        </h3>
                        <ul class="row">
                            <li class="col-md-12 col-sm-12" v-for="item in bluesticks.slice(0,6).reverse()" :key="item.id">
                                <a href="#" class="ellipsis">{{item.title}}</a>
                                <span>{{item.add_time | dateFormat}}</span>
                            </li>
                        </ul>
                    </div>
                    <!-- 游戏资料 -->
                    <div class="cain-game-data">
                        <h3 class="sidebar-title">
                            <i></i>游戏资料
                        </h3>
                        <ul class="row">
                            <li class="ellipsis col-md-3 col-sm-3" v-for="item in gamedatas" :key="item.id">
                                <a href="#">{{item.title}}</a>
                            </li>
                        </ul>
                    </div>
                    <!-- 推荐图集 -->
                    <div class="cain-rec-imgset">
                        <h3 class="sidebar-title">
                            <i></i>推荐图集
                            <a href="#">查看更多</a>
                        </h3>
                        <ul class="tac row">
                            <li class="col-md-6 col-sm-6">
                                <a href="#">
                                    <img src="../images/rec-imgset1.jpg" alt="">
                                    <p class="ellipsis">莉莉丝绘画作品合集</p>
                                </a>
                            </li>
                            <li class="col-md-6 col-sm-6">
                                <a href="#">
                                    <img src="../images/rec-imgset2.jpg" alt="">
                                    <p class="ellipsis">莉莉丝绘画作品合集</p>
                                </a>
                            </li>
                            <li class="col-md-6 col-sm-6">
                                <a href="#">
                                    <img src="../images/rec-imgset3.jpg" alt="">
                                    <p class="ellipsis">莉莉丝绘画作品合集</p>
                                </a>
                            </li>
                            <li class="col-md-6 col-sm-6">
                                <a href="#">
                                    <img src="../images/rec-imgset4.jpg" alt="">
                                    <p class="ellipsis">莉莉丝绘画作品合集</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- 友情链接 -->
                    <div class="cain-friendly-link">
                        <h3 class="sidebar-title">
                            <i></i>友情链接
                        </h3>
                        <div>
					        <a href="https://diablo4.blizzard.com/zh-cn/">暗黑起源1</a>
                            <a href="http://www.diablo3.com.cn/">暗黑起源2</a>
                            <a href="https://di.blizzard.cn/">暗黑起源：不朽</a>
                            <a href="http://cc.163.com/">xx直播</a>
                            <a href="http://lushi.163.com/">暗黑起源盒子</a>
                            <a href="http://wowui.w.163.com/163ui/">游戏插件</a>
                            <a href="http://play.163.com/">爱玩</a>
                            <a href="http://www.blizzard.com/">游戏娱乐</a>
                            <a href="http://www.battlenet.com.cn/">战网</a>
                            <a href="http://tieba.baidu.com/f?kw=%B0%B5%BA%DA3">百度暗黑起源吧</a>
                            <a href="http://tieba.baidu.com/f?kw=%E6%9A%97%E9%BB%913%E5%9B%BD%E6%9C%8D">百度暗黑起源国服吧</a>
                            <a href="http://d3.178.com/">178暗黑起源</a>
                            <a href="http://games.sina.com.cn/d3/">新浪</a>
                        </div>
                    </div>
                </div>
                </div>
                
            </div>
            <!-- 底部 -->
                <div class="cain-bottombar">
                    <h3>
                        <a href="//www.163.com/special/0077450P/feedback_window.html">意见反馈</a>
                    </h3>
                    <ul>
                        <li>
                            <a href="#">About NetEase</a>
                        </li>
                        <li>-</li>
                        <li><a href="#">网页简介</a></li>
                        <li>-</li>
                        <li><a href="#">联系方法</a></li>
                        <li>-</li>
                        <li><a href="#">招聘信息</a></li>
                        <li>-</li>
                        <li><a href="#">客户服务</a></li>
                        <li>-</li>
                        <li><a href="#">隐私政策及儿童个人信息保护规则</a></li>
                        <li>-</li>
                        <li><a href="#">网络营销</a></li>
                        <li>-</li>
                        <li><a href="#">网站地图</a></li>
                    </ul>
                    <small>©1997-2019</small>
                </div>
        </div>
    <!-- 中间主体部分end -->
    <!-- 返回顶部 -->
    <el-backtop class="cain-toolbar" :visibility-height="400">
        <div class="gotop-btn"></div>
    </el-backtop>
    

    <!-- end -->
    </div>
</template>

<style lang="css" >
.clearfix:after {
    display: block;
    visibility: hidden;
    clear: both;
    height: 0;
    font-size: 0;
    content: "";
}
.pr {
    position: relative;
}
.center {
    margin: 0 auto;
}
.cain-topbar {
    height: 40px;
    background-color: #262626;
    line-height: 40px;
    font-size: 14px;
}
.cain-topbar .center {
    width: 1200px;
}
.topbar-entry {
    float: left;
    width: 50%;
}
.topbar-entry {
    float: left;
    width: 50%;
}
.topbar-entry li {
    display: inline-block;
    position: relative;
}
.topbar-entry li:first-child > a {
    padding-left: 0;
}
.topbar-entry .link {
    display: block;
    position: relative;
    cursor: pointer;
    padding: 13px 10px;
    line-height: 14px;
    color: #959595;
    transition: all 300ms;
}
.topbar-entry .link::after {
    position: absolute;
    left: 100%;
    top: 14px;
    width: 1px;
    height: 14px;
    background-color: #959595;
    content: "";
    transform: scaleX(0.2);
}
.topbar-entry li:hover .link {
    color: #fff;
}
.tar {
    text-align: right;
}

/*  */
.cain-toolbar {
    width: 55px;
    /* height: 55px; */
    border-radius: 0;
}
.gotop-btn {
    width: 55px;
    height: 55px;
    background-image: url(../images/gotop.jpg);
}
.cain-bottombar small {
    color: #f00;
    font-size: 12px;
}
.cain-bottombar a:hover {
    color: white;
}
.cain-bottombar a {
    color: #a99877;
    font-size: 12px;
}
.cain-bottombar li {
    display: inline-block;
}
.cain-bottombar h3 {
    padding: 5px 0 10px;
    transition: all 300ms;
}
.more-box {
    background-color: rgb(18, 17, 15);
    width: 100%;
    height: 100px;
    position: absolute;
    bottom: -2570px;
    padding: 10px 20px 10px;
}
.detail-more:hover {
    color: #ff9300;
}
.detail-more {
    display: block;
    margin: 10px 0;
    border-radius: 3px;
    background-color: #0a0908;
    line-height: 40px;
    text-align: center;
    color: #b99d6e;
    transition: all 300ms;
    font-size: 13px;
}
.cain-bottombar  {
    text-align: center;
    margin: 0 auto;
    padding-top: 226px;
    height: 496px;
    background: url(../images/bg-bottom.jpg) no-repeat center top;
    line-height: 24px;
    font-size: 12px;
    color: #a99877;
}
.cain-friendly-link a:hover {
    color: #ff9300;
    border: 1px solid #ff9300;
}
.cain-friendly-link a {
    display: inline-block;
    margin: 0 5px 5px 0;
    padding: 2px 10px;
    border: 1px solid #322d29;
    border-radius: 3px;
    background-color: #12110f;
    color: #b99d6e;
    transition: all 300ms;
    font-size: 13px;
}
.cain-friendly-link div {
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #312818;
    border-top: 0;
    background: #0f0b0a url(../images/sidebar-bg.jpg) no-repeat 0 -100px;
}
.cain-friendly-link .sidebar-title i {
    background-position: 0 -25px;
}
.cain-rec-imgset p {
    line-height: 24px;
    color: #b99d6e;
    transition: all 300ms;
    font-size: 13px;
}
.cain-rec-imgset img {
    border: 1px solid #483a30;
    border-radius: 3px;
    width: 100%;
    height: 167px;
    box-shadow: 0 0 10px #000;
    transition: all 300ms;
}
.cain-rec-imgset li:hover p {
    color: #ff9300;
}
.cain-rec-imgset li:hover img {
    border: 1px solid #ff9300;
}
.cain-rec-imgset li {
    float: left;
    cursor: pointer;
    margin-right: 16px;
    padding: 5px 0;
    width: 45%;
}
.cain-rec-imgset ul {
    margin-left: 10px;
    padding: 10px 20px;
}
.cain-rec-imgset .sidebar-title i {
    background-position: 0 -75px;
}
.cain-game-data a:hover {
    color: #ff9300;
}
.cain-game-data a {
    display: block;
    color: #e1ce9a;
    transition: all 300ms;
    font-size: 13px;
}
.cain-game-data li {
    overflow: hidden;
    float: left;
    padding: 0 10px 0 15px;
    width: 152px;
    height: 28px;
    background: url(../images/bullet.gif) no-repeat 0 center;
    line-height: 28px;
}
.cain-game-data ul {
    overflow: hidden;
    margin-right: 0;
    height: 155px;
    margin-left: 10px;
    padding: 20px;
    border: 1px solid #312818;
    border-top: none;
    background: url(../images/sidebar-data-bg.jpg) no-repeat -100px -20px;
}
.cain-game-data .sidebar-title i {
    background-position: 0 -175px;
}
.cain-game-data h3,
.cain-rec-imgset h3,
.cain-friendly-link h3 {
    margin-left: 10px;
}
.cain-official-bluepost li span {
    font-size: 13px;
    float: right;
    color: #999;
    position: absolute;
    right: 3px;
}
.cain-official-bluepost li a:hover {
    color: #ff9300;
}
.cain-official-bluepost li a {
    font-size: 13px;
    display: inline-block;
    width: 280px;
    color: #00b4ff;
    transition: all 300ms;
}
.cain-official-bluepost li {
    width: 100%;
    padding-left: 5px;
    height: 30px;
    /* background: url(../images/bluepost-icon.jpg) no-repeat 0 center; */
    line-height: 30px;
}
.cain-official-bluepost ul {
    margin-right: 0;
    margin-left: 10px;
    padding: 10px 20px;
    border: 1px solid #312818;
    border-top: none;
    background: url(../images/bluepost-bg.jpg) no-repeat 0 -15px;
}
.cain-official-bluepost .sidebar-title i {
    background-position: 0 -150px;
}
.cain-official-bluepost h3 {
    margin-left: 10px;
}
.cain-official-bluepost,
.cain-game-data,
.cain-rec-imgset,
.cain-friendly-link {
    margin-top: 10px;
}
.hero-tech img {
    width: 100%;
}
.hero-tech {
    display: block;
    width: 100%;
    height: 60px;
}
.builds .build-head .build-meta span {
    display: block;
    padding-right: 10px;
    font-size: 12px;
}
.builds .build-head .build-meta {
    margin: 10px 0 0;
    padding: 0 0 0 55px;
    color: #999;
}
.builds .build-head .build-title {
    padding-left: 6px;
    line-height: 1;
    font-weight: normal;
    font-size: 14px;
    color: #b99d6e;
}
.builds .build-head .class-icon {
    display: block;
    float: left;
    border: 1px solid #59411c;
    width: 44px;
    height: 44px;
}
.builds .build-head {
    display: block;
    padding: 10px 5px;
    box-sizing: border-box;
    border: 1px solid rgba(0, 0, 0, 0)
}
.builds .index_heros_bar {
    background: url(../images/class-barbarian.jpg) no-repeat right 0;
}
.builds .build {
    cursor: pointer;
    margin: 10px 0;
    border: 1px solid #382f1f;
    box-sizing: border-box;
    background-color: #252017;
    transition: all 300ms;
}
.builds .build-head:hover {
    border: 1px solid #ff9300;
}
.builds {
    width: 100%;
}
.cain-hero-station .class-link .heros_bar {
    background-image: url(../images/heros_bar.jpg);
}
.cain-hero-station .class-link .heros_bar:hover {
    background-image: url(../images/heros_bar2.jpg);
}
.cain-hero-station .class-link .heros_cru {
    background-image: url(../images/heros_cru.jpg);
}
.cain-hero-station .class-link .heros_cru:hover {
    background-image: url(../images/heros_cru2.jpg);
}
.cain-hero-station .class-link .heros_dh {
    background-image: url(../images/heros_dh.jpg);
}
.cain-hero-station .class-link .heros_dh:hover {
    background-image: url(../images/heros_dh2.jpg);
}
.cain-hero-station .class-link .heros_monk {
    background-image: url(../images/heros_monk.jpg);
}
.cain-hero-station .class-link .heros_monk:hover {
    background-image: url(../images/heros_monk2.jpg);
}
.cain-hero-station .class-link .heros_necro {
    background-image: url(../images/heros_necro.jpg);
}
.cain-hero-station .class-link .heros_necro:hover {
    background-image: url(../images/heros_necro2.jpg);
}
.cain-hero-station .class-link .heros_wd {
    background-image: url(../images/heros_wd.jpg);
}
.cain-hero-station .class-link .heros_wd:hover {
    background-image: url(../images/heros_wd2.jpg);
}
.cain-hero-station .class-link .heros_wid {
    background-image: url(../images/heros_wid.jpg);
}
.cain-hero-station .class-link .heros_wid:hover {
    background-image: url(../images/heros_wid2.jpg);
}
.cain-hero-station .class-link a {
    display: block;
    height: 100%;
}
.cain-hero-station .class-link li {
    float: left;
    margin-right: 2px;
    border: 1px solid #3a301e;
    width: 63px;
    height: 142px;
    background: no-repeat center;
    background-size: 61px 140px;
    transition: all 500ms;
}
.cain-hero-station .class-link {
    overflow: hidden;
    height: 142px;
}
.cain-hero-station > div {
    padding: 10px 20px;
    border: 1px solid #312818;
    border-top: 0;
    background: #0f0b0a url(../images/sidebar-bg.jpg) no-repeat;
    margin-left: 10px;
}
.cain-hero-station .sidebar-title i {
    background-position: 0 -125px;
}
.cain-hero-station h3 {
    margin-left: 10px;
}
.cain-hero-station {
    margin-top: 10px;
    margin-left: 0;
    margin-right: 0;
}
.cain-rec-video li span {
    float: right;
    color: #999;
    font-size: 13px;
}
.cain-rec-video li a:hover {
    color: #ff9300;
}
.cain-rec-video li a {
    font-size: 13px;
    display: inline-block;
    width: 280px;
    color: #b99d6e;
    transition: all 300ms;
}
.cain-rec-video li {
    padding-left: 15px;
    height: 24px;
    background: url(../images/bullet.gif) no-repeat 0 center;
    line-height: 24px;
}
.cain-rec-video ul {
    padding-top: 10px;
}
.cain-rec-video .res-video span {
    position: absolute;
    left: 0;
    bottom: 0;
    padding: 0 10px;
    width: 100%;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.7);
    line-height: 30px;
    text-align: center;
    font-size: 13px;
}
.cain-rec-video .video-play {
    position: absolute;
    left: 50%;
    top: 50%;
    margin: -30px 0 0 -30px;
    width: 60px;
    height: 60px;
}
.cain-rec-video .video-cover {
    width: 100%;
    height: 195px;
}
.cain-rec-video .res-video:hover {
    border: 1px solid #ff9300;
}
.cain-rec-video .res-video {
    display: block;
    overflow: hidden;
    cursor: pointer;
    border: 1px solid #483a30;
    box-shadow: 0 0 10px #000;
    color: #b99d6e;
    transition: all 300ms;
}
.pr {
    position: relative;
}
.cain-rec-video div {
    padding: 10px;
}
.cain-rec-video .sidebar-title i {
    background-position: 0 -100px;
}
.cain-rec-video .sidebar-title {
    margin-left: 10px;
}
.cain-rec-video {
    margin-top: 10px;
}
.menu-bg {
    position: absolute;
    width: 1200px;
    height: 42px;
    /* background-color: red; */
    background: url(../images/menu-bg.jpg) no-repeat;
    left: 50%;
    transform: translateX(-50%);
    top: 45px;
}
.ml {
    margin-left: 10px;
}
.cain-selected-column li:hover img {
    border: 1px solid #ff9300;
}
.cain-selected-column li:hover p {
    color: #ff9300;
}
.cain-selected-column img {
    border: 1px solid #483a30;
    border-radius: 3px;
    width: 100%;
    /* height: 112px; */
    box-shadow: 0 0 10px #000;
    transition: all 300ms;
}
.cain-selected-column p {
    line-height: 24px;
    color: #b99d6e;
    transition: all 300ms;
}
.cain-selected-column li {
    float: left;
    cursor: pointer;
    margin-right: 10px;
    padding: 5px 0;
    width: 47%;
}
.cain-selected-column ul {
    padding: 10px 10px;
    margin-left: 20px;
}
.cain-selected-column .sidebar-title i {
    background-position: 0 -75px;
}
.sidebar-title {
    padding: 0 30px 0 20px;
    height: 44px;
    background: url(../images/sidebar-title-bg.jpg) no-repeat;
    line-height: 44px;
    font-size: 18px;
    color: #ff9300;
}
.cain-selected-column {
    margin-top: 10px;
    margin-right: 0px;
    margin-left: 0;
}
.tac {
    text-align: center;
}
.player-community .uu span {
    float: right;
    width: 105px;
    font-size: 13px;
    text-align: right;
}
.ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.player-community .uu a:hover {
    color: rgb(218, 12, 12);
}
.player-community .uu a {
    display: inline-block;
    color: #35110f;
    transition: all 300ms;
    font-size: 13px;
    /* width: 280px; */
}
.player-community .uu em {
    display: inline-block;
    margin-right: 10px;
    padding: 0 8px;
    border-radius: 3px;
    height: 19px;
    background-color: #35110f;
    line-height: 19px;
    vertical-align: 12px;
    font-style: normal;
    font-size: 12px;
    color: #ad835a;
}
.player-community .uu li {
    border-bottom: 1px solid rgba(152, 112, 63, 0.4);
    width: 100%;
    height: 33px;
    line-height: 32px;
}
.player-community .uu {
    margin-left: 0;
    margin-right: 0;
}
.player-community div {
    overflow: hidden;
    padding: 20px;
    height: 233px;
    background: url(../images/zwlzla.jpg) no-repeat;
}
.sidebar-title a:hover {
    color: #ff9300 !important;
}
.sidebar-title a {
    float: right;
    font-size: 12px;
    color: #b99d6e !important;
    transition: all 300ms;
}
.sidebar-title i {
    display: inline-block;
    margin-right: 5px;
    width: 25px;
    height: 25px;
    background: url(../images/d3-sidebar-icons.png) no-repeat 0 0;
    vertical-align: -6px;
}
.player-community .sidebar-title{
    padding: 0 30px 0 20px;
    height: 44px;
    background: url(../images/sidebar-title-bg.jpg) no-repeat;
    line-height: 44px;
    font-size: 18px;
    color: #ff9300;
    margin-left: 0;
}
.player-community {
    position: relative;
    left: 10px;
}
.right-con {
    position: absolute;
    top: 0;
    right: 0;
    width: 43.5%;
    height: 3100px;
    margin-right: -3px;
    background: url(../images/sidebar-center.jpg) repeat-y;
}
.right-con::after {
    position: absolute;
    left: 0;
    top: 100%;
    width: 100%;
    height: 56px;
    background: url(../images/sidebar-bottom.jpg) no-repeat center;
    content: "";
}
.list-con i {
    display: inline-block;
    padding: 0 5px 0 16px;
    height: 16px;
    background: url(../images/comment-icon.gif) no-repeat 0 3px;
    line-height: 18px;
    vertical-align: text-bottom;
    font-style: normal;
    color: #6f9ca2;
}
.list-con small {
    display: block;
    padding-top: 0px;
    color: #999;
    margin-left: 235px;
}
.list-item .list-con h3 .detail-title:hover {
    color: white;
}
.list-item .list-con h3 .detail-title{
    display: block;
    cursor: pointer;
    line-height: 17px;
    font-size: 16px;
    color: #f3e6d0;
    transition: all 300ms;
    margin-left: 235px;
    padding-top: 5px;
}
.list-item .list-con p {
    display: -webkit-box;
    overflow: hidden;
    padding-top: 10px;
    max-height: 108px;
    line-height: 22px;
    text-align: justify;
    font-size: 12px;
    color: #a99877;
    word-break: break-all;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3; /* 显示三行超出省略 */
    margin-left: 235px;
    padding-right: 20px;
}
.detail-banner img {
    width: 100%;
}
.detail-banner:hover {
    border: 1px solid #ff9500b6;
}
.detail-banner {
    position: absolute;
    margin-top: 10px;
    margin-left: 10px;
    padding: 1px;
    border: 1px solid #483a30;
    border-radius: 3px;
    width: 204px;
    height: 104px;
    box-shadow: 0 0 10px #000;
    transition: all 300ms;
}
.list-item .list-con {
    width: 100%;
    height: 165px;
    background: url(../images/blog-seperator.gif) repeat-x;
    padding-top: 10px;
    background-color: rgb(18, 17, 15);
    
}
.list-item {
    width: 100%;
    /* position: relative; */
    margin-left: 0;
}
.d4-content ul li a:hover {
    color: rgb(255, 147, 0);
}
.d4-content ul li a{
    overflow: hidden;
    float: left;
    padding: 0 10px 0 15px;
    /* width: 199px; */
    height: 26px;
    background: url(../images/bullet.gif) no-repeat 0 center;
    line-height: 26px;
    font-size: 12px;
    color: #b99d6e;
}
.d4-content h4 {
    padding-left: 10px;
    font-size: 16px;
    color: #f3e6d0;
    margin-bottom: 25px;
}
.d4-content {
    position: absolute;
    bottom: 100px;
    padding-left: 10px;
    margin-left: 0;
}
.banner-txt {
    position: absolute;
    left: 0;
    width: 100%;
    height: 40px;
    background-color: rgba(0, 0, 0, 0.5);
    line-height: 40px;
    color: #f3e6d0;
    font-size: 14px;
    padding-left: 20px;
    bottom: 0;
}
.el-carousel__indicators--horizontal {
    bottom: 0;
    left: 50%;
    -webkit-transform: translateX(115%);
    transform: translateX(115%);
}
.el-carousel__indicator.is-active button {
    background: url(../images/icon-active.png) no-repeat;
}
.el-carousel__button {
    border-radius: 50%;
    width: 20px;
    height: 20px;
    background: url(../images/icon.png) no-repeat;
}
.left-banner  img {
    width: 100%;
}
.left-con .left-banner {
    height: 521px;
    overflow: hidden;
    padding: 5px 15px;
    margin-right: 10px;
    margin-top: 3px;
}
.left-con {
    position: relative;
    left: -14px;
    top: 0;
    width: 58%;
    height: 540px;
    padding-top: 10px;
    background: url(../images/rotate-left-bg.jpg) no-repeat;
    /* background-color: red; */
}
.con-body {
    position: relative;
    width: 101%;
    background-color: rgb(18,17,15);
    /* background: url(../images/sidebar-center.jpg) repeat-y; */
}
.box {
    margin-top: 130px;
    padding: 0;
    height: 3110px;
}
.con-box {
    position: relative;
    /* background-color: red; */
    height: 500px;
    background: url(../images/000.png) no-repeat center -265px;
}
body,ul {
    padding: 0;
    margin: 0;
}
body {
    background-color: #000;
}
a {
    text-decoration: none;
}
a:hover {
    text-decoration: none;
}
ul {
    list-style: none;
}
#wrap {
    position: relative;
    width: 100%;
    height: 500px;
    background-color: #000;
}
#wrap .bg {
    width: 100%;
    height: 100%;
    overflow: hidden;
    z-index: -99;
}
#wrap .bg video {
    position: relative;
    /* left: -150px; */
}
#wrap .logo {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    
}
#wrap .logo img {
    width: 55%;
    position: absolute;
    top: 5%;
    left: -5%;
}
#wrap aside {
    position: absolute;
    left: 0;
    right: 0;
    bottom: -1px;
    height: 300px;
    background-image: linear-gradient(transparent, #000);
    
}
.app-con {
    background-color: black;
    height: 4285px;
}
.block {
    display: block;
}
.none {
    display: none;
}
</style>

<!-- 公共样式 -->
<style lang="css">
.el-dropdown-link {
    cursor: pointer;
    color: #959595;
} 
.el-dropdown-link:hover {
    color: white;
}
.el-icon-arrow-down {
    font-size: 12px;
}
.el-dropdown-menu__item {
    height: 30px;
    line-height: 30px;
    width: 100px;
    text-align: center;
    padding: 0 10px;
}
</style>


<script>
export default {
    inject:['reload'],
    data() {
        return {
            login_flag1:'',
            login_flag2:'',
            msg:[],
            lunboimg:[],
            recvideo:[],
            recvideoimg:[],
            listitem:[],
            bgvideo:[],
            herobuild:[],
            bluesticks:[],
            gamedatas:[],
            succ_user:window.sessionStorage.getItem('username')
        }
    },
    created() {
        this.login_check();
        this.getComment();
        this. getLunBoTu();
        this. getRecVideo();
        this. getBgVideo();
        this.getListItem();
        this.getHeroContent();
        this.getBlueStick();
        this.getGameData();
    },
    methods: {
        getComment(){
            this.$http.get("comments")
            .then(result=>{
                this.msg = result.body
            })
        },
        // 轮播图的获取
        getLunBoTu(){
            this.$http.get("lunboimages")
            .then(result=>{
                this.lunboimg = result.body
            })
        },
        getRecVideo(){
            this.$http.get("recvideo")
            .then(result=>{
                this.recvideo = result.body
                this.recvideoimg = result.body[0]
            })
        },
        getBgVideo(){
            this.$http.get("video")
            .then(result=>{
                this.bgvideo = result.body[0]
    
            })
        },
        getListItem(){
            this.$http.get("list")
            .then(result=>{
                this.listitem = result.body

            })
        },
        getHeroContent(){
            this.$http.get("herocon")
            .then(result=>{
                this.herobuild = result.body
            })
        },
        getBlueStick(){
            this.$http.get("bluestick")
            .then(result=>{
                this.bluesticks = result.body
            })
        },
        getGameData(){
            this.$http.get("gamedata")
            .then(result=>{
                this.gamedatas = result.body
            })
        },
        login_check(){
            if(this.succ_user == null){
                this.login_flag1= true
            }else if(this.succ_user != null){
                this.login_flag2= true
            }
        },
        log_off() {
            window.sessionStorage.clear()
             this.reload()
        }
    },
    mounted() {

    },
}
</script>