<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>-->
		<title>老师审查页面</title>
		<style type="text/css">
			div.dis{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				font-size: 15px;
				background-color: #696969;
				text-align: center;
			}
			a.disa{
				color: white;
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<%!
			String actno;
			String type;
			String ss;
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
						<td><input class="short" type="text" name="actname" value="<%=rs.getString("actname")%>" disabled="true"/></td>
					</tr>
					<tr class="s_topic">
						<td>组织单位:</td>
						<td><input type="text" class="short" name="unit" value="<%=rs.getString("unit")%>" disabled="true"/></td>
					</tr>
					<tr class="s_topic">
						<td>参与时间:(修改请严格按照年/月/日格式输入)</td>
						<td>
							<input type="text" class="short" name="stime" value="<%=rs.getString("stime")%>" disabled="true"/>
						</td>
						<td> &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp; </td>
						<td>
							<input type="text" class="short" name="etime" value="<%=rs.getString("etime")%>" disabled="true"/>
						</td>
					</tr>
					<tr class="s_topic">
						<td>担任职责:</td>
						<td><input type="text" name="duty" class="short" value="<%=rs.getString("duty")%>" disabled="true"/></td>
					</tr>
					<tr class="l_topic">
						<td>参与情况重点摘要：(50字以内)</td>
					</tr>
					<tr class="l_topic">
						<td><input type="text" maxlength="55" name="abstrac" class="long1" value="<%=rs.getString("abstrac")%>" disabled="true"/></td>
					</tr>
					<tr class="l_topic">
						<td>参与具体内容:(不少于100字)</td>
					</tr>
					<tr>
						<td><textarea name="content" rows="5" wrap="soft" disabled="true"><%=rs.getString("content")%></textarea></td>
					</tr>
					<tr class="l_topic">
						<td>查看附件：</td>
					</tr>
					<tr>
						<td>
							<form name="form1" action="upload" method="post" enctype="multipart/form-data">
						    <input type="file" name="file" />
						    <input type="submit" name="button" value="查看" />
							</form>
						</td>
					</tr>
					<tr class="l_topic">
						<td colspan="2">
							<div class="dis">
								<a href="acttype_change.jsp?name=<%=actno%>" class="disa">变换状态</a>
							</div>
							现在的状态是
							<%
								type=rs.getString("acttype");
								ss="waiting";
								if(type.equals(ss)) out.print("待审");
								else out.print("已通过");
							%>
						</td>
					</tr>
				</table>	
			</form>
			<%}%>
		</div>
	</body>
</html>
