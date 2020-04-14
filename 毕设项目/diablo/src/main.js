//入口文件
import Vue from 'vue'
//1.1导入路由
import VueRouter from 'vue-router'
//1.2安装路由
Vue.use(VueRouter)

import VueResource from 'vue-resource'
Vue.use(VueResource)
//设置全局post请求头 以表单形式去请求
Vue.http.options.emulateJSON = true;
Vue.http.options.root="http://127.0.0.1:8080/"

import VuePreview from 'vue2-preview'
Vue.use(VuePreview)

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/display.css';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);
// 引入bootstrap样式
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.min.js'

//导入MUI的样式
import './lib/mui/css/mui.min.css'
//导入MUI的字体图标
import "./lib/mui/css/icons-extra.css"

//按需导入Mint-UI
import 'mint-ui/lib/style.css'

//引用视频插件
import VideoPlayer from 'vue-video-player'
import 'video.js/dist/video-js.css'
Vue.use(VideoPlayer) 


// 导入ant-design-vue样式 按需导入
import 'ant-design-vue/dist/antd.css';
//1.3导入自己的路由模块
import router from './router.js'

import app from "./App.vue"
//导入时间格式化的插件
import moment from 'moment'

import Vuex from 'vuex'
Vue.use(Vuex)

//就是共享数据的仓库
var store = new Vuex.Store({
    state:{
        car:[],//这里是存储购物车中的商品信息的。用数组给保存起来，该数组装的每一个商品对象{id,name,count,price selected}
    },
    mutations:{//这里是状态进行修改的地方
        addToCar(state,goodsinfo){
            //如果购物车中有相同的物品则直接修改该商品的数量，否则再添加到该数组之中
            let flag = false;

            state.car.some(item=>{
                if(item.id == goodsinfo.id){
                    item.count += parseInt(goodsinfo.count);
                    flag = true;
                    return true;
                }
            })

            if(!flag){
                state.car.push(goodsinfo);
            }
           
        },
        updateGoodsInfo(state, goodsinfo) {
            // 修改购物车中商品的数量值
            // 分析： 
            state.car.some(item => {
              if (item.id == goodsinfo.id) {
                item.count = parseInt(goodsinfo.count)
                return true
              }
            })
        
          
          },
          removeFormCar(state, id) {
            // 根据Id，从store 中的购物车中删除对应的那条商品数据
            state.car.some((item, i) => {
              if (item.id == id) {
                state.car.splice(i, 1)
                return true;
              }
            })
          
          },
          updateGoodsSelected(state, info) {
            state.car.some(item => {
              if (item.id == info.id) {
                item.selected = info.selected
              }
            })
         
          }
    },
    getters:{
        //获得购物总数
        getAllCount(state){
            var c = 0;
            state.car.forEach(item=>{
                c += item.count;
            })
            return c;
        },
        getGoodsCount(state) {
        
            var o = []
            state.car.forEach(item => {
              o[item.id] = item.count
            })
            return o
          },
          getGoodsSelected(state) {
            var o = []
            state.car.forEach(item => {
              o[item.id] = item.selected
            })
            return o
          },
          getGoodsCountAndAmount(state) {
            var o = {
              count: 0, // 勾选的数量
              amount: 0 // 勾选的总价
            }
            state.car.forEach(item => {
              if (item.selected) {
                o.count += item.count
                o.amount += item.price * item.count
              }
            })
            return o
          }

    }

})



//定义全局过滤器
Vue.filter("dateFormat",function(dataStr,pattern="YYYY-MM-DD"){
        return moment(dataStr).format(pattern);
})
Vue.filter("dateFormat2",function(dataStr,pattern="YYYY-MM-DD HH:mm:ss"){
  return moment(dataStr).format(pattern);
})
// 跳转新页面后返回顶部的位置
router.afterEach((to,from,next)=>{
  window.scrollTo(0,0);
})

var vm = new Vue({
    el:"#app",
    render:c=>c(app),
    router, //1.4挂载路由
    store,//挂载store状态对象

})

