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
                            欢迎您,{{nickname}}<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
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
                        <!-- 主体部分 start-->
                        <div class="personal-main">
                            <div class="per-left">
                                <!-- 头像 -->
                                <div class="l-uimg">
                                    <div class="uimg">
                                        <img :src="uimage" alt="">
                                    </div>
                                    <div class="uname">
                                        <p>欢迎您，</p>
                                        <p class="nick-name">{{nickname}}</p>
                                    </div>
                                </div>
                                <!-- 导航 -->
                                <ul class="cen-menu">
                                    <h4>个人中心</h4>
                                    <li @click.prevent="cName='information'"><a href="#" >基本信息</a><span class="el-icon-arrow-right"></span> </li>
                                    <li @click.prevent="cName='account'"><a href="#" >修改密码</a><span class="el-icon-arrow-right"></span> </li>
                                </ul>
                            </div>
                            <div class="per-right">
                                <transition mode="out-in">
                                    <component :is='cName'></component> 
                                </transition>
                            </div>
                        </div>
                        <!-- 主体部分 end -->
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
.personal-main {
    width: 100%;
    height: 600px;
    background-color: #d1c39b;
    display: flex;
    justify-content: space-between;
    align-content: center;
    
}
.personal-main .per-left {
    width: 20%;
    border-right:1px solid gray; 
    /* background-color: red; */
}
.personal-main .per-right {
    width: 80%;
    /* background-color: blue; */
}
.personal-main .per-left .l-uimg {
    width: 100%;
    height: 150px;
    display: flex;
    justify-content: space-between;
    align-content: center;
    border-bottom: 1px dashed black;
    padding: 25px 10px;
}
.l-uimg .uimg {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    border: 1px solid black;
}
.l-uimg .uimg img {
    width: 100%;
    height: 100%;
}
.l-uimg .uname {
    width: 50%;
    margin: 25px 0px 25px 0;
}
.l-uimg .uname p {
    color: #000;
}
.l-uimg .uname .nick-name {
    margin-top: -12px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.per-left .cen-menu {
    padding: 10px 0;
}
.per-left .cen-menu h4 {
    height: 40px;
    line-height: 40px;
    padding: 0 10px;
}
.per-left .cen-menu li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 45px;
    padding: 0 10px;
    /* border-top: 1px solid gray;s */
}
.per-left .cen-menu li:hover a,
.per-left .cen-menu li:hover span {
    color: white;
}
.per-left .cen-menu li a {
    color: #000;
    height: 45px;
    line-height: 45px;
}
</style>


<script>
import information from './PersonalCenter/Information.vue'
import account from './PersonalCenter/Account.vue'
export default {
    inject:['reload'],
    data() {
        return {
            cName:"information",
            login_flag1:'',
            login_flag2:'',
            succ_user:window.sessionStorage.getItem('username'),
            uid:window.sessionStorage.getItem('userid'),
            uimage:'',
            nickname:''
        }
    },
    created() {
        this.login_check()
        this.getUimg()
    },
    methods: {
        login_check(){
            if(this.uid == null){
                this.login_flag1= true
            }else if(this.uid != null){
                this.login_flag2= true
            }
        },
        log_off() {
            window.sessionStorage.clear()
             this.reload()
             this.$router.push('/home');
        },
        getUimg(){
        this.$http.get("getuser/"+this.uid)
            .then(result=>{
                this.uimage = result.body.user_img
                this.nickname = result.body.nickname

            })
      }
    },
    components:{
        information:information,
        account:account,
    },
    mounted() {
        $('.cen-menu > li').click(function(){
            $(this).children().css('color','white')
            $(this).siblings('li').children().css('color','black')
        })
    },
}
</script>