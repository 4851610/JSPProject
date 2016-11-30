<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%request.setCharacterEncoding("euc-kr"); %>
<%-- Integer.parseInt(request.getParameter("Currentage")) --%>
<%
int m_cp = 0;

String m_column = request.getParameter("column");
if (m_column == null) m_column="";

String m_encoded_key = null;
String m_key = request.getParameter("key");
if(m_key!=null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc_kr");
} else {
	m_key="";
}

String id= request.getParameter("id");
String pw= request.getParameter("pw");

String db_id = null;
String db_pw = null;
String db_name = null;

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	String jdbcUrl = "jdbc:mysql://localhost/jsp_project_db";
	String jdbcid = "root";
	String jdbcpw = "cl7668ju";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcid,jdbcpw);
	
	
	String Query1 = "SELECT id, pw, name from member where id='" + id + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	if(rs.next()) {
		db_id = rs.getString(1);
		db_pw = rs.getString(2);
		db_name = rs.getString(3);
	} else {
		db_id = null;
		db_pw = null;
		db_name = null;
	}
	
	if( (id.equals(db_id)) && (pw.equals(db_pw)) ) {
		session.setAttribute("member_id", id);
		session.setAttribute("member_name", db_name);
		
		rs.close();
		stmt.close();
		conn.close();
		
		%>
		<%
	} else{
		
		out.println("<script languare=\"javascript\">");
		out.println("alert('권한이 없습니다.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<table align=center>
<tr	align=center>
<td	align=center>
<input type = "submit" value="확인" OnClick="javascript:location.href=('../main/Main.jsp');" >
</td>
</tr>
</table>

</body>
</html>