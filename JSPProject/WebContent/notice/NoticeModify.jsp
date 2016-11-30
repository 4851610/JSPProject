<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.net.URLEncoder" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
int rno = Integer.parseInt(request.getParameter("rno"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

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
	String jdbcUrl = "jdbc:mysql://localhost/jsp_project_db";
	String jdbcId = "jspbook";
	String jdbcPw = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query1 = "SELECT num, title, date, text FROM notice WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1,rno);
	
	rs = pstmt.executeQuery();
	rs.next();
	int num = rs.getInt(1);
	String title = rs.getString(2);
	String date = rs.getString(3);
	String text = rs.getString(4);
%>

<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<script type="text/javascript">
function CheckForm(form) {
	if(!form.text.value) {
		alert('내용을 입력하세요.');
		form.text.focus();
		return true;
	}
	if(!form.title.value) {
		alert('제목을 입력하세요.');
		form.title.focus();
		return true;
	}
	form.submit();
	}

</script>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.href('../main/Main.jsp')"></H2></center><br>
<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<tr bgcolor=#a0a0a0>
<td align=center><font size=4><B>공지사항 수정</B></font></td>
</tr>
</table>


<%
String member_id = (String)session.getAttribute("member_id");
String admin = "administrator";
if(member_id == null) {
%>
<jsp:include page="/member/LoginForm.jsp"/>
<%
} else if((member_id.equals(admin))){
%>
<jsp:include page="/member/LoginState.jsp"/>



<form name="NoticeModify" method=post action="NoticeModifyProc.jsp?rno=<%=rno %>&column=<%=column%>&key=<%=encoded_key%>">

<table border=1 width=600 align=center>
<tr align=center>
	<td colspan=4><br></td>
</tr>
<tr align=center>
	<td width=150>날짜</td><td width=150><%=date%></td>
</tr>
<tr>
	<td align=center width=150>제목</td>
	<td><input type=text name="title" size=60 value='<%=title%>'></td>
</tr>
<tr>
	<td align=center>내용
	</td>
	<td colspan=3>
	<textarea name="text" cols=50 rows=5><%=text%></textarea>
	</td>
</tr>
<tr>
</tr>
</table><br>
</form>
<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr align = center>
<td>
<input type="button" value="수정" onClick="javascript:CheckForm(NoticeModify)" style=cursor:hand>&nbsp;&nbsp;

<input type="button" value="취소"  onClick="javascript:location.replace('NoticeContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
</td>
</tr>
</table>

</body>
</html>
<%
} else {
%>
<input type="button" value="확인"  onClick="javascript:location.replace('NoticeContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
<%
}
}
catch (SQLException e) {
	e.printStackTrace();
} finally {
	rs.close();
	pstmt.close();
	conn.close();
}
%>