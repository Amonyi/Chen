<template>
    <div class="sj">
      <div class="sj-top">
            <h3>游戏蓝贴列表</h3>
            <div class="search-box"> 
                <el-button icon="el-icon-plus" type="primary" @click="addDialog=true;">添加</el-button>
                <div class="search">
                   <el-row>
                      <el-col :span="12">
                        <el-input v-model="searchData"  placeholder="输入关键词搜索" @blur="init"></el-input>
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
       <!-- 列表数据 -->
        <el-table :data="list" border>
            <el-table-column label="序号" type="index" width="50" align="center">
              <template scope="scope">
                  <span>{{(page - 1) * limit + scope.$index + 1}}</span>
              </template>
            </el-table-column>
            <el-table-column label="标题" prop="title" :show-overflow-tooltip="true"></el-table-column>
            <el-table-column label="内容" prop="contents" :show-overflow-tooltip="true"></el-table-column>
            <el-table-column label="添加时间" prop="add_time" :show-overflow-tooltip="true">
                <template slot-scope="scope">
                  <span>{{timestampToTime(scope.row.add_time)}}</span>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" width="200">
                    <template scope="scope">
                        <el-button type="success" icon="el-icon-view" @click="seeInfo(scope.row.id)"></el-button>
                        <el-button type="primary" icon="el-icon-edit" @click="getinfo(scope.row.id)"></el-button>
                        <el-button type="danger" icon="el-icon-delete" @click="delList(scope.row.id)"></el-button>
                    </template>            
            </el-table-column>
        </el-table>
        <!-- 分页 -->
        <div class="pagebox">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                :current-page="page" :page-sizes="[1, 2,5,]" :page-size="limit"
                layout="total, sizes, prev, pager, next, jumper" :total="total" hide-on-single-page>
            </el-pagination>
        </div>
        <!-- 详情弹窗 -->
           <el-dialog title="查看详情" :visible.sync="seeDialog" width="30%"
            :before-close="handleClose">
            <div class="messageBox">
                <label>标题：</label>
                <p>{{listinfo.list_title}}</p>
                <label>内容：</label>
                <p>{{listinfo.list_contents}}</p>
                <label>添加时间：</label>
                <p>{{listinfo.list_time | dateFormat2}}</p>
            </div>
            </el-dialog>
            <!-- 添加弹窗 -->
           <el-dialog title="添加数据" :visible.sync="addDialog" width="30%"
            :before-close="handleClose">
            <span class="tips" v-show="flag1">信息不能为空!</span>
            <form>
                <input type="hidden" v-model="listinfo.list_id">
                <label>标题：</label>
                <input type="text" v-model="listinfo.list_title">
                <label>内容：</label>
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
                <label>标题：</label>
                <input type="text" v-model="listinfo.list_title">
                <label>内容：</label>
                 <textarea cols="30" rows="5" v-model="listinfo.list_contents"></textarea>
            </form>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="putlistinfo" class="btn1">确 定</el-button>
            </span>
            </el-dialog>
    </div>
</template>
<!-- 公共样式 -->
<style lang="css">
.el-tooltip__popper {
    max-width: 60% !important;
} 
</style>

<style lang="css" scoped>
.pagebox >>>.el-select__caret.is-reverse {
    line-height: 20px;
}
.pagebox >>>.el-icon-arrow-up {
    line-height: 40px;
}
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
import { Modal } from 'ant-design-vue';

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
            }
      },
            pageList() {
                // 发请求拿到数据并暂存全部数据,方便之后操作
                this.$http.get("bluestick")
                .then(result=>{
                    this.data= result.body
                    this.getList()
                })  
            },
            // 处理数据
            getList() {
                // es6过滤得到满足搜索条件的展示数据list
                let list = this.data.filter((item, index) =>
                    item.title.includes(this.searchData) ||
                    item.contents.includes(this.searchData)  
                    
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
            // 搜索框失焦后为空，重新渲染列表数据
            init(){
                if(this.searchData == ''){
                    this.pageList()
                }
            },
            // 详情按钮
            seeInfo(id){
              this.seeDialog = true
              this.$http.get("getbstick/"+id)
              .then(result=>{
                  this.listinfo.list_title = result.body.title
                  this.listinfo.list_contents = result.body.contents
                  this.listinfo.list_id = result.body.id
                  this.listinfo.list_time = result.body.add_time
              })
            },
            // 修改按钮
            // 1、根据id获取信息
       getinfo(id){
           this.dialogVisible = true
           this.$http.get("getbstick/"+id)
            .then(result=>{
                this.listinfo.list_title = result.body.title
                this.listinfo.list_contents = result.body.contents
                this.listinfo.list_id = result.body.id
            })
       },
    //    修改
       putlistinfo(){
           if(this.listinfo.list_title == '' || this.listinfo.list_contents == ''){
                this.flag=true
           }else{
                this.$http.put("bstickitem",{
                id:this.listinfo.list_id,
                contents:this.listinfo.list_contents,
                title:this.listinfo.list_title,
            }).then(function(data){
                if(data.body.flag == 1){
                    this.editsuccess()
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            
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
                          
                        }
                    this.editfail()
                }
            })
           }  
       },
      //  添加按钮
      addList(){
        if(!this.listinfo.list_title || !this.listinfo.list_contents){
            this.flag1=true;
        }else{
            this.$http.post('addbluestick',{
                id:this.listinfo.list_id,
                contents:this.listinfo.list_contents,
                title:this.listinfo.list_title,
                add_time:this.date
            }).then(function(data){
                if(data.body.flag == 1){
                    this.addsuccess()
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                            
                        }
                    this.addDialog=false;
                    this.pageList()
                }else{
                    this.addfail()
                        this.listinfo={
                            list_title:'',
                            list_contents:'',
                            list_id:'',
                            list_time:'',
                           
                        }
                        this.addDialog=false;
                }
            })
        }
        
    },
    // 删除
    delList(id){
        var that = this
        Modal.confirm({
                title: '确定要删除此数据吗?',
                // content: '请慎重选择',
                okText: '是',
                okType: 'danger',
                cancelText: '否',
                onOk() {
                   that.$http.delete('delbluestick/'+id)
                    .then(result=>{
                            if(result.body.flag == 1){
                                    that.delsuccess()
                                    // 如果当前页数据被删除完，返回到当前页的上一页
                                let totalPage = Math.ceil((that.total - 1) / that.limit) // 总页数
                                let currentPage = that.page > totalPage ? totalPage : that.page
                                that.page = currentPage <1 ? 1:currentPage
                                that.pageList();
                            }else{
                                that.delfail()
                            }
                    })
                },
                onCancel() {
                    console.log('Cancel');
                },
                });  
    },
    // 时间格式化
    timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
       var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
        var h = (date.getHours() < 10 ? '0'+date.getHours() : date.getHours()) + ':';
        var m = (date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes()) + ':';
        var s = (date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds());
        return Y+M+D+h+m+s;
    },
    // 操作提示框
            addsuccess(){
                this.$message({
                message: '数据添加成功！',
                type: 'success'
                });
            },
            addfail(){
                this.$message({
                message: '数据添加失败！',
                type: 'error'
                });
            },
            editsuccess(){
                this.$message({
                message: '信息修改成功！',
                type: 'success'
                });
            },
            editfail(){
                this.$message({
                message: '信息修改失败！',
                type: 'error'
                });
            },
            delsuccess(){
                this.$message({
                message: '信息删除成功！',
                type: 'success'
                });
            },
            delfail(){
                this.$message({
                message: '信息删除失败！',
                type: 'error'
                });
            },
        },
        components:{
            AModal:Modal
        }
    }
</script>