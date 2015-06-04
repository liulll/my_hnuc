<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/index_form.css"/>
		<title>志愿者信息管理系统_form</title>
	</head>
	<body>
		<div class="center">
			<div class="left">
				<img src="img/hnuc.jpg">
				<div class="left_content">
						<h3>优秀的志愿者，商院以你为荣！</h3>
						<h5>
						<span class="text">以小我的真诚</span><br>
						<span class="text">还原人之向善进取的精神</span><br>
						<span class="text">以小我的行动</span><br>
						<span class="text">诠释人之美好希冀的愿望</span><br>
						</h5>
				</div>
			</div>
			<div class="right"> 
				<tr>
					<td><h2>系统登录</h2></td>
				</tr>
				<div class="hr_solid"></div>
				<div class="hr_dashed"></div>
				<form method="post" action="indexcheck.jsp">
					<tr>
						<br>
						<select name="usertype" size="1">
							<option name="manager">管理员</option>
							<option name="teacher">教师</option>
							<option name="student">学生</option>
						</select>
						<br>
						<input name="username" class="wtext" type="text" size="26" value="请输入用户名"/>
						<br>
						<input name="userpass" class="wtext" type="password" size="26"/>
						<br>
						<input type="submit" name="sub" class="sub" value="登录" />
						<a href="http://www.hnuc.edu.cn" target="_blank">湖南商学院</a>
						<br>
					</tr>
				</form>
						<div class="hr_dashed"></div>
						<div class="hr_solid"></div>
			</div>
		</div>	
	</body>
</html>