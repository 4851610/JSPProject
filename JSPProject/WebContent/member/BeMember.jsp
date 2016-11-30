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
	m_encoded_key = URLEncoder.encode(m_key,"utf-8");
} else {
	m_key="";
}
  request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="BeScript.js"></script>

<script language="javascript">
function CheckMemberForm(form){
	if(!form.name.value){
		alert("이름을 입력하세오.");
		form.name.focus();
		return true;
	}
	
	if(!form.id.value){
		alert("아이디를 입력하세오.");
		form.id.focus();
		return;
	}
	
	if(!form.pw.value){
		alert("패스워드를 입력하세오.");
		form.pw.focus();
		return;
	}
	
	if(!form.ReUserPass.value){
		alert("패스워드확인란에 패스워드를 입력하세오.");
		form.ReUserPass.focus();
		return;
	}
	
	if(!(form.pw.value==form.ReUserPass.value)){
		alert("패스워드가 일치하지 않습니다.");
		form.UserName.focus();
		return;
	}
	form.submit();
}
function IdCheck(form){
	if(!form.id.value){
		alert("아이디를 입력하세오.");
		form.id.focus();
		return;
	}
	var v = form.id.value;
	//form.action ="../member/IdCheck.jsp";
    popup(v);
	//form.submit();
}
</script>
</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.href('../main/Main.jsp')"></H2></center><br>
<table align=center width=620 height=40 border=0 cellspacing=1 cellpadding=1>
<TR bgcolor=#A0A0A0>
	<TD ALIGN=CENTER><FONT SIZE=4><B>회 원 가 입</B></FONT></TD>
	</TR>
	</table>
	
<FORM NAME="BeMember" method=post action="../member/BeMemberProc.jsp?column=<%=m_column%>&key=<%=m_encoded_key%>">

<table align=center width=630 border=1 cellspacing=0 cellpadding=2>
	<tr>
	<td width=120 align=center><b>이름</b></td>
	<td width=500>
	<input type=text name="name" size=20 maxlength=20 style="ime-mode:active">
	</td>
	</tr>
	
	<tr>
	<td width=120 align=center><b>아이디</b></td>
	<td width=500>
	<input type=text name="id" size=20 maxlength=10>
	<input type ="button" value="중복확인" OnClick="javascript:IdCheck(BeMember)">
	</td>
	</tr>
	
	<tr>
	<td width=120 align=center><b>패스워드</b></td>
	<td width=500>
	<input type=password name="pw" size=20 maxlength=10>
	</td>
	</tr>
	
	<tr>
	<td width=120 align=center><b>패스워드 확인</b></td>
	<td width=500>
	<input type=password name="ReUserPass" size=20 maxlength=10>
	</td>
	</tr>
	
	<tr>
	<td width=120 align=center><b>메일</b></td>
	<td width=500>
	<input type=text name="mail" size=60 maxlength=90 style="ime-mode:inactive">
	</td>
	</tr>
	</table>
	</FORM>
	
	<table width=620 hegight=50 border=0 cellspacing=1 cellpadding=1 align=center>
	<tr align=center>
	<td>
	<input type = "button" value="확인" OnClick="javascript:CheckMemberForm(BeMember)">&nbsp;&nbsp;
	<input type = "button" value="취소" onClick="javascript:location.replace('../main/Main.jsp')" style=cursor:hand>
	</td>
	</tr>
	</table>
	
</body>
</html>