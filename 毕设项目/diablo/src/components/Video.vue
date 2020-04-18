<template>
    <div>
        <!-- 头部 -->
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
                            欢迎您，{{usernickname}}<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item><router-link to="/home/personalcenter">个人中心</router-link></el-dropdown-item>
                            <el-dropdown-item><a href="javascript:" @click="log_off">退出登录</a></el-dropdown-item>
                        </el-dropdown-menu>
                        </el-dropdown>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 主体 -->
        <div class="d3">
            <div class="d3-bg">
                <div class="wrapper">
                    <div class="contents clearfix">
                        <div class="d3-videos">
                            <!--  -->
                            <div class="class-videos clearfix">
                                <h2 class="clearfix">职业视频</h2>
                                <ul class="class-videos-list first clearfix">
                                    <li class="first"> 
                                        <a href="javascript:" >
                                                <!-- <img src="../images/md266b.jpg" width="380" height="380">  -->
                                                <div class="vbox" @click="titleVisible=false">
                                                    <videoplayer></videoplayer>
                                                </div>
                                                <span class="width-1" v-if="titleVisible==true">散件飞盾玩法简介</span> 
                                                <!-- <span class="play-icon"></span> -->
                                        </a>
                                    </li>
                                </ul>
                                <ul class="class-videos-list clearfix">
                                    <li><a href="javascript:">
                                        <img src="https://ok.166.net/cain-corner/post/2019-06-03/1559560299040_b4gckm.jpg" width="380" height="250"> 
                                        <span class="width-1" >暗黑3分钟：散件魂法
                                        </span></a></li>
                                    <li><a href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562591782730_vctyl1.jpg" width="185" height="120"> <span class="width-2">连射DH击破134层
                                        </span> <span class="play-icon-s"></span></a></li>
                                    <li><a  href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562591969512_jg5kef.jpg" width="185" height="120"> <span class="width-2">野蛮人134层实战
                                        </span> <span class="play-icon-s"></span></a></li>
                                </ul>
                                <ul class="class-videos-list clearfix">
                                        <li><a  href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562592083784_eqibf2.png" width="185" height="120"> <span class="width-2">死灵法师散件冰枪
                                </span> <span class="play-icon-s"></span></a></li>
                                        <li><a  href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562592238413_eni6bt.jpg" width="185" height="120"> <span class="width-2">魔法师维尔棒棒糖
                                </span> <span class="play-icon-s"></span></a></li>
                                        <li><a  href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562592431277_jnwx7n.jpg" width="185" height="250"> <span class="width-2">全职业150视频赏析
                                </span> <span class="play-icon"></span></a></li>
                                        <li><a  href="javascript:"><img src="https://ok.166.net/cain-corner/post/2019-07-08/1562592592854_1czh8z.jpg" width="185" height="250"> <span class="width-2">法师145世界第一
                                </span> <span class="play-icon"></span></a></li>
                                </ul>
                        </div>
                        <div class="d3-videos-content clearfix marbom">
                            <div class="content-left">
                                <h2 class="clearfix f13">推荐视频</h2>
                                <div class="blog-articles">
                                    <div class="article-wrapper first clearfix">
                                        <div class="article-image">
                                            <a  href="javascript:">
                                                <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562663570790_ax5f2s.jpg" width="295" height="120">
                                            </a>
                                        </div>
                                        <div class="article-content">
                                            <h3>
                                                <a  href="javascript:">世界第一！法师单人维尔朵套145层实战赏析</a>
                                            </h3>
                                            <p>魔法师的维尔朵套玩法自从2.6.5版本得到加强之后可谓是全职业“最强”的玩法了，我们为大家来带了本玩法目前世界记录保持者 fw6263 的145层实战视频，一起来看看大神的独特战术吧！</p>
                                        </div>
                                    </div>
                                    <div class="article-wrapper first clearfix">
                                        <div class="article-image">
                                            <a  href="javascript:">
                                                <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562663704019_koydey.jpg" width="295" height="120">
                                            </a>
                                        </div>
                                        <div class="article-content">
                                            <h3>
                                                <a href="javascript:">看上去很强！“梦魇之王”活动精彩视频混剪</a>
                                            </h3>
                                            <p>17赛季是散件为王的梦魇赛季，在17赛季特别举办了一期“梦魇之王”活动，用来寻找那些“有趣”的玩法流派，我们为目前为止活动中出现的优秀流派进行了剪辑加工，一起来欣赏吧！</p>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="clearfix f13 reh">
                                    <span>
                                        <a  href="javascript:">查看更多</a>
                                    </span>最新视频
                                </h2>
                                <div class="new-videos clearfix">
                                    <div class="new-videos-image">
                                        <ul class="image-articles">
                                            <li>
                                                <a  href="javascript:">
                                                    <img src="https://ok.166.net/cain-corner/post/2019-08-09/1565357959602_ooluxq.png" width="187" height="140">
                                                    <span>老司机带你玩转PTR</span>
                                                </a>
                                            </li>
                                            <li>
                                            <a  href="javascript:">
                                                <img src="https://ok.166.net/cain-corner/post/2019-08-09/1565357639920_bzorqm.png" width="187" height="140">
                                                <span>在暗黑起源PTR中开包</span>
                                            </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="new-videos-article">
                                        <ul class="video-articles articles-list">
                                            <li>
                                                <span class="article-date">07-31</span>
                                                <a  href="javascript:">国服第一！十七赛季专家模式三人145层</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">07-31</span>
                                                <a  href="javascript:">5分57秒！赛季四人速刷150层实录</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">07-02</span>
                                                <a  href="javascript:">赛季专属死灵冰枪</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">07-01</span>
                                                <a  href="javascript:">巫医散件吹箭玩法简介</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-30</span>
                                                <a  href="javascript:">猎魔人非赛134层实战视频赏析</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-28</span>
                                                <a  href="javascript:">巫医加入！全职业通关四人模式150层视频鉴赏</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-25</span>
                                                <a  href="javascript:">法师单人维尔朵套145层实战赏析</a> 
                                            </li>
                                        </ul>
                                        <ul class="video-articles articles-list">
                                            <li>
                                                <span class="article-date">06-21</span>
                                                <a  href="javascript:">暗黑“3”分钟第二十六期：巫医散件吹箭</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-14</span>
                                                <a  href="javascript:">看上去很强！“梦魇之王”活动精彩视频混剪</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-12</span>
                                                <a  href="javascript:">暗黑“3”分钟第二十五期：赛季专属飞盾圣教军</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-10</span>
                                                <a  href="javascript:">梦魇赛季玩点啥：猎魔人散件连射简介</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-03</span>
                                                <a  href="javascript:">梦魇赛季玩点啥？圣教军散件飞盾玩法简介</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">06-03</span>
                                                <a  href="javascript:">暗黑“3”分钟第二十四期：赛季专属散件魂法</a> 
                                            </li>
                                            <li>
                                                <span class="article-date">05-30</span>
                                                <a href="javascript:">17赛季巫医散件吹箭实战视频</a> 
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 右边部分 -->
                            <div class="content-right">
                                <h2 class="clearfix f13">
                                    <span>
                                        <a  href="javascript:">查看更多</a>
                                    </span>官方视频
                                </h2>
                                <!-- 官方视频 -->
                                <ul class="image-articles float clearfix">
                                    <li class="first">
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562675666623_vphire.jpg" width="220" height="165">
                                            <span>一周年纪念视频</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2018-10-24/1540386998312_2iw8ae..jpg" width="220" height="165">
                                            <span>2019年暗黑起源回顾</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- 娱乐视频 -->
                                <h2 class="clearfix f13">
                                    <span>
                                        <a  href="javascript:">查看更多</a>
                                    </span>娱乐视频
                                </h2>
                                <ul class="image-articles float clearfix">
                                    <li class="first">
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562675779816_n82ydi.jpg" width="220" height="165">
                                            <span>飒爽奔跑的寒冰风暴</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562675874925_d6kx0p.jpg" width="220" height="165">
                                            <span>我为国家拉电网！</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- 其它视频 -->
                                <h2 class="clearfix f13">
                                    <span>
                                        <a  href="javascript:">查看更多</a>
                                    </span>其他视频
                                </h2>
                                <ul class="image-articles float clearfix">
                                    <li class="first">
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562676039297_blwohs.jpg" width="220" height="165">
                                            <span>“梦魇之王”活动精彩</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a  href="javascript:">
                                            <img src="https://ok.166.net/cain-corner/post/2019-07-09/1562676143686_cb5kye.jpg" width="220" height="165">
                                            <span>超燃的CG混剪</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                            <!-- 视频弹窗 -->

                        </div>
                    </div>
                    <!-- 页脚 -->
                    <div class="footer">
                        <div class="foot">
                            <div class="text"><a href="#">意见反馈</a>　</div>
                            <a href="#">About NetEase</a> - <a href="#">公司简介</a> -
                            <a href="#">联系方法</a> - <a href="#">招聘信息</a> -
                            <a href="# ">客户服务</a> - <a href="#">隐私政策</a> -
                            <a href="#">网络营销</a> - <a href="#">网站地图</a><br>
                            <span class="cor">公司版权所有</span>
                            <br>
                            <span class="cRed">©1997-2020</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--  -->
        <!-- 返回顶部 -->
        <el-backtop class="cain-toolbar" :visibility-height="400">
            <div class="gotop-btn"></div>
        </el-backtop>
        <!-- end -->
    </div>
</template>

<style lang="css" scoped>
body {
    background: #000 url(../images/bg-center.jpg) repeat-y center top;
    margin: 0;
    padding: 0;
    font-size: 13px;
}
div {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
ul {
    list-style: none;
}
a {
    text-decoration: none;
    color: #A99877;
} 
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
.d3 {
    background: url(../images/bg-bottom.jpg) no-repeat center bottom;
}
.d3 .d3-bg {
    background: url(../images/d3-bg-top2.jpg) no-repeat center top;
}
.d3 .wrapper {
    width: 1200px;
    padding-top: 310px;
    margin: 0 auto;
    background: url(../images/000.png) no-repeat center 0;
}
.d3 .contents {
    padding: 0px 5px 0;
    margin-top: 80px;
    background: url(../images/d3-bg-center.jpg) repeat-y center top #000;
}
.d3 .footer {
    font: 12px/1.2 Arial, "Microsoft Yahei", Helvetica, sans-serif;
    height: 270px;
    padding: 150px 0 0;
    text-align: center;
    line-height: 24px;
    box-sizing: content-box;
}
.d3 .footer .text {
    padding: 5px 0;
    margin: 0 0 5px;
}
.d3 .footer a {
    color: #A99877;
}
.d3 .footer a:hover {
    color: #fff;
}
.d3 .footer .cor {
    color: #b99d6e;
}
.d3 .footer .cRed {
    color: #ff0000;
}
/* 返回顶部 */
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
.video-box {
    width: 100%;
    height: 500px;
    background-color: red;
}
.d3-videos .class-videos {
    padding: 0 10px;
    margin: 0 0 40px;
}
.d3-videos .class-videos h2 {
    margin-bottom: 10px;
    font-size: 13px;
}
.d3-videos h2 {
    border-bottom: 3px solid #171614;
    color: #ff9300;
    height: 40px;
    line-height: 35px;
    margin: 20px 0 0;
    background: url(../images/media-icon.gif) no-repeat 0 center;
    padding: 0 0 0 30px;
}
.d3-videos .class-videos .first {
    width: 380px;
}
.d3-videos .class-videos .class-videos-list li a {
    display: block;
    position: relative;
    z-index: 0;
}
.d3-videos .class-videos .first video {
    width: 100%;
}
.d3-videos .class-videos .class-videos-list span.width-1 {
    width: 380px;
}
.d3-videos .class-videos .class-videos-list span {
    height: 30px;
    display: block;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: 1;
    text-align: center;
    line-height: 30px;
    background: rgba(0,0,0,0.8);
}
.d3 .contents a:hover {
    color: #ff9300;
}
.d3-videos .class-videos .class-videos-list li a:hover span.play-icon {
    width: 48px;
    height: 48px;
    display: block;
    position: absolute;
    left: 50%;
    top: 50%;
    z-index: 10;
    margin: -24px 0 0 -24px;
    background: url(//ok.166.net/cain-corner/133439765/game/blizzard/d3/images/d3-view-icon.png) no-repeat 0 0;
}
.d3-videos .class-videos .class-videos-list {
    width: 390px;
    float: left;
}
.d3-videos .class-videos .class-videos-list li {
    float: left;
    padding: 10px 0 0 10px;
}
.d3-videos .class-videos .class-videos-list span.width-2 {
    width: 185px;
}
.d3 .d3-videos .content-left {
    width: 630px;
    padding: 0 30px 0 15px;
    height: 100%;
    float: left;
}
.d3-videos-content * {
    box-sizing: content-box;
}
.d3-videos-content .article-wrapper {
    padding: 20px 0;
}
.d3-videos-content .article-image {
    float: left;
}
.d3 .d3-videos .article-content {
    width: 305px;
}
.d3-videos-content .article-content {
    float: left;
    padding: 0 0 0 20px;
}
.first {
    border: 0 !important;
    background: none !important;
}
.f13 {
    font-size: 13px;
}
.d3-videos h3 {
    font-size: 16px;
    white-space: nowrap;
}
.d3-videos-content p {
    font-size: 12px;
    margin: 10px 0;
    line-height: 22px;
    color: #b99d6e;
}
.d3-videos h2 span {
    float: right;
    font-size: 12px;
    padding: 5px 0 0;
}
.reh {
    line-height: 38px !important;
}
.d3-videos .new-videos-image {
    width: 191px;
    float: left;
    padding: 0 40px 0 0;
}
.d3-videos .image-articles li {
    margin: 20px 0 0;
}
.d3-videos-content .image-articles li a img {
    border: 1px solid #483a30;
    border-radius: 3px;
    box-shadow: 0 0 10px #000;
}
.d3-videos .image-articles span {
    display: block;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.d3-videos .new-videos-article {
    width: 399px;
    float: left;
}
.d3-videos .video-articles {
    margin: 15px 0 0;
}
.d3-videos-content .articles-list li {
    background: url(//ok.166.net/cain-corner/951088215/game/blizzard/d3/images/bullet.gif) no-repeat 0 center;
    padding: 0 0 0 15px;
    line-height: 24px;
    font-size: 12px;
}
.article-date {
    float: right;
    color: #999;
}
.d3 .d3-videos .content-right {
    width: 475px;
    padding: 0 15px 0 25px;
    height: 100%;
    float: left;
}
.d3-videos-content .float li {
    float: left;
}
.marbom {
    margin-bottom: 20px;
}
.vbox {
    width: 380px;
    height: 380px;
    margin-bottom: 10px;
}
.tbox {
    width: 380px;
    height: 250px;
}
</style>


<script>
import videoPlayer from '../components/other/videotest.vue'
export default {
    inject:['reload'],
    data() {
        return {
            videos:[],
           titleVisible:true,
            login_flag1:'',
            login_flag2:'',
            userid:window.sessionStorage.getItem('userid'),
            usernickname:'',
        }
    },
    created() {
        this.getVideo();
        this.getnickname()
        this.login_check()
        
    },
    methods: {
        getnickname(){
            this.$http.get("getuser/"+this.userid)
            .then(result=>{
                this.usernickname = result.body.nickname
            })
        },
        getVideo(){
            this.$http.get("video")
            .then(result=>{
                this.videos = result.body[1]
            })
        },
      login_check(){
            if(this.userid == null){
                this.login_flag1= true
            }else if(this.userid != null){
                this.login_flag2= true
            }
        },
        log_off() {
            window.sessionStorage.clear()
             this.reload()
        }
    },
    components:{
        videoplayer:videoPlayer
    }
}
</script>