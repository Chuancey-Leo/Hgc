<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>四川农业大学国资基建处</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main2.css">
    <!--<link rel="stylesheet" href="css/brown.css">-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/${color}">
    <style>

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-3 depart-left-nav">
            <h3>部门简介</h3>

            <ul class="nav nav-pills nav-stacked"role="tablist">
                <li><a href="${pageContext.request.contextPath}/part/introduce">介绍</a></li>
                <li><a href="${pageContext.request.contextPath}/part/leader">现任领导</a></li>
                <li><a href="${pageContext.request.contextPath}/part/office">办公室</a></li>
                <li><a href="${pageContext.request.contextPath}/part/base">基建科</a></li>
                <li><a href="${pageContext.request.contextPath}/part/equipment">设备科</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/part/land">房地产科</a></li>
            </ul>
        </div>
        <div class="col-md-9 col-xs-12">
            <article class="department-info">
                <h2><span>房地产科</span>
                    <nav class="leader-route">
                        <span class="route-item">当前位置&nbsp;</span>
                        <a href="${pageContext.request.contextPath}/index" class="route-item">首页</a>&nbsp; > <a></a>
                        <a href="${pageContext.request.contextPath}/part/land" class="route-item">房地产科</a>&nbsp;
                    </nav>
                </h2>
                <p class="depart-text">
                    ${part.content}
                </p>
            </article>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>