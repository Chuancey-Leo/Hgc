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
							<a href="#botColSet" role="tab" id="botColSet-tab" data-toggle="tab" aria-controls="botColSet" aria-expanded="false">底色设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/picture">图片设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/link">友情链接设置</a>
						</li>
						<li role="presentation" class="">
							<a href="${pageContext.request.contextPath}/user/admin/setting">用户信息设置</a>
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
								<input type="hidden" id="color" value="${color}">
							</div>
							
							<!--上面是设置主题颜色的按钮-->
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
	<script type="text/javascript">
		$(function() {
			$('#myTab li:eq(0) a').tab('show');
			var colorTest=$("#color").val();
			var buttonArr = document.getElementsByClassName('buttonChange');
			if(colorTest=="red.css"){
				buttonArr[0].style.backgroundColor = "red";
				buttonArr[1].style.backgroundColor = "white";
				buttonArr[2].style.backgroundColor = "white";
			}else if(colorTest=="black.css"){
				buttonArr[0].style.backgroundColor = "white";
				buttonArr[1].style.backgroundColor = "black";
				buttonArr[2].style.backgroundColor = "white";
			}else if(colorTest=="brown.css"){
				buttonArr[0].style.backgroundColor = "white";
				buttonArr[1].style.backgroundColor = "white";
				buttonArr[2].style.backgroundColor = "palegoldenrod";
			}

		});

		function set(e){
			var buttonArr = document.getElementsByClassName('buttonChange');
			if(e.innerText == "红色"){
				buttonArr[0].style.backgroundColor = "red";
				buttonArr[1].style.backgroundColor = "white";
				buttonArr[2].style.backgroundColor = "white";

				swal({title: "确定设置成红色吗?",
							text: "",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							cancelButtonText:"取消",
							confirmButtonText: "确定",
							closeOnConfirm: false },
						function(){
							$.post("${pageContext.request.contextPath}/user/admin/setColor",{id:1},function(result){
								if(result.success){
									swal({
											title:"设置完成！",
											text:"",
											type:"success"},
											function(isConfirm){
												window.location.reload();
											}
									);

									/*$("#dg").datagrid("reload");*/
								}else{
									swal("设置失败!", "请检查网络是否连接或刷新本页面！","error");
								}
							},"json");
						});
			}
			if(e.innerText == "黑色"){
				buttonArr[0].style.backgroundColor = "white";
				buttonArr[1].style.backgroundColor = "black";
				buttonArr[2].style.backgroundColor = "white";
				swal({title: "确定设置成黑色吗?",
							text: "",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							cancelButtonText:"取消",
							confirmButtonText: "确定",
							closeOnConfirm: false },
						function(){
							$.post("${pageContext.request.contextPath}/user/admin/setColor",{id:2},function(result){
								if(result.success){
									swal({
											title:"设置完成！",
											text:"",
											type:"success"},
											function(isConfirm){
												window.location.reload();
											}
									);

									/*$("#dg").datagrid("reload");*/
								}else{
									swal("设置失败!", "请检查网络是否连接或刷新本页面！","error");
								}
							},"json");
						});
			}
			if(e.innerText == "原色"){
				buttonArr[0].style.backgroundColor = "white";
				buttonArr[1].style.backgroundColor = "white";
				buttonArr[2].style.backgroundColor = "palegoldenrod";

				swal({title: "确定设置成原色吗?",
							text: "",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							cancelButtonText:"取消",
							confirmButtonText: "确定",
							closeOnConfirm: false },
						function(){
							$.post("${pageContext.request.contextPath}/user/admin/setColor",{id:3},function(result){
								if(result.success){
									swal({
											title:"设置完成！",
											text:"",
											type:"success"},
											function(isConfirm){
												window.location.reload();
											}
									);

									/*$("#dg").datagrid("reload");*/
								}else{
									swal("设置失败!", "请检查网络是否连接或刷新本页面！","error");
								}
							},"json");
						});
			}
		}
	</script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
	
</html>