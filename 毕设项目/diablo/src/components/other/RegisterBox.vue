<template>
    <div>
       
                  <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm"  class="demo-ruleForm">
                      <el-form-item label="" prop="email">
                          <el-input type="email" v-model="ruleForm.email" placeholder="邮箱地址" class="input-box" ref="rguser"></el-input>
                      </el-form-item>
                      <el-form-item label="" prop="pass">
                          <el-input type="password" v-model="ruleForm.pass" autocomplete="off" placeholder="密码" class="input-box" ref="rgpassword"></el-input>
                      </el-form-item>
                      <el-form-item label="" prop="checkPass">
                          <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off" placeholder="确认密码" class="input-box"></el-input>
                      </el-form-item>
                      <el-form-item class="btn-box">
                          <el-button type="primary" @click="submitForm('ruleForm')">注册</el-button>
                          <!-- <el-button @click="resetForm('ruleForm')">重置</el-button> -->
                      </el-form-item>
                  </el-form>
                  <!-- <div class="m-gologin">
                      已有帐号？<a href="">去登录</a>
                    </div> -->
    </div>
</template>

<style lang="css"> 
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
            // console.log(users_t[key].userName)
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
            // alert('注册成功')
            var rguser = this.$refs.rguser.value;
            var rgpassword = this.$refs.rgpassword.value;
            // alert(rguser +','+ rgpassword);
            this.$http.post('adduser',{
              userName:this.ruleForm.email,
              password:this.ruleForm.pass,
            }).then(function(data){
              if(data.body.flag ==1){
                alert('注册成功')
                window.location.href='http://localhost:3000/#/home/';
                return false;
              }
            })
            
          }else {
            console.log('error submit!!');
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
                console.log(result.body);
            })
        },
    },
  }

</script>