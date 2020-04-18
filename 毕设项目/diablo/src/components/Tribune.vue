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
                            欢迎您,{{succ_user}}<i class="el-icon-arrow-down el-icon--right"></i>
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
                        <!-- 主体部分 -->
                        <div class="content-box">
                            <!-- top -->
                            <div class="header">
                                <p class="title">{{listinfo.title}}</p>
                                <div class="header_num">
                                    <span class="look">查看: <i>{{i}}</i></span>
                                    <span>回复:<i>{{com_num}}</i></span>
                                    <a href="#"><img src="../images/print.png" alt=""></a>
                                </div>
                            </div>
                            <div class="main">
                                <div class="main-left">
                                    <div class="tx-box">
                                        <img src="../images/tx.jpg" alt="" >
                                        <div class="ms">
                                            <p class="name"><a href="#">明彻玉玦弦未鸣</a></p>
                                            <p>帖子数:</p>
                                            <p>等级:</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="main-right">
                                    <div class="right-top">
                                        <span>发表于：{{listinfo.add_time | dateFormat2}}</span><span>只看该作者</span>
                                    </div>
                                    <!-- 内容 -->
                                    <div class="text-box" v-html="listinfo.contents">
                                        {{listinfo.contents}}
                                    </div>
                                    <!-- 内容end -->
                                    <!-- 点赞收藏模块 -->
                                    <div class="p_btn">
                                        <div class="ptn1">
                                            <a href="javascript:" @click="addOrMinus"><i><img src="../images/fav.gif" alt="">收藏<span>{{collect_num}}</span></i></a>
                                            <a href="javascript:" @click="like"><i><img src="../images/rec_add.gif" alt="">点赞<span>{{likes}}</span></i></a>
                                            <a href="javascript:" @click="dislike"><i><img src="../images/rec_subtract.gif" alt="">踩<span>{{dislikes}}</span></i></a>
                                        </div>
                                        <div class="ptn2">
                                            <a href="javascript:">回复</a>
                                            <a href="javascript:">举报</a>
                                        </div>
                                    </div>
                                    <!-- 点赞收藏模块 end -->
                                </div>
                               
                            </div>
                            <!-- 评论 -->
                            <comment></comment>
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
    color: #000;
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
.content-box{
    width: 100%;

}
.header {
    width: 100%;
    height: 80px;
    background-color: #b8a87b;
    padding: 20px;
    line-height: 50px;
    display: flex;
    justify-content: space-between;
    /* border-bottom: 5px solid #998c68; */
}
.header .title {
    color: #000;
    font-size: 20px;
    font-weight: 700;
}
.header div {
    width: 200px;
    margin-right: 50px;
    display: flex;
    justify-content: space-around;
}
.header .header_num span {
    font-size: 15px;
}
.header .header_num i {
    color: blue;
    font-style: normal;
    margin-left: 5px;
}
.main {
    position: relative;
    margin-top: 5px;
    display: flex;
}
.main-left {
    /* position: absolute;
    left: 0; */
    width: 23%;
    /* height: 1000px; */
    background-color: #BCAD87;
    border-right: 1px solid #998c68;
    padding-left: 20px;
    padding-top: 20px;
    
}
.main-left .tx-box {
    position: relative;
    width: 100%;
    /* background-color: red; */
}
.main-left img {
    width: 96px;
    height: 96px;
    overflow: hidden;
    border: 1px solid black;
    border-radius: 8px;
    background-color: #000;
}
.main-left .ms {
    position: absolute;
    right: 30px;
    top: 0;
}
.main-left .ms p {
    text-align: left;
    margin-top: 5px;
    color: #000;
    font-size: 12px;
}
.main-left .ms .name {
    font-size: 16px;
    font-weight: 700;
}
.main-left .name a {
    color: #000;
}
.main-left .name a:hover {
    color: darkred;
}
.main-right {
    /* position: absolute;
    right: 0; */
    width: 77%;
    /* height: 500px; */
    background-color: #b8a87b;
    padding-bottom: 30px;
}
.main-right .right-top {
    width: 95%;
    line-height: 50px;
    height: 50px;
    /* background-color: red; */
    margin: 0 auto;
    border-bottom: 1px dashed gray;
}
.main-right .right-top span {
    margin-right: 20px;
    font-size: 13px;
}
.text-box >>>.black {
    color: #000;
    line-height: 30px;
}
.text-box {
    padding: 20px;
}
.text-box >>>p {
    color: #000;
    /* text-indent: 2em; */
    line-height: 30px;
}
.text-box >>>.title2 {
    font-weight: 700;
    font-size: 20px;
    color: darkred;
    display: block;
    margin-bottom: 15px;
}
.text-box >>>img {
    margin-bottom: 15px;
}
.p_btn {
    width: 80%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-content: center;
    margin-top: 30px;
}
.ptn1 i:hover {
    background: #854130;
}
.ptn1 i{
    display: inline-block;
    font-style: normal;
    height: 30px;
    line-height: 30px;
    background: #581100;
    cursor: pointer;
    padding: 0 10px;
    color: #c7b88d;
    font-size: 14px;
}
.ptn1 img {
    margin-right: 5px;
    vertical-align: middle;
}
.ptn1 span {
    margin-left: 5px;
    color: #c7b88d;
}
.ptn2 {
    width: 150px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    /* background-color: red; */
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.ptn2 a{
    font-size: 14px;
    border: 1px solid rgb(141, 136, 136);
    text-align: center;
    width: 60px;
    height: 30px;
    line-height: 30px;
    background: #bcad87;
    border: 1px solid #8e7e50;
    padding: 0;
    margin-left: 6px;
}
.ptn2 a:hover {
    color: darkred;
    background: #998754;
}
</style>


<script>
import comment from './comment.vue'
import {Toast} from 'mint-ui'
export default {
    inject:['reload'],
    data() {
        return {
            id:this.$route.params.id,
            listinfo:[],
            com_num:'',
            i:'',
            collect_num:'',
            likes:'',
            dislikes:'',
            flag:true,
            flag1:true,
            flag2:true,
            cName:'baseContents',
            login_flag1:'',
            login_flag2:'',
            succ_user:window.sessionStorage.getItem('username')
        }
    },
    created() {
        this.getListInfo()
        this.getComments()
        this.looknum()
        this.login_check()
    },
    methods: {
        getListInfo(){
            this.$http.get("listinfo/".concat(this.id))
            .then(result=>{
                this.listinfo = result.body;
                this.collect_num = result.body.collect_num;
                this.likes = result.body.good_num;
                this.dislikes = result.body.bad_num;
            })
        },
        getComments(){
            this.$http.get("getcom")
            .then(res=>{
                    this.com_num = res.body.length
            })
        },
        looknum(){
            if (localStorage.pagecount) {
            localStorage.pagecount = Number(localStorage.pagecount) + 1;
            } else {
            localStorage.pagecount = 1;
            }
            this.i = localStorage.pagecount
        },
        addOrMinus() {
            this.collect_num = this.flag ? this.collect_num + 1 : this.collect_num - 1;
            this.flag = !this.flag;
            if(this.flag == false){
                Toast({
                        message: '收藏成功',
                        position: 'middle',
                        duration: 1500
                    });
            }else{
                Toast({
                        message: '取消收藏',
                        position: 'middle',
                        duration: 1500
                    });
            }
        },
        like(){
            this.likes = this.flag1 ? this.likes + 1 : this.likes - 1;
            this.flag1 = !this.flag1;
            if(this.flag2 == false){
                if(this.dislikes >0)
                this.dislikes = this.dislikes-1
                this.flag2=true;
            }
            
        },
        dislike(){
            this.dislikes = this.flag2 ? this.dislikes + 1 : this.dislikes - 1;
            this.flag2 = !this.flag2;
            if(this.flag1 == false){
                this.likes = this.likes-1
                this.flag1=true;
            }
        },
        login_check(){
            // console.log(this.succ_user)
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
        onload = function(){
            
        }        
    },
    components:{
        comment:comment
    }
}
</script>