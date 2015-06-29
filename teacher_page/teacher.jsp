<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<title>教师页面</title>
	</head>
		<frameset rows="55px,*" frameborder="no">
			<frame src="../index_top.jsp" name="index_top" scrolling="no" noresize></frame>
			<frameset cols="250px,*" frameborder="no">
				<frame src="teacher_nav.jsp" name="teacher_nav" scrolling="no" noresize></frame>
				<frame src="teacher_main.jsp" name="teacher_main" scrolling="yes" noresize></frame>
			</frameset>
	<noframes>
		对不起，您的浏览器版本太低！
	</noframes>
</html>