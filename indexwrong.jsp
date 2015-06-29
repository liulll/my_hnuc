<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>loginout</title>
	</head>
	<body>
		<%
		session.invalidate();
		out.print("<script>alert('用户类型错误或账号密码不匹配,请重新登录！');window.location.href='index.jsp'</script>");
		%>
	</body>
</html>