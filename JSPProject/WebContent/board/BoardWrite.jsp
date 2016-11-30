<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try {
	String jdbcUrl="jdbc:mysql://127.0.0.1/jsp_project_db";
	String jdbcId="jspbook";
	String jdbcPw="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query = "select * from categorize";
	pstmt = conn.prepareStatement(Query);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		String categorize = rs.getString("categorize");
		
		String[] categorize_ = {};
		for(int i=0;i<8;i++) {
			categorize_[i] = categorize;
		}
	}
} catch(Exception e) {
	
}
String encoded_key=" ";

String column = request.getParameter("column");
if(column == null) column="";

String key = request.getParameter("key");
if(column == null) {
	encoded_key = URLEncoder.encode(key,"utf-8");
} else {
	key="";
}
int CurrentPage = 0;
%>
<%!

public static String getdate(int mountdate)

{
   //mountdate = 해당 숫자만큼 더해진 날짜를 반환
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance(); 
   calendar.add(calendar.DATE, mountdate);
   String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
   String month = df.format(calendar.get(Calendar.MONTH) + 1); //달을 구한다
   String day = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다
   String date = year + "-" + month + "-" + day;   //8자리 숫자★
   return date;
}
%>
<%
String str=getdate(0);
%>
<%-- Integer.parseInt(request.getParameter("CurrentPage")) --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="templatemo_style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>★ 레시피 작성 ★</title>

<script type="text/javascript">

function CheckForm(form){
	
	if(!form.title.value){
		alert('제목을 입력하세요.');
		 form.title.focus();
		 return true;
	}
	
	if(!form.text.value){
		alert('내용을 입력하세요.');
		 form.text.focus();
		 return true;
	}
	
	form.submit();
	
}
</script>



</head>
<body>
<center><H2><IMG src="../image/main.jpg" style='cursor:pointer' onClick="javascript:location.href('../main/Main.jsp')"></H2></center><br>

<%                     
String member_id=(String)session.getAttribute("member_name");
if(member_id==null){
	%>
	<center>로그인하세요 <input type = "button" value = "확인" OnClick="javascript:location.href=('../member/LoginForm.jsp')"></center>
	<%
}else{
	%>
	<jsp:include page="/member/LoginState.jsp">
	<jsp:param value="<%=CurrentPage %>" name="CurrentPage"/>
	<jsp:param value="<%=column %>" name="column"/>
	<jsp:param value="<%=key %>" name="key"/>
	</jsp:include>

<table width=600 height=40 border=0 cellspacing=1 cellpadding=1 align=center>
	<tr bgcolor=#D1B2FF>
		<td align=center><font size=4><b>★ 레시피 작성 ★</b></font></td>
		</tr>
</table>
<form name="BoardWrite" method=post enctype="multipart/form-data" action="../board/BoardWriteProc.jsp?column=<%=column%>&key=<%=encoded_key%>">
<table border=1 width=600 align=center>
<tr align=center>
	<td colspan=4><br></td>
</tr>
<tr align=center>
	<td width=150>날짜</td><td width=150><%out.print(str);%></td><td width=150>이름</td><td width=150><%out.print(member_id);%></td>
</tr>
<tr>
	<td align=center width=150>제목</td>
	<td><input type="text" size="50" maxlength="50" colspan=3
          name="title"></td>
    <td align=center>분류</td>
    <td align=center>
    <select id="userPhone" name="categorize">
    	<option value="간식">간식</option>
    	<option value="국">국</option>
    	<option value="다이어트">다이어트</option>
    	<option value="디저트">디저트</option>
    	<option value="서양식">서양식</option>
    	<option value="이유식">이유식</option>
    	<option value="일식">일식</option>
    	<option value="전골">전골</option>
    	<option value="중식">중식</option>
    	<option value="찌개">찌개</option>
    	<option value="탕">탕</option>
    	<option value="한식">한식</option>
    	<option value="면류">면류</option>
    	<option value="기타">기타</option>
    </select>
    </td>
</tr>
<tr>
	<td align=center width=150>
	첨부 사진
	</td>
	<td colspan=3>
	<input type="file" name="filename" size=50 multiple>
		</td>
</tr>
<tr>
	<td align=center>내용
	</td>
	<td colspan=3>
	<textarea name="text" cols=50 rows=8></textarea>
	</td>
</tr>
<tr>
</tr>
</table><br>
</form>
<table width=600 height=50 border=0 cellspacing=1 cellpadding=1 align=center>
<tr align=right>
	<td >
	<input type = "button" value="글목록" OnClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>')"style=cursor:hand>&nbsp;&nbsp;
	<input type = "button" value="확인" OnClick="javascript:CheckForm(BoardWrite)" >&nbsp;&nbsp;
	<input type = "button" value="취소" OnClick="javascipt:location.replace('../board/BoardList.jsp')"style=corsor:hand>
	</td>
	</tr>
</table>
</body>
</html>
	<%
	}
%>