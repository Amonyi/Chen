<template>
    <div class="body-bg">
        <!-- start -->
        <div class="m-wrapper">
            <!-- 头部 -->
            <div class="m-head">
                <div class="u-cnt clearfix">
                    <div class="u-logo">
                        <img src="../images/logo-906b3317.png" class="u-img">
                    </div>
                </div>
            </div>
            <!-- 头部end -->
            <!-- 主体 -->
            <div id="regi-box" class="m-app">
                <div>
                    <!-- 步骤条 -->
                    <el-steps :active="active" finish-status="success" space="100%" align-center class="stepguide">
                        <el-step title="填写账号密码" ></el-step>
                        <el-step title="验证手机号码" ></el-step>
                        <el-step title="完成注册" ></el-step>
                    </el-steps>
                </div>
                <!-- 输入框 -->
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm re-box">
                    <el-form-item label="邮箱地址" prop="email">
                        <el-input type="email" v-model="ruleForm.email"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" prop="pass">
                        <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码" prop="checkPass">
                        <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item class="btn-box">
                        <el-button type="primary" @click="submitForm('ruleForm')">下一步</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                    </el-form-item>
                </el-form>

                <!-- 输入框end -->
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
}
.el-step__head.is-process {
    color: #2c82ff;
    border-color: #2c82ff;
}
.el-step__title.is-process {
    font-weight: 700;
    color: #2c82ff;
}
.el-step.is-horizontal .el-step__line {
    height: 2px;
    top: 21px;
}
.el-step__icon {
  width: 45px;
  height: 45px;
}
.re-box {
    width: 444px;
    padding: 20px 0;
    margin: 20px auto 0;
}
.el-form-item {
    margin-bottom: 22px;
    margin-left: -15px;
}
.el-form-item__label {
    text-align: justify;
    text-justify: distribute-all-lines;
    text-align-last: justify;
}
.el-input__prefix, .el-input__suffix {
    height: 80%;
    color: rgb(6, 248, 6);
}
.btn-box {
    text-align: center;
}
.el-form-item__error {
    top: 80%;
}

</style>


<script>
export default {
    data() {
      var checkEmail = (rule, value, callback) => {
        var regEmail = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!value) {
          return callback(new Error('邮箱不能为空'));
        }else if(!regEmail.test(value) ){
          return callback(new Error('邮箱格式不正确'));
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
        active: 0,
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
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            console.log('成功')
              if(this.active++ > 2){
                this.active = 0;
            }
          }else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }

</script>