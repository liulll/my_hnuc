<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/main_nav.css">
		<title>学校页面_左侧菜单展开</title>
		<style type="text/css">
			a.topic{
				height: 30px;
				line-height: 30px;
				margin-left: 20px;
				font-size: 15px;
			}
			a.major{
				height: 30px;
				line-height: 30px;
				margin-left: 20px;
				font-size: 12px;
			}
		</style>
	</head>
	<body>
		<dl>
		<%! 
			String academy;
			String useracademy;
			String[] userclass = new String[1000];
			int i,j;
		%>
		<%
			useracademy=request.getParameter("name");
			//out.print(useracademy);
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql1="select * from academyInfo where useracademy='"+useracademy+"'";
			rs=st.executeQuery(sql1);
			i=0;
			while(rs.next()){
				userclass[i]=rs.getString("userclass");
				i++;
			}
		%>
			<dt class="school_inform"><a href="main_nav.jsp">湖南商学院</a></dt>
			<div class="hr_solid"></div>
			<a class="topic" href="useracademy_right.jsp?name=<%=useracademy%>" target="main_main"><%=useracademy%></a>
			<div class="hr_solid"></div>
			<%
				for(j=0;j<i;j++){
			%>
				<dd><a class="major" href="userclass_right.jsp?name=<%=userclass[j]%>" target="main_main"><img src="img/nav_rec.png"><%=userclass[j]%></a></dd>
				<!--show_right.jsp-->
				<div class="hr_solid"></div>
			<%}%>
		</dl>
	</body>
</html>