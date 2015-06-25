<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>change password</title>
</head>
<body>
	<form method="post" action="passwordcheck.jsp">
		<table align="center" width="400px">
			<tr>
				<th colspan="2">修改密码</th>
			</tr>
			<tr>
				<td>新密码:</td>
				<td><input name="password" type="password"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input name="sure" type="submit" value="确认"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="clear" type="reset" value="取消"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>