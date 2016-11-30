<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	try {
		String filename = request.getParameter("filename");
		String realFolder = "";
		String saveFolder = "upload_files";
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		String PathAndName = realFolder + "/" + filename;
		File file = new File(PathAndName);
		
		out.clear();
		pageContext.pushBody();
		
		String fileName = new String(request.getParameter("filename").getBytes("utf-8"),"ISO-8859-1");
		
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+"");
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setContentLength((int)file.length());
		response.setHeader("Cache-control", "no-cache");
		
		byte[] data = new byte[1024*1024];
		
		BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream fos = new BufferedOutputStream(response.getOutputStream());
		
		int count = 0;
		while((count = fis.read(data))!=-1) {
			fos.write(data);
		}
		if(fis != null) fis.close();
		if(fos != null) fos.close();
	}catch(IOException e) {
		System.out.println("download error : " + e);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>