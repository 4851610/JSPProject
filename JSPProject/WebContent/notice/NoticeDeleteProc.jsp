<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.net.URLEncoder" %>
    
    <%request.setCharacterEncoding("utf-8"); %>
    
    <%
    String member_id = (String)session.getAttribute("member_name");
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
    	
    	if(member_id.equals("administrator")) {
    		
    		String Query2 = "DELETE FROM notice WHERE num=" + rno;
    		pstmt = conn.prepareStatement(Query2);
    		pstmt.executeUpdate(Query2);

    		pstmt.close();
    		conn.close();
    		
    		String retUrl = "NoticeList.jsp?column=" + column + "&key=" + encoded_key;
    		response.sendRedirect(retUrl);
    	} else {
    		out.println("<script languare=\"javascript\">");
    		out.println("alert('권한이 없습니다.')");
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