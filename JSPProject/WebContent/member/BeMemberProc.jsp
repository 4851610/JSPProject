<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%-- Integer.parseInt(request.getParameter("Currentage")) --%>
<%request.setCharacterEncoding("utf-8"); %>
<%-- Integer.parseInt(request.getParameter("CurrentPage")) --%>
<%
int m_cp = 0;

String m_column = request.getParameter("column");
if (m_column == null) m_column="";

String m_encoded_key = null;
String m_key = request.getParameter("key");
if(m_key!=null) {
	m_encoded_key = URLEncoder.encode(m_key,"utf-8");
} else {
	m_key="";
}
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs1 = null;
ResultSet rs2 = null;

try{
	String jdbcUrl="jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId="jspbook";
	String jdbcPw="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String id = request.getParameter("id");
	
	String Query1 = "select count(*) from member where id='" + id + "'";
	stmt = conn.createStatement();
	rs1 = stmt.executeQuery(Query1);
	rs1.next();
	
	int same_id = rs1.getInt(1);
	
	if(same_id == 0){
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String mail = request.getParameter("mail");
		
		String Query2="insert into member values(?,?,?,?)";
		pstmt=conn.prepareStatement(Query2);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setString(4,mail);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("../member/LoginForm.jsp");
		
		rs2.close();
		rs1.close();
		stmt.close();
		pstmt.close();
		conn.close();
	} else {
		rs1.close();
		stmt.close();
		conn.close();
		
		out.println("<script language=\"javascript\">");
		out.println("arert('동일한 아이디가 존재합니다')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
	}
	catch(Exception e){
	System.out.println(e);
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