
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%
			String username=request.getParameter("username");
			byte b[]=username.getBytes("ISO-8859-1");
			username=new String(b,"UTF-8");
			String stuname=request.getParameter("stuname");
			byte b1[]=stuname.getBytes("ISO-8859-1");
			stuname=new String(b1,"UTF-8");
			String userclass=request.getParameter("userclass");
			byte b2[]=userclass.getBytes("ISO-8859-1");
			userclass=new String(b2,"UTF-8");
			String stuyear=request.getParameter("useryear");
			byte b3[]=stuyear.getBytes("ISO-8859-1");
			stuyear=new String(b3,"UTF-8");
			String academy=request.getParameter("academy");
			byte b4[]=academy.getBytes("ISO-8859-1");
			academy=new String(b4,"UTF-8");
			String userpass="888888";
			//String userphoto=request.getParameter("url");
			if(username.equals("")){
			response.sendRedirect("techer.jsp");
		}
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			String sql="insert into stuInfo values("+username+",'"+userclass+"','"+stuname+"','"+stuyear+"','"+academy+"')";
			stmt.executeUpdate(sql);
			String sql1="insert into testInfo values("+username+",'"+userpass+"','"+academy+"')";
			stmt.executeUpdate(sql1);
		
		%>
		<center>
			<h2>添加学生信息</h2>
			<p>
			<br>
			新的数据已经添加到数据库中！
			</p>
			<form name="form1" method="post" action="show_test.jsp">
				<input type="submit" id="back" name="back" onclick="javascript:window.close();" value="返回班级学生页面">
			</form>
		</center>
	</body>
</html>