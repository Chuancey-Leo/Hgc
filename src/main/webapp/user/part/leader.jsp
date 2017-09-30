<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li class="active"><a href="">现任领导</a></li>
                <li><a href="${pageContext.request.contextPath}/part/office">办公室</a></li>
                <li><a href="${pageContext.request.contextPath}/part/base">基建科</a></li>
                <li><a href="${pageContext.request.contextPath}/part/equipment">设备科</a></li>
                <li><a href="${pageContext.request.contextPath}/part/land">房地产科</a></li>
            </ul>
        </div>
        <div class="col-md-9 col-xs-12">
            <div class="leader-wrap">
            <h2>现任领导
                <nav class="leader-route">
                    <span class="route-item">当前位置&nbsp;</span>
                    <a href="${pageContext.request.contextPath}/index" class="route-item">首页</a>&nbsp; > <a></a>
                        <a href="${pageContext.request.contextPath}/part/leader" class="route-item">现任领导</a>

                </nav>
            </h2>
            <div class="leader-info">
                <ul>
                    <li class="col-md-12 col-xs-12">
                        <p><c:out value="${leader1.post}" escapeXml="true"/></p>
                        <p><img class="first-leader" src="${pageContext.request.contextPath}/static/leaderImg/${leader1.avatar}" alt="处长"></p>
                        <p class="leader-name">
                            <c:out value="${leader1.userName}" escapeXml="true"/>
                        </p>
                        <p>电话:<c:out value="${leader1.phone}" escapeXml="true"/></p>
                        <p><c:out value="${leader1.job}" escapeXml="true"/></p>

                    </li>
                   <c:forEach var="leader" items="${leaderList}">
                       <li class="col-md-6 col-xs-12">
                           <p>${leader.post}</p>
                           <p><img src="${pageContext.request.contextPath}/static/leaderImg/${leader.avatar}" alt="处长"></p>
                           <p class="leader-name">
                                   <c:out value="${leader.userName}" escapeXml="true"/>
                           </p>
                           <p>电话:<c:out value="${leader.phone}" escapeXml="true"/></p>
                           <p><c:out value="${leader.job}" escapeXml="true"/></p>
                       </li>
                   </c:forEach>

                </ul>
            </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>