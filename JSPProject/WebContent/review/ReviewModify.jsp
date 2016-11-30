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
	
	String Query1 = "SELECT num, title, date, id, text, filename FROM review WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1,rno);
	
	rs = pstmt.executeQuery();
	rs.next();
	int num = rs.getInt(1);
	String title = rs.getString(2);
	String date = rs.getString(3);
	String id = rs.getString(4);
	String text = rs.getString(5);
	String filename = rs.getString(6);


%>

<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 수정</title>
<script type="text/javascript">
function CheckForm(form) {
	if(!form.title.value) {
		alert('제목을 입력하세요.');
		form.title.focus();
		return true;
	}
	if(!form.text.value) {
		alert('내용을 입력하세요.');
		form.text.focus();
		return true;
	}
	form.submit();
	}

</script>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/Main.jsp')"></H2><br>
<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<tr bgcolor=#a0a0a0>
<td align=center><font size=4><B>후기 수정</B></font></td>
</tr>
</table>


<%
String member_id = (String)session.getAttribute("member_id");
if(member_id == null) {
%>
<jsp:include page="/member/LoginForm.jsp"/>
<%
} else if (member_id.equals(id)){
%>
<jsp:include page="/member/LoginState.jsp"/>




<form name="ReviewModify" method=post enctype="multipart/form-data" action="ReviewModifyProc.jsp?rno=<%=rno %>&column=<%=column%>&key=<%=encoded_key%>">

<table width=620 barder=1 cellspacing=0 cellpadding=1 align=center>

<tr>
<td width=120 align=center><B>이름</B></td>
<td width=400><%=id %></td>
</tr>

<tr>
<td width=120 align=center><B>날짜</B></td>
<td width=400><%=date%>
</td>
</tr>

<tr>
<td width=120 align=center><B>제목</B></td>
<td width=400>
<input type=text name="title" size=50 style="ime-mode:inactive" value='<%=title%>'>
</td>
</tr>

<tr>
<td width=120 align=center><B>내용</B></td>
<td width=500>
<textarea name="text" cols=50 rows=5><%=text%></textarea>
</td>
</tr>

<tr>
<td width=120 align=center><B>첨부파일</B></td>
<td width=400>
<%
if(filename == null) {
	out.println("첨부된 파일이 없습니다.");
} else {
%>
<img src = "../image/<%=filename%>" style='width:500px;height:300px'>
<%
}
%>

</td>
</tr>

<tr>
<td width=120 align=center><B>새첨부파일</B></td>
<td width=400>
<input type=file name="filename" size=50>&nbsp;
</td>
</tr>
</table>
</form>


<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr align = center>
<td>
<input type="button" value="수정" onClick="javascript:CheckForm(ReviewModify)" style=cursor:hand>&nbsp;&nbsp;
<input type="button" value="취소"  onClick="javascript:location.replace('ReviewContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
</td>
</tr>
<%
} else {
	out.println("권한이 없습니다.");
%>
<tr><td>
<input type="button" value="확인"  onClick="javascript:location.replace('ReviewContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
</td></tr>
<%
}
%>
<%
}
catch (SQLException e) {
	e.printStackTrace();
} 
%>
</table>

</body>

</html>
