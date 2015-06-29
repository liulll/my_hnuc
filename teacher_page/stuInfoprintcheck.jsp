
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>stuInfoprintcheck page</title>
		<link rel="stylesheet" type="text/css" href="css/public.css">
		<link rel="stylesheet" type="text/css" href="css/printtable.css">
	</head>
	<body>
		<%!
			int i;
			String ddate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		%>
		<%
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			ResultSet rs=null;
			String username=request.getParameter("username");
			byte b[]=username.getBytes("ISO-8859-1");
			username=new String(b,"UTF-8");
			String sql="select * from stuInfo where username='"+username+"'";
			rs=stmt.executeQuery(sql);
			while(rs.next()){
		%>
		<h3 align="center">湖南商学院学生志愿记录</h3>
		<br/>
		<table border="1" align="center">
			<tr>
				<th class="topic" colspan="4">学生情况</th>
				<th>
					<table>
						<tr>
							<th class="rb">学院</th>
							<th class="rb_2"><%=rs.getString("academy")%></th>
							<th class="rb">学号</th>
							<th class="rb_2"><%=rs.getString("username")%></th>
							<th class="rb">班级</th>
							<th class="rb"><%=rs.getString("userclass")%></th>
						</tr>
						<tr>
							<th class="r">专业</th>
							<th class="r"><%=rs.getString("useracademy")%></th>
							<th class="r">姓名</th>
							<th class="r"><%=rs.getString("stuname")%></th>
							<th class="r">性别</th>
							<th class="r"><%=rs.getString("sex")%></th>
							<th class="r">入学时间</th>
							<th class="r"><%=rs.getString("stuyear")%></th>
						</tr>
					</table>
				</th>
				<th class="photo" colspan="4">照片</th>
			</tr>
			<%}%>
			<tr>
				<th class="topic" colspan="4">志愿记录</th>
				<th colspan="2">
					<table class="inn">
						<tr>
							<th class="inn_1 rrb">志愿名称</th>
							<th class="inn_2 rrb">职位</th>
							<th class="inn_3 rrb">单位</th>
							<th class="inn_4 rrb">具体时间</th>
						</tr>
						<%
							String sql2="select * from activityInfo where username='"+username+"' and acttype='passed'";
							rs=stmt.executeQuery(sql2);
							i=0;
							while(rs.next()){
								i++;
						%>
						<tr>
							<th class="inn_1 rrb"><%=rs.getString("actname")%></th>
							<th class="inn_2 rrb"><%=rs.getString("duty")%></th>
							<th class="inn_3 rrb"><%=rs.getString("unit")%></th>
							<th class="inn_4 rrb"><%=rs.getString("stime")%>-<%=rs.getString("etime")%></th>
						</tr>	
						<%}%>
						<tr>
							<th class="rr">共<%=i%>条志愿者记录</th>
						</tr>	
					</table>
				</th>
			</tr>
			<tr>
				<th class="topic" colspan="4">学院意见</th>
				<th colspan="2">
				<br/>
				<br/>
				<br/>
				<br/>
					<p class="right_1"align="right">志愿记录校对人签字:</p>
					<p class="right_2" align="right">年&nbsp;&nbsp;月&nbsp;&nbsp;日</p>
				</th>
			</tr>
		</table>
		<br/>
		<a href="#" onclick="javascript:window.print();"><%=ddate%></a>
	</body>
</html>
