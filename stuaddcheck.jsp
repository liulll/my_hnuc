<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/student_main.css"/>
		<title>学生页面</title>
	</head>
	<body>
		<div class="right"> 
				<tr>
					<td><h2>志愿者活动详情记录</h2></td>
				</tr>
				<form method="post" action="stuaddcheck.jsp">
					<tr>
						<td>活动名称:</td>
						<td><input type="text" name="actname" /></td>
					</tr>
					<tr>
						<td>组织单位:</td>
						<td><input type="text" name="company" /></td>
					</tr>
					<tr>
						<td>参与时间：</td>
						<td><input type="text" name="time" /></td>
						<p>(请以YYYY年Y月~YYYY年Y月的格式输入)</p>
					</tr>
					<tr>
						<td>担任职责：</td>
						<td><input type="text" name="job" /></td>
					</tr>
					<tr>
						<td>参与情况重点摘要：(50字以内)</td>
						<br>
						<td><input type="textarea" name="important_con"/></td>
					</tr>
					<tr>
						<td>参与具体内容:(不少于100字)</td>
						<br>
						<td><input type="textarea" name="con" /></td>
					</tr>
					<tr>
						<td>上传附件：(请上传带组织单位章的证明材料)</td>
						<td><input type="text" name="file" /></td>
						<td><input type="submit" name="up" value="上传" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="sure" type="submit" value="确认" />
							<input name="clear" type="reset" value="重置"/>
						</td>
					</tr>
				</form>
		</div>
	</body>
</html>
