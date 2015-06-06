<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>StuaddInfo</title>
	</head>
	<body>
		<%
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
		%>
		<center>
			<p>删除学生信息</p>
			<form action="stuInfodeletecheck.jsp" method="post">
				<select name="username">
					<%
						ResultSet rs=stmt.executeQuery("SELECT * FROM stuInfo");
						while(rs.next()){
						String username=rs.getString("username");
					%>
					<option value="<%=username%>"><%=username%></option>
					<%}%>
				</select>
			<p>
				<input type="submit" name="sure" value="确定" />
				<input type="button" name="back" value="返回" onclick="javascript:history.go(-1)" />
			</p>
			</form>
		</center>
	</body>
</html>