<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/list.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/student_main.css"/>-->
		<title>学校页面</title>
	</head>
	<body>
		<%! String academy;%>
		<%
			Object name=session.getAttribute("name");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn=DriverManager.getConnection("jdbc:odbc:testInfo");
			Statement stmt=conn.createStatement();
		%>
		<form action="teacher_maincheck.jsp" method="post">
			<%!
				String username;
			%>
			<%
				username=request.getParameter("name");
				session.setAttribute("ss",username);
			%>
			<div class="center">
				<div class="menu">
					<ul>
						<li><a href="main_inner_check.jsp?name=all" class="hide">所有记录</a>
						<ul>					
							<li class="change"><a href="main_inner_check.jsp?name=waiting">待审</a></li>
							<li class="change"><a href="main_inner_check.jsp?name=passed">已通过</a></li>
						</ul>
						</li>
					</ul>					
				</div>	
					<table align="center" border="1" width="800">
						<tr>
							<!--<th width="200" height="80" align="center">志愿记录编号</th>-->
							<th width="200" height="80" align="center">学生学号</th>
							<th width="200" height="80" align="center">志愿记录编号</th>
							<th width="200" height="80" align="center">志愿名称</th>
							<th width="200" height="80" align="center">志愿状态</th>
						</tr>
						
						<%
							//out.print(username);
							Connection con=null;
							Statement st=null;
							ResultSet rs=null;
							Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
							con=DriverManager.getConnection("jdbc:odbc:testInfo");
							int intPageSize;
							int intRowCount;
							int intPageCount;
							int intPage;
							String strPage;
							int i;
							intPageSize=8;
							strPage=request.getParameter("page");
							if(strPage==null){
								intPage=1;
							}
							else{
								intPage=java.lang.Integer.parseInt(strPage);
								if(intPage<1) intPage=1;
							}
							st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
							String sql="select * from activityInfo where username='"+username+"'";
							rs=st.executeQuery(sql);
							rs.last();
							intRowCount=rs.getRow();
							intPageCount=(intRowCount+intPageSize-1)/intPageSize;
							if(intPage>intPageCount)
								intPage=intPageCount;
							if(intPageCount>0){
								rs.absolute((intPage-1)*intPageSize+1);
							i=0;
							while(i<intPageSize && !rs.isAfterLast()){
						%>
						<tr>
							<td align="center"><a href="main_main_inner.jsp?name=<%=rs.getString("username")%>"><%=rs.getString("username")%></a></td>
							<td align="center"><a href="main_checkcon.jsp?name=<%=rs.getString("actno")%>"><%=rs.getString("actno")%></a></td>
							<td align="center"><%=rs.getString("actname")%></td>
							<td align="center"><%=rs.getString("acttype")%></td>
						</tr>
						<%
								rs.next();
								i++;
								}
							}
						%>
					</table>
					<br/>
					<div align="center">
						第<%=intPage%>页 共<%=intPageCount%>页
						<%
							if(intPage<intPageCount){
						%>
						<a href="pagebreak.jsp?page=<%=intPage+1%>">下一页</a>
						<%
							}
							if(intPage>1){%>
						<a href="pagebreak.jsp?page=<%=intPage-1%>">上一页</a>
						<%
							}
							rs.close();
							stmt.close();
							con.close();
						%>
					</div>
			</div>
		</form>
	</body>
</html>