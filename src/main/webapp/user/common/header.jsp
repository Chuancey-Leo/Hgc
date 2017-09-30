<%--
  User: liao
  Date: 16-12-4
  Time: 下午1:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="shadow">
        <div class="logo">
            <!--<img class="empty" src="" alt="">-->
            <span style="overflow: hidden;">
                <a href="http://www.sicau.edu.cn/"><img class="sicaulogo" src="${pageContext.request.contextPath}/static/img/sicaulogo.png" alt="sicau_logo"></a>
                <a href="http://hgc.sicau.edu.cn"><img class = "logotext" src="${pageContext.request.contextPath}/static/img/logo.png" alt="logo"></a>
            </span>
            <span class="phone-wrap">
                
                <form action="${pageContext.request.contextPath}/search" method="get" class="form-inline" id="search-form">
                    <div class="search">
                        <input maxlength="100" type="text" name="content" class="input-text form-control" id="search-input" placeholder="搜索本站..." required="required">
                       <button id="search-btn" class=" search-button"   type="submit"  value=""><i class="fa fa-search search-button"></i></button>
                    </div>
                </form>
            </span>
        </div>
        <nav class="navbar" role = "navigation">
            <div class = navbar-header>
                <div class="sm-search">
                    <form action="${pageContext.request.contextPath}/search" method="get" class="form-inline">
                        <div class="sm-search">
                            <input type="text" required="required" name="content" class="input-text form-control sm-search-input" placeholder="搜索本站内容...">
                            <button id="" class=" search-button"   type="submit"  value=""><i class="fa fa-search search-button"></i></button>
                        </div>
                    </form>
                </div>
                <button type="button"id="navbar-collapse" class="navbar-toggle" data-toggle="collapse"
                        data-target="#nav-container">
                    <span class="sr-only">切换导航</span>
                    <!--<span style="color: #fff; ">导航菜单</span>-->
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="container collapse navbar-collapse" id = "nav-container">
                    <div class="row">
                        <!--<div class="" >-->
                        <ul class="nav navbar-nav nav-ul top-nav">
                            <li class="navitem"><a href="${pageContext.request.contextPath}/index">首页</a></li>
                            <li class="navitem dropdown"><a class="dropdown-toggle" data-toggle = "dropdown">部门简介</a>
                                <ul class="dropdown-menu main-nav-dropdwon">
                                    <li><a href="${pageContext.request.contextPath}/part/introduce">介绍</a></li>
                                    <li><a href="${pageContext.request.contextPath}/part/leader">现任领导</a></li>
                                    <li><a href="${pageContext.request.contextPath}/part/office">办公室</a></li>
                                    <li><a href="${pageContext.request.contextPath}/part/base">基建科</a></li>
                                    <li><a href="${pageContext.request.contextPath}/part/equipment">设备科</a></li>
                                    <li><a href="${pageContext.request.contextPath}/part/land">房地产科</a></li>

                                </ul>
                            </li>

                            <li class="navitem"><a href="${pageContext.request.contextPath}/work">工作动态</a></li>
                            <li class="navitem"><a href="${pageContext.request.contextPath}/service">服务指南</a></li>
                            <li class="navitem"><a href="${pageContext.request.contextPath}/tender">招标信息</a></li>
                            <li class="navitem dropdown"><a class="dropdown-toggle" data-toggle = "dropdown">相关文件</a>
                                <ul class="dropdown-menu main-nav-dropdwon">
                                    <li><a href="${pageContext.request.contextPath}/file/policy">政策法规</a></li>
                                    <li><a href="${pageContext.request.contextPath}/file/manage">学校管理办法</a></li>
                                    <li><a href="${pageContext.request.contextPath}/file/house">房产信息</a></li>
                                </ul>
                            </li>
                            <li class="navitem"><a href="${pageContext.request.contextPath}/source/general">资料下载</a></li>
                            <li class="navitem"><a href="${pageContext.request.contextPath}/source/learn">学习资料</a></li>
							
                        </ul>
						${adminConsole}
                    </div>
                    <!--</div>-->
                </div>
            </div>
        </nav>
    </div>
</header>
<script type="text/javascript">

</script>
