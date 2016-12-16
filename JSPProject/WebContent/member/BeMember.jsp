<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	int m_cp = 0;

	String m_column = request.getParameter("column");

	if (m_column == null)
		m_column = "";

	String m_encoded_key = null;

	String m_key = request.getParameter("key");
	if (m_key != null) {
		m_encoded_key = URLEncoder.encode(m_key, "utf-8");
	} else {
		m_key = "";
	}
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/templatemo_style.css" rel="stylesheet"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="BeScript.js"></script>
<script type="text/javascript">
	function CheckMemberForm() {
		if (!(BeMember.pw.value == BeMember.ReUserPass.value)) {
			alert("패스워드가 일치하지 않습니다.");
			BeMember.UserName.focus();
			return;
		}
		form.submit();
	}

	function IdCheck(form) {
		if (!form.id.value) {
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
	<div align="center">
		<header>
			<IMG src="../image/main.jpg" style='cursor: pointer'
				onClick="javascript:location.href('../main/Main.jsp')">
		</header>

		<font size=4><b>회 원 가 입</b></font> <br>
		<br>
		<FORM NAME="BeMember" method=post
			action="../member/BeMemberProc.jsp?column=<%=m_column%>&key=<%=m_encoded_key%>">

			<table>
				<tr>
					<td width=120 align=center><b>이름</b></td>
					<td width=500><input type=text name="name" size=20
						maxlength=20 required="required" autofocus></td>
				</tr>

				<tr>
					<td width=120 align=center><b>아이디</b></td>
					<td width=500><input type=text name="id" size=20 maxlength=10 required>
						<input type="button" value="중복확인"
						OnClick="javascript:IdCheck(BeMember)"></td>
				</tr>

				<tr>
					<td width=120 align=center><b>패스워드</b></td>
					<td width=500><input type=password name="pw" size=20
						maxlength=10 required></td>
				</tr>

				<tr>
					<td width=120 align=center><b>패스워드 확인</b></td>
					<td width=500><input type=password name="ReUserPass" size=20
						maxlength=10 required></td>
				</tr>

				<tr>
					<td width=120 align=center><b>메일</b></td>
					<td width=500><input type=text name="mail" size=60
						maxlength=90 required></td>
				</tr>
			</table>
		</FORM>
		<br> <input type="submit" value="확인"
			onclick="CheckMemberForm()">&nbsp;&nbsp; <input
			type="button" value="취소"
			onclick="location.replace('../main/Main.jsp')"
			style="cursor: hand">
	</div>
</body>
</html>