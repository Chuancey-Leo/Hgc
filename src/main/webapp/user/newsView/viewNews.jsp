<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/${color}">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <style>

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <div class="col-md-8 col-xs-12 article-wrap">
        <div class="nowposition">
            <nav class="route">
                <span class="route-item">当前位置&nbsp;</span>
                <a href="${pageContext.request.contextPath}/index" class="route-item">首页</a>&nbsp; > <a></a>

                <%--<c:choose>
                    <c:when test="${news[newsTypeId]==1}">
                        <a href="${pageContext.request.contextPath}/work" class="route-item">工作动态</a>&nbsp;
                    </c:when>
                    <c:when test="${news.newsTypeId}==2">
                        <a href="${pageContext.request.contextPath}/work" class="route-item">服务指南</a>&nbsp;
                    </c:when>
                    <c:when test="${news.newsTypeId}==3">
                        <a href="${pageContext.request.contextPath}/work" class="route-item">招标信息</a>&nbsp;
                    </c:when>
                </c:choose>--%>
                <c:set scope="request" var="newsTypeId" value="${news.newsTypeId}"></c:set>
                <c:choose>
                    <c:when test="${newsTypeId==1}">
                        <a href="${pageContext.request.contextPath}/work" class="route-item">工作动态</a>&nbsp;
                    </c:when>
                    <c:when test="${newsTypeId==2}">
                        <a href="${pageContext.request.contextPath}/service" class="route-item">服务指南</a>&nbsp;
                    </c:when>
                    <c:when test="${newsTypeId==3}">
                        <a href="${pageContext.request.contextPath}/tender" class="route-item">招标信息</a>&nbsp;
                    </c:when>
                </c:choose>
                <span class="view-item"><i class="fa fa-eye"></i>浏览:<span>${news.clickHit}</span></span>
            </nav>
        </div>
        <article>
            <h2><c:out value="${news.title}" escapeXml="true"/></h2>
            <nav class="download-wrap">
                <span href="#" class="route-item">发布时间:</span>
                    <span class="route-item"><fmt:formatDate value="${news.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>



                <span class="view-item"><i class="fa fa-pencil"></i> 编辑:<span><c:out value="${news.author}" escapeXml="true"/></span></span>
            </nav>
            ${news.content}
        </article>
    </div>
    <div class="col-md-4 latest-list" id="latest-list">
        <h3>最近新闻</h3>
        <div class="list-box">
            <ul class="newslist latest-list">
                <c:forEach var="news" items="${recentNews}">
                    <li><a href="${pageContext.request.contextPath}/news/${news.id}"><i class="fa fa-chevron-circle-right"></i> &nbsp;&nbsp;&nbsp;<c:out value="${news.title}" escapeXml="true"/></a>
                    </li>
                </c:forEach>
            </ul>

    </div>
</div>
</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>