<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>acttype_change</title>
	</head>
	<body>
	 	<%!
	 		String type;
	 		String ss="waiting";
	 		String hh="passed";
	 	%>
		<%
			String actno=request.getParameter("name");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement st=conn.createStatement();
			ResultSet rs=null;
			String sql="select * from activityInfo where actno='"+actno+"'";
			rs=st.executeQuery(sql);
			while(rs.next()){
				type=rs.getString("acttype");
			}
			if(type.equals(ss)){
				type=hh;
			}
			else{
				type=ss;
			}
			String sql1="update activityInfo set acttype='"+type+"' where actno='"+actno+"'";
			st.executeUpdate(sql1);
		
		%>
		<center>
			<h2>审核志愿者信息</h2>
			<p>
			<br>
			已修改状态成功！
			</p>
			<form name="form1" method="post" action="teacher_main.jsp">
				<input type="submit" id="back" name="back" value="返回">
			</form>
		</center>
	</body>
</html>
