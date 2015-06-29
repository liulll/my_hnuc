<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>
		<title>学生页面</title>
	</head>
	<body>
		<%!
			int no;
			int ss;
		%>
		<%
					Object username=session.getAttribute("name");
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con=DriverManager.getConnection("jdbc:odbc:testInfo");
					st=con.createStatement();
					String sql="select actno from activityInfo where username='"+username+"'";
					no=Integer.parseInt(String.valueOf(username))*10;
					rs=st.executeQuery(sql);
					while(rs.next()){	
					 	no=rs.getInt("actno");
					}
					String sql1="select stuyear from stuInfo where username='"+username+"'";
					rs=st.executeQuery(sql1);
					while(rs.next()){	
						ss=rs.getInt("stuyear");
					}
				%>
				<%
					//rs.close();
					//stmt.close();
					//conn.close();
		%>
		<div class="center"> 
				<tr>
					<td><h2>志愿者活动详情记录</h2></td>
				</tr>
				<div class="inn">
				<form method="post" action="studentaddcheck.jsp">
							<h3>志愿编号:</h3>
								<select name="actno">
										<option><%=no+1%></option>
								</select>
							<br/>
							<h3>活动名称:</h3>
							<input class="short" type="text" name="actname" />
							<br/>
							<h3>组织单位:</h3>
							<input type="text" class="short" name="unit" />
							<br/>
							<h3>参与时间:</h3>
								<select name="syear">
									<%
									for(int i=ss;i<=ss+3;i++){
									%>
									<option><%=i%></option>
									<%}%>
								</select>年
								<select name="smonth">
									<%
									for(int j=1;j<=12;j++){
									%>
									<option><%=j%></option>
									<%}%>
								</select>月
								<select name="sday">
									<%
									for(int k=1;k<=31;k++){
									%>
									<option><%=k%></option>
									<%}%>
								</select>日
							&nbsp;至
								<select name="eyear">
									<%
									for(int i=ss;i<=ss+3;i++){
									%>
									<option><%=i%></option>
									<%}%>
								</select>年
								<select name="emonth">
									<%
									for(int j=1;j<=12;j++){
									%>
									<option><%=j%></option>
									<%}%>
								</select>月
								<select name="eday">
									<%
									for(int k=1;k<=31;k++){
									%>
									<option><%=k%></option>
									<%}%>
								</select>日
							<br/>
							<h3>担任职责:</h3>
							<input type="text" name="duty" class="short" />
							<br/>
							<h3 class="long">参与情况重点摘要：(50字以内)</h3>
							<br/>
							<input type="text" maxlength="55" name="abstrac" class="lon" />
							<br/>
							<h3 class="long">参与具体内容:(不少于100字)</h3>
							<br/>
							<textarea name="content" rows="5" wrap="soft" class="lon"></textarea>
							<br/>
							<h3 class="long">上传附件：(请上传带组织单位章的证明材料)</h3>
							<td>
								6
							</td>
							<br/>							
								<input name="sure" type="submit" value="确认" class="sure" />
								<input name="clear" type="reset" value="重置"class="clear"/>
			</form>
			</div>
		</div>
	</body>
</html>
