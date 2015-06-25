<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>-->
		<title>志愿修改页面</title>
	</head>
	<body>
		<%!
			String actno;
		%>
		<%
					Object username=session.getAttribute("name");
					actno=request.getParameter("name");
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					con=DriverManager.getConnection("jdbc:odbc:testInfo");
					st=con.createStatement();
					String sql="select * from activityInfo where actno='"+actno+"'";
					rs=st.executeQuery(sql);
					while(rs.next()){
				%>
				<%
					//rs.close();
					//stmt.close();
					//conn.close();
		%>
		<div class="center"> 
				<tr>
					<td><h2>志愿者活动详情记录修改</h2></td>
				</tr>
				<form method="post" action="changeconcheck.jsp">
				<table border="0">
				<tr class="s_topic">
						<td>志愿编号：</td>
						<td>
							<select name="actno">
									<option><%=actno%></option>
							</select>
						</td>
					</tr>
					<tr class="s_topic">
						<td>活动名称:</td>
						<td><input class="short" type="text" name="actname" value="<%=rs.getString("actname")%>" /></td>
					</tr>
					<tr class="s_topic">
						<td>组织单位:</td>
						<td><input type="text" class="short" name="unit" value="<%=rs.getString("unit")%>"/></td>
					</tr>
					<tr class="s_topic">
						<td>参与时间:(修改请严格按照年/月/日格式输入)</td>
						<td>
							<input type="text" class="short" name="stime" value="<%=rs.getString("stime")%>"/>
						</td>
						<td> &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp; </td>
						<td>
							<input type="text" class="short" name="etime" value="<%=rs.getString("etime")%>"/>
						</td>
					</tr>
					<tr class="s_topic">
						<td>担任职责:</td>
						<td><input type="text" name="duty" class="short" value="<%=rs.getString("duty")%>"/></td>
					</tr>
					<tr class="l_topic">
						<td>参与情况重点摘要：(50字以内)</td>
					</tr>
					<tr class="l_topic">
						<td><input type="text" maxlength="55" name="abstrac" class="long1" value="<%=rs.getString("abstrac")%>"/></td>
					</tr>
					<tr class="l_topic">
						<td>参与具体内容:(不少于100字)</td>
					</tr>
					<tr>
						<td><textarea name="content" rows="5" wrap="soft"><%=rs.getString("content")%></textarea></td>
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
			<%}%>
		</div>
	</body>
</html>
