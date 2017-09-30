<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sweetalert.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <style type="text/css">
        html,body {
            height: 100%;
        }
        .box {
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
           /* background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/

            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }
        .login-box {
            width: 100%;
            max-width:500px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }
        @media screen and (min-width:500px){
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width:500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }
        .login-content {
            height: 300px;
            width: 100%;
            max-width:500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }


        .input-group {
            margin: 0px 0px 30px 0px !important;
        }
        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }
        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }
        .login-title h1 {
            margin-top: 10px !important;
        }
        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }
        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }
    </style>
</head>
<body style="overflow-x: hidden;">
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <h1><small>管理员登录</small></h1>
        </div>
        <div class="login-content " style="border: 1px solid rgba(0, 0, 0, .6)">
            <div class="form">
                <form action="${pageContext.request.contextPath}/user/adminlogin" method="post">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input required="required" style="height: 40px;width: 400px;outline: none;border: 1px solid #d9d2d1" type="text" id="userame" name="userName" placeholder=" 用户名">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input required="required" type="password" id="password" name="password" style="border: 1px solid #d9d2d1;height: 40px;width: 400px;outline: none" placeholder=" 密码">
                            </div>
                        </div>
                    </div>
                    <div>
                        <font color="red" style="font-size: 18px" id="error">${errorInfo}</font>
                        <div class="col-xs-4 col-xs-offset-4 ">
                            <button type="submit" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span> 登录</button>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a>
                            </p>
                        </div>
                    </div>--%>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
<script type="text/javascript">
    /*var target;
    window.onload = function(){
        target = document.getElementById('box');
    }
    function center(){
        var screenHeight = document.documentElement.clientHeight;
        target.style.marginTop = (screenHeight-400)/2+"px";
    }
    setInterval("center()",50);
    function fun1()
    {
        var userName=document.getElementById("adminId").value;
        var pwd=document.getElementById("adminPsd").value;

        var matchResult=true;
        if (userName == "" || pwd == "" || repwd == "") {
            sweetAlert("请确认是否有空缺项！");
            matchResult = false;
        } else if (userName.length < 0 || userName.length > 20) {
            sweetAlert("用户名长度应在1到20个字符之间！");
            matchResult = false;
        } else if (pwd.length < 0 || pwd.length > 20 || repwd.length < 0 || repwd.length > 20) {
            sweetAlert("密码长度应在1到20个字符之间！");
            matchResult = false;
        }
        return matchResult;
    }*/
</script>

</html>