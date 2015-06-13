
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%
			String usertype=request.getParameter("usertype");
			out.print(usertype);
			String ok="admin";
			if(ok.equals(usertype)) out.print("ok");
		%>
	</body>
</html>
