<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/student_nav.css">
		<title>学生页面_左侧菜单</title>
	</head>
	<body>
	<%!int ss;%>
		<%
					String username=(String)session.getAttribute("name");
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con=DriverManager.getConnection("jdbc:odbc:testInfo");
					st=con.createStatement();
					String sql="select stuyear from stuInfo where username='"+username+"'";
					rs=st.executeQuery(sql);
					while(rs.next()){	
						ss=rs.getInt("stuyear");
					}
				%>
				<%
					//rs.close();
					//stmt.close();
					//conn.close();
				%>
		<dl>
			<dt class="school_inform"><a href="news.jsp" target="_top">公告通知</a></dt>
			<div class="hr_solid"></div>
			<dt class="topic">志愿记录</dt>
			<dt><a href="firstcon.jsp?no=<%=ss%>" target="student_main"><%=ss%>学年</a></dt>
			<dt><a href="firstcon.jsp?no=<%=ss+1%>" target="student_main"><%=ss+1%>学年</a></dt>
			<dt><a href="firstcon.jsp?no=<%=ss+2%>" target="student_main"><%=ss+2%>学年</a></dt>
			<dt><a href="firstcon.jsp?no=<%=ss+3%>" target="student_main"><%=ss+3%>学年</a></dt>
		</dl>
	</body>
</html>