<template>
    <div class="body-bg">
        <!-- start -->
        <div class="m-wrapper">
            <!-- 头部 -->
            <div class="m-head">
                <div class="u-cnt clearfix">
                    <div class="u-logo">
                        <i class="glyphicon glyphicon-envelope ema-icon"></i>
                        <span class="ema-text">邮箱账号注册</span>
                    </div>
                </div>
            </div>
            <!-- 头部end -->
            <!-- 主体 -->
            <div id="regi-box" class="m-app">
              <div class="stepguide">
                <h3 class="register-btn">注册</h3>
              </div>
                <!-- 输入框 -->
                <div class="re-box">
                  <div>
                    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm"  class="demo-ruleForm">
                        <el-form-item label="" prop="email">
                            <el-input type="email" v-model="ruleForm.email" placeholder="邮箱地址" class="input-box" ></el-input>
                        </el-form-item>
                        <el-form-item label="" prop="pass">
                            <el-input type="password" v-model="ruleForm.pass" autocomplete="off" placeholder="密码" class="input-box" ></el-input>
                        </el-form-item>
                        <el-form-item label="" prop="checkPass">
                            <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off" placeholder="确认密码" class="input-box"></el-input>
                        </el-form-item>
                        <el-form-item class="btn-box">
                            <el-button type="primary" @click="submitForm('ruleForm')">注册</el-button>
                            <!-- <el-button @click="resetForm('ruleForm')">重置</el-button> -->
                        </el-form-item>
                    </el-form>
                    <div class="m-gologin">
                        已有帐号？<router-link to="/home/login">去登录</router-link>
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
.link-space {
  font-size: 20px;
  margin: 0 3px;
}
.m-gologin {
    font-size: 14px;
    color: #333;
    margin-top: 20px;
    margin-left: 45px;
}
.m-gologin a:hover {
  color: #1966da
}
.el-button--primary {
    width: 80%;
}
.btn-box {
    text-align: center;
}
.el-form-item__error {
    top: 80%;
    left: 50px;
}
.el-form-item {
    margin-bottom: 22px;
}
.el-input__prefix, .el-input__suffix {
    height: 80%;
    color: rgb(6, 248, 6);
} 
.input-box {
  width: 80%;
}
.el-form-item__content {
  margin-left: 0;
  text-align: center;
}
</style>


<script>
import {Toast} from 'mint-ui'
import moment from 'moment'
export default {
    data() {
      var checkEmail = (rule, value, callback) => {
        var regEmail = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!value) {
          return callback(new Error('邮箱不能为空'));
        }else if(!regEmail.test(value) ){
          return callback(new Error('邮箱格式不正确'));
        }else {
          var users_t = this.users
          for(var key in users_t){
          if(value == users_t[key].userName){
            return callback(new Error('邮箱账号已存在'));
          }
        }
      }
        callback();
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        }else if(value.length < 8 || value.length >16){
          callback(new Error('请输入8-16位密码'));
        } else {
          if (this.ruleForm.checkPass !== '') {
            this.$refs.ruleForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        date:moment(new Date()).format("YYYY-MM-DD HH:mm:ss"),
        users:'',
        ruleForm: {
          pass: '',
          checkPass: '',
          email: '',
        },
        rules: {
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          email: [
            { validator: checkEmail, trigger: 'blur' }
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
            this.$http.post('adduser',{
              userName:this.ruleForm.email,
              password:this.ruleForm.pass,
              add_time:this.date,
              user_img:'http://localhost:3000/src/images/uimg.jpg',
              level:1,
              stick_num:0,
              nickname:this.ruleForm.email,
              sex:3
            }).then(function(data){
              if(data.body.flag ==1){
                Toast({
                        message: '注册成功',
                        position: 'middle',
                        duration: 1500
                    });
                var _this = this
                setTimeout(function(){
                   _this .$router.push('/home/login');
                   }, 1000);
                return false;
              }
            })  
          }else {
            Toast({
                        message: '注册失败',
                        position: 'middle',
                        duration: 1500
                    });
            return false;
          }
        });
        
      },
      // resetForm(formName) {
      //   this.$refs[formName].resetFields();
      // },
      getUser(){
            this.$http.get("users")
            .then(result=>{
                this.users = result.body
            })
        },
    },
  }

</script>