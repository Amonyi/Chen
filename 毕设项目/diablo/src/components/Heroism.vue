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
                        <!-- 这是主体组件切换部分 -->
                        <ul class="uu">
                            <li><span class="ymr"></span><a href="#" @click.prevent="cName='bar'">野蛮人</a></li>
                            <li><span class="lmr"></span><a href="#" @click.prevent="cName='demonhunter'">猎魔人</a></li>
                            <li><span class="fs"></span><a href="#" @click.prevent="cName='wizard'">魔法师</a></li>
                            <li><span class="wy"></span><a href="#" @click.prevent="cName='witchdoctor'">巫医</a></li>
                            <li><span class="ws"></span><a href="#" @click.prevent="cName='monk'">武僧</a></li>
                            <li><span class="sjj"></span><a href="#" @click.prevent="cName='crusader'">圣教军</a></li>
                            <li><span class="sl"></span><a href="#" @click.prevent="cName='necromancer'">死灵法师</a></li>
                        </ul>
                        <transition mode="out-in">
                            <component :is='cName'></component> 
                        </transition>
                        <!-- <div class="hero-img">
                            <div>
                                <img src="../images/ymr-icon.png" alt="">
                                <p>野蛮人</p>
                            </div>
                        </div> -->
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
.uu {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: url(../images/bg-test.png) repeat-x;
    /* background-size: cover; */
}
.uu li {
    width: 14%;
    height: 60px;
    color: white;
    text-align: center;
    line-height: 60px;
    border-right: 2px solid rgba(99, 95, 95, 0.808);
    justify-content: center;
    align-items: center;
    display: flex;
}
.uu li span {
    display: inline-block;
    width: 42px;
    height: 42px;
    border: 1px solid gray;
    margin-right: 10px;
    background-size: cover;
}
.uu li a {
    color: #FCB614;
    font-size: 20px;
}
.ymr {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 0;
}
.lmr {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 -42px;
}
.fs {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 -78px;
}.wy {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 -118px;
}.ws {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 -158px;
}.sjj {
    background: #000 url(../images/hero-icon.jpg) no-repeat 0 -200px;
}.sl {
    background: #000 url(../images/sl-icon.png) no-repeat;
}

</style>


<script>
import bar from './HeroContents/bar.vue'
import wizard from './HeroContents/Wizard.vue'
import monk from './HeroContents/Monk.vue'
import necromancer from './HeroContents/Necromancer.vue'
import crusader from './HeroContents/Crusader.vue'
import witchdoctor from './HeroContents/Witchdoctor.vue'
import demonhunter from './HeroContents/DemonHunter.vue'

export default {
    inject:['reload'],
    data() {
        return {
           cName:"bar",
           login_flag1:'',
            login_flag2:'',
            userid:window.sessionStorage.getItem('userid'),
            usernickname:''

        }
    },
    created() {
        this.login_check()
        this.getnickname()
    },
    methods: {
        getnickname(){
            this.$http.get("getuser/"+this.userid)
            .then(result=>{
                this.usernickname = result.body.nickname
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
        bar:bar,
        necromancer:necromancer,
        monk:monk,
        demonhunter:demonhunter,
        witchdoctor:witchdoctor,
        crusader:crusader,
        wizard:wizard
    }
}
</script>