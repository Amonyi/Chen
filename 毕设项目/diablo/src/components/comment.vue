<template>
    <div>
   <!-- 评论内容显示部分 -->
        <div class="com-box" v-for="(item) in list" :key="item.id">
            <div class="com-left">
                <div class="tx-box">
                    <img :src="item.user_tx" alt="" >
                    <div class="ms">
                        <p class="name"><a href="#">{{item.user_name}}</a></p>
                        <p>帖子数:{{item.num_tz}}</p>
                        <p>等级:{{item.level}}</p>
                    </div>
                </div>
            </div>
            <div class="com-right">
                <div class="com-txt">{{item.content}}</div>
                <div class="right-cz">
                    <span class="addtime">发表于{{item.add_time | dateFormat2}}</span>
                    <div class="ptn1">
                        <a href="javascript:" @click="like(item)"><i >点赞<span  >{{item.good_num}}</span></i></a>
                        <a href="javascript:" @click="dislike(item)"><i><img src="../images/rec_subtract.gif" alt="">踩<span>{{item.bad_num}}</span></i></a>
                    </div>
                    <div class="ptn2">
                        <a href="#">回复</a>
                        <a href="#">举报</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 评论内容显示部分 end -->
        <!-- 分页 -->
        <!-- <el-pagination background layout="prev, pager, next" :total="70"></el-pagination> -->
        <div class="pagebox">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                :current-page="page"  :page-size="limit" background hide-on-single-page
                layout="total, prev, pager, next, jumper" :total="total" >
            </el-pagination>
        </div>
        <!-- 分页end -->
        <div class="comment-box">
            <textarea placeholder="请输入你想回复的内容" class="inp" v-model="msg"></textarea>
            <span>0/120</span>
            <button type="submit" @click="postComment">发表评论</button>
        </div>
    </div>
</template>

<style lang="css" scoped>
.comment-box {
    width: 100%;
    height: 250px;
    padding: 45px 30px 45px 30px;
    overflow: hidden;
    background-color: #000;
    background: url(../images/01.png) no-repeat;
    position: relative;
}
textarea {
    height: 130px;
    font-size: 16px;
    line-height: 25px;
    resize: none;
}
.comment-box button {
    float: right;
}
.comment-box span {
    right: 40px;
    bottom: 80px;
    color: rgb(179, 169, 169);
    position: absolute;
}
.com-box {
    width: 100%;
    display: flex;
    /* background-color: red; */
}
.com-box .com-left {
    width: 23%;
    height: 150px;
    background-color: #BCAD87;
    border-right: 1px solid #998c68;
    border-top: 1px solid #998c68;
    padding: 20px 0 0 20px;
}
.com-left .tx-box {
    position: relative;
    width: 100%;
    /* background-color: red; */
}
.com-left img {
    width: 96px;
    height: 96px;
    overflow: hidden;
    border: 1px solid black;
    border-radius: 8px;
    background-color: #000;
}
.com-left .ms {
    position: absolute;
    right: 30px;
    top: 0;
}
.com-left .ms p {
    text-align: left;
    margin-top: 5px;
    color: #000;
    font-size: 12px;
    width: 115px;
}
.com-left .ms .name {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 16px;
    font-weight: 700;
}
.com-left .name a {
    color: #000;
}
.com-left .name a:hover {
    color: darkred;
}
.com-box .com-right {
    width: 77%;
    background-color: #b8a87b;
    border-top: 1px solid #998c68;
    padding: 20px;
    position: relative;
}
.com-txt {
    font-size: 16px;
}
.right-cz {
    width: 80%;
    display: flex;
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
}
.right-cz .addtime {
    font-size: 14px;
    color: #7b643d;
}
.ptn1 {
    margin-left: 200px;
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
    position: absolute;
    right: 0px;
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
    color: #000;
}
.ptn2 a:hover {
    color: darkred;
    background: #998754;
}
.el-pagination {
    float: right;
    margin: 10px 0;
}

</style>

<script>
import {Toast} from 'mint-ui'
import moment from 'moment'
export default {
    data() {
        return {
            userInfo:{
                username:'',
                userimg:'',
                ulevel:'',
                sticknum:''

            },
            list:[],
            comments:[],
            msg:'',//评论输入的内容
            com_num:'',
            // 转换时间的格式，传入数据库
            date:moment(new Date()).format("YYYY-MM-DD HH:mm:ss"),
            flag1:true,
            flag2:true,
            limit: 3, //每页数据条数
            total: null,  
            page: 1,  //当前页
            searchData: "",
            username:window.sessionStorage.getItem('username'),
            userId:window.sessionStorage.getItem('userid'),
        }
    },
    created() {
        this.getComments();
        this.getUserInfo();
    },
    methods: {
      handleSizeChange(val) {
        this.limit = val
                this.getList()
      },
      handleCurrentChange(val) {
        this.page = val
                this.getList()
      },
        getComments(){
            this.$http.get("getcom")
            .then(res=>{
                    this.comments = res.body
                    this.getList()
            })
        },
        getList() {
                // es6过滤得到满足搜索条件的展示数据list
                let list = this.comments.filter((item, index) =>
                    item.content.includes(this.searchData)
                )
                this.list = list.filter((item, index) =>
                    index < this.page * this.limit && index >= this.limit * (this.page - 1)
                )
                this.total = list.length
            },
        postComment(){
            if(this.userId){
                if(this.msg !=''){
                    this.$http.post("addcomments",{
                                    user_name:this.userInfo.username,
                                    add_time:this.date,
                                    content:this.msg,
                                    user_tx:this.userInfo.userimg,
                                    num_tz:this.userInfo.sticknum,
                                    level:this.userInfo.ulevel,
                                    good_num:0,
                                    bad_num:0
                                }).then(function(data){
                                    if(data.body.flag == 1){
                                        Toast({
                                            message: '评论成功',
                                            position: 'middle',
                                            duration: 1500
                                        });
                                        this.getComments();
                                        this.msg = ''
                                    }
                                })
                }else if(this.msg ==''){
                    Toast({
                        message: '内容不能为空！',
                        position: 'middle',
                        duration: 1500
                    });
                }
                
            }else {
                Toast({
                        message: '请先进行登录',
                        position: 'middle',
                        duration: 1500
                    });
            }
            
        },
        like(item){
            item.good_num = this.flag1 ? item.good_num + 1 : item.good_num - 1;
            this.flag1 = !this.flag1;
            if(this.flag2 == false){
                if(item.bad_num >0)
               item.bad_num = item.bad_num-1
                this.flag2=true;
            }
        },
        dislike(item){
            item.bad_num = this.flag2 ? item.bad_num + 1 : item.bad_num - 1;
            this.flag2 = !this.flag2;
            if(this.flag1 == false){
                item.good_num = item.good_num-1
                this.flag1=true;
            }
        },
        getUserInfo(){
            this.$http.get("getuser/"+this.userId)
            .then(res=>{
                    this.userInfo.username = res.body.userName
                    this.userInfo.userimg = res.body.user_img
                    this.userInfo.ulevel = res.body.level
                    this.userInfo.sticknum = res.body.stick_num
            })
        }
    },
    mounted() {
            $(".inp").bind("input propertychange", function (event) {
                var len = $(this).val().length;
                if(len <=120){
                    $('.comment-box > span').text(len +'/120')
                }else if(len > 120) {
                    // 只截取120个字
                    $(this).val($(".inp").val().substr(0, 120));
                    // Toast('内容字数超出限制')
                    $('.comment-box > span').text( '120/120')
                    Toast({
                        message: '内容字数超出限制',
                        position: 'top',
                        duration: 1500
                    });
                }
            });
    },
}
</script>
