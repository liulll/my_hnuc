
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>studeleteInfocheck page</title>
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
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			String username=request.getParameter("username");
			byte b[]=username.getBytes("ISO-8859-1");
			username=new String(b,"UTF-8");
			String sql="delete from stuInfo where username='"+username+"'";
			stmt.executeUpdate(sql);
			String sql1="delete from testInfo where username='"+username+"'";
			stmt.executeUpdate(sql1);
			String sql2="delete from activityInfo where username='"+username+"'";
			stmt.executeUpdate(sql2);
		%>
		<center>
			<h2>删除学生信息</h2>
			<p>
			<br>
			该学生记录已经被删除！
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
