<template>
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
            <div class="m-goreg">
                <a href="#">忘记密码?</a>
            </div>
    </div>
</template>

<style lang="css">
.btn-box {
    text-align: center;
}
.m-goreg {
    float: right;
    margin-right: 45px;
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
            var rguser = this.$refs.rguser.value;
            var rgpassword = this.$refs.rgpassword.value;
            var users_t = this.users
            for(var key in users_t){
            if(rguser == users_t[key].userName && rgpassword == users_t[key].password ){
                alert('登录成功')
                window.location.href='http://localhost:3000/#/home/';
                return false;
                }else {
                    alert('账号或密码错误')
                    return false;
                }
            }
          
        });
        
      },
      getUser(){
            this.$http.get("users")
            .then(result=>{
                this.users = result.body
                // console.log(result.body);
            })
        },
    },
  }

</script>