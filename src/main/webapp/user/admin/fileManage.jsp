<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
		<style type="text/css">
			.nav-tabs>li {
				float: left;
				margin-bottom: -2px;}
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
				<a href="${pageContext.request.contextPath}/user/admin/fileManage.jsp" class="list-group-item active">
					<span class="glyphicon glyphicon-file"></span>文 件 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/sourceManage.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-th"></span>资 源 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/partManage.jsp" class="list-group-item">
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
						<a href="#botColSet" role="tab" id="botColSet-tab" data-toggle="tab" aria-controls="botColSet" aria-expanded="false">政策法规</a>
					</li>
					<li role="presentation" class="">
						<a href="#strolPicSet" role="tab" id="strolPicSet-tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">学校管理办法</a>
					</li>
					<li role="presentation" class="">
						<a href="#colNumSet" role="tab" id="colNumSet-tab" data-toggle="tab" aria-controls="colNumSet" aria-expanded="false">房产信息</a>
					</li>
					<li role="presentation" class="">
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control"  style="margin-bottom: -7px !important;"  placeholder="Search">
							</div>
						</form>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade" id="botColSet" aria-labelledby="botColSet-tab">
						<!--下面是设置工作动态-->
						<table class="table">
							<thead>
							<tr>
								<th>文件名</th>
								<th>发布时间</th>
								<th>更改</th>
								<th>删除</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>1</td>
								<td>2016/10/10</td>
								<td>
									<button type="button" class="btn btn-default">
										<a href="updateFile.html" style="text-decoration: none;color: black;">更改</a>
									</button>
								</td>
								<td><button type="button" class="btn btn-default">删除</button></td>
							</tr>
							<tr>
								<td>1</td>
								<td>2016/10/10</td>
								<td>
									<button type="button" class="btn btn-default">
										<a href="updateFile.html" style="text-decoration: none;color: black;">更改</a>
									</button>
								</td>
								<td><button type="button" class="btn btn-default">删除</button></td>
							</tr>
							</tbody>
						</table>
						<!--分页开始-->
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#">«</a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">»</a></li>
							</ul>
						</nav>
						<!--分页结束-->
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">保存</button>
						</div>
						<!--上面是设置工作动态-->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
						<p class="p-text">这些是服务指南:</p>
						<!--下面是保存按钮-->
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">保存</button>
						</div>
						<!--上面是保存按钮-->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="colNumSet" aria-labelledby="colNumSet-tab">
						<p class="p-text">目前招标信息如下：</p>
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">上传</button>
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
