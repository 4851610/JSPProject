<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%request.setCharacterEncoding("utf-8"); %>
    
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
	
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String text = request.getParameter("text");
			
	String Query1 = "SELECT date, title, text FROM notice WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1,rno);
	rs = pstmt.executeQuery();
	rs.next();
	String id_test = rs.getString(1);
	String oldfilename = rs.getString(2);
	
	String admin = "administrator";
	String member_id = (String)session.getAttribute("member_id");
	if(member_id.equals(admin)) {
		
		String Query2 = "UPDATE notice SET title=?, text=? WHERE num=?";
		
		pstmt = conn.prepareStatement(Query2);
		pstmt.setString(1, title);
		pstmt.setString(2, text);
		pstmt.setInt(3, rno);
		
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		conn.close();
		String retUrl = "NoticeContent.jsp?rno=" + rno + "&column=" + column + "&key=" + encoded_key;
		response.sendRedirect(retUrl);
		
	} else {
		rs.close();
		pstmt.close();
		conn.close();
		out.println("<script languare=\"javascript\">");
		out.println("alert('수정을 실패했습니다.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
	}catch (SQLException e) {
		out.print(e);
	}
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>