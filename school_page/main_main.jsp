<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/list.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/student_main.css"/>-->
		<title>老师页面</title>
	</head>
	<body>
		<%! 
			String academy;
			String username;
		%>
		<form action="main_maincheck.jsp" method="post">
			<div class="center">
			<br/>
			<br/>
			<br/>
			<br/>
					<table align="center" border="1" width="800">
						<tr>
							<!--<th width="200" height="80" align="center">志愿记录编号</th>-->
							<th width="200" height="80" align="center">所属班级</th>
							<th width="200" height="80" align="center">学生学号</th>
							<th width="200" height="80" align="center">学生姓名</th>
							<th width="200" height="80" align="center">入学年份</th>
						</tr>
						<%
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
							String sql1="select * from stuInfo";
							rs=st.executeQuery(sql1);
							rs.last();
							intRowCount=rs.getRow();
							intPageCount=(intRowCount+intPageSize-1)/intPageSize;
							if(intPage>intPageCount)
								intPage=intPageCount;
							if(intPageCount>0){
								rs.absolute((intPage-1)*intPageSize+1);
							i=0;
							while(i<intPageSize && !rs.isAfterLast()){
								username=rs.getString("username");
						%>
						<tr>
							<td align="center"><%=rs.getString("userclass")%></td>
							<td align="center"><a href="main_main_inner.jsp?name=<%=username%>"><%=username%></a></td>
							<td align="center"><%=rs.getString("stuname")%></td>
							<td align="center"><%=rs.getString("stuyear")%></td>
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
							st.close();
							con.close();
						%>
					</div>
			</div>
		</form>
	</body>
	</script> 
</html>