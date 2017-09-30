<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件管理页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
/*
	function formatBlogType(val,row){
		return val.typeName;
	}*/
	
	function formatTitle(val,row){
		return "<a target='_blank' href='${pageContext.request.contextPath}/file/preview/"+row.id+"'>"+val+"</a>"
	}
	
	function searchBlog(){
		$("#dg").datagrid('load',{
			"title":$("#s_title").val()
		});
	}
	
	function deleteFile(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].id);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${pageContext.request.contextPath}/user/admin/deleteFile",{ids:ids},function(result){
						if(result.success){
							 $.messager.alert("系统提示","数据已成功删除！");
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}
	
	function previewFile() {
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要置顶的新闻！");
			return;
		}

		var row=selectedRows[0];
		$.post("${pageContext.request.contextPath}/user/admin/previewFile",{id:row.id});
	}

	function toTopNews(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要置顶的新闻！");
			return;
		}
		var row=selectedRows[0];
		$.messager.confirm("系统提示","您确定要置顶这条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/user/admin/toTopNews",{id:row.id},function(result){
					if(result.success){
						$.messager.alert("系统提示","成功置顶！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","置顶失败！");
					}
				},"json");
			}
		});
	}

	function openFileModifyTab(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要修改的数据！");
			return;
	}
	var row=selectedRows[0];
	window.parent.openTab('文件信息修改','modifyFile.jsp?id='+row.id,'icon-writeblog');
}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="文件管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/user/admin/listFile" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="id" width="20" align="center">编号</th>
   		<th field="title" width="200" align="center" formatter="formatTitle">标题</th>
   		<th field="releaseDate" width="50" align="center">发布日期</th>
   	</tr>
   </thead>
</table>
<div id="tb">
 	<div>
 		<a href="javascript:openFileModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteFile()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
</div>
</body>
</html>