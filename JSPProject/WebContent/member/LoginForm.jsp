<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%-- Integer.parseInt(request.getParameter("CurrentPage")) --%>
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
<%-- Integer.parseInt(request.getParameter("CurrentPage")) --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css">
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
		return true;
	}	
}
</script>
</head>
<body>

<table align=center width=620 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
<TR bgcolor=#A0A0A0>
	<TD ALIGN=CENTER><FONT SIZE=4><B>로 그 인</B></FONT></TD>
	</TR>
	</table>
	
<FORM NAME="Login" method=post action="../member/LoginProc.jsp?CorrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<table align=center width=400 border=1 cellspacing=0 cellpadding=2 align="left">
	<tr align=center>
	<td width=120 align=center><b>아이디</b></td>
	<td width=200>
	<input type=text name="id" size=20 maxlength=10 style="ime-mode:inactive">&nbsp;&nbsp;		
	</td>
	</tr>
	<tr align=center>
	<td width=120 align=center><b>패스워드</b></td>
	<td width=200>
	<input type=password name="pw" size=21.5 maxlength=10>
	</td>
	</tr>
	</table><br>
	<table width=620 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
	<tr align=center>
	<td>
	<input type = "submit" value="확인" OnClick="javascript:CheckMemberForm(Login);" >&nbsp;&nbsp;
	<input type = "button" value="회원가입" OnClick="window.location='BeMember.jsp'">&nbsp;&nbsp;
	<input type = "button" value="취소" OnClick="location.replace('../main/Main.jsp')">
	</td>
	</tr>
	</table>
</FORM>
</body>
</html>