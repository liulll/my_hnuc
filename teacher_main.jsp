<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/student_main.css"/>-->
		<title>学生页面</title>
	</head>
	<body>
		<%
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
		%>
		<form action="teacher_maincheck.jsp" method="post">
			<div class="center">
					<select name="type">
					<%
						ResultSet rs=stmt.executeQuery("SELECT * FROM activityInfo");
						while(rs.next()){
						String type=rs.getString("type");
					%>
					<option value="<%=type%>"><%=type%></option>
					<%}%>
					</select>
					<a href="stuInfoadd.jsp" name="add" class="add">添加学生信息</a>
					<a href="stuInfodelete.jsp" name="delete" class="delete">删除学生信息</a>
			</div>
			
		</form>
	</body>
</html>