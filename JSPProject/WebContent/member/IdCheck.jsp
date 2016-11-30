<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8"); %>

<%
	

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
	try {
		String jdbcUrl = "jdbc:mysql://127.0.0.1/jsp_project_db";
		String jdbcid = "jspbook";
		String jdbcpw = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcid,jdbcpw);
		
		String Query1 = "select count(*) from member where id = '" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(Query1);
		rs.next();
		int db_id = rs.getInt(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">

	function popup_close(){
		
		self.close();
	}
	function CheckForm(form) {
		if(!form.id.value) {
			alert('아이디를 입력하세요.');
			form.id.focus();
			return;
		}
		//form.submit();
	}

	function useid() {
		opener.document.BeMember.id.value = '<%=id%>';
		self.close();
	}
</script>
</head>
<body topmargin=0 leftmargin=0>
<table width=378 cellspacing=0 cellpadding=0 topmargin=0 leftmargin=0>
	<tr bgcolor=#a0a0a0>
		<td align=center height=30><font color=white size=3><b>아이디 중복검사</b></font></td>
	</tr>
<%
	if(db_id > 0) {
%>

	<tr>
		<td align=center>
			<form name="IdCheck" method=post action="IdCheck.jsp">
				<table width=300 cellspacing=0 cellpadding=0 topmargin=0 leftmargin=0>
					<tr>
						<td>
							입력하신 <b><%=id%></b>은 이미 등록된 아이디 입니다.<br>다른 아이디를 입력하세요.
						</td>
					</tr>
					
					<tr>
						<td align=center height=40>
							<input type=text name="id" size=20 maxlength=20>
							<input type = "submit" value="검색" align=absmiddle OnClick="javascript:CheckForm(IdCheck)">
							
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
<%
	}else {
%>

	<tr>
		<td align=center>
			<form name="IdCheck" method=post action="BeMember.jsp">
			
			<table width=300 cellspacing=0 cellpadding=0 topmargin=0 leftmargin=0>
				<tr>
					<td>
						입력하신 <b><%=id%></b>은(는)사용가능 한 아이디입니다. <br> 이 아이디를 사용하시겠습니까?
					</td>
				</tr>
				
				<tr>
					<td align=center height=40>
						<input type="button" value="확인" size=60 onClick="popup_close()">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
<%
	}}catch(Exception e) {
		out.print(e);
	}
%>
</table>
</body>
</html>