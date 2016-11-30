<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
int m_cp = 0;

String m_column = request.getParameter("column");

if (m_column == null) m_column="";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key!=null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}

session.invalidate();

String retURL = "../board/BoardList.jsp?column=" + m_column + "&key=" + m_encoded_key + "&CurrentPage=" + m_cp;
%><center>  <%out.println("로그아웃 되었습니다."); %></center> <%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align=center>
<tr align=center>
<td>
<input type = "submit" value="확인" OnClick="javascript:location.href=('../main/Main.jsp');" >
</td>
</tr>
</table>
</body>
</html>