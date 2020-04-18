<template>
    <div>
        <div class="info-main">
            <div class="user-img">
                <span>头像：</span>
                <el-upload
                class="avatar-uploader"
                action="https://jsonplaceholder.typicode.com/posts/"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload"
                name
                :file-list=[]
                >
                <img v-if="imageUrl" :src="imageUrl" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
            </div>
            <div class="uinfo">
              <ul>
                <li><label>昵称:</label><input type="text" v-model="nickname"></li>
                <li><label>性别:</label>
                    <el-radio-group v-model="radio">
                      <el-radio :label="3">保密</el-radio>
                      <el-radio :label="1">男</el-radio>
                      <el-radio :label="2">女</el-radio>
                    </el-radio-group>
                </li>
                <li class="signature">
                  <label>个性签名:</label>
                  <br>
                  <el-input
                  class="insigna"
                  type="textarea"
                  placeholder="请输入内容"
                  v-model="textarea"
                  maxlength="50"
                  show-word-limit
                  resize="none"
                  rows=5>
                  </el-input>
                </li>
              </ul>
                <div class="storage-btn">
                  <button @click="putuinfo">保存</button>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
div {
    box-sizing: border-box;
}
.info-main {
    width: 100%;
    height: 600px;
    padding: 25px 20px;
}
.info-main .user-img {
    display: flex;
    margin-bottom: 20px;
}
.user-img >>>.el-upload__input {
    display: none;
}
.uinfo ul li {
  width: 60%;
  height: 50px;
  line-height: 40px;
  display: flex;
  margin-bottom: 15px;
}
.uinfo ul li input {
  margin-left: 10px;
  width: 90%;
}
.uinfo >>>.el-radio-group {
  line-height: 50px;
  margin-left: 10px;
}
.uinfo .signature {
  height: 150px;
}
.uinfo .signature >>>.insigna {
  margin-left: 10px;
  width: 85%;
}
.uinfo >>>.el-input__count {
  bottom: 35px;
}
.uinfo .storage-btn {
  width: 100px;
  margin-left: 220px;
  text-align: center;
}
.uinfo .storage-btn button {
  width: 100%;
}
</style>

<style lang="css">
.avatar-uploader .el-upload {
    border: 1px solid gray;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 150px;
    height: 150px;
    line-height: 150px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }

</style>

<script>
import {Toast} from 'mint-ui'
  export default {
    inject:['reload'],
    data() {
      return {
        imageUrl: '',
        nickname:'',
        radio:1,
        textarea:'',
        uid:window.sessionStorage.getItem('userid'),
        filename:''
      };
    },
    created() {
      this.getUinfo()
    },
    methods: {
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
      },
      beforeAvatarUpload(file) {
        this.filename='http://localhost:3000/src/images/'+file.name
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      // 获取用户信息
      getUinfo(){
        this.$http.get("getuser/"+this.uid)
            .then(result=>{
                this.nickname = result.body.nickname
                this.radio = result.body.sex
                this.textarea = result.body.signature
                this.imageUrl = result.body.user_img
                this.filename = result.body.user_img
            })
      },
      putuinfo(){
        this.$http.put("puinfo",{
          id:this.uid,
          nickname:this.nickname,
          user_img:this.filename,
          sex:this.radio,
          signature:this.textarea
        })
            .then(result=>{
               Toast({
                        message: '保存成功',
                        duration: 1500
                      });
                      // this.getUinfo()
                      this.reload()
            })
      }
    }
  }
</script>