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
			<p>删除志愿信息</p>
			<form action="studeletecheck.jsp" method="post">
				<select name="actno">
					<%
						ResultSet rs=stmt.executeQuery("SELECT * FROM activityInfo");
						while(rs.next()){
						String actno=rs.getString("actno");
					%>
					<option value="<%=actno%>"><%=actno%></option>
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