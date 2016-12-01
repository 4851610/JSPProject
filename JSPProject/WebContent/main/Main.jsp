<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;

try {
	String jdbcUrl="jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId="jspbook";
	String jdbcPw="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query1="SELECT filename FROM recipe ORDER BY del DESC limit 5";
	String Query2="select filename from recipe order by num desc limit 5";
	String Query3="select n.title, n.date, r.filename, r.title from notice n, review r order by n.num desc, r.num desc limit 5";

	pstmt=conn.prepareStatement(Query1);
	rs=pstmt.executeQuery();
	pstmt=conn.prepareStatement(Query2);
	rs1=pstmt.executeQuery();
	pstmt=conn.prepareStatement(Query3);
	rs2=pstmt.executeQuery();
} catch(Exception e) {
	
}

String encoded_key=" ";

String column = request.getParameter("column");
if(column == null) column="";

String key = request.getParameter("key");
if(column == null) {
	encoded_key = URLEncoder.encode(key,"utf-8");
} else {
	key="";
}
int CurrentPage = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나도 셰프랍니다</title>
</head>
<body>
<div align=center>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.reload()"></H2></center><br>
<%                     
String member_id=(String)session.getAttribute("member_name");
if(member_id==null){
	%>
	<jsp:include page="../member/login.jsp">
	<jsp:param value="<%=CurrentPage %>" name="CurrentPage"/>
	<jsp:param value="<%=column %>" name="column"/>
	<jsp:param value="<%=key %>" name="key"/>
	</jsp:include>
	<%
}else{
	%>
	<jsp:include page="../member/LoginState.jsp">
	<jsp:param value="<%=CurrentPage %>" name="CurrentPage"/>
	<jsp:param value="<%=column %>" name="column"/>
	<jsp:param value="<%=key %>" name="key"/>
	</jsp:include>
	<%
	}
%>

<table border=1 width=600>
<tr><td width = 180 align=center><a href="../best_recipe/best_recipeList.jsp">명예의 전당</a></td><td width = 180 align=center><a href="../board/BoardList.jsp">게시글</a></td>
<td width = 180 align=center><a href="../notice/NoticeList.jsp">공지사항</a></td><td width = 180 align=center><a href="../review/ReviewList.jsp">후기</a></td></tr>
</table><br>

<a href="../best_recipe/best_recipeList.jsp">명예의 전당</a>
<table border=1 width=200>
<tr align=center>
<%
while(rs.next()){
	String filename = rs.getString("filename");
%>
<td><img src = "../image/<%=filename%>" style="width:100px;height:100px"></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
}
%>
</tr>
</table><br>
<a href="../board/BoardList.jsp">게시글 보기 </a>
<table border=1 width=200>
<tr align=center>
<%
while(rs1.next()){
	String filename_recipe = rs1.getString("filename");
%>
<td><img src = "../image/<%=filename_recipe%>" style="width:100px;height:100px"></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
}
%>
</tr>
</table><br>

<table align=center width=620>
<tr align=center><td align=center>제목</td><td>날짜</td><td align=center>사진</td><td align=center>제목</td></tr>
<%
while(rs2.next()) {
	String title_notice = rs2.getString("n.title");
	String date = rs2.getString("n.date");
	String filename_review = rs2.getString("r.filename");
	String title_review = rs2.getString("r.title");
%>
<tr>
<td align=center><%=title_notice%></td><td><%=date %></td>
<td align=center><img src = "../image/<%=filename_review%>" style="width:100px;height:100px"></td>
<td align=center><%=title_review %></td>
</tr>
<%
}
%>
</table>
<br>
</div>
</body> 
</html>