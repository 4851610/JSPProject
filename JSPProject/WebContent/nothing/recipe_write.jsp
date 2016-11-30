<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
    
<%-- <%@ include file="color.jspf"%> --%>
<html>
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<title>레시피 작성</title>
<script type="text/java-script" src="script.js"></script>
</head>

<%-- <body bgcolor="<%=bodyback_c%>"> --%>
<% 
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbcUrl = "jdbc:mysql://127.0.0.1/jsp_project_db";
try{
	Class.forName(jdbc_driver);
} catch(Exception e) {
	e.printStackTrace();
}
conn = DriverManager.getConnection(jdbcUrl,"jspbook","1234");
DecimalFormat df = new DecimalFormat("00");
Calendar currentCalendar = Calendar.getInstance();
String strYear   = Integer.toString(currentCalendar.get(Calendar.YEAR));
String strMonth  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
String strDay   = df.format(currentCalendar.get(Calendar.DATE));
String strDate = strYear+ "-"+ strMonth +"-"+ strDay;

  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  try{
    if(request.getParameter("num")!=null){
    num=Integer.parseInt(request.getParameter("num"));
    ref=Integer.parseInt(request.getParameter("ref"));
    re_step=Integer.parseInt(request.getParameter("re_step"));
    re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
<p><center><H2>나도 셰프랍니다</H2><center></p>
<form method="post" name="writeform" align="center"
      action="writePro.jsp" o-nsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table border=1 width=600>
<tr>
<td colspan=4><center>레시피 작성</center></td>
</tr>
<tr>
<td align="right" colspan=4>맛있어요</td>
</tr>
<tr align="center">
<td>분류</td><td>분류</td><td>날짜</td><td>분류</td>
</tr>
<tr>

</tr>
<tr>

</tr>
<tr>

</tr>
<tr>

</tr>
<tr>

</tr>
</table>
<table>
   <tr>
   <td align="center" colspan="2" >레시피 작성 
   </td>
    
   </td>
   </tr>
   <tr><td><br></td><td></td><td align="right" colspan="2"><a href="BoardList.jsp"> 글목록</a></td></tr>
      <tr>
    <td  width="70"  align="center">분류
    <td> <select id="userPhone" name="tel1">
             <option ${vo.sex=='02'?"selected":""}>국</option>
             <option ${vo.sex=='031'?"selected":""}>찌개</option>
             <option ${vo.sex=='032'?"selected":""}>밥</option>
             <option ${vo.sex=='051'?"selected":""}>디저트</option>
             <option ${vo.sex=='053'?"selected":""}>간식</option>
 </select>날짜
           <%=strDate.toString() %>    맛있어요 : 
    <span style='font-size:70%'>
    <c:if test='${not isReply}'>
    <a href="like.html"?action=vote&num=&{article.num}
    onClick='vote()' target='w'>'맛있어요'하기</a>
    </c:if> </span>
    </td>
  </tr>
   
   <tr>
    <td  width="90"  align="center" >이 름</td>
    <td  width="330" align="left">
       <input type="text" size="10" maxlength="10" colspan=3
          name="writer" style="ime-mode:active;"></td><!--active:한글-->
  </tr>
  <tr>
    <td  width="90"   align="center" >제 목</td>
    <td  width="330" align="left">
    <%
      if(request.getParameter("num")==null) 
      strV = "";
      else
      strV = "[답변]";
    %>
    <input type="text" size="40" maxlength="50" name="subject" colspan=3
         value="<%=strV%>" style="ime-mode:active;"></td> 
  </tr>
  <tr>
    <td  width="90" align="center">사진업로드</td>
    <td  width="330" align="left">
       <input type="file" name="uploadFile" multiple>
  </tr>
  <tr>
    <td  width="90"   align="center" >내 용</td>
    <td  width="330" align="left">
     <textarea name="content" rows="13" cols="40" 
              style="ime-mode:active;"></textarea> </td>
  </tr>
  <tr>      
    <td colspan=2  align="right"> 
      <input type="submit" value="글쓰기" >  
      <input type="reset" value="다시작성">
      <input type="button" value="목록보기" O-nClick="window.l-ocation='list.jsp'">
    </td>
  </tr>
</table>    
 <%
  }catch(Exception e){}
%>     
</form>    
</body>
</html>
