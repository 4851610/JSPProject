<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%-- Integer.parseInt(request.getParameter("CorrentPage")) --%>
<%
	int m_cp = 0;
	String m_column = request.getParameter("column");
	if(m_column == null) m_column="";
	
	String m_encoded_key = null;
	String m_key = request.getParameter("key");
	if(m_key!=null) {
		m_encoded_key = URLEncoder.encode(m_key,"euc_kr");
	} else {
		m_key="";
	}
	
	String name = (String)session.getAttribute("member_name");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align=center width=420 border=0 cellspacing=0 cellpadding=0>
		<tr>
			<td align=center width=320>
				<font size=2><b><%=name %></b>님의 방문을 환영합니다.</font>
			</td>
			<td>
				<input type = "submit" value="로그아웃" OnClick="javascript:location.href='../member/LogOut.jsp';" >
			</td>
		</tr>
	</table><br>
</body>
</html>