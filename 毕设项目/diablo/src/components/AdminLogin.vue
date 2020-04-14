<template>
    <div class="body-bg">
        <!-- start -->
        <div class="m-wrapper">
            <!-- 头部 -->
            <div class="m-head">
                <div class="u-cnt clearfix">
                    <div class="u-logo">
                        <span class="ema-text">管理员账号登录</span>
                        
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
                              <el-input type="email" v-model="ruleForm.user" placeholder="账号" class="login-inp" ref="rguser"></el-input>
                          </el-form-item>
                          <el-form-item label="" prop="pass">
                              <el-input type="password" v-model="ruleForm.pass" autocomplete="off" placeholder="密码" ref="rgpassword" class="login-inp"></el-input>
                          </el-form-item>
                          <el-form-item class="btn-box">
                              <el-button type="primary" @click="submitForm('ruleForm')" id="login-btn">登录</el-button>
                          </el-form-item>
                          </el-form>
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
        if (!value) {
          return callback(new Error('请输入管理员账号'));
        }
        callback();
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
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
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
            var rguser = this.$refs.rguser.value;
            var rgpassword = this.$refs.rgpassword.value;
            if(rguser == 'admin' && rgpassword == 202042 ){
              window.sessionStorage.setItem('administrators',this.ruleForm.user)
                           this.loginsuccess()
                           var _this = this
                            setTimeout(function(){
                            _this.$router.push('/management')
                        }, 2000);
                return false;
                }else if(rguser !== '' && rgpassword !== ''){
                    if(rguser !== 'admin' || rgpassword !== 202042 ){
                      Toast({
                        message: '账号或密码错误！',
                        duration: 800
                    });
                    }
                    return false;
                }
        });
        
      },
      loginsuccess(){
                this.$message({
                message: '登录成功！',
                type: 'success'
                });
            },
    },
  }

</script>