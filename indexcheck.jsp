<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%
			String txt="admin";
			String usertype=request.getParameter("usertype");
			String username=request.getParameter("username");
			String userpass=request.getParameter("userpass");
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
				if(usertype.equals(txt))
				{
					String sql="select * from index where username='"+username+"'";
					rs=st.executeQuery(sql);
					if(rs.next()){
					//密码
					String sql2="select * from index where userpass='"+userpass+"'";
					rs=st.executeQuery(sql2);
					if(rs.next())
					{
						response.sendRedirect("show_test.jsp"); //网页名字还未定
					}
					else{
						response.sendRedirect("index.jsp");
					}
				}
				}
				else{
				 	String sql3="select * from index where username='"+username+"'";
					rs=st.executeQuery(sql3);
					if(rs.next()){
					//密码
					String sql4="select * from index where userpass='"+userpass+"'";
					rs=st.executeQuery(sql4);
					if(rs.next())
					{
						response.sendRedirect("student_main.jsp");
					}
					else{
						response.sendRedirect("index.jsp");
					}
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
