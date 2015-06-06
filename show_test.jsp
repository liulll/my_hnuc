<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/student_main.css"/>-->
		<title>学生页面</title>
	</head>
	<body>
		<form>
			<table align="center" border="1" width="800">
				<tr>
					<th width="200" height="80" align="center">学号</th>
					<th width="200" height="80" align="center">姓名</th>
					<th width="200" height="80" align="center">班级</th>
				</tr>
				<%
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con=DriverManager.getConnection("jdbc:odbc:testInfo");
					st=con.createStatement();
					String sql="select * from stuInfo";  //软件1301要赋值为变量值
					rs=st.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("username")%></td>
					<td><%=rs.getString("stuname")%></td>
					<td><%=rs.getString("userclass")%></td>
				</tr>
				<%}%>
				<%
					//rs.close();
					//stmt.close();
					//conn.close();
				%>
			</table>
		</form>
	</body>
</html>