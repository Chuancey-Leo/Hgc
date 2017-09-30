<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
		<title>国资基建处风格设置</title>
	</head>
	<body>
	<jsp:include page="common/topNav.jsp"/>
	<!--上面是导航，下面是主体部分-->
	<div class="main-wrap">
		<!--下面就是左边-->
		<div class="main-left col-sm-12 col-xs-12 col-md-4 col-lg-3">
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/user/admin/work" class="list-group-item active">
					<span class="glyphicon glyphicon-send"></span>新 闻 管 理
				</a>
				<a href="${pageContext.request.contextPath}/user/admin/test.jsp" class="list-group-item">
					<span class="glyphicon glyphicon-asterisk"></span>风 格 设 置
				</a>

				<a href="${pageContext.request.contextPath}/user/admin/fileManage.jsp" class="list-group-item">
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
						<a href="#botColSet" id="botColSet-tab" role="tab" data-toggle="tab" aria-controls="botColSet" aria-expanded="false">工作动态</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/service">服务指南</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/tender">招标信息</a>
					</li>
					<li role="presentation" class="">
						<form class="navbar-form navbar-left" style="margin-bottom: -7px;" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
						</form>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<%--<button type="button" class="btn btn-primary btn-sm topbtn" data-toggle="modal" data-target="#myModal1">增加</button>--%>
					<%--<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="myModalLabel">增加新闻信息：</h4>
								</div>
								<div class="modal-body">
									<div class="input-group">
										<span class="input-group-addon">作者：</span>
										<input type="text" class="form-control">
									</div>

								</div>
								<div class="modal-body">
									<div class="input-group">
										<span class="input-group-addon">标题：</span>
										<input type="text" class="form-control">
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">添加</button>
								</div>
							</div>
						</div>
					</div>--%>

						<div role="tabpanel" class="tab-pane fade" id="botColSet" aria-labelledby="botColSet-tab">
							<!--下面是设置工作动态-->
							<table class="table" fitColumns="true" pagination="true" rownumbers="true"
								   url="${pageContext.request.contextPath}/user/admin/work" fit="true">
								<thead>
								<tr>
									<th field="id">编号</th>
									<th field="title">标题</th>
									<th field="author">作者</th>
									<th field="releaseDate">发表时间</th>
									<%--<th>删除</th>
                                    <th>更改</th>
                                    <th>置顶</th>
                                    <th>预览</th>--%>
								</tr>
								</thead>
								<tbody>

								<c:forEach var="work" items="${workList}">
									<tr>
										<td>${work.id}</td>
										<td>${work.title}</td>
										<td>${work.author}</td>
										<td><fmt:formatDate value="${work.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
										<td><button type="button" class="btn btn-default">删除</button></td>
										<td><button type="button" class="btn btn-default">更改</button></td>
										<td><button type="button" class="btn btn-default">置顶</button></td>
										<td><button type="button" class="btn btn-default">预览</button></td>
											<%--<td><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-play"></span></button></td>--%>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!--分页开始-->
							<nav>
								<ul class="pagination">
									${pageCode }
								</ul>
							</nav>
							<!--分页结束-->
							<!--上面是设置工作动态-->
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
