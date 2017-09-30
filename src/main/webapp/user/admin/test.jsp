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
				<a href="${pageContext.request.contextPath}/user/admin/test" class="list-group-item">
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
					<li role="presentation">
						<a href="#botColSet" role="tab" id="botColSet-tab" data-toggle="tab" aria-controls="botColSet" aria-expanded="false">底色设置</a>
					</li>
					<li role="presentation" class="">
						<a href="#strolPicSet" role="tab" id="strolPicSet-tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">图片设置</a>
					</li>
					<li role="presentation" class="">
						<a href="#colNumSet" role="tab" id="colNumSet-tab" data-toggle="tab" aria-controls="colNumSet" aria-expanded="false">栏序设置</a>
					</li>
					<li role="presentation" class="">
						<a href="#friLinkSet" role="tab" id="friLinkSet-tab" data-toggle="tab" aria-controls="friLinkSet" aria-expanded="false">友情链接设置</a>
					</li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade" id="botColSet" aria-labelledby="botColSet-tab">
						<!--下面是设置主题颜色的按钮-->
						<div class="btn-group btn-group-justified" id="btnColGroup">
							<div class="btn-group">
								<button type="button" class="btn btn-default buttonChange" id="red" onclick="set(this)">红色</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default buttonChange" id="black" onclick="set(this)">黑色</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default buttonChange" id="pure" onclick="set(this)">原色</button>
							</div>
						</div>

						<!--上面是设置主题颜色的按钮-->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
						<p class="p-text">这些是现有的图片:</p>
						<!--下面是图片预览的功能-->
						<div class="row">
							<div class="content">
								<div class="perwrap col-xs-12 col-sm-4 col-md-4">
									<div class="imgwrap" id="imgwrap1">
										<div class="delete" onclick="fun1()">
											<span class="glyphicon glyphicon-remove" style="position: relative;float: right;top: 16px;"></span>
										</div>
										<img src="${pageContext.request.contextPath}/static/img/img1.jpg"/>
									</div>
									<div class="imgwrap" id="imgwrap11" style="margin-top: 20px;">
										<img onclick="fun11()" src="${pageContext.request.contextPath}/static/img/picpuls.png"/>
									</div>
								</div>
								<div class="perwrap col-xs-12 col-sm-4 col-md-4">
									<div class="imgwrap" id="imgwrap2">
										<div class="delete" onclick="fun2()">
											<span class="glyphicon glyphicon-remove" style="position: relative;float: right;top: 16px;"></span>
										</div>
										<img src="${pageContext.request.contextPath}/static/img/img1.jpg"/>
									</div>
									<div class="imgwrap" id="imgwrap22" style="margin-top: 20px;">
										<img onclick="fun11()" src="${pageContext.request.contextPath}/static/img/picpuls.png" />
									</div>
								</div>
								<div class="perwrap col-xs-12 col-sm-4 col-md-4">
									<div class="imgwrap" id="imgwrap3">
										<div class="delete" onclick="fun3()">
											<span class="glyphicon glyphicon-remove" style="position: relative;float: right;top: 16px;"></span>
										</div>
										<img src="${pageContext.request.contextPath}/static/img/img1.jpg"/>
									</div>
									<div class="imgwrap" id="imgwrap33" style="margin-top: 20px;">
										<img onclick="fun11()" src="${pageContext.request.contextPath}/static/img/picpuls.png" />
									</div>
								</div>
							</div>
						</div>
						<!--
                            描述：下面是一个增加的input
                       -->
						<input style="display: none;" id="repage" type="file" />


						<!--上面是图片预览的功能-->
						<!--下面是修改保存按钮-->
						<div class="btn-group fright" style="margin: 9px 0 5px;">
							<button type="button" class="btn btn-default">保存</button>
						</div>
						<!--上面是修改保存按钮-->
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
							<button type="button" class="btn btn-default savebtn">保存</button>
						</div>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg rightbtn" data-toggle="modal" data-target="#myModal">
							选择
						</button>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										<h4 class="modal-title" id="myModalLabel">添加友情链接</h4>
									</div>
									<div class="modal-body">
										<div class="input-group">
											<span class="input-group-addon">友情连接名称</span>
											<input type="text" class="form-control">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">友情连接地址</span>
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
			</div>
		</div>
	</div>
	<!--主体结束-->
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js" ></script>
	<script type="text/javascript">
		$(function() {
			$('#myTab a:first').tab('show')
		})
	</script>
</html>
