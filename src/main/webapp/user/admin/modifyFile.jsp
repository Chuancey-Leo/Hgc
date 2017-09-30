<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>文件上传</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body style="margin: 10px">

<form id= "uploadForm">
	<input type="hidden" name="id" id="id">
	<p>标题： <input type="text" id="title" name="title"></p >
	<p>选择文件： <input type="file" id="file" name="file" onchange="fileChange(this)"/></p>
	<td>
		<select class="easyui-combobox" style="width: 154px" id="fileTypeId" name="fileTypeId" editable="false" panelHeight="auto" >
			<option value="">请选择文件类型...</option>
			<c:forEach var="fileType" items="${fileTypeList }">
				<option value="${fileType.id }">${fileType.name }</option>
			</c:forEach>
		</select>
	</td>
	<br><br>
	<tr>
		<td valign="top">内容：</td>
		<td>
			<script id="editor" name="content" type="text/plain" style="width:100%;height:500px;"></script>
			<%--<input type="hidden" value="UE.getEditor('editor').getContent()">--%>
		</td>
	</tr>

	<input type="button" value="上传" onclick="uploadFile()">
</form>

<br><br>

<progress id="progressBar" value="0" max="100"></progress>
<span id="percentage"></span>

<script type="text/javascript">
	function uploadFile() {
		var title=$("#title").val();
		var file=$("#file").val();
		var fileTypeId=$("#fileTypeId").combobox("getValue");
		if(title==null || title==''){
			alert("标题不能为空!");
			return false;
		}

		/*if(file==null || file==''){
			alert("文件不能为空!");
			return false;
		}*/

		if(fileTypeId==null || fileTypeId==''){
			alert("文件类型不能为空!");
			return false;
		}

		// 接收上传文件的后台地址
		var FileController = "http://localhost:8080/Hgc/user/admin/updateFile";
		// FormData 对象
		var form = new FormData($( "#uploadForm" )[0]);

		// XMLHttpRequest 对象
		var xhr = new XMLHttpRequest();
		xhr.open("post", FileController, true);
		xhr.onload = function () {
			// alert("上传完成!");
		};

		xhr.upload.addEventListener("progress", progressFunction, false);
		xhr.send(form);
	}

	function progressFunction(evt) {
		var progressBar = document.getElementById("progressBar");
		var percentageDiv = document.getElementById("percentage");
		if (evt.lengthComputable) {
			progressBar.max = evt.total;
			progressBar.value = evt.loaded;
			percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
			if(evt.loaded==evt.total){
				alert("上传完成100%");
			}
		}
	}
	function fileChange(target) {
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		var fileSize = 0;
		var fileTypes =[".txt",".pdf",".doc",".docx",".excel"];
		var filePath = target.value;
		var fileMaxSize = 1024*100;//100M
		if(filePath){
			var isNext = false;
			var fileEnd = filePath.substring(filePath.indexOf("."));
			if(fileTypes && fileTypes.length>0){
				for(var i =0; i<fileTypes.length;i++){
					if(fileTypes[i]==fileEnd){
						isNext = true;
						break;
					}
				}
			}
			if(!isNext){
				alert("不接受此文件类型！");
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
				alert("附件不存在，请重新输入！");
				return false;
			}
			var file = fileSystem.GetFile (filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		}
		var size = fileSize / 1024;
		if(size>fileMaxSize){
			alert("附件大小不能大于"+fileMaxSize/1024+"M！");
			target.value ="";
			return false;
		}
		if(size<=0){
			alert("附件大小不能为0M！");
			target.value ="";
			return false;
		}
	}
</script>
<%--<script type="text/javascript">
	function doUpload() {
		var formData = new FormData($( "#uploadForm" )[0]);
		$.ajax({
			url: 'http://localhost:8080/Hgc/file/upload' ,
			type: 'POST',
			data: formData,
			async: false,
			cache: false,
			contentType: false,
			processData: false,
			success: function (returndata) {
				alert(returndata);
			},
			error: function (returndata) {
				alert(returndata);
			}
		});
	}
</script>--%>
<script type="text/javascript">
    //实例化编辑器
    //使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
	ue.addListener("ready",function(){
		//通过ajax请求数据
		UE.ajax.request("${pageContext.request.contextPath}/user/admin/findFileById",
				{
					method:"post",
					async : false,
					data:{"id":"${param.id}"},
					onsuccess:function(result){
						result = eval("(" + result.responseText + ")");
						$("#id").val(result.id);
						$("#title").val(result.title);
						$("#file").val(result.file);
						$("#fileTypeId").combobox("setValue",result.fileTypeId);
						UE.getEditor('editor').setContent(result.content);
					}
				}
		);
	});
</script>

</body>
</html>