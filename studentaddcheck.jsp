
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%
			String actname=request.getParameter("actname");
			byte b[]=actname.getBytes("ISO-8859-1");
			actname=new String(b,"UTF-8");
			String unit=request.getParameter("unit");
			byte b1[]=unit.getBytes("ISO-8859-1");
			unit=new String(b1,"UTF-8");
			String syear=request.getParameter("syear");
			String smonth=request.getParameter("smonth");
			String sday=request.getParameter("sday");			
			String stime=syear+"/"+smonth+"/"+sday;
			byte b2[]=stime.getBytes("ISO-8859-1");
			stime=new String(b2,"UTF-8");
			String eyear=request.getParameter("eyear");
			String emonth=request.getParameter("emonth");
			String eday=request.getParameter("eday");			
			String etime=eyear+"/"+emonth+"/"+eday;
			//String etime=request.getParameter("etime");
			byte b3[]=etime.getBytes("ISO-8859-1");
			etime=new String(b3,"UTF-8");
			String duty=request.getParameter("duty");
			byte b4[]=duty.getBytes("ISO-8859-1");
			duty=new String(b4,"UTF-8");
			String abstrac=request.getParameter("abstrac");
			byte b5[]=abstrac.getBytes("ISO-8859-1");
			abstrac=new String(b5,"UTF-8");
			String content=request.getParameter("content");
			byte b6[]=content.getBytes("ISO-8859-1");
			content=new String(b6,"UTF-8");
			String actno=request.getParameter("actno");
			byte b7[]=actno.getBytes("ISO-8859-1");
			actno=new String(b7,"UTF-8");			
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
			String sql="insert into activityInfo values("+actno+",'"+actname+"','"+unit+"','"+stime+"','"+etime+"','"+duty+"','"+abstrac+"','"+content+"')";
			stmt.executeUpdate(sql);
		
		%>
		<center>
			<h2>添加活动信息</h2>
			<p>
			<br>
			新的数据已经添加到数据库中！
			</p>
			<form name="form1" method="post" action="student_main.jsp">
				<input type="submit" id="back" name="back" value="返回">
			</form>
		</center>
	</body>
</html>
