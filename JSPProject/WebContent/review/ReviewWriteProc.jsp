<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%request.setCharacterEncoding("utf-8");%>
<%!
public static String getdate(int mountdate)

{
   //mountdate = 해당 숫자만큼 더해진 날짜를 반환
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance(); 
   calendar.add(calendar.DATE, mountdate);
   String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
   String month = df.format(calendar.get(Calendar.MONTH) + 1); //달을 구한다
   String day = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다
   String date = year + "-" + month + "-" + day;   //8자리 숫자★
   return date;
}
%>
<%
String str=getdate(0);
%>
<%

Connection conn=null;
Statement stmt=null;
PreparedStatement pstmt=null;
ResultSet rs=null;



try{
	String jdbcUrl="jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId="jspbook";
	String jdbcPw="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String filename=null;
	String saveFolder = "C:/Users/user/workspace_for_EE/jsp_project/WebContent/image";
	String encType = "utf-8";
	int sizeLimit = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, saveFolder, sizeLimit, encType, new DefaultFileRenamePolicy()); 
	Enumeration params = multi.getParameterNames();
	
	ServletContext context = getServletContext();
	
	filename = multi.getFilesystemName("filename");
	if(filename!=null){
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		File file = multi.getFile(fname);
	}
	
	String id=(String)session.getAttribute("member_id");
	String title = multi.getParameter("title");
	String text = multi.getParameter("text");
	
	String Query1="SELECT max(num) FROM review";
	stmt=conn.createStatement();
	rs=stmt.executeQuery(Query1);
	
	rs.next();
	
	int num = (rs.getInt(1))+1;
	
	String Query2="INSERT INTO review (num, title, date, id, text, filename) VALUES(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(Query2);
	pstmt.setInt(1,num);
	pstmt.setString(2,title);
	pstmt.setString(3,str);
	pstmt.setString(4,id);
	pstmt.setString(5,text);
	pstmt.setString(6,filename);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("ReviewList.jsp");
}catch(SQLException e){
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