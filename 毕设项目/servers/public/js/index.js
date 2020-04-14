

// 自定义的js-->主要做数据的请求 与 显示数据
$(function(){
    //初始化数据 -->访问 http://192.168.9.101:8080/books/
    function initList(){
        $.ajax({
            url:"/comments",
            type:"get",
            dataType:"json",//预期返回的数据类型
            success:function(data){
                var html = template("indexTpl",{list:data});
                $("#dataList").html(html);

                $("#dataList").find("tr").each(function(index,element){
                    var td = $(element).find('td:eq(4)');
                    var id = $(element).find('td:eq(0)').text();

                     //编辑图书图书
                     td.find("a:eq(0)").click(function(){
                        
                        editComment(id);
                    })

                    //删除图书
                    td.find("a:eq(1)").click(function(){
                        
                        deleteComment(id);
                    })

                       //绑定添加图书事件。。
                        addComment();
                        //表单初始化
                        var form = $("#addCommentForm");
                        form.get(0).reset();
                        form.find('input[type=hidden]').val('');
                })


             
            },
            error:function(){
                alert("初始化错误");
            }
        })
    }
    initList();
function editComment(id){
    var form = $("#addCommentForm");
   
    $.ajax({
        url:"/comments/comment/"+id,
        type:"get",
        dataType:"json",
        success:function(data){
            //初始化弹窗
            var mark = new MarkBox(600,400,"修改评论",form.get(0));
            mark.init();
           
            form.find("input[name=id]").val(data.id);
            form.find("input[name=title]").val(data.title);
            form.find("input[name=author]").val(data.author);
            form.find("input[name=txttype]").val(data.txttype);

            form.find("input[type=button]").unbind("click").click(function(){
                $.ajax({
                    url:"/comments/comment",
                    type:"put",
                    data:form.serialize(),//表单序列化。将表单数据格式化为 name="张三"&age=18
                    dataType:"json",
                    success:function(data){
                        if(data.flag ==1){
                            mark.close();
                            initList();
                        }else{
                            alert("修改失败");
                        }
                    }
                })
        
            })

        }
    })
}


function deleteComment(id){
    
    $.ajax({
        url:"/comments/comment/"+id,
        type:"delete",
        dataType:"json",
        success:function(data){
        
            if(data.flag =='1'){
                initList();
            }
        }
    })
}


function addComment(){
  //添加图书的点击事件
  $("#addComment").click(function(){
    var form = $("#addCommentForm");
    form.get(0).reset();
    //实例化弹窗对象
    var mark = new MarkBox(600,400,"添加数据",form.get(0));
    mark.init();
    form.find("input[type=button]").unbind("click").click(function(){
        var binfo = form.find("input[type=text]");
        for(var key in binfo){
            var mes = binfo[key].value;
            console.log(mes);
            if(mes == ''){
                alert('数据不能为空');
                return;
            }
        }
        $.ajax({
            url:"/comments/comment",
            type:"post",
            data:form.serialize(),//表单序列化。将表单数据格式化为 name="张三"&age=18
            dataType:"json",
            success:function(data){
                if(data.flag ==1){
                    mark.close();
                    initList();
                }else{
                    alert("添加失败");
                }
            }
        })

    })

})
}
  
})