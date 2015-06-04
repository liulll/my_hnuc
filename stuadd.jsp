<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/stuadd.css"/>
		<title>学生页面</title>
	</head>
	<body>
		<div class="center"> 
				<tr>
					<td><h2>志愿者活动详情记录</h2></td>
				</tr>
				<form method="post" action="stuaddcheck.jsp">
				<table border="0">
					<tr class="s_topic">
						<td>活动名称:</td>
						<td><input class="short" type="text" name="actname" /></td>
					</tr>
					<tr class="s_topic">
						<td>组织单位:</td>
						<td><input type="text" class="short" name="company" /></td>
					</tr>
					<tr class="s_topic">
						<td>参与时间:</td>
						<td><input type="text" name="time" class="short" value="YYYY年Y月~YYYY年Y月" /></td>
					</tr>
					<tr class="s_topic">
						<td>担任职责:</td>
						<td><input type="text" name="job" class="short" /></td>
					</tr>
					<tr class="l_topic">
						<td>参与情况重点摘要：(50字以内)</td>
					</tr>
					<tr class="l_topic">
						<td><input type="text" maxlength="55" name="important_con" class="long1" /></td>
					</tr>
					<tr class="l_topic">
						<td>参与具体内容:(不少于100字)</td>
					</tr>
					<tr>
						<td><textarea name="con" rows="5" wrap="soft"></textarea></td>
					</tr>
					<tr class="l_topic">
						<td>上传附件：(请上传带组织单位章的证明材料)</td>
					</tr>
					<tr>
						<td><input type="text" name="file" class="file" /></td>
						<td><input type="submit" name="up" value="上传" class="up" /></td>
					</tr>
					<tr class="l_topic">
						<td colspan="2">
							<input name="sure" type="submit" value="确认" class="sure" />
							<input name="clear" type="reset" value="重置"class="clear"/>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</body>
</html>
