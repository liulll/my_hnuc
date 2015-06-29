<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>
		<title>志愿修改页面</title>
		<style type="text/css">
			h3.longl{
				width: 300px;
			}
			input.sshort{
				width: 170px;
				padding: 5px;
			}
		</style>
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
				<div class="inn"> 
				<form method="post" action="changeconcheck.jsp">
						<h3>志愿编号:</h3>
							<select name="actno">
									<option><%=actno%></option>
							</select>
						<br/>
						<h3>活动名称:</h3>
						<input class="short" type="text" name="actname" value="<%=rs.getString("actname")%>" />
						<br/>
						<h3>组织单位:</h3>
						<input type="text" class="short" name="unit" value="<%=rs.getString("unit")%>"/>
						<br/>
						<h3 class="longl">参与时间:(修改请严格按照年/月/日格式输入)</h3>
						<br/>
							<input type="text" class="sshort" name="stime" value="<%=rs.getString("stime")%>"/>
						至
							<input type="text" class="sshort" name="etime" value="<%=rs.getString("etime")%>"/>
						<br/>
						<h3>担任职责:</h3>
						<input type="text" name="duty" class="short" value="<%=rs.getString("duty")%>"/>
						<br/>
						<h3 class="long">参与情况重点摘要：(50字以内)</h3>
						<br/>
						<input type="text" maxlength="55" name="abstrac" class="lon" value="<%=rs.getString("abstrac")%>"/></h3>
						<br/>
						<h3 class="long">参与具体内容:(不少于100字)</h3>
						<br/>
						<textarea name="content" rows="5" wrap="soft" class="lon"><%=rs.getString("content")%></textarea>
						<br/>
						<h3 class="longl">上传附件：(请上传带组织单位章的证明材料)</h3>
					<tr>
6					</tr>
							<input name="sure" type="submit" value="确认" class="sure" />
							<input name="clear" type="reset" value="重置"class="clear"/>
						<br/>
			</form>
			</div>
			<%}%>
		</div>
	</body>
</html>
