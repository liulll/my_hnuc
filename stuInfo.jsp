<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>1</title>
	</head>
	<body>
		<table border="1" align="center">
			<tr>
				<th width="87" align="center">学院</th>
				<th width="87" align="center">专业</th>
				<th width="87" align="center">学号</th>
			</tr>
			<%
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection conn=DriverManager.getConnection("jdbc:odbc:stuInfo");
				Statement stmt=conn.createStatement();
				String sql="select * from stuInfo";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("学院")%></td>
				<td><%=rs.getString("专业")%></td>
				<td><%=rs.getString("学号")%></td>
			</tr>w
			<%}%>
			<%
			rs.close();
			stmt.close();
			conn.close();
			%>
		</table>
	</body>
</html>