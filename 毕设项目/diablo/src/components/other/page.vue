<template>
    <div class="sj">
      <div class="sj-top">
            <h3>游戏资讯列表</h3>
            <div class="search-box"> 
                <el-button icon="el-icon-plus" type="primary" @click="addDialog=true;">添加</el-button>
                <div class="search">
                   <el-row>
                      <el-col :span="12">
                        <el-input v-model="searchData"  placeholder="输入姓名搜索"></el-input>
                      </el-col>
                      <el-col :span="2" class="search-btn">
                          <el-button type="success" icon="el-icon-search" @click="search">搜索</el-button>
                      </el-col>
                      <!--  -->
                      <el-button-group>
                          <el-button  icon="el-icon-printer"></el-button>
                          <el-button  icon="el-icon-document-copy"></el-button>
                          <el-button  icon="el-icon-share"></el-button>
                      </el-button-group>
                  </el-row>
                    
                </div>
            </div>
            
        </div>
       
        <el-table :data="list" border>
            <el-table-column label="序号" type="index" width="50" align="center">
              <template scope="scope">
                  <span>{{(page - 1) * limit + scope.$index + 1}}</span>
              </template>
            </el-table-column>
            <el-table-column label="标题" prop="title" :show-overflow-tooltip="true"></el-table-column>
            <el-table-column label="简介" prop="contents" :show-overflow-tooltip="true"></el-table-column>
            <el-table-column label="封面地址" prop="img_url" :show-overflow-tooltip="true"></el-table-column>
            <el-table-column label="操作" align="center" width="200">
                    <template scope="scope">
                        <el-button type="success" icon="el-icon-view" @click="seeInfo(scope.row.id)"></el-button>
                        <el-button type="primary" icon="el-icon-edit" @click="getinfo(scope.row.id)"></el-button>
                        <el-button type="danger" icon="el-icon-delete" @click="delList(scope.row.id)"></el-button>
                    </template>            
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
            :current-page="page" :page-sizes="[1, 2,5,]" :page-size="limit"
            layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>

        <!-- 详情弹窗 -->
           <el-dialog title="查看详情" :visible.sync="seeDialog" width="30%"
            :before-close="handleClose">
            <div class="messageBox">
                <label>资讯标题：</label>
                <p>{{listinfo.list_title}}</p>
                <label>资讯简介：</label>
                <p>{{listinfo.list_contents}}</p>
                <label>添加时间：</label>
                <p>{{listinfo.list_time | dateFormat2}}</p>
                <label>封面详情：</label>
                <br>
                <img :src="listinfo.list_img" alt="">
            </div>
            </el-dialog>
            <!-- 添加弹窗 -->
           <el-dialog title="添加数据" :visible.sync="addDialog" width="30%"
            :before-close="handleClose">
            <span class="tips" v-show="flag1">信息不能为空!</span>
            <form>
                <input type="hidden" v-model="listinfo.list_id">
                <label>资讯标题：</label>
                <input type="text" v-model="listinfo.list_title">
                <label>封面图片地址：</label>
                <input type="text" v-model="listinfo.list_img">
                <label>资讯简介：</label>
                <!-- <input type="text" v-model="listinfo.list_contents"> -->
                <textarea cols="30" rows="5" v-model="listinfo.list_contents"></textarea>
            </form>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="addList" class="btn1">确 定</el-button>
            </span>
            </el-dialog>
            <!-- 修改弹窗 -->
           <el-dialog title="信息修改" :visible.sync="dialogVisible" width="30%"
            :before-close="handleClose">
            <span class="tips" v-show="flag">请输入对应信息!</span>
            <form>
                
                <input type="hidden" v-model="listinfo.list_id">
                <label>资讯标题：</label>
                <input type="text" v-model="listinfo.list_title">
                <label>封面图片地址：</label>
                <input type="text" v-model="listinfo.list_img">
                <label>资讯简介：</label>
                <!-- <input type="text" v-model="listinfo.list_contents"> -->
                 <textarea cols="30" rows="5" v-model="listinfo.list_contents"></textarea>
            </form>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="putlistinfo" class="btn1">确 定</el-button>
            </span>
            </el-dialog>
    </div>
</template>

<style lang="css" scoped>
.messageBox img {
    width: 100%;
}
.dialog-footer >>>.btn1 {
  width: 60px;
    padding: 10px 0px; 
}
.el-dialog textarea {
    resize: none;
}
.tips {
    position: absolute;
    left: 20px;
    top: 50px;
    color: red;
}
.dialog-footer >>>.btn1 {
    padding: 10px 0px; 
}
.el-pagination {
  margin-top: 15px;
  float: right;
}
.search-btn {
  margin-right: 60px;
}
.search-btn >>>.el-button{
  margin-left: 10px;
  height: 40px;
}
.sj {
  background-color: white;
  padding-right: 10px;
}
.sj-top {
    width: 100%;
    padding: 0px 0 10px 0;
}
.sj-top .search-box {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-content: center;
    /* background-color: red; */
}
.sj-top .search-box .search {
    display: flex;
    align-items: center;
    /* width: 70%; */
}
.sj-top div input {
    margin: 0 5px 0 10px;
    /* width: 80%; */
}
.el-button-group {
    display: flex;
}
.el-button-group .el-button {
    height: 40px;
    font-size: 16px;
}
.sj-top h3 {
    font-size: 20px;
    margin-bottom: 15px;
}
.sj-top .el-button--primary {
    width: 65px;
    height: 40px;
    padding: 10px 0;
}
.el-button {
    padding: 10px 15px;
}
.el-button--primary {
    width: 46px;
}
</style>

<script>
import moment from 'moment'
import {Toast} from 'mint-ui'
    export default {
        data() {
            return {
                list: [],
                data: [],
                limit: 5, //每页数据条数
                total: null,  
                page: 1,  //当前页
                searchData: "",
                seeDialog: false,
                dialogVisible: false,
                addDialog: false,
                flag:false,
                flag1:false,
                date:moment(new Date()).format("YYYY-MM-DD HH:mm:ss"),
                listinfo:{
                    list_title:'',
                    list_contents:'',
                    list_id:'',
                    list_time:'',
                    list_img:''
              },
            }
        },
       created() {
            this.pageList()
        },
        methods: {
          // 弹窗关闭
          handleClose(done) {
            done();
            this.flag=false;
            this.flag1=false;
            this.listinfo={
                list_title:'',
                list_contents:'',
                list_id:'',
                list_time:'',
                list_img:''
            }
      },
            pageList() {
                // 发请求拿到数据并暂存全部数据,方便之后操作
                this.$http.get("list")
                .then(result=>{
                    this.data= result.body
                    this.getList()
                })  
            },
            // 处理数据
            getList() {
                // es6过滤得到满足搜索条件的展示数据list
                let list = this.data.filter((item, index) =>
                    item.title.includes(this.searchData)
                )
                this.list = list.filter((item, index) =>
                    index < this.page * this.limit && index >= this.limit * (this.page - 1)
                )
                this.total = list.length
            },
            // 当每页数量改变
            handleSizeChange(val) {
                this.limit = val
                this.getList()
            },
            // 当当前页改变
            handleCurrentChange(val) {
                this.page = val
                this.getList()
            },
            // 搜索过滤数据
            search() {
                this.page = 1
                this.getList()
            },
            // 详情按钮
            seeInfo(id){
              this.seeDialog = true
              this.$http.get("listiteminfo/"+id)
              .then(result=>{
                  this.listinfo.list_title = result.body.title
                  this.listinfo.list_contents = result.body.contents
                  this.listinfo.list_id = result.body.id
                  this.listinfo.list_time = result.body.add_time
                  this.listinfo.list_img = result.body.img_url
              })
            },
            // 修改按钮
            // 1、根据id获取信息
       getinfo(id){
           this.dialogVisible = true
           this.$http.get("listiteminfo/"+id)
            .then(result=>{
                this.listinfo.list_title = result.body.title
                this.listinfo.list_contents = result.body.contents
                this.listinfo.list_id = result.body.id
                this.listinfo.list_img = result.body.img_url
            })
       },
    //    修改
       putlistinfo(){
           if(this.listinfo.list_title == '' || this.listinfo.list_contents == ''){
                this.flag=true
           }else{
                this.$http.put("listitem",{
                id:this.listinfo.list_id,
                contents:this.listinfo.list_contents,
                title:this.listinfo.list_title,
                img_url:this.listinfo.list_img,
            }).then(function(data){
                if(data.body.flag == 1){
                    Toast({
                            message: '信息修改成功',
                            position: 'middle',
                            duration: 1500
                        });
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            list_img:''
                        }
                        this.dialogVisible=false;
                        this.pageList()
                }else{
                    this.dialogVisible = false
                    this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            list_img:''
                        }
                    Toast({
                            message: '信息修改失败',
                            position: 'middle',
                            duration: 1500
                        });
                }
            })
           }  
       },
      //  添加按钮
      addList(){
        if(!this.listinfo.list_title || !this.listinfo.list_contents){
            this.flag1=true;
        }else{
            this.$http.post('addlist',{
                id:this.listinfo.list_id,
                contents:this.listinfo.list_contents,
                title:this.listinfo.list_title,
                img_url:this.listinfo.list_img,
                add_time:this.date
            }).then(function(data){
                if(data.body.flag == 1){
                    Toast({
                            message: '信息添加成功',
                            position: 'middle',
                            duration: 1500
                        });
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            list_img:''
                        }
                    this.addDialog=false;
                    this.pageList()
                }else{
                    Toast({
                            message: '信息添加失败',
                            position: 'middle',
                            duration: 1500
                        });
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            list_img:''
                        }
                        this.addDialog=false;
                }
            })
        }
        
    },
    // 删除
    delList(id){
        this.$http.delete('dellist/'+id)
        .then(result=>{
            if(result.body.flag == 1){
                Toast({
                            message: '信息已删除',
                            position: 'middle',
                            duration: 1500
                        });
                        // 如果当前页数据被删除完，返回到当前页的上一页
                       let totalPage = Math.ceil((this.total - 1) / this.limit) // 总页数
                       let currentPage = this.page > totalPage ? totalPage : this.page
                       this.page = currentPage <1 ? 1:currentPage
                       this.pageList();
            }else{
                Toast({
                            message: '信息删除失败',
                            position: 'middle',
                            duration: 1500
                        });
            }
        })
    },
        },
    }
</script>