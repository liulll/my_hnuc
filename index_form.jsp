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
				<form method="post" action="indexcheck.jsp" target="_top">
					<table>
					<tr>
						<td><p class="pname">用户类型&nbsp;：</p></td>
						<td>
						<select name="usertype" size="1">
							<option value="user">user</option>
							<option value="admin">admin</option>
							<option value="school">shcool</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>
						<p class="pname">用&nbsp; 户 &nbsp;名：</p>
						</td>
						<td>
						<input name="username" class="wtext" type="text" size="26" />
						</td>
					</tr>
					<tr>
						<td>
						<p class="pname">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</p>
						</td>
						<td>
						<input name="userpass" class="wtext" type="password" size="26"/>
						</td>
					</tr>
					<tr>
						<td>
						<input type="submit" name="sub" class="sub" value="登录" />
						</td>
						<td>
						<a href="http://www.hnuc.edu.cn" target="_blank">湖南商学院</a>
						</td>
					</tr>
					</table>
				</form>
						<div class="hr_dashed"></div>
						<div class="hr_solid"></div>
			</div>
		</div>	
	</body>
</html>