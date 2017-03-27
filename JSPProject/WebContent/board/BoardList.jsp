<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.net.URLEncoder"%>
<%
	int TotalRecords = 0;
	int CurrentPage = 0;
	int Number = 0;
	int TotalPage = 0;
	int TotalpageSets = 0;
	int CurrentPageset = 0;
	int PageRecords = 10;
	int PageSets = 10;

	String encoded_key = " ";

	if (request.getParameter("CurrentPage") == null) {
		CurrentPage = 1;

	} else {
		CurrentPage = Integer.parseInt(request.getParameter("CurretPage"));
	}

	int FirstRecord = PageRecords * (CurrentPage - 1);
	String column = request.getParameter("column");
	String key = request.getParameter("key");

	BoardDAO bdao1 = new BoardDAO();
	ArrayList<Board> list = bdao1.recipeList();

	BoardDAO bdao2 = new BoardDAO();
	TotalRecords = bdao2.totalRecord();

	Number = TotalRecords - (CurrentPage - 1) * PageRecords;
%>

<html>
<head>
<link href="../css/templatemo_style.css" rel="stylesheet"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 리스트</title>
</head>
<body>
	<div align="center">
		<header>
			<IMG src="../image/main.jpg" style='cursor: pointer'
				onClick="javascript:location.replace('../main/Main.jsp')">
		</header>
		<br>
		<%
			String member_id = (String) session.getAttribute("member_id");
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
		<jsp:include page="../member/LoginState.jsp" />
		<%
			}
		%>
		<table>
			<tr>
				<td width=180 align=center><a
					href="../best_recipe/best_recipeList.jsp">명예의 전당</a></td>
				<td width=180 align=center><a href="../board/BoardList.jsp">게시글</a></td>
				<td width=180 align=center><a href="../notice/NoticeList.jsp">공지사항</a></td>
				<td width=180 align=center><a href="../review/ReviewList.jsp">후기</a></td>
			</tr>
		</table>
		<br> <font size=4><b>레시피 글 목록</b></font> <br>
		<table>
			<tr align=center>
				<td width=45><b>번호</b></td>
				<td width=395><b>제목</b></td>
				<td width=65><b>작성자</b></td>
				<td width=70><b>작성일</b></td>
			</tr>

			<%
				for (Board b : list) {
			%>

			<tr>
				<td width=45 align=center><%=Number%></td>
				<td width=395 align=center><A
					href="../board/BoardContent.jsp?rno=<%=b.getRecipeUniqueKey()%>&coumn=<%=column%>&key=<%=encoded_key%>"><%=b.getRecipeTitle()%></A></td>
				<td width=65 align=center><%=b.getUserName()%></td>
				<td align=center><%=b.getRecipeWritingDate()%></td>
			</tr>
			<%
				Number--;
				}
			%>
			<tr>
				<td colspan="4" align="right"><input type="button" value="글쓰기"
					OnClick="javascript:location.replace('BoardWrite.jsp')"
					style="cursor: hand"></td>
			</tr>
		</table>
		<br>
		<form>
			<select name="">
			<option>제목</option>
			<option>작성자</option>
			<option>내용</option>
			</select>
			<input type="search" name="searchWord">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="" value="검색">
		</form>
		<br> <br><br><br>
	</div>
</body>
</html>