<template>
    <div class="data-content">
        <div class="location">
            <a href="#">暗黑起源</a>
            <span id="tip-title">基础介绍</span>
        </div>
        <div class="guide-top-img">
            <p class="guide-text">
                《暗黑起源》是一款经典的动作类角色扮演游戏，玩家可在七种不同的职业中（野蛮人、巫医、魔法师、武僧、猎魔人、死灵法师和圣教军）选择创建自己的角色，每种职业各有一套完整独特的技能体系。
            </p>
        </div>
        <div class="guide clearfix endtext">
            <!-- 侧边菜单 -->
            <div class="guide-menu">
                <h2 class="guide-menu-title">基本资料</h2>
                <h3 class="open">基础知识</h3>
                <ul class="guide-menu-content "  >
                    <li><a href="#" @click.prevent="cName='gameFeatures'">游戏特色</a></li>
                    <li><a href="#" @click.prevent="cName='basicOperation'">基础操作</a></li>
                    <li><a href="#" @click.prevent="cName='rolecareer'">角色职业</a></li>
                    <li><a href="#" @click.prevent="cName='gamepattern'">游戏模式</a></li>
                </ul>
                <h3 >其它介绍</h3>
                <ul class="guide-menu-content none" >
                    <li><a href="#" @click.prevent="cName='mappresrntation'">地图介绍</a></li>
                    <li><a href="#" @click.prevent="cName='achievement'">成就系统</a></li>
                    <li><a href="#">怪物介绍</a></li>
                    <li><a href="#">游戏难度</a></li>
                    <li><a href="#">其它</a></li> 
                </ul>
            </div>
            <!-- 侧边导航结束 -->
            <!-- 右边内容 -->
            
                <transition mode="out-in">
                    <component :is='cName'></component> 
                </transition>
            
        </div>

        <!--  -->
    </div>
</template>

<style lang="css" scoped>
body,html { 
    color: #b99d6e;
}
div,body,ul,h3,h2 {
    margin: 0;
    padding: 0;
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
.d3 .contents .data-content {
    height: 100%;
    padding: 0 0 20px;
    position: relative;
    z-index: 0;
    
}
.location {
    border-bottom: 3px solid #22201C;
    font: 12px/1.2 Arial, "Microsoft Yahei", Helvetica, sans-serif;
}
.d3 .contents .data-content .location {
    border: 0;
    position: absolute;
    left: 25px;
    top: 0;
    z-index: 10;
}
.location a, .location span {
    display: inline-block;
    padding: 10px 10px 10px 15px;
    background: url(../images/arrow.gif) no-repeat 0 center;
    line-height: 22px;
    color: #A99877;
}
.location a:hover {
    color: rgb(221, 151, 20);
}
.guide-top-img {
    /* background: url(../images/basic_guide-top-all.jpg) no-repeat 0 0; */
    background: url(../images/01.png) no-repeat 0 0;
    height: 260px;
}
.guide-top-img p {
    margin: 0;
}
.guide-top-img .guide-text {
    text-indent: 2em;
    padding: 80px 0 50px 20px;
    width: 400px;
    color: #A99877;
    font-size: 16px;
    line-height: 28px;
    box-sizing: content-box;
}
.guide {
    width: 100%;
    position: relative;
}
.endtext {
    width: auto;
    font-size: 14px;
    clear: both;
    /* padding: 10px 0; */
}
.guide-menu {
    width: 300px;
    float: left;
    text-align: left;
}
.guide-menu-title {
    height: 41px;
    line-height: 41px;
    text-align: center;
    color: #B99D6E;
    font-size: 18px;
    background: url(../images/guide-menu-list-title.jpg) no-repeat center top;
    margin: 0;
}
.guide-menu h3 {
    background: url(../images/guide-menu-list-bg.jpg) no-repeat 0 0;
}
.guide-menu h3 {
    cursor: pointer;
    color: #f4b66b;
    height: 33px;
    line-height: 33px;
    padding: 0 0 0 30px;
    font-size: 14px;
    font-weight: normal;
    margin: 0;
}
.guide-menu .guide-menu-content {
    background: #090909;
    padding: 0;
}
.guide-menu .guide-menu-content li {
    border-top: 1px solid #2a241c;
    list-style: none;
    line-height: 30px;
    color: red;
    font-size: 14px;
    /* text-align: center; */
}
.guide-menu .guide-menu-content li a {
    color: #A4601E;
    display: block;
    padding: 0 10px 0 30px;
    background: url(../images/jiang_classes_bullet.gif) no-repeat 15px 12px;
}
.guide-menu .guide-menu-content li a:hover {
    color: #fff;
}
.guide-menu h3.open {
    background: url(../images/guide-menu-list-bg.jpg) no-repeat 0 -66px;
}

.block {
    display: block;
}
.none {
    display: none;
}
.guide .guide-contents {
    width: 889px;
    float: left;
    border-left: 1px solid #2A241C;
    overflow: hidden;
}
</style>

<script>
import gameFeatures from './BaseContents/GameFeatures.vue'
import basicOperation from './BaseContents/BasicOperation.vue'
import rolecareer from './BaseContents/RoleCareer.vue'
import gamepattern from './BaseContents/GamePattern.vue'
import mappresrntation from './BaseContents/MapPresentation.vue'
import achievement from './BaseContents/Achievement.vue'

  export default {
      data() {
          return {
              cName:'gameFeatures',
          }
      },
    methods: {
        
    },
    mounted() {
        $('.guide-menu>h3').click(function(){
            //是否存在open 属性
            var ss= $(this).hasClass('open');
            if(ss){
                $(this).removeClass('open');
                // $(this).next('.guide-menu-content').addClass('none');
                // slideToggle()  如果该元素为隐藏则变为显示，带有过渡时间效果。反之
                $(this).next('.guide-menu-content').slideToggle(250);
            }else{
                $(this).addClass('open');
                // $(this).next('.guide-menu-content').removeClass('none');
                $(this).next('.guide-menu-content').slideToggle(250);
            }
        })
        // 点击侧边菜单选项时改变小标题文字,添加选中样式
        $('.guide-menu-content>li').click(function(){
            var aa = $(this).children('a').text();
            if(aa == '游戏特色'){
                $('#tip-title').text('基础介绍');
            }else{
                 $('#tip-title').text(aa);
            }
           $(this).children('a').css("color","#fff")
           $(this).siblings('li').children('a').css("color","#A4601E")
           $(this).parents('ul').siblings('ul').children('li').children('a').css("color","#A4601E")
        })
    },
    components:{
        gameFeatures:gameFeatures,
        basicOperation:basicOperation,
        rolecareer:rolecareer,
        gamepattern:gamepattern,
        mappresrntation:mappresrntation,
        achievement:achievement,
    }
  }
</script>

