<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhanhengkitt
  Date: 2015/12/26
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
     <link href="${pageContext.request.contextPath }/css/contentcomm.css" rel="stylesheet" type="text/css"/>
  <link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css"/>
  <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
  function Change(HourSurplus,MinuteSurplus,SecondSurplus)
  {

    SecondSurplus = SecondSurplus - 1;
    if (SecondSurplus<0)
    {
      SecondSurplus=60+SecondSurplus;
      MinuteSurplus=MinuteSurplus-1;
    }
    if (MinuteSurplus<0)
    {
      MinuteSurplus=60+MinuteSurplus;
      HourSurplus=HourSurplus-1;
    }
    document.getElementById("restTime").innerHTML=""+ HourSurplus +":"+ MinuteSurplus +":"+ SecondSurplus +"";
    setTimeout(function() {
      Change(HourSurplus,MinuteSurplus,SecondSurplus);
    },1000);
  }
</script>

<script type="text/javascript">
    function testA(){

        return false;
    }
  function checkAll(){
      //alert("alert");
    var  count = document.getElementById("timuCount").innerHTML;
    var i = 1;
    var flag = new Array();
    var allFlag = true;
    for(i;i<=count;i++){
      flag[i-1]=false;
      var elementByName = document.getElementsByName("answer"+i);
      for(var k = 0;k<elementByName.length;k++){
        if(elementByName[k].checked == true){
          //alert("answer"+i+","+k+elementByName[k].value);
          flag[i-1]=true;
        }
      }

    }
    for(i=1;i<=count;i++){
      //alert("flag["+(i-1)+"]:"+flag[i-1])
      if(flag[i-1]==false){
          allFlag = false;
      }
    }
    if(allFlag==false){
      alert("骚年，请答完再离开！");
    }else{
      alert("好棒哦，你已经答完！")
    }
    return allFlag;
  }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/public/header.jsp"></jsp:include>
  <div class="big">
    <div class="left">
    <div class="lefttop">
    </div>
    <div class="leftbottom">
    <div class="leftbottom12">
    <table>
<tr>
           <td class="leftbottomtd1">
                <a href="${pageContext.request.contextPath }/testOnline/showExamList_Action">习题练习</a>
            </td>
        </tr>
         <tr>
           <td class="leftbottomtd1">
                <a href="${pageContext.request.contextPath }/testOnline/showOnlineTestQuestion_Action">在线考试</a>
            </td>
        </tr>
         <tr>
           <td class="leftbottomtd1">
                <a href="${pageContext.request.contextPath }/testOnline/courseTest_Action">课程测试</a>
            </td>
        </tr>
         <tr>
           <td class="leftbottomtd1">
                <a href="${pageContext.request.contextPath }/testOnline/showCapterList_Action">章节测试</a>
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
    <div class="right" style="text-align:left;float:left;">
    <div class="righttop">
    <div class="righttopmap">
        您当前的位置:&nbsp;首页&nbsp;»&nbsp;在线测试&nbsp;»&nbsp;课程测试
    </div>
    </div>
        <h3>课程测试</h3>
        <table>
            <tr>
                <td>总分：100</td>
                <td>时间：30分钟</td>
                <td>还可以测试${restCount}次</td>
                <td>剩余时间：<span id="restTime"></span></td>
                <script>
                    Change(0,30,1);
                    var allSecond = 30*60*1000;

                    //Change(0,0,5);
                    //var allSecond = parseInt(allTime.innerHTML)*60*1000;
                    function a(){
                        if(checkAll()==true) {
                            document.getElementById('btn').click();
                        }
                        else{
                            alert("时间到了,没做完当作废处理");
                            window.history.go(-1);
                            return false;
                        }
                    }
                    setTimeout(
                            function(){a()},allSecond
                    );

                </script>
            </tr>
        </table>
        <form action="${pageContext.request.contextPath}/testOnline/calculateCourseScore_Action" method="post">
            <p>选择题</p>
            <input type="hidden" name="exam.id" value="1">
            <c:set var="count" value="1"/>
            <c:forEach items="${showChoice}" var="choices">
                <p>${count}.${choices.choiceTitle}</p>
                <c:if test="${choices.keyA != ''}">
                    <label><p><input type="radio" value="A#${choices.id}" name="answer${count}">&nbsp;&nbsp;A、${choices.keyA}</p></label>
                </c:if>
                <c:if test="${choices.keyB != ''}">
                    <label><p><input type="radio" value="B#${choices.id}" name="answer${count}">&nbsp;&nbsp;B、${choices.keyB}</p></label>
                </c:if>
                <c:if test="${choices.keyC != ''}">
                    <label><p><input type="radio" value="C#${choices.id}" name="answer${count}">&nbsp;&nbsp;C、${choices.keyC}</p></label>
                </c:if>
                <c:if test="${choices.keyD != ''}">
                    <label><p><input type="radio" value="D#${choices.id}" name="answer${count}">&nbsp;&nbsp;D、${choices.keyD}</p></label>
                </c:if>
                <c:if test="${choices.keyE != ''}">
                    <label><p><input type="radio" value="E#${choices.id}" name="answer${count}">&nbsp;&nbsp;E、${choices.keyE}</p></label>
                </c:if>
                <c:set var="count" value="${count+1}"/>
                <br>
            </c:forEach>
            <p style="display: none" id="timuCount">${count-1}</p>
            <input type="submit" id="btn" onclick="return checkAll();" value="提交">

        </form>
</div>
    </div>
    <jsp:include page="/WEB-INF/public/foot.jsp"/>
</body>
</html>
