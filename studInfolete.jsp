<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>StuaddInfo</title>
	</head>
	<body>
		<center>
			<p>删除学生信息</p>
			<form action="deleteInfocheck.jsp" method="post">
				<table border="0" width="300">
					<tr>
						<td>学号</td>
						<td><input type="text" name="username"/></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input name="sure" type="submit" value="提 交"/>
							<input name="clear" type="reset" value="取 消"/>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>