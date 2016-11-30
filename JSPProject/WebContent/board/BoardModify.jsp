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
	
	String Query1 = "SELECT num, title, id, del, date, text, categorize, filename FROM recipe WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1,rno);
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		int num = rs.getInt("num");
		String title = rs.getString("title");
		String id = rs.getString("id");
		int del = rs.getInt("del");
		String date = rs.getString("date");
		String categorize = rs.getString("categorize");
		String text = rs.getString("text").trim();
		text = text.replaceAll("\r\n","<br>");
		String filename = rs.getString("filename");
%>

<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
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

<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.href('../main/Main.jsp')"></H2></center><br>




<%
String member_id = (String)session.getAttribute("member_id");
if(member_id == null) {
%>
<jsp:include page="/member/LoginForm.jsp"/>
<%
} else if((member_id.equals(id))) {
%>
<jsp:include page="/member/LoginState.jsp"/>
<form name="BoardModify" method=post enctype="multipart/form-data" action="BoardModifyProc.jsp?rno=<%=rno %>&column=<%=column%>&key=<%=encoded_key%>">
<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<tr bgcolor=#a0a0a0>
<td align=center><font size=4><B>게시글 수정</B></font></td>
</tr>
</table>
<table width=620 border=1 cellspacing=0 cellpadding=1 align=center>
<tr>
<td width=120 align=center><B>글 번호</B></td>
<td width=400><%=num%></td>
</tr>

<tr>
<td width=120 align=center><B>작성자</B></td>
<td width=400><%=id %></td>
</tr>

<tr>
<td width=120 align=center><B>작성 날짜</B></td>
<td width=400><%=date %></td>
</tr>

<tr>
<td width=120 align=center><B>카테고리</B></td>
<td width=400><%=categorize %></td>
</tr>

<tr>
<td width=120 align=center><B>맛있어요</B></td>
<td width=400><%=del%></td>
</tr>

<tr>
<td width=120 align=center><B>제목</B></td>
<td width=400><input type=text name="title" size=50 value='<%=title%>'></td>
</tr>

<tr>
<td width=120 align=center><B>내용</B></td>
<td width=400><textarea name="text" cols=50 rows=5><%=text%></textarea></td>
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
<input type="button" value="수정" onClick="javascript:CheckForm(BoardModify)" style=cursor:hand>&nbsp;&nbsp;

<input type="button" value="취소"  onClick="javascript:location.replace('BoardContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')" style=cursor:hand>
</td>
</tr>
</table>
<%
} else {
%>
<center>권한이 없습니다. &nbsp;&nbsp;<input type = "button" value = "확인" onClick="javascript:location.replace('BoardContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')"></center>

<%
}
%>
<%
}}
catch (SQLException e) {
	e.printStackTrace();
} finally {
	rs.close();
	pstmt.close();
	conn.close();
}
%>


</body>
</html>