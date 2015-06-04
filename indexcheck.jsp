
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%
			String username=request.getParameter("username");
			String password=request.getParameter("userpass");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			if(username.equals("")){
			response.sendRedirect("index.jsp");
		}
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql="select * from testInfo where username='"+username+"'";
			rs=st.executeQuery(sql);
			if(rs.next()){
			//判断密码是否正确
			String sql2="select * from testInfo where password='"+password+"'";
			rs=st.executeQuery(sql2);
			if(rs.next()){
				response.sendRedirect("student.jsp");
			}
			else{
				response.sendRedirect("index.jsp");
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			//rs.close();
			//st.close();
			//con.close();
		}
		%>
	</body>
</html>
