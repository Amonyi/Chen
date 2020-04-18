<template>
    <div class="body-bg">
        <!-- start -->
        <div class="m-wrapper">
            <!-- 头部 -->
            <div class="m-head">
                <div class="u-cnt clearfix">
                    <div class="u-logo">
                        <i class="glyphicon glyphicon-envelope ema-icon"></i>
                        <span class="ema-text">邮箱账号登录</span>
                        
                    </div>
                </div>
            </div>
            <!-- 头部end -->
            <!-- 主体 -->
            <div id="regi-box" class="m-app">
              <div class="stepguide">
                <h3 class="register-btn">登录</h3>
              </div>
                <!-- 输入框 -->
                <div class="re-box">
                  <div>
                      <el-form :model="ruleForm" :rules="rules" ref="ruleForm"  class="demo-ruleForm">
                          <el-form-item label="" prop="user">
                              <el-input type="email" v-model="ruleForm.user" placeholder="账号" class="login-inp"></el-input>
                          </el-form-item>
                          <el-form-item label="" prop="pass">
                              <el-input type="password" v-model="ruleForm.pass" autocomplete="off" placeholder="密码"  class="login-inp"></el-input>
                          </el-form-item>
                          <el-form-item class="btn-box">
                              <el-button type="primary" @click="submitForm('ruleForm')" id="login-btn">登录</el-button>
                          </el-form-item>
                          </el-form>
                     
                          <div class="m-goreg">
                            <router-link to="/home/register">立即注册</router-link>
                            <a href="#">忘记密码?</a>
                          </div>
                  </div>
                </div>
                  <!-- 输入框end -->
                </div>
            <div class="g-ft">
              <div class="bview-footer">
                <div class="m-c">
                  <div class="u-link">
                    <a href="#" target="_blank">公司简介</a>&nbsp;|&nbsp;
                    <a href="#" target="_blank">帐号中心</a>&nbsp;|&nbsp;
                    <a href="#" target="_blank">帐号中心公众号</a>&nbsp;|&nbsp;
                    <a href="#" target="_blank">帐号管家</a>&nbsp;|&nbsp;
                    <a href="#" target="_blank">帮助中心</a>
                  </div>
                  <div class="u-icp u-link">
                    <a target="_blank" href="#">增值电信业务经营许可证粤B2-20090191</a> 
                    <a target="_blank" href="#">工业和信息化部ICP/IP地址/域名信息备案管理系统</a>
                  </div>
                  <div class="u-cpr">
                      公司版权所有&nbsp; © 1997-2020
                  </div>
                </div>
              </div>
            </div>
        </div>
        <!-- end -->
    </div>
</template>

<style lang="css"> 
body,div {
    margin: 0;
    padding: 0;
    outline: none;
}
.body-bg {
    height: 780px;
    background-color: #f8f8f8;
    /* background: url(../images/0.jpg) no-repeat -205px 0; */
}
.clearfix {
    zoom: 1;
}
.m-head {
    height: 64px;
    line-height: 64px;
    background: #fff;
    margin-bottom: 22px;
}
.m-head .u-cnt {
    width: 1100px;
    margin: 0 auto;
}
.m-head .u-cnt .u-logo {
    float: left;
}
.m-head .u-cnt .u-logo .u-img {
    width: 168px;
    height: 24px;
    vertical-align: middle;
    cursor: pointer;
}
#regi-box {
    position: relative;
    width: 1100px;
    padding-bottom: 100px;
    margin: 0 auto;
    background: #fff;
}
.stepguide {
    width: 540px;
    margin: 0 auto;
    padding-top: 60px;
    text-align: center;
    /* background-color: red; */
}
.stepguide a {
  font-size: 20px;
  text-decoration: none;
}
.re-box {
    width: 444px;
    padding: 20px 0;
    margin: 20px auto 0;
}
.btn-box {
    text-align: center;
}
.bview-footer {
    height: 150px;
    width: 100%;
}
.bview-footer .m-c {
    padding-top: 46px;
    margin: 0 auto;
    text-align: center;
    font-size: 12px;
    line-height: 20px;
    color: #b8b8b8;
}
.bview-footer .m-c .u-link {
    text-align: center;
}
.bview-footer .m-c .u-link a {
    cursor: pointer;
    margin: 0 5px;
    color: #b8b8b8;
}
.bview-footer .m-c .u-link a:hover {
    color: blue;
}
.bview-footer .m-c .u-link.u-icp {
    margin: 6px 0;
}
.ema-icon {
  color: blue;
  font-size: 36px;
  vertical-align: middle;
  margin-bottom: 8px;
}
.ema-text {
  font-size: 26px;
}
.btn-box {
    text-align: center;
}
.m-goreg {
    display: flex;
    justify-content: space-between;
    margin-left: 45px;
    width: 80%;
}
.m-goreg a {
    color: gray;
    font-size: 14px;
}
.m-goreg a:hover {
    color: red;
    text-decoration: underline;
}
.login-inp {
    width: 80%;
}
</style>


<script>
import { Indicator } from 'mint-ui';
import {Toast} from 'mint-ui'
export default {
    data() {
      var checkUser = (rule, value, callback) => {
        var regEmail = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!value) {
          return callback(new Error('请输入账号'));
        }else if(!regEmail.test(value) ){
          return callback(new Error('账号需为邮箱格式'));
        }
        callback();
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        }else if(value.length < 8 || value.length >16){
          callback(new Error('请输入8-16位密码'));
        } 
          callback();
      };
      return {
        users:'',
        ruleForm: {
          pass: '',
          user: '',
        },
        rules: {
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          user: [
            { validator: checkUser, trigger: 'blur' }
          ]
        }
      };
    },
    created() {
      this.getUser();
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
              var users_t = this.users
              var length = users_t.length
              nameAll=[];
              passAll=[];
              
            for(var i=0; i<length; i++){
              nameAll.push(users_t[i].userName);
              passAll.push(users_t[i].password);
            }
            if(nameAll.indexOf(this.ruleForm.user) === -1){
              Toast({
                        message: '该账号不存在！',
                        duration: 800
                      });
          }else{
            var index = nameAll.indexOf(this.ruleForm.user);
            if(passAll[index] === this.ruleForm.pass){
              window.sessionStorage.setItem('username',this.ruleForm.user)
              window.sessionStorage.setItem('userid',users_t[index].id)
              Indicator.open('跳转页面中');
              var _this = this
              setTimeout(function(){
                      _this.$router.push('/home');
                      Indicator.close();
                   }, 1000); 
              
            }else{
              Toast({
                        message: '账号或密码错误！',
                        duration: 800
                      });
            }
          }
          }else {  
            return false
          }
        });
        
      },
      getUser(){
            this.$http.get("users")
            .then(result=>{
                this.users = result.body
            })
        },
    },
  }

</script>