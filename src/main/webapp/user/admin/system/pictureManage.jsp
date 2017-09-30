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
		<title>国资基建处风格设置</title>
		<style type="text/css">
			.media .media-body .panel-body {
				padding: 0px;
			}

			.media .media-body .panel-body .table-responsive .table {
				margin-bottom: 0px;
			}

			.topbtn {
				margin-top: -20px;
				margin-bottom: 40px;
			}
			.media{
				padding: 20px;
				width: 700px;
				border: 1px solid gainsboro;
			}
			.media .media-body{
				width: 600px;
			}
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
							<a href="#strolPicSet" role="tab" id="strolPicSet-tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">图片设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/link">友情链接设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/setting">用户信息设置</a>
						</li>
					</ul>

					<div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
						<c:forEach var="picture" items="${scrollPictureList}">
							<div>
								<img src="${pageContext.request.contextPath}/static/scrollPic/${picture.imgUrl}" alt="" style="width: 700px;height: 170px;margin-top: 30px"><br><br>
								<form id="updatePic${picture.id}" method="post">
									<a href="javascript:;" class="file">修改
										<input type="file" name="file" id="file${picture.id}" onchange="fileChange(this)">
									</a>
									<a href="javascript:;" onclick="updatePic(${picture.id})" class="file">保存
									</a>
									<input type="hidden" value="${picture.id}" name="id">
								</form>
								<h5 class="showfile${picture.id}"></h5>
							</div>
						</c:forEach>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
	<script type="text/javascript">
		$(function() {
			$('#myTab li:eq(1) a').tab('show')
		})

		function fileChange(target) {
			var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
			var fileSize = 0;
			var fileTypes =[".png",".jpg"];
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
							var fileId=target.id;
							$(".show"+fileId).html(fileName);
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
				$(".show"+fileId).html("");
				return false;
			}
			if(size<=0){
				sweetAlert("文件大小不能为0M！");
				target.value ="";
				return false;
			}
		}

		function updatePic(element) {
			var file=$("#file"+element).val();

			// 接收上传文件的后台地址
			var FileController = "${pageContext.request.contextPath}/user/admin/updatePic";
			// FormData 对象
			var form = new FormData($( "#updatePic"+element )[0]);

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
			if (evt.lengthComputable) {
				if(evt.loaded==evt.total){
					swal({
								title:"ok",
								text:"ok",
								type:"success"},
							function(isConfirm){
								window.location.reload();
							}
					);
				}
			}
		}
	</script>
	
</html>