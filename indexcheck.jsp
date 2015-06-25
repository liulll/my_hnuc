<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>indexcheckJSP page</title>
	</head>
	<body>
		<%! int r;%>
		<%
			r=0;
			String txt="admin";
			String usertype=request.getParameter("usertype");
			String username=request.getParameter("username");
			session.setAttribute("name",username);  //把b放到session里，命名为a，
			//String M = session.getAttribute(“name”).toString(); 
			//从session里把a拿出来，并赋值给M
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
					String sql="select * from testInfo where username='"+username+"' and userpass='"+userpass+"'";
					rs=st.executeQuery(sql);
					while(rs.next())
					{
						r++;
					}
					if(r>0){
						response.sendRedirect("teacher.jsp"); 
					}
					else{
						response.sendRedirect("index.jsp");
					}
				}
				
				else{
					String sql="select * from testInfo where username='"+username+"' and userpass='"+userpass+"'";
					rs=st.executeQuery(sql);
					while(rs.next())
					{
						r++;
					}
					if(r>0){
						response.sendRedirect("student_page/student.jsp");
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
