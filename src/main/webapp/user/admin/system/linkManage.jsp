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
		<script type="text/javascript">
			function deleteData(element){
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
							$.post("${pageContext.request.contextPath}/user/admin/deleteLink",{id:element},function(result){
								if(result.success){
									swal({
												title:"删除完成",
												text:"此链接信息删除完成！",
												type:"success"},
											function(isConfirm){
												window.location.reload();
											}
									);

									/*$("#dg").datagrid("reload");*/
								}else{
									swal("删除失败!", "此条新闻已被删除","error");
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
							<a href="${pageContext.request.contextPath}/user/admin/picture">图片设置</a>
						</li>
						<li role="presentation" class="">
							<a href="#friLinkSet" role="tab" id="friLinkSet-tab" data-toggle="tab" aria-controls="friLinkSet" aria-expanded="false">友情链接设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/setting">用户信息设置</a>
						</li>
					</ul>
					
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade" id="friLinkSet" aria-labelledby="friLinkSet-tab">

							<table class="table">
								<thead>
								<tr>
									<th>链接名称</th>
									<th>链接地址</th>
								</tr>
								</thead>
								<c:forEach var="link" items="${linkList}">
									<tbody>
									<tr>
										<td><c:out value="${link.linkName}" escapeXml="true"/></td>
										<td><c:out value="${link.link}" escapeXml="true"/></td>
										<td>
											<button type="button" class="btn btn-default" onclick="deleteData(${link.id})">删除</button>
										</td>
									</tr>
									</tbody>
								</c:forEach>
							</table>

							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary btn-lg rightbtn" data-toggle="modal" data-target="#myModal">
								添加
							</button>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										</div>
										<form method="post">
											<div class="modal-body">
												<div class="input-group">
													<span  class="input-group-addon">友情连接名称</span>
													<input id="linkName" type="text" class="form-control">
												</div>
												<br />
												<div class="input-group">
													<span class="input-group-addon">友情连接地址</span>
													<input id="link" type="text" class="form-control">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary" onclick="addLink()">添加</button>
												<button type="button" class="btn btn-primary" onclick="closeModel()">关闭</button>
											</div>
										</form>
									</div>
								</div>
							</div>
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
			$('#myTab li:eq(2) a').tab('show')
		})

		function addLink(){
			var linkName=$("#linkName").val();
			var link=$("#link").val();

			if(linkName==null || linkName==''){
				sweetAlert("请输入链接名称！");
			}else if(link==null || link==''){
				sweetAlert("请输入链接内容！");
			}else if(!checkURL(link)) {
				sweetAlert("链接格式不正确！");
			}else {
				$.post("${pageContext.request.contextPath}/user/admin/saveLink",{'linkName':linkName,'link':link},function(result){
					if(result.success){
						swal({
									title:"添加完成!",
									text:"此链接已添加!",
									type:"success"},
								function(isConfirm){
									window.location.reload();
								}
						);
					}else{
						sweetAlert("新闻发布失败！");
					}
				},"json");
			}
		}
		function checkURL(URL){
			var str=URL;
//下面的代码中应用了转义字符"\"输出一个字符"/"
			var Expression=/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
			var objExp=new RegExp(Expression);
			if(objExp.test(str)==true){
				return true;
			}else{
				return false;
			}
		}

		function closeModel(){
			$('#myModal').modal('hide');
		}

	</script>
	
</html>