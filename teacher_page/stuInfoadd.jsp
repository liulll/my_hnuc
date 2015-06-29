<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>StuaddInfo</title>
	</head>
	<body>
		<center>
			<%! 
				String academy;
				String[] useracademy = new String[100];
				String[] userclass = new String[1000];
				int m,n,j,k;
				String ss,hh;
			%>
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
			String sql1="select * from academyclass_Info where academy='"+academy+"'";
			rs=st.executeQuery(sql1);
			m=0;
			while(rs.next()){
				useracademy[m]=rs.getString("useracademy");
				m++;
			}
			String sql2="select * from academyInfo where academy='"+academy+"'";
			rs=st.executeQuery(sql2);
			j=0;
			while(rs.next()){
				userclass[j]=rs.getString("userclass");
				j++;
			}
		%>
			<p>添加学生信息</p>
			<form action="stuInfoaddcheck.jsp" method="post">
				<table border="0" width="300">
					<tr>
						<td>学号</td>
						<td><input type="text" name="username"/></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" name="stuname"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<select name="sex">
								<option>女</option>
								<option>男</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>专业</td>
						<td>
							<select name="useracademy">
								<%
									for(n=0;n<m;n++){
									ss=useracademy[n];
								%>
									<option><%=ss%></option>
								<%}%>
							</select>
						</td>
					</tr>
					<tr>
						<td>班级</td>
						<td>
							<select name="userclass">
								<%
									for(k=0;k<j;k++){
									hh=userclass[k];
								%>
									<option><%=hh%></option>
								<%}%>
							</select>
						</td>
					</tr>
					<tr>
						<td>入学年份</td>
						<td>
							<select name="useryear">
								<%
								for(int i=2012;i<=2060;i++){
								%>
								<option><%=i%></option>
								<%}%>
							</select>年
						</td>
					</tr>
					<tr>
						<td>所属学院</td>
						<td>
							<select name="academy">
								<option><%=academy%></option>
							</select>
						</td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input name="sure" type="submit" value="提 交"/>
							<input name="clear" type="reset" value="重 置"/>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>