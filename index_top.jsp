<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/index_top.css"/>
		<link rel="stylesheet" type="text/css" href="css/list.css"/>
		<title>志愿者信息管理系统_top</title>
		<style type="text/css">
		.change{
			margin-top: -10px;
		}
		</style>
	</head>
	<body>
		<div class="left">
			<a href="http://www.hnuc.edu.cn" target="_blank"><img src="img/home.png"></a>
			<div class="hr_right"></div>			
			<p>志愿者登录系统</p>			
		</div>
		<div class="right">
			<div class="menu">
				<ul>
				<li><a href="" class="hide"><%=session.getAttribute("name")%></a>
				    <ul>
				    <li class="change">
				    	<!--<a href="change.jsp" target="_blank" title="change password">修改密码</a>-->
				    	<a href="#" onclick="openwin()">修改密码</a>
				    </li>
				    </ul>
				</li>
				</ul>
			</div>
			<div class="hr_right"></div>
			<div class="a"><a href="loginout.jsp" target="_top">退出</a></div>
		</div>
	</body>
	<script LANGUAGE="JavaScript"> 
	<!-- 
	function openwin() { window.open ("change.jsp", "newwindow", "height=200, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
	//写成一行 
	} 
	//--> 
	</script> 
</html>