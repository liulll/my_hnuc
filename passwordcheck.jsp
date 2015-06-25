<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>passwordcheck</title>
	</head>
	<body>
		<%
			String userpass=request.getParameter("password");
			byte b[]=userpass.getBytes("ISO-8859-1");
			userpass=new String(b,"UTF-8");
			Object username=session.getAttribute("name");
			Connection con=null;
			Statement st=null;
			try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:testInfo");
			st=con.createStatement();
			String sql="Update testInfo set userpass='"+userpass+"' where username='"+username+"'";
			int row=st.executeUpdate(sql);
			if(row==1){
			response.sendRedirect("success.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
	}
		finally{
		//st.close();
		//con.close();
	}
		%>
	</body>
</html>
