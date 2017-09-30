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
		<title>国资基建处新闻设置</title>
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
                            $.post("${pageContext.request.contextPath}/user/admin/deleteFile",{id:element},function(result){
                                if(result.success){
                                    swal({
                                                title:"删除完成",
                                                text:"此条文件已被删除",
                                                type:"success"},
                                            function(isConfirm){
                                                window.location.reload();
                                            }
                                    );

                                    /*$("#dg").datagrid("reload");*/
                                }else{
                                    swal("删除失败!", "此条新闻未被删除","error");
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
					<a href="${pageContext.request.contextPath}/user/admin/policy" class="list-group-item active">
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
				<!--下面是一个标签页-->
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/policy">政策法规</a>
						</li>
						<li role="presentation" class="">
							<a href="#strolPicSet" id="strolPicSet-tab" role="tab" data-toggle="tab" aria-controls="strolPicSet" aria-expanded="false">学校管理办法</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/house">房产信息</a>
						</li>
						<li role="presentation" class="search-li">
							<form action="${pageContext.request.contextPath}/user/admin/searchFile" method="get" class="navbar-form navbar-left" style="margin-bottom: -7px;" role="search">
								<div class="form-group">
									<input maxlength="100" style="margin-top: -6px" type="text" required="required" name="content" class="manage-search form-control" placeholder="输入要搜索的内容..">
									<input style="margin-top: -6px" class="btn btn-primary" type="submit" value="搜索">
								</div>
							</form>
						</li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<h4>总数：${sum}</h4>
					<div role="tabpanel" class="tab-pane fade" id="strolPicSet" aria-labelledby="strolPicSet-tab">
						<!--下面是设置服务动态-->

						<table class="table" fitColumns="true" pagination="true" rownumbers="true" fit="true">
							<thead>
							<tr>
								<th field="title">标题</th>

								<th field="releaseDate">发表时间</th>
								<%--<th>删除</th>
                                <th>更改</th>
                                <th>置顶</th>
                                <th>预览</th>--%>
							</tr>
							</thead>

							<tbody>
							<c:forEach var="manage" items="${manageList}">
								<tr>
									<td><c:out value="${manage.title}" escapeXml="true"/></td>
									<td><fmt:formatDate value="${manage.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><button type="button" class="btn btn-default" onclick="deleteData(${manage.id})">删除</button></td>
									<td><button type="button" class="btn btn-default"
												onclick="window.location.href='${pageContext.request.contextPath}/user/admin/updateFile/${manage.id}'">更改</button></td>
									<td><button type="button" class="btn btn-default"
												onclick="window.location.href='${pageContext.request.contextPath}/file/preview/${manage.id}'">预览</button></td>
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
		<jsp:include page="../common/footer.jsp"/>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
		<script>
		$(function() {
			$('#myTab li:eq(1) a').tab('show')
		})
	</script>
</html>
