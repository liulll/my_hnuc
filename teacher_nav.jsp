<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/teacher_nav.css">
		<title>学生页面_左侧菜单</title>
	</head>
	<body>
		<dl>
		<%! String academy;%>
		<%
			Object username=session.getAttribute("name");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql="select * from testInfo where username='"+username+"'";
			rs=st.executeQuery(sql);
			while(rs.next()){
				academy=rs.getString("academy");
			}
		%>
			<dt class="school_inform"><%=academy%></dt>
			<div class="hr_solid"></div>
			<dt class="topic">软件工程</dt>
			<div class="hr_solid"></div>
			<dd class="major_one"><a href=""><img src="img/nav_rec.png">软件1301班</a></dd>
			<div class="hr_solid"></div>
			<dd class="major_two"><a href=""><img src="img/nav_rec.png">软件1201班</a></dd>
			<div class="hr_solid"></div>
			<dd class="major_three"><a href=""><img src="img/nav_rec.png">软件1101班</a></dd>
			<div class="hr_solid"></div>
			<dd class="major_four"><a href=""><img src="img/nav_rec.png">软件1401班</a></dd>
			<div class="hr_solid"></div>
		</dl>
	</body>
</html>