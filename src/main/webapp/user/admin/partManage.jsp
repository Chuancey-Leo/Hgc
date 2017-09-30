<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
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
		</style>
		<title>国资基建处风格设置</title>
	</head>
	<body>
	<jsp:include page="common/topNav.jsp"/>
	<!--上面是导航，下面是主体部分-->
	<div class="main-wrap">
		<!--下面就是左边-->
		<div class="main-left col-sm-12 col-xs-12 col-md-4 col-lg-3">
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/user/admin/test.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-asterisk"></span>风 格 设 置
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/newsManage.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-send"></span>新 闻 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/fileManage.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-file"></span>文 件 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/sourceManage.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-th"></span>资 源 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/partManage.jsp" class="list-group-item active">
					<span class="glyphicon glyphicon-tower"></span>部 门 简 介
				</a>
				<a href="updateUser.html" class="list-group-item">
					<span class="glyphicon glyphicon-user"></span>修 改 信 息
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
						<a href="#strolPicSet" role="tab" id="strolPicSet-tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">办公室</a>
					</li>
					<li role="presentation" class="">
						<a href="#colNumSet" role="tab" id="colNumSet-tab" data-toggle="tab" aria-controls="colNumSet" aria-expanded="false">基建科</a>
					</li>
					<li role="presentation" class="">
						<a href="#friLinkSet" role="tab" id="friLinkSet-tab" data-toggle="tab" aria-controls="friLinkSet" aria-expanded="false">房地产科</a>
					</li>
					<li role="presentation" class="">
						<a href="#friLinkSet" role="tab" id="friLinkSet-tab" data-toggle="tab" aria-controls="friLinkSet" aria-expanded="false">设备科</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<button type="button" class="btn btn-primary btn-sm topbtn" data-toggle="modal" data-target="#myModal1">增加</button>
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="myModalLabel">领导人信息：</h4>
								</div>
								<div class="modal-body">
									<div class="input-group">
										<span class="input-group-addon">头像：</span>
										<input type="file" class="form-control">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">电话：</span>
										<input type="text" class="form-control">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">职务：</span>
										<input type="text" class="form-control">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">分管工作：</span>
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">添加</button>
								</div>
							</div>
						</div>
					</div>

					<div role="tabpanel" class="tab-pane fade" id="botColSet" aria-labelledby="botColSet-tab">
						<!--下面是设置领导人信息-->
						<div class="media">
							<a class="media-left" href="#">
								<img class="media-object" data-src="holder.js/100x100" alt="100*100" style="width: 100px; height: 100px;" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE0LjUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
									 data-holder-rendered="true">
							</a>
							<div class="media-body">
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-hover">
											<tbody id="body-data">
											<tr>
												<td>姓名:</td>
												<td>**********</td>
											</tr>
											<tr>
												<td>电话</td>
												<td>11111111111111</td>
											</tr>
											<tr>
												<td>职务:</td>
												<td>1111111111111111</td>
											</tr>
											<tr>
												<td>分管工作:</td>
												<td>1111111111111111111</td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="media-bottom">
								<button type="button" class="btn btn-primary btn-sm" data-toggle="modal">删除</button>
								<!--下面的两行完成了增加领导人的功能-->
								<!--上面的两行完成了增加领导人的功能呢-->

								<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2">修改</button>
								<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="myModalLabel">领导人信息：</h4>
											</div>
											<div class="modal-body">
												<div class="input-group">
													<span class="input-group-addon">头像：</span>
													<input type="file" class="form-control">
												</div>
												<br />
												<div class="input-group">
													<span class="input-group-addon">电话：</span>
													<input type="text" class="form-control">
												</div>
												<br />
												<div class="input-group">
													<span class="input-group-addon">职务：</span>
													<input type="text" class="form-control">
												</div>
												<br />
												<div class="input-group">
													<span class="input-group-addon">分管工作：</span>
													<input type="text" class="form-control">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary">添加</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<!--上面是设置领导人信息-->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
						<p class="p-text">下面是一些简介信息:</p>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="colNumSet" aria-labelledby="colNumSet-tab">
						<p class="p-text">目前栏序如下：</p>
						<table class="table">
							<thead>
							<tr>
								<th>序列名称</th>
								<th>序列号</th>
								<th>置顶操作</th>
								<th>取消操作</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>
									<button type="button" class="btn btn-default">选择</button>
								</td>
								<td>
									<button type="button" class="btn btn-default">选择</button>
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>
									<button type="button" class="btn btn-default">选择</button>
								</td>
								<td>
									<button type="button" class="btn btn-default">选择</button>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">保存</button>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="friLinkSet" aria-labelledby="friLinkSet-tab">
						<p class="p-text">目前友情链接如下：</p>
						<table class="table">
							<thead>
							<tr>
								<th>友情链接名称</th>
								<th>链接地址</th>
								<th>删除</th>
								<th>更改</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>
									<button type="button" class="btn btn-default">删除</button>
								</td>
								<td>
									<button type="button" class="btn btn-default">更改</button>
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>
									<button type="button" class="btn btn-default">删除</button>
								</td>
								<td>
									<button type="button" class="btn btn-default">更改</button>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">保存</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!--主体结束-->
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>

	<script type="text/javascript">
		$(function() {
			$('#myTab a:first').tab('show')
		})
	</script>
</html>
