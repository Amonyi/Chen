//引入路由文件
import VueRouter from "vue-router"
//导入对应的路由组件
import homeContainer from "./components/HomeContainer.vue"
import login from "./components/Login.vue"
import register from "./components/Register.vue"
import base from "./components/Base.vue"
import heroism from "./components/Heroism.vue"
import tribune from "./components/Tribune.vue"
import adminlogin from "./components/AdminLogin.vue"
import management from "./components/Management.vue"
import video from "./components/video.vue"



var router = new VueRouter({
    routes:[//路由的规则
        {path:"/",redirect:"/home"},
        {path:"/home",component:homeContainer},
        {path:"/home/register",component:register},
        {path:"/home/login",component:login},
        {path:"/home/base",component:base},
        {path:"/home/heroism",component:heroism},
        {path:"/home/tribune/:id",component:tribune,name:"tribune"},
        {path:"/management",component:management,meta:{isLogin:true}},
        {path:"/adminlogin",component:adminlogin},
        {path:"/home/video",component:video},
    ],
    linkActiveClass:"mui-active"
})
router.beforeEach((to,from,next)=>{
    if(to.matched.some(res=>res.meta.isLogin)){//判断是否需要登录
        if (sessionStorage['administrators']) {
            next();
        }else{
            next({
                path:"/adminlogin",
                query:{
                    redirect:to.fullPath
                }
            });
        }
    }else{
        next()
    }
});
export default router