
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
			String actno=request.getParameter("actno");
			byte b[]=actno.getBytes("ISO-8859-1");
			actno=new String(b,"UTF-8");
			String sql="delete from activityInfo where actno="+actno;
			//String sql="delete from stuInfo where username="+username;
			stmt.executeUpdate(sql);
		%>
		<center>
			<h2>删除记录信息</h2>
			<p>
			<br>
			该记录已经被删除！
			</p>
			<form name="form1" method="post" action="student.jsp">
				<input type="submit" id="back" name="back" value="返回">
			</form>
		</center>
	</body>
</html>
