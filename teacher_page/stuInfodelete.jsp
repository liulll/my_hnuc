<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>StuaddInfo</title>
	</head>
	<body>
		<%! String academy;%>
		<%
			Object name=session.getAttribute("name");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement st=conn.createStatement();
			ResultSet rs=null;
			String sql="select * from testInfo where username='"+name+"'";
			rs=st.executeQuery(sql);
			while(rs.next()){
				academy=rs.getString("academy");
			}
		%>
		<center>
			<p>删除学生信息</p>
			<form action="stuInfodeletecheck.jsp" method="post">
				<select name="username">
					<%
						rs=st.executeQuery("SELECT * FROM stuInfo where academy='"+academy+"'");
						while(rs.next()){
						String username=rs.getString("username");
					%>
					<option value="<%=username%>"><%=username%></option>
					<%}%>
				</select>
			<p>
				<input type="submit" name="sure" value="确定" />
				<input type="button" name="back" value="返回" onclick="javascript:window.close();" />
			</p>
			</form>
		</center>
	</body>
</html>