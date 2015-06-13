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
			<div class="center">
					<select>
						<option class="all">所有记录</option>
						<option class="pass">已通过</option>
						<option class="wait">待审</option>
					</select>
					<a href="stuadd.jsp" name="add" class="add">新建记录</a>
					<a href="studelete.jsp" name="delete" class="delete" target="_blank">删除记录</a>
			</div>
			<table align="center" border="1" width="800">
				<tr>
					<!--<th width="200" height="80" align="center">志愿记录编号</th>-->
					<th width="200" height="80" align="center">活动名称</th>
					<th width="200" height="80" align="center">开始时间</th>
					<th width="200" height="80" align="center">结束时间</th>
					<th width="200" height="80" align="center">摘要</th>
					<!--<th width="200" height="80" align="center">状态</th>-->
				</tr>
				<%
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con=DriverManager.getConnection("jdbc:odbc:testInfo");
					st=con.createStatement();
					String sql="select * from activityInfo";
					rs=st.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
					
					<td><%=rs.getString("actname")%></td>
					<td><%=rs.getString("stime")%></td>
					<td><%=rs.getString("etime")%></td>
					<td><%=rs.getString("abstrac")%></td>
					
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