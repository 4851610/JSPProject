<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="notice.Notice"%>
<%@ page import="notice.NoticeDAO"%>
<%@ page import="review.Review"%>
<%@ page import="review.ReviewDAO"%>
<%@ page import="java.util.ArrayList"%>
<%    
	String encoded_key = " ";

	String column = request.getParameter("column");
	String key = request.getParameter("key");
	
	if (column == null) {
		column = "";
		encoded_key = URLEncoder.encode(key, "utf-8");
	} else {
		key = "";
	}
	int CurrentPage = 0;

	BoardDAO bdao1 = new BoardDAO();
	ArrayList<Board> list1 = bdao1.bestRecipe();

	BoardDAO bdao2 = new BoardDAO();
	ArrayList<Board> list2 = bdao2.mainBoard();

	NoticeDAO ndao = new NoticeDAO();
	ArrayList<Notice> list3 = ndao.mainNotice();

	ReviewDAO rdao = new ReviewDAO();
	ArrayList<Review> list4 = rdao.mainList();
%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/templatemo_style.css" rel="stylesheet"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나도 셰프랍니다</title>
<style>
table {
margin:auto;
text-align:center;
}
</style>
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

		<table style="width:600px">
			<tr>
				<td width=180 align=center><a
					href="../best_recipe/best_recipeList.jsp">명예의 전당</a></td>
				<td width=180 align=center><a href="../board/BoardList.jsp">게시글</a></td>
				<td width=180 align=center><a href="../notice/NoticeList.jsp">공지사항</a></td>
				<td width=180 align=center><a href="../review/ReviewList.jsp">후기</a></td>
			</tr>
		</table>
		<br> <a href="../best_recipe/best_recipeList.jsp">명예의 전당</a>
		<table style="width:200px">
			<tr align=center>
				<%
					for (Board b : list1) {
				%>
				<td><img src="../image/<%=b.getRecipeImage()%>"
					style="width: 100px; height: 100px" onclick="../board/BoardContent.jsp?rno=<"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<%
					}
				%>
			</tr>
		</table>
		<br> <a href="../board/BoardList.jsp">게시글 보기 </a>
		<table style="width: 200">
			<tr align=center>
				<%
					for (Board b : list2) {
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

		<table>
			<tr>
			<td><a href="../best_recipe/best_recipeList.jsp">공지사항</a></td>
			<td></td>
			<td><a href="">리뷰</a></td>
			</tr>
			<tr>
				<td>
					<table style="width:300;">
						<tr>
							<th align=center>제목</th>
							<th align=center>날짜</th>
						</tr>
						<%
							for (Notice n : list3) {
						%>
						<tr>
							<td style="height:60px"><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeDate()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<table style="width:300px">
						<tr>
							<th align=center>사진</th>
							<th align=center>제목</th>
						</tr>
						<%
							for (Review r : list4) {
						%>
						<tr>
							<td align="center"><img src="../image/<%=r.getReviewImage()%>"style="width: 100px; height: 100px"></td>
							<td><%=r.getReviewTitle()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>
		<br>
	</div>
</body>
</html>