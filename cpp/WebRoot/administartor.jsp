<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

﻿<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>C++admin</title>
		<meta name="keywords" content="c++ c++team" />
		<meta name="description" content="C++team" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>c++ 后台管理</h1><br><br>
            <form action="${pageContext.request.contextPath}/admin_checklogin.action" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit"> 登 录 </button>
                <div class="username" style="margin-top:20px;color:red;"><span>${error}</span></div>
            </form>
           
        </div>
		
        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

    </body>

</html>

