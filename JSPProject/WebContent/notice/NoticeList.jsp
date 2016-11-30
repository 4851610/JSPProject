<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs1=null;
ResultSet rs2=null;

int TotalRecords=0;

String Query1="";
String Query2="";
String encoded_key=" ";

int CurrentPage=0;

if(request.getParameter("CurrentPage")==null){
	CurrentPage=1;
	
}else{
	CurrentPage=Integer.parseInt(request.getParameter("CurretPage"));
}

String column = request.getParameter("column");
if(column == null) column="";

String key = request.getParameter("key");
if(column == null) {
	encoded_key = URLEncoder.encode(key,"euc-kr");
} else {
	key="";
}
try{
	String jdbcUrl="jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId="jspbook";
	String jdbcPw="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	Query1="SELECT count(num) FROM recipe";
	Query2="SELECT num, title, date FROM notice ORDER BY num DESC;";
	
	pstmt=conn.prepareStatement(Query1);
	rs1=pstmt.executeQuery();
	pstmt=conn.prepareStatement(Query2);
	rs2=pstmt.executeQuery();
	
	rs1.next();
	TotalRecords=rs1.getInt(1);


%>

<html>
<head> <link href="../notice/templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 리스트</title>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/Main.jsp')"></H2><br>
<%                     
String member_id=(String)session.getAttribute("member_name");
if(member_id==null){
	%>
	<jsp:include page="../member/login.jsp">
	<jsp:param value="<%=CurrentPage%>" name="CurrentPage"/>
	<jsp:param value="<%=column %>" name="column"/>
	<jsp:param value="<%=key %>" name="key"/>
	</jsp:include>
	<%
}else{
	%>
	<jsp:include page="../member/LoginState.jsp"/>
	<%
	}
%>
<table border=1 width=600>
<tr><td width = 180 align=center><a href="../best_recipe/best_recipeList.jsp">명예의 전당</a></td><td width = 180 align=center><a href="../board/BoardList.jsp">게시글</a></td>
<td width = 180 align=center><a href="../notice/NoticeList.jsp">공지사항</a></td><td width = 180 align=center><a href="../review/ReviewList.jsp">후기</a></td></tr>
</table><br>
<table width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
	<tr bgcolor=#B5B2FF>
		<td align=center><font size=4><b>공지사항 목록</b></font></td>
		</tr>
</table>
<table width=620 border=1 cellspacing=0 cellpadding=1 align=center>
<tr align=center>
<td width=45><b>번호</b></td>
<td width=395><b>제목</b></td>
<td width=70><b>작성일</b></td>
</tr>

<%
while(rs2.next()){
	int rno=rs2.getInt("num");
	String subject=rs2.getString("title");
	String date = rs2.getString("date");
%>

<tr>
<td width=45 align=center><%=rno%></td>
<td width=395 align=center><A href="../notice/NoticeContent.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>"><%=subject%></A></td>
<td align=center><%=date%></td>
</tr>
<% TotalRecords--;

}

%>
</table>

<form name="BoardSearch" method=post action="../notice/NoticeList.jsp">
<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr>
<td align=left width=100>
<input type = "button" value="글쓰기" OnClick="javascript:location.replace('../notice/NoticeWrite.jsp')" style=cursor:hand>
</td>

</tr>
</table></form>
<%
}
catch(SQLException e){
	e.printStackTrace();
	
}finally {
	rs2.close();
	rs1.close();
	pstmt.close();
	conn.close();
}
%>

</body>
</html>