<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <!--<link rel="stylesheet" href="css/red.css">-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/${color}">
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
                <a href="#" class="route-item">首页</a>&nbsp; > <a></a>
                <a href="${pageContext.request.contextPath}/file/policy" class="route-item">资料</a>&nbsp; >
                <span class="route-item">预览</span>

                <span class="view-item"><i class="fa fa-eye"></i>浏览 : <span><c:out value="${file.clickHit}" escapeXml="true"/></span></span>
            </nav>

        </div>
        <article>
            <h3 class="filename"><c:out value="${file.title}" escapeXml="true"/></h3>
            <nav class="download-wrap">
                <span href="#" class="route-item">发布时间:</span>
                <span class="route-item"><fmt:formatDate value="${file.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
                <span class="route-item"> &nbsp;&nbsp;文件大小:</span>
                <span href="#" class="route-item"><c:out value="${file.fileSize}" escapeXml="true"/></span>&nbsp;


            </nav>
            ${file.content}
            <iframe src="${pageContext.request.contextPath}/static/ViewerJS/#../filesPDF/${file.fileName}" height="700" style="width: 100%"
                    allowfullscreen webkitallowfullscreen></iframe>

        </article>
    </div>
    <div class="col-md-4 latest-list" id="latest-list">
        <h3>最近新闻</h3>
        <div class="list-box">
            <ul class="newslist latest-list">
                <c:forEach var="news" items="${recentNews}">
                    <li><a href="${pageContext.request.contextPath}/news/${news.id}"><i class="fa fa-chevron-circle-right"></i> &nbsp;&nbsp;&nbsp; <c:out value="${news.title}" escapeXml="true"/></a>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>