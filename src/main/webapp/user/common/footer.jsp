<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: liao
  Date: 16-12-4
  Time: 下午1:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="scroll" onclick="IntervalBackTop()">
    <a id="toTop">
        <i class="fa fa-chevron-up"></i>
    </a>

</div>

<footer class="">
    <div id="outerLinks">
        <ul>
            <c:forEach var="link" items="${linkList}">
                <li><a href="${link.link}"><c:out value="${link.linkName}" escapeXml="true"/></a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="copyright col-lg-12">
        <p>Copyright © 2016 四川农业大学. <a href="http://www.wingstudio.org">WingStudio工作室</a>.  All Rights Reserved.</p>
    </div>
</footer>
<script type="text/javascript" src = "${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/static/js/main.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sweetalert-dev.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.searchMeme.js"/>
