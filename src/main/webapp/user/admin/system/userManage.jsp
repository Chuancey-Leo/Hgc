<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sweetalert.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <title>国资基建处新闻设置</title>
    <script type="text/javascript">
        function submitData(){
            var password=$("#password").val();
			var userName=$("#userName").val();
            var password1=$("#password1").val();
            var password2=$("#password2").val();
            /*var keyWord=$("#keyWord").val();*/

            if(password==null || password==''){
                sweetAlert("请输入用户当前密码！");
            }else if(password1==null || password1==''){
                sweetAlert("请输入修改密码！");
            }else if(password1==password){
                sweetAlert("修改密码不能和旧密码相同！");
            }else if(password2==null || password2==''){
                sweetAlert("请输入确认修改密码！");
            }else if(password1!=password2){
                sweetAlert("两次输入的密码不一致！");
            }else{
                $.post("${pageContext.request.contextPath}/user/admin/modify",{'userName':userName,'password':password,'password1':password1},function(result){
                    if(result.success){
                        sweetAlert("修改成功！下次登录生效！");
                        /*resetValue();*/
                    }else{
                        sweetAlert("修改失败！原密码错误或网络断开！");
                    }
                },"json");
            }
        }
    </script>
</head>
<body>
<jsp:include page="../common/topNav.jsp"/>
<!--上面是导航，下面是主体部分-->
<div class="main-wrap container">
    <!--下面就是左边-->
    <div class="main-left col-sm-12 col-xs-12 col-md-4 col-lg-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/user/admin/addNews" class="list-group-item">
                <span class="glyphicon glyphicon-plus"></span>新建新闻
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/addFile" class="list-group-item">
                <span class="glyphicon glyphicon-open"></span>上传文件
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/addSource" class="list-group-item">
                <span class="glyphicon glyphicon-open"></span>上传资料
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/work" class="list-group-item">
                <span class="glyphicon glyphicon-send"></span>新 闻 管 理
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/policy" class="list-group-item">
                <span class="glyphicon glyphicon-file"></span>文 件 管 理
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/general" class="list-group-item">
                <span class="glyphicon glyphicon-th"></span>资 源 管 理
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/leader" class="list-group-item">
                <span class="glyphicon glyphicon-tower"></span>部 门 简 介
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/color" class="list-group-item active">
                <span class="glyphicon glyphicon-asterisk"></span>风 格 设 置
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/logout" class="list-group-item">
                <span class="glyphicon glyphicon-user"></span>注 销 登 录
            </a>
        </div>
    </div>
    <!--下面是右边-->
    <div class="main-right col-sm-12 col-xs-12 col-md-8 col-lg-9">
        <!--下面是一个标签页-->
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li role="presentation">
                    <a href="${pageContext.request.contextPath}/user/admin/color">底色设置</a>
                </li>
                <li role="presentation" class="">
                    <a href="${pageContext.request.contextPath}/user/admin/picture">图片设置</a>
                </li>
                <li role="presentation" class="">
                    <a href="${pageContext.request.contextPath}/user/admin/link">友情链接设置</a>
                </li>
                <li role="presentation" class="">
                    <a href="#strolPicSet" role="tab" id="strolPicSet-tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">用户信息设置</a>
                </li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
                    <div class="main-right col-sm-12 col-xs-12 col-md-8 col-lg-9">

                        <div>
                            <p>请输入当前用户密码</p>
                            <input type="password" id="password" required="required" class="form-control" placeholder="请输入当前用户密码"><br>
							<p>请输入要修改的用户名</p>
                            <input type="text" id="userName" required="required" class="form-control" placeholder="请输入要修改的用户名"><br>
							<p>请输入修改密码</p>
                            <input type="password" id="password1" required="required" class="form-control" placeholder="请输入修改密码"><br>
							<p>请再次输入修改密码</p>
                            <input type="password" id="password2" required="required" class="form-control" placeholder="请再次输入修改密码"><br>
                            <button type="button" class="btn btn-default" onclick="submitData()">提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主体结束-->
<jsp:include page="../common/footer.jsp"/>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>

<script type="text/javascript">
    $(function() {
        $('#myTab li:eq(3) a').tab('show')
    })
</script>
</html>