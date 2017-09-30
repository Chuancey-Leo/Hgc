<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sweetalert.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>国资基建处新闻设置</title>
    <style type="text/css">
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>
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
            <a href="${pageContext.request.contextPath}/user/admin/addFile" class="list-group-item active">
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
            <a href="${pageContext.request.contextPath}/user/admin/color" class="list-group-item">
                <span class="glyphicon glyphicon-asterisk"></span>风 格 设 置
            </a>
            <a href="${pageContext.request.contextPath}/user/admin/logout" class="list-group-item">
                <span class="glyphicon glyphicon-user"></span>注 销 登 录
            </a>
        </div>
    </div>
    <!--下面是右边-->

    <div class="main-right col-sm-12 col-xs-12 col-md-8 col-lg-9">
        <form id= "uploadForm">
            <div>
                <p>请输入标题:</p>
                <input type="text" maxlength="20" id="title" name="title" required="required" class="form-control" placeholder="请输入标题">
            </div><br>

           <%-- <p >选择文件： <input type="file" id="file" name="file" onchange="fileChange(this)"/></p>--%>
            <a href="javascript:;" class="file">选择文件
                <input type="file" name="file" id="file" onchange="fileChange(this)">
            </a><h5 class="showFileName"></h5>

            <select id="fileTypeId" name="fileTypeId" editable="false" panelHeight="auto" style="background-color: #FFFFFF;border-radius: 3px;">
                <option value="">请选择文件类型...</option>
                <c:forEach var="fileType" items="${fileTypes }">
                    <option value="${fileType.id }">${fileType.name }</option>
                </c:forEach>
            </select>
            <br><br>
            <tr>
                <td valign="top">内容：</td>
                <td>
                    <script id="editor" name="content" type="text/plain" style="width:100%;height:500px;"></script>
                    <%--<input type="hidden" value="UE.getEditor('editor').getContent()">--%>
                </td>
            </tr><br>
            <div class="btn-group fright">
                <button id="submitBtn" data-loading-text="Loading..." autocomplete="off" type="button" class="btn btn-default" onclick="uploadFile()">发布</button>
            </div>
            <input type="hidden" name="contentNoTag" id="contentNoTag">
        </form>
        <br>

    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script type="text/javascript">
    function uploadFile() {
        var title=$("#title").val();
        var file=$("#file").val();
        var fileTypeId=$("#fileTypeId").val();
        var content=$("editor").val();
        document.getElementById("contentNoTag").value=UE.getEditor('editor').getContentTxt();

        if(title==null || title==''){
            sweetAlert("标题不能为空!");
            return false;
        }

        if(file==null || file==''){
            sweetAlert("文件不能为空!");
            return false;
        }

        if(fileTypeId==null || fileTypeId==''){
            sweetAlert("文件类型不能为空!");
            return false;
        }
/*
        // 接收上传文件的后台地址
        var FileController = "/user/admin/upload";
        // FormData 对象
        var form = new FormData($( "#uploadForm" )[0]);

        // XMLHttpRequest 对象
        var xhr = new XMLHttpRequest();
        xhr.open("post", FileController, true);
        xhr.onload = function () {
            // alert("上传完成!");
        };

        //xhr.upload.addEventListener("progress", progressFunction, false);
        xhr.send(form);*/

        // FormData 对象
	var btn = $("#submitBtn");
	btn.button('loading');
        var form = new FormData($( "#uploadForm" )[0]);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/admin/upload",
                        type:"POST",
                        data:form,
                        contentType:false,
                        processData:false,
                        dataType:"json",
                        success:function (result) {
                            if(result.success){
                                swal({
                                            title:"发布成功！",
                                            text:"",
                                            type:"success"},
                                        function(isConfirm){
                                            window.location.reload();
                                        }
                                );
                            }else{
                                swal({
                                    title:"发布失败！误操作或者网络断开！",
                                    text:"",
                                    type:"error"}
                                );
                            }
                        },

                    });

    }

 /*   function progressFunction(evt) {
        var progressBar = document.getElementById("progressBar");
        var percentageDiv = document.getElementById("percentage");
        if (evt.lengthComputable) {
            progressBar.max = evt.total;
            progressBar.value = evt.loaded;
            percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
            if(evt.loaded==evt.total){
                sweetAlert("上传完成100%");
            }
        }
    }
*/

    function fileChange(target) {
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
        var fileSize = 0;
        var fileTypes =[".txt",".pdf",".doc",".docx",".excel"];
        var filePath = target.value;
        var fileMaxSize = 1024*100;//100M
        var arr=filePath.split('\\');
        var fileName=arr[arr.length-1];

        if(filePath){
            var isNext = false;
            var fileEnd = filePath.substring(filePath.indexOf("."));
            if(fileTypes && fileTypes.length>0){
                for(var i =0; i<fileTypes.length;i++){
                    if(fileTypes[i]==fileEnd){
                        isNext = true;
                        $(".showFileName").html(fileName);
                        break;
                    }
                }
            }
            if(!isNext){
                sweetAlert("不接受此文件类型！");
                target.value ="";
                return false;
            }
        }else{
            return false;
        }
        if (isIE && !target.files) {
            var filePath = target.value;
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            if(!fileSystem.FileExists(filePath)){
                sweetAlert("文件不存在，请重新输入！");
                return false;
            }
            var file = fileSystem.GetFile (filePath);
            fileSize = file.Size;
        } else {
            fileSize = target.files[0].size;
        }

        var size = fileSize / 1024;
        if(size>fileMaxSize){
            sweetAlert("文件大小不能大于"+fileMaxSize/1024+"M！");
            target.value ="";
            $(".showFileName").html("");
            return false;
        }
        if(size<=0){
            sweetAlert("文件大小不能为0M！");
            target.value ="";
            return false;
        }
    }

    //实例化编辑器
    //使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor',{
        autoHeightEnabled: true,
        autoFloatEnabled: true
    });
</script>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/updateUser.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
</html>
