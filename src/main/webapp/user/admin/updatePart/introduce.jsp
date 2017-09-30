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
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
	<title>国资基建处新闻设置</title>

	<script type="text/javascript">
		function submitData(){
			var content=UE.getEditor('editor').getContent();
			/*var keyWord=$("#keyWord").val();*/

			if(content==null || content==''){
				sweetAlert("请输入内容！");
			}else{
				$.post("${pageContext.request.contextPath}/user/admin/saveIntro",{'id':5,'content':content},function(result){
					if(result.success){
						sweetAlert("修改成功！");
						/*resetValue();*/
					}else{
						sweetAlert("修改失败！");
					}
				},"json");
			}
		}
	</script>
</head>
<body>
<jsp:include page="../common/topNav.jsp"/>
<!--上面是导航，下面是主体部分-->
<div class="main-wrap">
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
		<h3 style="">修改</h3>
		<button type="button" class="btn btn-default" style="position: relative;margin-left: 91%;margin-bottom: 12px"
				onclick="javascript:window.location.href='${pageContext.request.contextPath}/user/admin/introduce'">返回</button>
		<div>
			<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
		</div><br>
		<div class="btn-group fright" style="margin-right: 819px">
			<button type="button" class="btn btn-default" onclick="submitData()">发布</button>
		</div>

	</div>
</div>
<!--主体结束-->
<jsp:include page="../common/footer.jsp"/>
</body>
<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor',{
		autoHeightEnabled: true,
		autoFloatEnabled: true
	});
	ue.addListener("ready",function(){
		UE.getEditor('editor').setContent('${introduce.content}');
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/updateUser.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
</html>