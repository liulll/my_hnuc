
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>studeleteInfocheck page</title>
	</head>
	<body>
		<%
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			String username=request.getParameter("username");
			byte b[]=username.getBytes("ISO-8859-1");
			username=new String(b,"UTF-8");
			String sql="delete from stuInfo where username="+username;
			stmt.executeUpdate(sql);
		%>
		<center>
			<h2>删除学生信息</h2>
			<p>
			<br>
			该学生记录已经被删除！
			</p>
			<form name="form1" method="post" action="show_test.jsp">
				<input type="submit" id="back" name="back" value="返回班级学生页面">
			</form>
		</center>
	</body>
</html>
