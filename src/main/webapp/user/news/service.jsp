<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/${color}">
    <style>

    </style>
</head>
<body class="list-body">
<jsp:include page="../common/header.jsp"/>
<div class="container page-wrap">
    <div class="col-md-8 col-xs-12">
        <div class="list-wrap">
            <h3><i class="fa fa-list-alt"></i> 服务指南</h3>
            <div class="list-box">
                <ul class="newslist">
                    <c:forEach var="service" items="${serviceList}">
                        <li><a href="${pageContext.request.contextPath}/news/${service.id}"><i class="fa fa-chevron-circle-right"></i> &nbsp;&nbsp;&nbsp; <c:out value="${service.title}" escapeXml="true"/></a>
                            <span><i class="fa fa-calendar"></i> <fmt:formatDate value="${service.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                    </c:forEach>
                </ul>
                <nav>
                    <ul class="pagination">
                        ${pageCode }
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <div class="col-md-4 newslist-pic">
        <h3><i class="fa fa-eye"></i> 最近新闻
        </h3>
        <div id="smCarousel"class="carousel slide" data-ride="carousel">

            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#smCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#smCarousel" data-slide-to="1"></li>
                <li data-target="#smCarousel" data-slide-to="2"></li>
                <li data-target="#smCarousel" data-slide-to="3"></li>
                <li data-target="#smCarousel" data-slide-to="4"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="${p1.imgUrl}" style="width: 100%;" alt="First slide">
                </div>
                <div class="item">
                    <img src="${p2.imgUrl}" style="width: 100%;" alt="Second slide">
                </div>
                <div class="item">
                    <img src="${p3.imgUrl}" style="width: 100%;" alt="Third slide">
                </div>
                <div class="item">
                    <img src="${p4.imgUrl}" style="width: 100%;" alt="Fourth slide">
                </div>
                <div class="item">
                    <img src="${p5.imgUrl}" style="width: 100%;" alt="Fifth slide">
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#smCarousel"
               data-slide="prev"></a>
            <a class="carousel-control right" href="#smCarousel"
               data-slide="next"></a>
        </div>

    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>