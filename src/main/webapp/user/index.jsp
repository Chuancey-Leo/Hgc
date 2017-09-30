<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sweetalert.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/${color}">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/search.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" />
    <style>

    </style>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<!--图片轮播-->
<div class="pic-view">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${pageContext.request.contextPath}/static/scrollPic/${picture1.imgUrl}" style="width: 100%;height: 300px;" alt="">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/static/scrollPic/${picture2.imgUrl}" style="width: 100%;height: 300px;" alt="">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/static/scrollPic/${picture3.imgUrl}" style="width: 100%;height: 300px;" alt="">
            </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
           <!--<i class="fa fa-chevron-left"></i>-->
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <!--<i class="fa fa-chevron-right"></i>-->
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<!--第二屏-->
<div class="container main">
    <div class="row">
    <div class="col-lg-9 col-sm-12 container-left">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-xs-12">
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
            <div class="col-md-6 col-xs-12">
                <section class="worknews">
                    <h3><i class="fa fa-list-alt"></i> 工作动态
                        <a class="text-right view-more" href="${pageContext.request.contextPath}/work">more <i class="fa fa-arrow-circle-right"></i></a>
                    </h3>
                    <ul class="newslist">
                        <c:forEach var="news1" items="${newsList1}">
                            <li><a class="top3" href="${pageContext.request.contextPath}/news/${news1.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${news1.title}" escapeXml="true"/></a>
                                <span><img src="${pageContext.request.contextPath}/static/img/hot1.gif" alt=""> <fmt:formatDate value="${news1.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                        </c:forEach>

                        <c:forEach var="news" items="${newsList}">
                            <li><a href="${pageContext.request.contextPath}/news/${news.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${news.title}" escapeXml="true"/></a>
                                <span><fmt:formatDate value="${news.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                        </c:forEach>
                    </ul>
                </section>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-sm-12 entry">
        <h3><i class="fa fa-paper-plane-o"></i> 快速入口</h3>
        <div class="entry-wrap">
            <div class="entry1 col-lg-12 col-sm-6">
                <a href="http://202.115.177.17/"></a>
            </div>
            <!--<img class="login1" src="img/login1.jpg" alt="高校国资综合管理系统"style="">-->
            <div class="entry2 col-lg-12 col-sm-6">
                <a href="http://202.115.177.16/fangchan/"></a>
            </div>
        </div>
    </div>
    </div>
    <div class="row">

        <div class="col-md-4 col-xs-12">
            <section class="worknews ">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active">
                        <a href="#bid-info" aria-controls="#bid-info" data-toggle="tab" role="tab" aria-expanded="true">招标信息</a>

                    </li>
                    <li>
                        <a href="#service-info" aria-controls="#policy-regulation" data-toggle="tab" role="tab" aria-expanded="true">服务指南</a>
                    </li>
                    <a class="text-right view-more" href="${pageContext.request.contextPath}/service">more <i class="fa fa-arrow-circle-right"></i></a>
                   </ul>
                <div class="tab-content">
                <div class="tab-pane active" id="bid-info" role="tabpanel">
                    <ul class="newslist">
                        <c:forEach var="tender" items="${tenderList}">
                            <li><a class="top3" href="${pageContext.request.contextPath}/news/${tender.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${tender.title}" escapeXml="true"/></a>
                                <span><img src="${pageContext.request.contextPath}/static/img/hot1.gif" alt=""> <fmt:formatDate value="${tender.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                        </c:forEach>

                        <c:forEach var="tender1" items="${tenderList1}">
                            <li><a href="${pageContext.request.contextPath}/news/${tender1.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${tender1.title}" escapeXml="true"/></a>
                                <span><fmt:formatDate value="${tender1.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                        </c:forEach>
                    </ul>
                </div>
                    <div class="tab-pane"id="service-info" role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="service" items="${serviceList}">
                                <li><a class="top3" href="${pageContext.request.contextPath}/news/${service.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${service.title}" escapeXml="true"/></a>
                                    <span><img src="${pageContext.request.contextPath}/static/img/hot1.gif" alt=""> <fmt:formatDate value="${service.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>

                            <c:forEach var="service1" items="${serviceList1}">
                                <li><a href="${pageContext.request.contextPath}/news/${service1.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${service1.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${service1.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                    </div>

            </section>
        </div>

        <div class="col-md-4 col-xs-12">
            <section class="some-file">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active">
                        <a href="#policy-regulation" aria-controls="#policy-regulation" data-toggle="tab" role="tab" aria-expanded="true">政策法规</a>
                    </li>
                    <li><a href="#manage-method"aria-controls="#manage-method" data-toggle="tab" role="tab" aria-expanded="false">学校管理办法</a></li>
                    <li><a href="#housing-info"aria-controls="#housing-info" data-toggle="tab" role="tab" aria-expanded="false">房产信息</a></li>
                    <a class="text-right view-more" href="${pageContext.request.contextPath}/file/policy">more <i class="fa fa-arrow-circle-right"></i></a>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="policy-regulation" role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="file1" items="${fileList1}">
                                <li><a href="${pageContext.request.contextPath}/file/preview/${file1.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${file1.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${file1.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="tab-pane" id="manage-method"role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="file2" items="${fileList2}">
                                <li><a href="${pageContext.request.contextPath}/file/preview/${file2.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${file2.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${file2.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="tab-pane" id="housing-info"role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="file3" items="${fileList3}">
                                <li><a href="${pageContext.request.contextPath}/file/preview/${file3.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${file3.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${file3.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-md-4 col-xs-12">
            <section class="worknews">
                <ul class="nav nav-tabs" role="tablist">

                    <li class="active"><a href="#info-download"aria-controls="#info-download" data-toggle="tab" role="tab" aria-expanded="false">资料下载</a></li>
                    <li><a href="#learning-info"aria-controls="#learning-info" data-toggle="tab" role="tab" aria-expanded="false">学习资料</a></li>
                    <a class="text-right view-more" href="${pageContext.request.contextPath}/source/general">more <i class="fa fa-arrow-circle-right"></i></a>
                </ul>
                <div class="tab-content">

                    <div class="tab-pane  active" id="info-download"role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="source1" items="${sourceList1}">
                                <li><a href="${pageContext.request.contextPath}/source/preview/${source1.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${source1.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${source1.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="tab-pane" id="learning-info"role="tabpanel">
                        <ul class="newslist">
                            <c:forEach var="source2" items="${sourceList2}">
                                <li><a href="${pageContext.request.contextPath}/source/preview/${source2.id}"><i class="fa fa-chevron-right"></i>  <c:out value="${source2.title}" escapeXml="true"/></a>
                                    <span><fmt:formatDate value="${source2.releaseDate }" type="date" pattern="MM-dd"/></span></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
<
