<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>

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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script language="javascript">
function CheckMemberForm(form){
	if(!form.id.value){
		alert("아이디를 입력하세오.");
		form.id.focus();
		return true;
	}
	
	 if(!form.pw.value){
		alert("패스워드를 입력하세오.");
		form.pw.focus();
		return;
	}
}
</script>
</head>
<body>
	
<FORM NAME="login" method=post action="../member/LoginProc.jsp?CorrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<table align=center width=600 cellspacing=0 cellpadding=2 align="left">
	<tr align=center>
	<td width=70 align=center>아이디</td>
	<td><input type=text name="id" size=15 maxlength=15></td>
	<td width=70 align=center>패스워드</td>
	<td><input type=password name="pw" size=15.5 maxlength=15></td>
	<td align=center>&nbsp;&nbsp;
	<input type = "submit" value="로그인" OnClick="javascript:CheckMemberForm(login);" >&nbsp;&nbsp;
	<input type = "button" value="회원가입" OnClick="window.location='../member/BeMember.jsp'">&nbsp;&nbsp;
	</td>
	</tr>
	
	</table><br>
	<%-- input type = "submit" value="로그인" --%>
</body>
</html>