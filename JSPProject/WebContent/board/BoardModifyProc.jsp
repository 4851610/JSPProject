<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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

String saveFolder = "C:/Users/user/workspace_for_EE/jsp_project/WebContent/image";
String encType = "utf-8";
int sizeLimit = 10*1024*1024;
ServletContext context = getServletContext(); 
MultipartRequest multi = new MultipartRequest(request, saveFolder, sizeLimit, encType, new DefaultFileRenamePolicy()); 
String filename = multi.getFilesystemName("filename");

try {
	String jdbcUrl = "jdbc:mysql://localhost/jsp_project_db";
	String jdbcId = "jspbook";
	String jdbcPw = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String id = multi.getParameter("id");
	String title = multi.getParameter("title");
	String text = multi.getParameter("text");
			
	String Query1 = "SELECT id, filename FROM recipe WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1,rno);
	rs = pstmt.executeQuery();
	rs.next();
	String id_test = rs.getString(1);
	String oldfilename = rs.getString(2);
	
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		File file = multi.getFile(fname);
		
		String Query2 = "UPDATE recipe SET title=?, text=?, filename=? WHERE num=?";
		
		pstmt = conn.prepareStatement(Query2);
		pstmt.setString(1, title);
		pstmt.setString(2, text);
		pstmt.setString(3, filename);
		pstmt.setInt(4, rno);
		
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		conn.close();
		String retUrl = "BoardContent.jsp?rno=" + rno + "&column=" + column + "&key=" + encoded_key;
		response.sendRedirect(retUrl);
		

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