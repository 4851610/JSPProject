<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%-- Integer.parseInt(request.getParameter("rno")) --%>
<%
    int CurrentPage=0;

    if(request.getParameter("CurrentPage")==null){
    	CurrentPage=1;
    	
    }else{
    	CurrentPage=Integer.parseInt(request.getParameter("CurretPage"));
    }
    
    
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
	
	String Query2 = "SELECT num, title, date, text FROM notice WHERE num=?";
	pstmt = conn.prepareStatement(Query2);
	pstmt.setInt(1, rno);
	rs1 = pstmt.executeQuery();
	
	while(rs1.next()){ 
	int num = rs1.getInt("num");
	String title = rs1.getString("title");
	String date = rs1.getString("date").trim();
	String text = rs1.getString("text").trim();
	text = text.replaceAll("\r\n","<br>");
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 출력</title>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.href('../main/Main.jsp')"></H2></center><br>
<%
String member_id = (String)session.getAttribute("member_id");
if(member_id == null) {
%>
<jsp:include page="../member/login.jsp"/>

<%
} else {
%>
<jsp:include page="../member/LoginState.jsp"/>
<%
}
%>

<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<tr >
<td align=center><font size=4><B>공지사항</B></font></td>
</tr>
</table>

<table width=620 border=1 cellspacing=0 cellpadding=1 align=center>
<tr>
<td width=120 align=center><B>글 번호</B></td>
<td width=500><%=num%></td>
</tr>

<tr>
<td width=120 align=center><B>날짜</B></td>
<td width=500><%=date%></td>
</tr>

<tr>
<td width=120 align=center><B>제목</B></td>
<td width=500><%=title%></td>
</tr>

<tr>
<td width=120 align=center><B>내용</B></td>
<td width=500><%=text%></td>
</tr>
<%

}%>
</table>

<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr align = center>
<td width="310" align=left>
<input type="button" value="목록" onClick="javascript:location.replace('NoticeList.jsp?column=<%=column %>&key=<%=encoded_key %>')">
</td>

<td width="310" align=right>
<input type="button" value="수정" onClick="javascript:location.replace('NoticeModify.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key %>')" style=cursor:hand>&nbsp;&nbsp;

<input type="button" value="삭제"  onClick="javascript:location.replace('NoticeDeleteProc.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
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