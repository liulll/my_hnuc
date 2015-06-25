<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>-->
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
				<form method="post" action="studentaddcheck.jsp">
				<table border="0">
				<tr class="s_topic">
						<td>志愿编号：</td>
						<td>
							<select name="actno">
									<option><%=no+1%></option>
							</select>
						</td>
					</tr>
					<tr class="s_topic">
						<td>活动名称:</td>
						<td><input class="short" type="text" name="actname" /></td>
					</tr>
					<tr class="s_topic">
						<td>组织单位:</td>
						<td><input type="text" class="short" name="unit" /></td>
					</tr>
					<tr class="s_topic">
						<td>参与时间:</td>
						<td>
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
						</td>
						<td> &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp; </td>
						<td>
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
						</td>
					</tr>
					<tr class="s_topic">
						<td>担任职责:</td>
						<td><input type="text" name="duty" class="short" /></td>
					</tr>
					<tr class="l_topic">
						<td>参与情况重点摘要：(50字以内)</td>
					</tr>
					<tr class="l_topic">
						<td><input type="text" maxlength="55" name="abstrac" class="long1" /></td>
					</tr>
					<tr class="l_topic">
						<td>参与具体内容:(不少于100字)</td>
					</tr>
					<tr>
						<td><textarea name="content" rows="5" wrap="soft"></textarea></td>
					</tr>
					<tr class="l_topic">
						<td>上传附件：(请上传带组织单位章的证明材料)</td>
					</tr>
					<tr>
						<td>
							<form name="form1" action="upload" method="post" enctype="multipart/form-data">
						    <input type="file" name="file" />
						    <input type="submit" name="button" value="上传" />
							</form>
						</td>
					</tr>
					<tr class="l_topic">
						<td colspan="2">
							<input name="sure" type="submit" value="确认" class="sure" />
							<input name="clear" type="reset" value="重置"class="clear"/>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</body>
</html>
