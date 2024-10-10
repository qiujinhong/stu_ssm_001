<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css"
          rel="stylesheet"/>

    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination/jquery.bs_pagination.min.css">
    <script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination/en.js"></script>


    <script type="text/javascript">

        $(function () {

            $(".time").datetimepicker({
                minView: "month",
                language: 'zh-CN',
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayBtn: true,
                pickerPosition: "bottom-left"
            })

            //为创建按钮绑定事件，打开需要操作的模态窗口
            $("#addBtn").click(function () {

                $("#createActivityModal").modal("show");


            })
            //为保存按钮绑定添加操作
            $("#saveBtn").click(function () {

                $("#avtivityAddForm").submit()


                $("#createActivityModal").modal("hide");

            })

            //页面加载完毕后触发一个方法
            pageList(1, 2);



            //为模态窗口中更新按钮绑定事件
            /*
                在实际项目开发中，一定是先做添加后做修改
                所以为了节省开发时间，修改操作一般都是copy添加操作
             */


        });


    </script>


</head>
<body>

<input type="hidden" id="hidden-name">
<input type="hidden" id="hidden-owner">
<input type="hidden" id="hidden-startDate">
<input type="hidden" id="hidden-endDate">




<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">添加书籍</h4>
            </div>
            <div class="modal-body">

                <form id="avtivityAddForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/book/save">

                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">书籍名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="name">
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">作者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="author">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="create-cost" class="col-sm-2 control-label">书籍描述</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="detail">
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <!--data-dismiss:关闭模态窗口-->
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改</h4>
            </div>
            <div class="modal-body">

                <form id="updateForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/book/update">
                    <input type="hidden" id="edit-id">
                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">书籍名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="name" id="name">
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">作者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="author" id="author">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="create-cost" class="col-sm-2 control-label">书籍描述</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="detail" id="detail">
                        </div>

                        <label for="create-cost" class="col-sm-2 control-label"></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" name="id" id="bid" style="display: none">
                        </div>
                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateBtn()">更新</button>

            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>图书管理列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form  id="searchForm" action="${pageContext.request.contextPath}/book/findBookByCondition" class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">查找</div>
                        <input class="form-control" type="text" id="condition" name="condition">
                    </div>
                </div>

                <button type="button" id="searchBtn" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">

                <!--
                    点击创建按钮，观察两个属性和属性值

                    data-toggle="motal"
                    表示触发该按钮，将要打开一个模态窗口
                    data-target = "id"
                    表示要打开哪个模态窗口，通过#id的形式找到该窗口
                    但是这样做是有问题的，这样就把属性和属性值写死了，没有办法对按钮功能进行扩充
                -->
                <button type="button" class="btn btn-primary" id="addBtn"><span class="glyphicon glyphicon-plus"></span>创建</button>
            </div>

        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td>id</td>
                    <td>书名</td>
                    <td>作者</td>
                    <td>描述</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>

                <c:forEach items="${bookList}" var="book">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.name}</td>
                        <td>${book.author}</td>
                        <td>${book.detail}</td>
                        <td>${book.status}</td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="update(${book.id})"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
                            <button type="button" class="btn btn-danger" onclick="del(${book.id})"><span class="glyphicon glyphicon-minus"></span> 删除</button>
                        </td>
                    </tr>

                </c:forEach>

                </thead>
                <tbody id="activityBody">

                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 30px;">
            <div id="activityPage"></div>
        </div>

    </div>

</div>
<script>
    //为删除按钮绑定事件，执行市场活动的删除操作
    function del(id){
        if (confirm("你确定要删除吗？")){
            location.href = "${pageContext.request.contextPath}/book/delete?id="+id+""
        }

    }

    function update(id){

        //发送异步请求
        $.get("book/findBook",{id:id},function (book){
            $("#name").val(book.name)
            $("#author").val(book.author)
            $("#detail").val(book.detail)
            $("#bid").val(book.id)
        })

        $("#editActivityModal").modal("show")
    }

    function updateBtn(){
        $("#updateForm").submit()
    }

    $("#searchBtn").click(function () {

        var v = $("#condition").val()
        if(v == null){
            $("#condition").val("")
        }

        $("#searchForm").submit()

    })

</script>
</body>
</html>