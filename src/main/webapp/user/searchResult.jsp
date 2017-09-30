<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--<link rel="stylesheet" href="css/black.css">-->
    <!--<link rel="stylesheet" href="css/test.css">-->
</head>

<body>
<jsp:include page="common/header.jsp"/>
<div class="search-container">
    <div class="row">

            <h2 class="search-result-head">为您找到以下结果：</h2>
            <hr />
            <div class="search-box">
                <c:forEach var="news" items="${newsList}">
                    <div class="result">
                        <h4 class="title">${news.title}</h4>
                        <p class="brief-info"><span class="abstract">【摘要】</span>&nbsp;   ${news.contentNoTag}...
                            <a href="${pageContext.request.contextPath}/news/${news.id}">【阅读全文】</a></p>
                        <p class="description">
                            <span>Publish © ${news.releaseDateStr}</span>
                        </p>
                    </div>
                </c:forEach>

                <c:forEach var="file" items="${fileList}">
                    <div class="result">
                        <h4 class="title">${file.title}</h4>
                        <p class="brief-info"><span class="abstract">【摘要】</span>&nbsp;   ${file.contentNoTag}...
                            <a href="${pageContext.request.contextPath}/file/preview/${file.id}">【阅读全文】</a></p>
                        <p class="description">
                            <span>Publish © ${file.releaseDateStr}</span>
                        </p>
                    </div>
                </c:forEach>

                <c:forEach var="source" items="${sourceList}">
                    <div class="result">
                        <h4 class="title">${source.title}</h4>
                        <p class="brief-info"><span class="abstract">【摘要】</span>&nbsp;   ${source.contentNoTag}...
                            <a href="${pageContext.request.contextPath}/source/preview/${source.id}">【阅读全文】</a></p>
                        <p class="description">
                            <span>Publish © ${source.releaseDateStr}</span>
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--<div class="right-wrap">-->

        <!--</div>-->
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>