<template>
    <div class="app">
        <el-container>
            <el-header>
                <div class="header-left">后台数据管理系统</div>
                <div class="header-right">
                   
                    <el-dropdown>
                        <span class="el-dropdown-link">
                            {{administrators}}
                            <i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item >
                                <span @click="log_off">退出登录</span>
                                </el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </div>
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <ul class="management-list">
                        <li @click.prevent="cName='banner'">
                            <a href="javascript:" >首页轮播图管理</a>
                            <span> <i class="el-icon-arrow-right"></i></span>
                        </li>
                        <li @click.prevent="cName='listdata'">
                            <a href="javascript:" >游戏资讯管理</a><span> <i class="el-icon-arrow-right"></i></span>
                        </li>
                        <li @click.prevent="cName='usermanage'">
                            <a href="javascript:">用户账号管理</a><span> <i class="el-icon-arrow-right"></i></span>
                        </li>
                        <li @click.prevent="cName='stickdata'">
                            <a href="javascript:" >游戏蓝贴管理</a><span> <i class="el-icon-arrow-right"></i></span>
                        </li>
                        <!-- <li @click.prevent="cName='test'">
                            <a href="javascript:" >测试</a><span> <i class="el-icon-arrow-right"></i></span>
                        </li> -->
                    </ul>
                </el-aside>
                <el-main>
                    <transition mode="out-in">
                            <component :is='cName'></component> 
                    </transition>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<style lang="css" scoped>
.app {
    display: flex;
    flex-direction: column;
}
.el-main {
   width: 100vh;;
}
.el-container {
    height: 100vh;
}
a {
    text-decoration: none;
}
.el-header {
    background-color: #23262E;
    color: rgba(255,255,255,.7);
    text-align: center;
    line-height: 60px;
}
.el-aside {
    background-color: #393D49;
    color: rgba(255,255,255,.7);
    
}
.el-aside a {
    color: rgba(255,255,255,.7);
    font-size: 14px;
}
.el-main {
    background-color: white;
    color: #333;
}
body > .el-container {
    margin-bottom: 40px;
}
.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
    line-height: 260px;
}
.el-container:nth-child(7) .el-aside {
    line-height: 320px;
}
.el-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.header-left {
    margin-left: 25px;
    font-size: 25px;
}
.header-right {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.header-right .user-img {
   width: 36px;
   height: 36px;
   border-radius: 50%;
   /* background-color: red; */
   margin-right: 5px;
   overflow: hidden;
   line-height: 36px;
}
.header-right .user-img img {
    width: 100%;
    height: 100%;
}
.el-aside ul li {
    width: 100%;
    height: 45px;
    line-height: 45px;
    /* background-color: red; */
    margin-top: 10px;
    padding: 0 10px;
    display: flex;
    justify-content: space-between;
}
.el-aside ul li:hover {
    background-color: rgba(204, 199, 199, 0.541)
}
.el-aside ul li:hover a,
.el-aside ul li:hover span  {
    color: white;
}
</style>

<script>
import {Toast} from 'mint-ui'
import banner from './Managements/banner.vue'
import welcome from './Managements/Welcome.vue'
import listdata from './Managements/ListData.vue'
import stickdata from './Managements/BlueStick.vue'
import test from '../components/other/page.vue'
import usermanage from './Managements/UserManage.vue'
export default {
    inject:['reload'],
    data() {
        return {
            administrators:sessionStorage.getItem('administrators'),
        banner:banner,
            cName:'welcome',
        }
    },
    created() {

    },
    methods: {
        log_off() {
                    window.sessionStorage.removeItem('administrators')
                    this.reload()
                    this.$router.push('/adminlogin')
            }
    },
    mounted() {
        
                $('.management-list > li').click(function(){
                $(this).children('a').css('color','white')
                $(this).children('span').css('color','white')
                $(this).siblings('li').children('span').css('color','rgba(255,255,255,.7)')
                $(this).siblings('li').children('a').css('color','rgba(255,255,255,.7)')
            })
        
        
    },
    components:{
        banner:banner,
        welcome:welcome,
        listdata:listdata,
        stickdata:stickdata,
        test:test,
        usermanage:usermanage,
    }
}
</script>