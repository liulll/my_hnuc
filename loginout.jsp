<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>loginout</title>
	</head>
	<body>
		<%
		session.invalidate();
		out.print("<script>alert('用户即将退出，确定后退出该页面。');window.location.href='index.jsp'</script>");
		%>
	</body>
</html>