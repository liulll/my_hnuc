<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<!--	<link rel="stylesheet" type="text/css" href="css/student_main.css"/>-->
		<link rel="stylesheet" type="text/css" href="css/list.css"/>
		<title>学生页面</title>
	</head>
	<body>
			<div class="center">
				<div class="menu">
					<ul>
						<li><a href="student_main.jsp" class="hide">所有记录</a>
						<ul>					
							<li class="change"><a href="student_main_check.jsp?name=waiting">待审</a></li>
							<li class="change"><a href="student_main_check.jsp?name=passed">已通过</a></li>
						</ul>
						</li>
					</ul>					
				</div>	
				<div class="right">
					<a href="stuadd.jsp" name="add" class="add">新建记录</a>
					<a href="#"  name="delete" class="delete" onclick="openwin()">删除记录</a>
				</div>
			</div>
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
				<%! String no;%>
				<%
					Object username=session.getAttribute("name");
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
					intPageSize=6;
					strPage=request.getParameter("page");
					if(strPage==null){
						intPage=1;
					}
					else{
						intPage=java.lang.Integer.parseInt(strPage);
						if(intPage<1) intPage=1;
					}
					Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					String sql="select * from activityInfo where username='"+username+"'";
					ResultSet rs=stmt.executeQuery(sql);
					rs.last();
					intRowCount=rs.getRow();
					intPageCount=(intRowCount+intPageSize-1)/intPageSize;
					if(intPage>intPageCount)
						intPage=intPageCount;
					if(intPageCount>0){
						rs.absolute((intPage-1)*intPageSize+1);
					i=0;
					while(i<intPageSize && !rs.isAfterLast()){
						no=rs.getString("actno");
					%>
					<tr align="center">
						<td><a href="changecon.jsp?name=<%=no%>"><%=no%></a></td>					
						<td><%=rs.getString("actname")%></td>
						<td><%=rs.getString("stime")%></td>
						<td><%=rs.getString("etime")%></td>
						<td><%=rs.getString("abstrac")%></td>
						<td><%=rs.getString("acttype")%></td>					
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
				<a href="student_main.jsp?page=<%=intPage+1%>">下一页</a>
				<%
					}
					if(intPage>1){%>
				<a href="student_main.jsp?page=<%=intPage-1%>">上一页</a>
				<%
					}
					rs.close();
					stmt.close();
					con.close();
				%>
			</div>
		</center>
	</body>
	<script LANGUAGE="JavaScript"> 
	<!-- 
	function openwin() { window.open ("studelete.jsp", "newwindow", "height=200, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
	//写成一行 
	} 
	//-->                                                          
	</script> 
</html>