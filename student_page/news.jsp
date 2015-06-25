<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<title>news.jsp</title>
	</head>
	<frameset rows="55px,*" frameborder="no">
		<frame src="../index_top.jsp" name="index_top" scrolling="no" noresize></frame>
		<frameset cols="250px,*">
				<frame src="student_nav.jsp" name="student_nav" scrolling="no" noresize></frame>				
				<frame src="news_content.jsp" name="news_content" scrolling="auto" noresize></frame>
		</frameset>
	</frameset>
	<noframes>
		对不起，您的浏览器版本太低！
	</noframes>
</html>