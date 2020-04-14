<template>
    <div>
        <!-- 顶部banner图 -->
        <div class="hero-img">
            <div v-if="heroism[5]">
                <!-- <img :src="heroism[0].hero_banner" alt=""> -->
                <p>{{heroism[5].hero_img_txt}}</p>
            </div>
        </div>
        <!-- 主体内容 -->
        <div class="hero-con">
            <div class="hero-left">
                <p class="title3"><img src="../../images/ico_bullet.jpg"/>简介</p>
                <div class="brief" v-if="heroism[5]">
                    <div v-html="heroism[5].brief">{{heroism[5].brief}}</div>
                    <ul>
                        <li><img :src="heroism[5].brief_img1" alt="" width="200"></li>
                        <li><img :src="heroism[5].brief_img2" alt="" width="200"></li>
                        <li><img :src="heroism[5].brief_img1" alt="" width="200"></li>
                    </ul>
                </div>
                <p class="title3"><img src="../../images/ico_bullet.jpg"/>故事</p>
                <div class="story">
                    <div class="mx"></div>
                    <div class="xb-btn">
                        <div class="man"></div>
                        <div class="woman"></div>
                    </div>
                    <div class="story-txt" v-html="heroism[5].story_txt" v-if="heroism[5]">
                        {{heroism[5].story_txt}}
                    </div>
                </div>
                <p class="title3"><img src="../../images/ico_bullet.jpg"/>装备</p>
                <div class="zb-txt" v-if="heroism[5]">
                    <div v-html="heroism[5].zb_txt">{{heroism[5].zb_txt}}</div>
                    <div class="zb"><img :src="heroism[5].zb_img" alt=""></div>
                </div>
                <p class="title3"><img src="../../images/ico_bullet.jpg"/>护甲进展</p>
                <div class="zbjz" v-if="heroism[5]">
                    <img :src="heroism[5].zbjz_img" alt="">
                    <div v-html="heroism[5].zbjz_txt">{{heroism[5].zbjz_txt}}</div>
                    
                </div>
            </div>
            <!-- 右边内容 -->
            <div class="hero-right">
                <div class="jntx" v-if="heroism[5]">
                    <img :src="heroism[5].jntx_img" alt="" class="img-icon">
                    <p class="title2">特性</p>
                    <div class="jnxq">
                        <ul>
                            <li>
                                <img :src="heroism[5].jnxq_icon1">
                                <div v-html="heroism[5].jnxq_icon1_txt">
                                    {{heroism[5].jnxq_icon1_txt}}
                                </div>
                            </li>
                            <li>
                                <img :src="heroism[5].jnxq_icon2">
                                <div v-html="heroism[5].jnxq_icon2_txt">
                                    {{heroism[5].jnxq_icon2_txt}}
                                </div>
                            </li>
                            <li>
                                <img :src="heroism[5].jnxq_icon3">
                                <div v-html="heroism[5].jnxq_icon3_txt">
                                    {{heroism[5].jnxq_icon3_txt}}
                                </div>
                            </li>
                            <li>
                                <img :src="heroism[5].jnxq_icon4">
                                <div v-html="heroism[5].jnxq_icon4_txt">
                                    {{heroism[5].jnxq_icon4_txt}}
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- 能量内容 -->
                    <div class="energy" v-if="heroism[5]">
                        <img :src="heroism[5].energy_img" class="fury-img">
                        <div class="energy-txt" v-html="heroism[5].energy_txt">
                            {{heroism[5].energy_txt}}
                        </div>
                    </div>
                    <!-- 媒体资源 -->
                    <div class="hero-video">
                        <ul>
                            <li>
                              <img src="../../images/newmap8.jpg" alt="" width="120">
                              <p>演示一</p>
                              <a></a>
                            </li>
                            <li>
                              <img src="../../images/newmap8.jpg" alt="" width="120">
                              <p>演示二</p><a></a>
                            </li>
                            <li>
                              <img src="../../images/newmap8.jpg" alt="" width="120">
                              <p>演示三</p><a></a>
                            </li>
                            <li>
                              <img src="../../images/newmap8.jpg" alt="" width="120">
                              <p>演示四</p><a></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
.brief >>> p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
    margin-bottom: 10px;
    line-height: 25px;
}
.title3 {
    font-family: "Verdana";
    font-size: 14px;
    font-weight: bold;
    color: #D99B3C;
    margin-top: 10px;
    text-indent: 0;
    padding-bottom: 10px;
    background: #000 url(../../images/solid-bg.png) repeat-x bottom;
}
.title3 img {
    margin-right: 5px;
}
p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
}
.hero-img {
    position: relative;
    width: 100%;
    height: 300px;
    box-sizing: border-box;
    overflow: hidden;
    background: url(../../images/hero-img6.jpg) no-repeat;
    background-size: cover;
}
.hero-img div {
    position: absolute;
    width: 300px;
    left: 30px;
    top: 30px;
}
.hero-img div img {
    width: 100px;
}
.hero-img p {
    position: absolute;
    height: 50px;
    line-height: 50px;
    top: 0px;
    left: 0px;
    font-size: 40px;
    font-weight: 800;
    background-image: linear-gradient(#fff,#D6A32D);
    -webkit-background-clip: text;
    color: transparent;
    text-indent: 0;
}
.hero-left {
    width: 65%;
    /* height: 1000px; */
    padding: 5px 10px;
    /* background-color: red; */
}
.hero-left .brief ul {
    display: flex;
    justify-content: space-between;
}
.story {
    width: 100%;
    height: 472px;
    position: relative;
    box-sizing: border-box;
}
.story .mx {
    width: 271px;
    height: 400px;
    /* background-color: red; */
    background: url(../../images/crsmx1.png) no-repeat;
    background-size: cover;
    box-sizing: border-box;
}
.xb-btn {
    width: 271px;
    height: 70px;
    text-align: center;
    display: flex;
    justify-content: center;
    box-sizing: border-box;
}
.xb-btn .man {
    box-sizing: border-box;
    width: 70px;
    height: 70px;
    /* border-radius: 50%; */
    background: url(../../images/xbxz.jpg) no-repeat 0 -70px;
}
.xb-btn .woman {
    box-sizing: border-box;
    width: 70px;
    height: 70px;
    /* border-radius: 50%; */
    background: url(../../images/xbxz.jpg) no-repeat -70px 2px;
}
.story-txt {
    width: 65%;
    position: absolute;
    right: 0;
    top: 0;
}
.story-txt >>> p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
    margin-bottom: 25px;
    line-height: 25px;
}
.story-txt >>> .tit {
    margin-top: 20px;
    font-size:30px; 
    font-style: italic;
    margin-bottom: 25px;
}
.zb-txt {
    position: relative;
}
.zb-txt >>>p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
    width: 60%;
    height: 200px;
    line-height: 25px;
}
.zb {
    position: absolute;
    right: 0;
    top: 0;
}
.zbjz {
    width: 100%;
}
.zbjz >>> p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
    line-height: 25px;
}
.zbjz >>>img {
    margin-bottom: 10px;
    width: 100%;
}
.hero-con {
    position: relative;
}
.hero-right {
    position: absolute;
    right: 0;
    top: 0;
    width: 30%;
    height: 500px;
    /* background-color: red; */
}
.jntx {
    position: relative;
    width: 90%;
    height: 700px;
    background: url(../../images/jntx-bg.jpg) no-repeat;
    background-size: cover;
    margin: 0 auto;
    padding-top: 80px;
}
.jntx >>> .img-icon {
    width: 60%;
    position: absolute;
    top: -110px;
    left: 50%;
    transform: translateX(-50%);
}
.jnxq {
    width: 100%;
    padding: 0 20px;
}
.title2 {
    border: 1px solid gray;
    width: 50px;
    height: 25px;
    line-height: 25px;
    color: black;
    font-weight: 800;
    text-align: center;
    margin: 0 auto;
    text-indent: 0;
    background-color: rgb(218, 153, 57);
}
.jnxq li:nth-child(1) {
    margin-top: 10px;
}
.jnxq li {
    position: relative;
    margin-top: 20px;
    height: 125px;
}
.jnxq li div {
    position: absolute;
    right: 0;
    top: 0%;
    width: 70%;
}
.jnxq li >>>.jn-name {
    color: rgb(197, 26, 26);
    font-weight: 800;
}
.jnxq div >>>p {
    text-indent: 0;
    color: rgb(19, 13, 1);
    font-weight: 800;
    margin-top: 5px;
    font-size: 12px;
}
.energy {
    width: 100%;
    height: 530px;
    background:  url(../../images/bar-fury2.png);
    margin-top: 50px;
    position: relative;
}
.energy >>>.fury-img {
    position: absolute;
    top: 15px;
    left: 28%;
    width: 135px;
}
.energy-txt {
    position: absolute;
    top: 160px;
    width: 85%;
    left: 50%;
    transform: translateX(-50%);
    padding: 0 10px;
    /* background-color: red; */
}
.energy-txt >>> p {
    text-indent: 2em;
    color: #b99d6e;
    font-family: 'Courier New', Courier, monospace;
    margin-bottom: 10px;
    font-size: 14px;
}
.energy-txt >>>p:nth-child(1) {
    margin-left: -10px;
    font-size: 18px;
    color: #D6A32D;
}
.hero-video {
    width: 100%;
    height: 400px;
    background: url(../../images/hero-video.png) no-repeat;
    margin-top: 5px;
    padding: 10px 15px;
}
.hero-video ul {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    width: 90%;
    margin: 0 auto;
    margin-top: 80px;
}
.hero-video ul li {
    position: relative;
    width: 45%;
    height: 110px;
    margin-bottom: 30px;
}
.hero-video ul li p {
    margin-top: 5px;
}
.hero-video ul li a {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    width: 30px;
    height: 30px;
    background: url(../../images/video-play-icon.png) no-repeat;
    background-size: contain;
}
</style>

<script>
export default {
    data() {
        return {
            heroism:'',
        }
    },
    created() {
        this.getHeroism();
    },
    methods: {
        getHeroism(){
            this.$http.get("heroism")
            .then(result=>{
                this.heroism = result.body
               
            })
        },
    },
    mounted() {
        this.$nextTick(function(){
            setTimeout(()=>{
                $('.xb-btn>.man').click(function(){
                    $(this).css('background','url(src/images/xbxz.jpg) no-repeat 0 -70px')
                    $('.woman').css('background','url(src/images/xbxz.jpg) no-repeat -70px 2px')
                    $('.mx').css('background','url(src/images/crsmx1.png) no-repeat')
                    $('.xb-btn').css('margin-top','0px')
                })
                $('.xb-btn>.woman').click(function(){
                    $(this).css('background','url(src/images/xbxz.jpg) no-repeat -70px -72px')
                    $('.man').css('background','url(src/images/xbxz.jpg) no-repeat 0 0px')
                    $('.mx').css('background','url(src/images/crsmx0.png) no-repeat')
                    $('.xb-btn').css('margin-top','2px')
                })
            },1000)
        })
            
        
        
    },
}
</script>