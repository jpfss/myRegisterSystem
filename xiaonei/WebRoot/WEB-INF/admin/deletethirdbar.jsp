<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精品课堂管理后台</title>

  </head>
  
  <body>
<jsp:include page="/WEB-INF/admin/adminheader.jsp"></jsp:include>

  <div class="bigright">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">内容管理</a></li>
    <li><a href="#">内容列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>目录</th>
        <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <tr>
  <c:forEach items="${list}" var="news">
  <tr><td class="homeworkmctd">${news.newsTitle}</td>
  <c:choose>
  <c:when test="${news.flag=='1'}">
  <td class="homeworkmctd"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${news.newstype.id}&newsid=${news.id}">删除</a></td></tr>
  </c:when>
  <c:when test="${news.flag=='3'}">
  <td class="homeworkmctd"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${news.newstype.id}&newsid=${news.id}">删除</a>
  <a href="${pageContext.request.contextPath}/test/content_goseevedio?newsTypeid=${news.newstype.id}&newsid=${news.id}">查看详情</a></td></tr>
  </c:when>
  <c:when test="${news.flag=='4'}">
  <td class="homeworkmctd"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${news.newstype.id}&newsid=${news.id}">删除</a>
  </c:when>
  <c:otherwise>
  <td class="homeworkmctd"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${news.newstype.id}&newsid=${news.id}">删除</a>
  <a href="${pageContext.request.contextPath}/test/content_gochangeword?newsTypeid=${news.newstype.id}&newsid=${news.id}">查看详情</a></td></tr>
  </c:otherwise>
  </c:choose>
  </c:forEach>
 
        </tr>
        </tbody>
    </table>
    <div class="pagin">
        <ul class="paginList">
        <li class="paginItem"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${newsTypeid}&pageNow=1" style="font-weight:normal;display:inline-block;">首页</a></li>
      <c:forEach var="i" begin="1" end="${pageCount}">
          <li class="paginItem"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${newsTypeid}&pageNow=${i}">${i}</a></li>
            </c:forEach>
        <li class="paginItem"><a href="${pageContext.request.contextPath}/test/content_godeletethirdbar?newsTypeid=${newsTypeid}&pageNow=${pageCount}" style="font-weight:normal;display:inline-block;">尾页</a></li>
        </ul>
    </div>

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</div>
  </body>
</html>
