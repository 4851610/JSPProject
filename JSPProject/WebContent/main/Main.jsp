<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.ArrayList" %>
<%
	String encoded_key = " ";

	String column = request.getParameter("column");
	if (column == null)
		column = "";

	String key = request.getParameter("key");
	if (column == null) {
		encoded_key = URLEncoder.encode(key, "utf-8");
	} else {
		key = "";
	}
	int CurrentPage = 0;

	BoardDAO bdao = new BoardDAO();
	ArrayList<Board> list = bdao.bestRecipe();
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
	<div align=center>
		<H2>
			<IMG src="../image/main.jpg" style='cursor: pointer'
				onClick="javascript:location.reload()">
		</H2>
		<br>
		<%
			String member_id = (String) session.getAttribute("member_name");
			if (member_id == null) {
		%>
		<jsp:include page="../member/login.jsp">
			<jsp:param value="<%=CurrentPage%>" name="CurrentPage" />
			<jsp:param value="<%=column%>" name="column" />
			<jsp:param value="<%=key%>" name="key" />
		</jsp:include>
		<%
			} else {
		%>
		<jsp:include page="../member/LoginState.jsp">
			<jsp:param value="<%=CurrentPage%>" name="CurrentPage" />
			<jsp:param value="<%=column%>" name="column" />
			<jsp:param value="<%=key%>" name="key" />
		</jsp:include>
		<%
			}
		%>

		<table border=1 width=600>
			<tr>
				<td width=180 align=center><a
					href="../best_recipe/best_recipeList.jsp">명예의 전당</a></td>
				<td width=180 align=center><a href="../board/BoardList.jsp">게시글</a></td>
				<td width=180 align=center><a href="../notice/NoticeList.jsp">공지사항</a></td>
				<td width=180 align=center><a href="../review/ReviewList.jsp">후기</a></td>
			</tr>
		</table>
		<br> <a href="../best_recipe/best_recipeList.jsp">명예의 전당</a>
		<table border=1 width=200>
			<tr align=center>
				<%
					for (Board b : list) {
				%>
				<td><img src="../image/<%=b.getRecipeImage()%>"
					style="width: 100px; height: 100px"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<%
					}
				%>
			</tr>
		</table>
		<br> <a href="../board/BoardList.jsp">게시글 보기 </a>
		<table border=1 width=200>
			<tr align=center>
				<%
					for (Board b : list) {
				%>
				<td><img src="../image/<%=b.getRecipeImage()%>"
					style="width: 100px; height: 100px"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<%
					}
				%>
			</tr>
		</table>
		<br>

		<table align=center width=620>
			<tr align=center>
				<td align=center>제목</td>
				<td>날짜</td>
				<td align=center>사진</td>
				<td align=center>제목</td>
			</tr>
			<%
				for (Board b : list) {
			%>
			<tr>
				<td align=center><%=title_notice%></td>
				<td><%=date%></td>
				<td align=center><img src="../image/<%=filename_review%>"
					style="width: 100px; height: 100px"></td>
				<td align=center><%=title_review%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
	</div>
</body>
</html>