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
		</style>
		<title>国资基建处风格设置</title>
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
						<a href="${pageContext.request.contextPath}/user/admin/leader">现任领导及分管工作</a>
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
						<a  href="#friLinkSet" role="tab" id="friLinkSet-tab" data-toggle="tab" aria-controls="friLinkSet" aria-expanded="false">房地产科</a>
					</li>
					<li role="presentation" class="">
						<a href="${pageContext.request.contextPath}/user/admin/equipment">设备科</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<button type="button" class="btn btn-primary btn-sm topbtn" data-toggle="modal"
							data-target="#myModal1" onclick="window.location.href='${pageContext.request.contextPath}/user/admin/updateLand'">修改</button>
					<div role="tabpanel" class="tab-pane fade" id="friLinkSet" aria-labelledby="friLinkSet-tab">
						${land.content}
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
	<script type="text/javascript">
		$(function() {
			$('#myTab li:eq(4) a').tab('show')
		})

	</script>
</html>
