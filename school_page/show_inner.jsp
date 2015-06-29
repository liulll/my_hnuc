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
			String academy;
			String ss;
			String[] useracademy = new String[100];
			int i,j;
		%>
		<%
			academy=request.getParameter("name");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql1="select * from academyclass_Info where academy='"+academy+"'";
			rs=st.executeQuery(sql1);
			i=0;
			while(rs.next()){
				useracademy[i]=rs.getString("useracademy");
				i++;
			}
		%>
			<dt><a class="school_inform" href="main_nav.jsp"><%=academy%></a></dt>
			<div class="hr_solid"></div>
			<%
				for(j=0;j<i;j++){
					ss=useracademy[j];
					//out.print(ss);
			%>

				<a class="topic" href="main_class.jsp?name=<%=ss%>"><img src="img/nav_rec.png"><%=useracademy[j]%></a>
				<div class="hr_solid"></div>
			<%}%>
		</dl>
	</body>
</html>