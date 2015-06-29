<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/main_nav.css">
		<title>学校页面_左侧菜单</title>
		<style type="text/css">
			a.topic{
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
			String ss;
			String[] academy = new String[100];
			int i,j;
		%>
		<%
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql="select * from school";
			rs=st.executeQuery(sql);
			i=0;
			while(rs.next()){
				academy[i]=rs.getString("academy");
				i++;
			}
		%>
			<dt class="school_inform">湖南商学院</dt>
			<div class="hr_solid"></div>
			<%
				for(j=0;j<i;j++){
					ss=academy[j];
					//out.print(ss);
			%>

				<a class="topic" href="show_inner.jsp?name=<%=ss%>"><img src="img/nav_rec.png"><%=academy[j]%></a>
				<div class="hr_solid"></div>
			<%}%>
		</dl>
	</body>
</html>