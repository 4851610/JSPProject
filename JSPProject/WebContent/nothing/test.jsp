<%
	int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

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


noticecontent
	String Query1 = "UPDATE notice SET UsrRefer=UsrRefer+1 WHERE num=?";
	pstmt = conn.prepareStatement(Query1);
	
	pstmt.setInt(1,rno);
	pstmt.executeUpdate();



boardwirte
취소버튼
?column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>



<jsp:include page="../member/login.jsp">
	<jsp:param value="<%=CurrentPage %>" name="CurrentPage"/>
	<jsp:param value="<%=column %>" name="column"/>
	<jsp:param value="<%=key %>" name="key"/>
	</jsp:include>