<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
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

int rno = Integer.parseInt(request.getParameter("rno"));

try {
	String jdbcUrl = "jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId = "jspbook";
	String jdbcPw = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query1 = "SELECT del FROM recipe WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1, rno);
	rs = pstmt.executeQuery();
	
	rs.next();
	int del = rs.getInt("del");
	del = del+1;

	String Query2 = "UPDATE recipe SET del=? WHERE num=?";
	pstmt = conn.prepareStatement(Query2);
	pstmt.setInt(1, del);
	pstmt.setInt(2, rno);
	
	pstmt.executeUpdate();
}catch(Exception e) {
	
} finally {
	rs.close();
	pstmt.close();
	conn.close();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/Main.jsp')"></H2><br>
<center>맛있어요 되었습니다.^^*<br><br><input type="button" value="확인" onClick="javascript:location.replace('BoardContent.jsp?rno=<%=rno %>&column=<%=column %>&key=<%=encoded_key%>')"></center>
</body>
</html>