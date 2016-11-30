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

String Query1="";
String Query2="";
String encoded_key=" ";

int TotalRecords=0;
int CurrentPage=0;
int Number=0;
int TotalPage=0;
int TotalpageSets=0;
int CurrentPageset=0;
int PageRecords=10;
int PageSets=10;

if(request.getParameter("CurrentPage")==null){
	CurrentPage=1;
	
}else{
	CurrentPage=Integer.parseInt(request.getParameter("CurretPage"));
}

int FirstRecord = PageRecords * (CurrentPage-1);
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
	Query2="SELECT num, del, title, id, date, filename FROM recipe ORDER BY del DESC limit 10";
	
	pstmt=conn.prepareStatement(Query1);
	rs1=pstmt.executeQuery();
	pstmt=conn.prepareStatement(Query2);
	rs2=pstmt.executeQuery();
	
	rs1.next();
	TotalRecords=rs1.getInt(1);
	
	Number=TotalRecords-(CurrentPage-1)*PageRecords;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>명예의 전당</title>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/Main.jsp')"></H2><br>


<%                     
String member_id=(String)session.getAttribute("member_id");
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
	<tr bgcolor=#D1B2FF>
		<td align=center><font size=4><b>명예의 전당</b></font></td>
		</tr>
</table><br>
<table width=620 border=1 cellspacing=0 cellpadding=1 align=center>
<tr align=center>
<td align=center width=60><b>글 번호</b></td>
<td align=center width=60><b>맛있어요</b></td>
<td width=200><b>제목</b></td>
<td width=60><b>사진</b></td>
<td width=65><b>작성자</b></td>
<td width=80><b>작성일</b></td>
</tr>

<%
while(rs2.next()){
	int rno = rs2.getInt("num");
	int del=rs2.getInt("del");
	String subject=rs2.getString("title");
	String name=rs2.getString("id");
	String date=rs2.getString("date");
	String filename=rs2.getString("filename");
%>

<tr>
<td align=center><%=rno%></td>
<td align=center><%=del%></td>
<td align=center><A href="../board/BoardContent.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>"><%=subject%></A></td>
<td align=center><img src = "../image/<%=filename%>" style="width:100px;height:100px"></td>
<td align=center><%=name%></td>
<td align=center><%=date%></td>
</tr>
<% TotalRecords--;

}
%>
</table>

<form name="BoardSearch" method=post action="../board/BoardList.jsp">
<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr>
<td align=left width=100>
<input type = "button" value="글쓰기" OnClick="javascript:location.replace('../board/BoardWrite.jsp')" style=cursor:hand>
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