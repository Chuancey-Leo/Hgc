<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
		<title>国资基建处风格设置</title>
		<script type="text/javascript">
			function deleteLeader(element){
				/*sweetAlert(element);*/
				swal({title: "确定删除吗?",
							text: "此数据将无法恢复!",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							cancelButtonText:"取消",
							confirmButtonText: "确定",
							closeOnConfirm: false },
						function(){
							$.post("${pageContext.request.contextPath}/user/admin/deleteLeader",{element:element},function(result){
								if(result.success){
									swal({
												title:"删除完成！",
												text:"此数据已被删除！",
												type:"success"},
											function(isConfirm){
												window.location.reload();
											}
									);

									/*$("#dg").datagrid("reload");*/
								}else{
									swal("删除失败!", "此数据未被删除！","error");
								}
							},"json");
						});
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
				<a href="${pageContext.request.contextPath}/user/admin/leader" class="list-group-item active">
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
			<!--下面是一个标签页-->
			<div class="bs-example bs-example-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="">
						<a href="#botColSet" id="botColSet-tab" role="tab" data-toggle="tab" aria-controls="botColSet" aria-expanded="false">现任领导及分管工作</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/introduce">介绍</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/office">办公室</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/base">基建科</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/land">房地产科</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/equipment">设备科</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<button type="button" class="btn btn-primary btn-sm topbtn" data-toggle="modal" data-target="#myModal1">增加</button>
					<form id="addLeader" method="post">
						<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										<h4 class="modal-title" id="myModalLabel">领导人信息：</h4>
									</div>
									<%--<input type="file" class="form-control">--%>
									<div class="modal-body">
										<a href="javascript:;" class="file">选择文件
											<input type="file" name="file" id="file" onchange="fileChange(this)">
										</a><h5 class="showFileName"></h5>
										<div class="input-group">
											<span class="input-group-addon">姓名：</span>
											<input maxlength="20" type="text" name="userName" id="userName" class="form-control">
										</div><br>
										<div class="input-group">
											<span class="input-group-addon">电话：</span>
											<input maxlength="20" type="text" name="phone" id="phone" class="form-control">
										</div><br/>
										<div class="input-group">
											<span class="input-group-addon">职务：</span>
											<input maxlength="100" type="text" name="post" id="post" class="form-control">
										</div><br/>
										<div class="input-group">
											<span class="input-group-addon">分管工作：</span>
											<input maxlength="100" type="text" name="job" id="job" class="form-control">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onclick="addLeader()">添加</button>
									</div>
								</div>
							</div>
						</div>
					</form>

					<div role="tabpanel" class="tab-pane fade" id="botColSet" aria-labelledby="botColSet-tab">
						<!--下面是设置领导人信息-->
						<c:forEach var="leader" items="${leaders}">
							<div class="media">
								<a class="media-left" href="#">
									<img class="media-object" data-src="holder.js/100x100" alt="100*100"
										 style="width: 100px; height: 100px;" src="${pageContext.request.contextPath}/static/leaderImg/${leader.avatar}"
										 data-holder-rendered="true">
								</a>
								<div class="media-body">
									<div class="panel-body">
										<div class="table-responsive">
												<table class="table table-striped table-hover">
													<tbody id="body-data">
													<tr>
														<td>姓名:<c:out value="${leader.userName}" escapeXml="true"/></td>
													</tr>
													<tr>
														<td>电话:<c:out value="${leader.phone}" escapeXml="true"/></td>
													</tr>
													<tr>
														<td>职务:<c:out value="${leader.post}" escapeXml="true"/></td>
													</tr>
													<tr>
														<td>分管工作:<c:out value="${leader.job}" escapeXml="true"/></td>
													</tr>
													</tbody>
												</table>
										</div>
									</div>
								</div>
								<div class="media-bottom">
									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" onclick="deleteLeader(${leader.id})">删除</button>
									<!--下面的两行完成了增加领导人的功能-->
									<!--上面的两行完成了增加领导人的功能呢-->

									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#${leader.id}">修改</button>

									<form id="updateLeader${leader.id}" method="post">
										<div class="modal fade" id="${leader.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
														<h4 class="modal-title" id="myModalLabel2">领导人信息：</h4>
													</div>
														<%--<input type="file" class="form-control">--%>
													<div class="modal-body">
														<a href="javascript:;" class="file">选择头像
															<input type="file" name="file" id="file${leader.id}" onchange="fileChange(this)">
														</a><h5 class="showFileName"></h5>
														<div class="input-group">
															<span class="input-group-addon">姓名：</span>
															<input type="hidden" name="id" value="${leader.id}">
															<input maxlength="20" type="text" name="userName" id="userName${leader.id}" class="form-control" value="<c:out value="${leader.userName}" escapeXml="true"/>">
														</div><br>
														<div class="input-group">
															<span class="input-group-addon">电话：</span>
															<input maxlength="20" type="text" name="phone" id="phone${leader.id}" class="form-control" value="<c:out value="${leader.phone}" escapeXml="true"/>">
														</div><br/>
														<div class="input-group">
															<span class="input-group-addon">职务：</span>
															<input maxlength="100" type="text" name="post" id="post${leader.id}" class="form-control" value="<c:out value="${leader.post}" escapeXml="true"/>">
														</div><br/>
														<div class="input-group">
															<span class="input-group-addon">分管工作：</span>
															<input maxlength="100" type="text" name="job" id="job${leader.id}" class="form-control" value="<c:out value="${leader.job}" escapeXml="true"/>">
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary" onclick="updateLeader(${leader.id})">修改</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</c:forEach>
						<!--上面是设置领导人信息-->
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
			$('#myTab li:eq(0) a').tab('show')
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
		
		function addLeader() {
			var userName=$("#userName").val();
			var phone=$("#phone").val();
			var file=$("#file").val();
			var post=$("#post").val();
			var job=$("#job").val();
			if(file==null || file==''){
				sweetAlert("头像不能为空!");
				return false;
			}
			if( $.trim(userName)==null || $.trim(userName)==''){
				sweetAlert("姓名不能为空!");
				return false;
			}
			if($.trim(phone)==null || $.trim(phone)==''){
				sweetAlert("电话不能为空!");
				return false;
			}
			if($.trim(post)==null || $.trim(post)==''){
				sweetAlert("职务不能为空!");
				return false;
			}
			if($.trim(job)==null || $.trim(job)==''){
				sweetAlert("分管工作不能为空!");
				return false;
			}

			// 接收上传文件的后台地址
			var FileController = "${pageContext.request.contextPath}/user/admin/addLeader";
			// FormData 对象
			var form = new FormData($( "#addLeader" )[0]);

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

		function updateLeader(element) {
			var userName=$("#userName"+element).val();
			var phone=$("#phone"+element).val();
			var file=$("#file"+element).val();
			var post=$("#post"+element).val();
			var job=$("#job"+element).val();
			if($.trim(userName)==null || $.trim(userName)==''){
				sweetAlert("姓名不能为空!");
				return false;
			}
			if($.trim(phone)==null || $.trim(phone)==''){
				sweetAlert("电话不能为空!");
				return false;
			}
			if($.trim(post)==null || $.trim(post)==''){
				sweetAlert("职务不能为空!");
				return false;
			}
			if($.trim(job)==null || $.trim(job)==''){
				sweetAlert("分管工作不能为空!");
				return false;
			}

			// 接收上传文件的后台地址
			var FileController = "${pageContext.request.contextPath}/user/admin/updateLeader";
			// FormData 对象
			var form = new FormData($( "#updateLeader"+element )[0]);

			// XMLHttpRequest 对象
			var xhr = new XMLHttpRequest();
			xhr.open("post", FileController, true);
			xhr.onload = function () {
				// alert("上传完成!");
			};

			xhr.upload.addEventListener("progress", progressFunction, false);
			xhr.send(form);
		}
	</script>
</html>
