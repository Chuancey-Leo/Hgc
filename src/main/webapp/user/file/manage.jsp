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
    <!--<link rel="stylesheet" href="css/brown.css">-->
    <!--<link rel="stylesheet" href="css/black.css">-->
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
            <h3>相关文件</h3>

            <ul class="nav nav-pills nav-stacked"role="tablist">
                <li><a href="${pageContext.request.contextPath}/file/policy">政策法规</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/file/manage">学校管理办法</a></li>
                <li><a href="${pageContext.request.contextPath}/file/house">房产信息</a></li>
            </ul>
        </div>
        <div class="col-md-9 col-xs-12">
            <div class="list-wrap files-list-wrap">
                <h3><i class="fa fa-list-alt"></i> 学校管理办法
                    
                </h3>
                <div class="list-box">
                    <ul class="newslist">
                        <c:forEach var="manage" items="${manageList}">
                            <li><a href="${pageContext.request.contextPath}/file/preview/${manage.id}"><i class="fa fa-chevron-circle-right"></i> &nbsp;&nbsp;&nbsp; <c:out value="${manage.title}" escapeXml="true"/></a>
                                <span><i class="fa fa-calendar"></i> <fmt:formatDate value="${manage.releaseDate }" type="date" pattern="MM-dd"/></span></li>
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
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>