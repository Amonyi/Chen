<template>
    <div class="edit-main">
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm"  label-width="100px" class="demo-ruleForm">
            <el-form-item label="旧密码" prop="oldpass">
                <el-input v-model="ruleForm.oldpass" type="password" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="新密码" prop="newpass">
                <el-input type="password" v-model="ruleForm.newpass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="确认密码" prop="checkPass">
                <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitPass('ruleForm')" class="subtn">提交</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>


<style lang="css" scoped>
.edit-main {
    width: 40%;
    margin-top: 50px;
}
.edit-main >>>.subtn {
    width: 70px;
}
.edit-main >>>.el-form-item__error {
    left: 0;
}
</style>


<script>
import {Toast} from 'mint-ui'
  export default {
      inject:['reload'],
    data() {
      var checkOldPass = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('请输入旧密码'));
        }
        callback();
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入新密码'));
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
        } else if (value !== this.ruleForm.newpass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        uoldpass:'',
        uid:window.sessionStorage.getItem('userid'),
        ruleForm: {
          newpass: '',
          checkPass: '',
          oldpass: ''
        },
        rules: {
          newpass: [
            { required:true, validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { required:true,validator: validatePass2, trigger: 'blur' }
          ],
          oldpass: [
            { required:true,validator: checkOldPass, trigger: 'blur' }
          ]
        }
      };
    },
    created() {
        this.getPass()
    },
    methods: {
      submitPass(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if(this.ruleForm.oldpass != this.uoldpass){
                Toast({
                        message: '旧密码错误！',
                        duration: 1500
                      });
                      this.$refs[formName].resetFields();
            }else if(this.ruleForm.oldpass == this.uoldpass){
                this.$http.put("putuser",{
                id:this.uid,
                password:this.ruleForm.newpass
                })
                .then(result=>{
                    let _this = this;
                    setTimeout(function(){
                        Toast({
                            message: '密码修改成功',
                            duration: 1500
                        });
                        _this.reload()
                    },1000)
                })
                    
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      getPass(){
          this.$http.get("getuser/"+this.uid)
            .then(result=>{
                this.uoldpass = result.body.password
            })
      }
    }
  }
</script>