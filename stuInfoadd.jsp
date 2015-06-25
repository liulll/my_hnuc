<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>StuaddInfo</title>
	</head>
	<body>
		<center>
			<%! String academy;%>
		<%
			Object username=session.getAttribute("name");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql="select * from testInfo where username='"+username+"'";
			rs=st.executeQuery(sql);
			while(rs.next()){
				academy=rs.getString("academy");
			}
		%>
			<p>添加学生信息</p>
			<form action="stuInfoaddcheck.jsp" method="post">
				<table border="0" width="300">
					<tr>
						<td>学号</td>
						<td><input type="text" name="username"/></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" name="stuname"/></td>
					</tr>
					<tr>
						<td>班级</td>
						<td><input type="text" name="userclass"/></td>
					</tr>
					<tr>
						<td>入学年份</td>
						<td>
							<select name="useryear">
								<%
								for(int i=2012;i<=2060;i++){
								%>
								<option><%=i%></option>
								<%}%>
							</select>年
						</td>
					</tr>
					<tr>
						<td>所属学院</td>
						<td>
							<select name="academy">
								<option><%=academy%></option>
							</select>
						</td>
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