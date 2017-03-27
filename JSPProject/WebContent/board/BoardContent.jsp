<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.ArrayList"%>

<%
	int CurrentPage = 0;

	if (request.getParameter("CurrentPage") == null) {
		CurrentPage = 1;

	} else {
		CurrentPage = Integer.parseInt(request.getParameter("CurretPage"));
	}

	int rno = Integer.parseInt(request.getParameter("rno"));

	String encoded_key = "";

	String column = request.getParameter("column");
	if (column == null)
		column = "";

	String key = request.getParameter("key");
	if (key != null) {
		encoded_key = URLEncoder.encode(key, "utf-8");
	} else {
		key = "";
	}

	BoardDAO bdao = new BoardDAO();
	ArrayList<Board> list = bdao.recipeContent(rno);
%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/templatemo_style.css" rel="stylesheet"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나도 셰프랍니다</title>
</head>
<body>
	<div align="center">
		<header>
			<IMG src="../image/main.jpg" style='cursor: pointer'
				onClick="javascript:location.href('../main/Main.jsp')">
		</header>

		<%
			String member_id = (String) session.getAttribute("member_id");
			if (member_id == null) {
		%>
		<jsp:include page="/member/login.jsp" />

		<%
			} else {
		%>
		<jsp:include page="/member/LoginState.jsp" />
		<%
			}
		%>
		<table>
			<tr bgcolor=#a0a0a0>
				<td align=center><font size=4><B>게시판</B></font></td>
			</tr>
		</table>

		<table>
			<%
				for (Board b : list) {
			%>
			<tr>
				<td width=120 align=center><B>글 번호</B></td>
				<td width=500><%=rno%></td>
			</tr>

			<tr>
				<td width=120 align=center><B>작성자</B></td>
				<td width=500><%=b.getUserName()%></td>
			</tr>

			<tr>
				<td width=120 align=center><B>작성 날짜</B></td>
				<td width=500><%=b.getRecipeWritingDate()%></td>
			</tr>

			<tr>
				<td width=120 align=center><b>카테고리</b></td>
				<td width=500><%=b.getCategorizeName()%></td>
			</tr>

			<tr>
				<td width=120 align=center><B>♡</B></td>
				<td width=100><%=b.getRecipeLike()%></td>
				<td width=40><input type="button" value="♡"
					onClick="javascript:location.replace('like.jsp?rno=<%=rno%>')"></td>
			</tr>

			<tr>
				<td width=120 align=center><B>제목</B></td>
				<td width=400><%=b.getRecipeTitle()%></td>
			</tr>

			<tr>
				<td width=120 align=center><B>내용</B></td>
				<td width=400><%=b.getRecipeContent()%></td>
			</tr>

			<tr>
				<td width=120 align=center><B>첨부파일</B></td>
				<td width=400>
					<%
						if (b.getRecipeImage() == null) {
								out.println("첨부된 파일이 없습니다.");
							} else {
								String IMGURL = "../image";
					%> <img src="../image/<%=b.getRecipeImage()%>"
					style='width: 400px; height: 300px'> <%
 	}
 %>
				</td>
			</tr>
			<%
				}
			%>
		</table>

		<input type="button" value="목록"
			onClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>')">
		<input type="button" value="수정"
			onClick="javascript:location.replace('BoardModify.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>')"
			style="cursor: hand">&nbsp;&nbsp; <input type="button"
			value="삭제"
			onClick="javascript:location.replace('BoardDeleteProc.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>')"
			style="cursor: hand">
	</div>
</body>
</html>