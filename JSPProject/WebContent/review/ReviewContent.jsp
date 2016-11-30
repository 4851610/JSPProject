<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
int rno = Integer.parseInt(request.getParameter("rno"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs1 = null;

String encoded_key="";

String column = request.getParameter("column");
if(column==null) column="";

String key = request.getParameter("key");
if(key!=null) {
	encoded_key = URLEncoder.encode(key,"utf-8");
} else {
	key = "";
}

try {
	String jdbcUrl = "jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId = "jspbook";
	String jdbcPw = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query2 = "SELECT num, id, date, title, text, filename FROM review WHERE num=?";
	pstmt = conn.prepareStatement(Query2);
	pstmt.setInt(1, rno);
	rs1 = pstmt.executeQuery();
	String filename=null;
	while(rs1.next()){ 
		
		int num = rs1.getInt("num");
		String id = rs1.getString("id");
		String title = rs1.getString("title");
		String date = rs1.getString("date").trim();
		String text = rs1.getString("text").trim();
		text = text.replaceAll("\r\n","<br>");
		filename = rs1.getString("filename");
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="../notice/templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기</title>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/Main.jsp')"></H2><br>

<%
String member_id = (String)session.getAttribute("member_id");
if(member_id == null) {
%>
<jsp:include page="/member/login.jsp"/>
<%
} else {
%>
<jsp:include page="/member/LoginState.jsp"/>
<%
}
%>

<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<tr bgcolor=#a0a0a0>
<td align=center><font size=4><B>후기</B></font></td>
</tr>
</table>

<table width=620 barder=1 cellspacing=0 cellpadding=1 align=center>
<tr>
<td width=120 align=center><B>글 번호</B></td>
<td width=500><%=num%></td>
</tr>

<tr>
<td width=120 align=center><B>아이디</B></td>
<td width=500><%=id %></td>
</tr>

<tr>
<td width=120 align=center><B>날짜</B></td>
<td width=500><%=date %></td>
</tr>

<tr>
<td width=120 align=center><B>제목</B></td>
<td width=500><%=title %></td>
</tr>

<tr>
<td width=120 align=center><B>내용</B></td>
<td width=500><%=text %></td>
</tr>

<tr>
<td width=120 align=center><B>첨부파일</B></td>
<td width=500>
<%
	
if(filename == null) {
	out.println("첨부된 파일이 없습니다.");
} else {
	String IMGURL="../image";
%>
<img src = "../image/<%=filename%>" style='width:500px;height:300px'>
<%
}}
%></td>
</tr>
</table>

<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr align = center>
<td width="310" align=left>
<input type="button" value="목록" onClick="javascript:location.replace('ReviewList.jsp?column=<%=column %>&key=<%=encoded_key %>')">
</td>

<td width="310" align=right>
<input type="button" value="수정" onClick="javascript:location.replace('ReviewModify.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key %>')" style=cursor:hand>&nbsp;&nbsp;

<input type="button" value="삭제"  onClick="javascript:location.replace('ReviewDeleteProc.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
</td>
</tr>
</table>
<%
	}
catch (SQLException e) {
	e.printStackTrace();
}
%>
</body>
</html>