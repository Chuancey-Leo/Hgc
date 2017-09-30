<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写博客页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	
	function submitData(){
		var linkName=$("#linkName").val();
		var link=$("#link").val();
		if(linkName==null || linkName==''){
			alert("请输入链接信息！");
		}else if(link==null || link==''){
			alert("请输入链接！");
		}else{
			$.post("${pageContext.request.contextPath}/user/admin/saveLink",{'linkName':linkName,'link':link},function(result){
				if(result.success){
					alert("链接保存成功！");
					resetValue();
				}else{
					alert("链接保存失败！");
				}
			},"json");
		}
	}
</script>
</head>
<body style="margin: 10px">
<div id="p" class="easyui-panel" title="链接编辑" style="padding: 10px">
 	<table cellspacing="20px">
   		<tr>
   			<td width="80px">链接信息：</td>
   			<td><input type="text" id="linkName" name="linkName" style="width: 400px;"/></td>
   		</tr>
		<tr>
			<td width="80px">链接：</td>
			<td><input type="text" id="link" name="link" style="width: 400px;"/></td>
		</tr>
   		<tr>
   			<td></td>
   			<td>
   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">保存</a>
   			</td>
   		</tr>
   	</table>
</div>
</body>
</html>