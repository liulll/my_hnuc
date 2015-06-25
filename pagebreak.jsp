<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
		<title>分页浏览模板</title>
	</head>
	<body>
		<center>
			<table align="center" border="1" width="800">
				<tr>
					<th width="200" height="80" align="center">志愿记录编号</th>
					<th width="200" height="80" align="center">活动名称</th>
					<th width="200" height="80" align="center">开始时间</th>
					<th width="200" height="80" align="center">结束时间</th>
					<th width="200" height="80" align="center">摘要</th>
					<th width="200" height="80" align="center">状态</th>
				</tr>
				<%
					Connection con=null;
					Statement st=null;
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
					Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					String sql="select * from activityInfo";
					ResultSet rs=stmt.executeQuery(sql);
					rs.last();
					intRowCount=rs.getRow();
					intPageCount=(intRowCount+intPageSize-1)/intPageSize;
					if(intPage>intPageCount)
						intPage=intPageCount;
					if(intPageCount>0){
						rs.absolute((intPage-1)*intPageSize+1);
					i=0;
					while(i<intPageSize && !rs.isAfterLast()){%>
					<tr>
						<td><%=rs.getString("actno")%></td>					
						<td><%=rs.getString("actname")%></td>
						<td><%=rs.getString("stime")%></td>
						<td><%=rs.getString("etime")%></td>
						<td><%=rs.getString("abstrac")%></td>
						<td><a href="*"><%=rs.getString("acttype")%></a></td>					
					</tr>
					<%
							rs.next();
							i++;
							}
						}
					%>
			</table>
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
		</center>
	</body>
</html>