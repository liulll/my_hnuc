
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
		<style type="text/css">
			div.back{
				display: inline-block;
				width: 120px;
				height: 30px;
				line-height: 30px;
				font-size: 12px;
				text-align: center;
				background-color: #999;
			}
			a.aback{
				text-decoration: none;

			}
		</style>
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
			String useracademy=request.getParameter("useracademy");
			byte b5[]=useracademy.getBytes("ISO-8859-1");
			useracademy=new String(b5,"UTF-8");
			String sex=request.getParameter("sex");
			byte b6[]=sex.getBytes("ISO-8859-1");
			sex=new String(b6,"UTF-8");
			//out.print(useracademy);
			//useracademy="11";
			String userpass="123456";
			String usertype="user";
			//String userphoto=request.getParameter("url");
			if(username.equals("")){
			response.sendRedirect("techer.jsp");
		}
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			String sql="insert into stuInfo values("+username+",'"+userclass+"','"+stuname+"','"+stuyear+"','"+academy+"','"+useracademy+"','"+sex+"')";
			stmt.executeUpdate(sql);
			String sql1="insert into testInfo values("+username+",'"+userpass+"','"+academy+"','"+usertype+"')";
			stmt.executeUpdate(sql1);
		%>
		<center>
			<h2>添加学生信息</h2>
			<p>
			<br>
			新的数据已经添加到数据库中！
			</p>
			<div class="back">
				<a href="teacher_main.jsp" target="teacher_main" onclick="javascript:winclose();" class="aback">返回班级学生页面</a>
			</div>
		</center>
	</body>
	<script language=javascript> 
		function winclose() { 
		window.opener.location.reload(teacher_main.jsp);//刷新 
		window.close();//关闭 
		} 
	</script> 
</html>
