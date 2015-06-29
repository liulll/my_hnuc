<!--并没有实现展示样式-->
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
			String type=request.getParameter("type");
			byte b[]=type.getBytes("ISO-8859-1");
			type=new String(b,"UTF-8");
		%>
			<table align="center" border="1" width="800">
				<tr>
					<th width="200" height="80" align="center">志愿记录编号</th>
					<th width="200" height="80" align="center">活动名称</th>
					<th width="200" height="80" align="center">开始时间</th>
					<th width="200" height="80" align="center">结束时间</th>
					<th width="200" height="80" align="center">摘要</th>
					<th width="200" height="80" align="center">状态</th>
				</tr>
				<%
					String sql="select * from activityInfo where type="+type;
					rs=st.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("activityno")%></td>
					<td><%=rs.getString("actname")%></td>
					<td><%=rs.getString("starttime")%></td>
					<td><%=rs.getString("endtime")%></td>
					<td><%=rs.getString("abstract")%></td>
					<td><%=rs.getString("type")%></td>
				</tr>
				<%}%>
				<%
					//rs.close();
					//stmt.close();
					//conn.close();
				%>
			</table>
		</center>
	</body>
</html>