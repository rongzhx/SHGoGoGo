<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Publish_Activity</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	 <link rel="stylesheet" type="text/css" href="css/MPublish.css"/>
	</head>
	
<body>
<div class="linear">
	<h1 id="nap1" class="napkeeComponent napkeeLabel">Welcome 
		<jsp:useBean id="regManager" class="entity.Manager" scope="session"/>
		&nbsp;<jsp:getProperty name="regManager" property="club_name"/>管理者大人<br>

	请按要求填写下列表格，以发布活动</h1>
	<form action="ARegServlet" method="post">
		<table id="nap4" class="napkeeComponent napkeeLabel ">				
		<tr>
		<td>活动名称:</td>
		<td> <input type="text" name="activity_name" /></td>
		</tr>
	<!--	<ebctype = multipart/form-data method = post>  -->
		<tr>
			<td>活动描述</td>
			<td><textarea name="activity_describe"></textarea></td>
		</tr>
		<tr>
			<td>活动地点</td>
			<td><input type="text" name="activity_location" /></td>
		</tr>
		<tr>
		<td>活动海报:</td>
		<td><input type="text" name="activity_poster" /></td>
		<!-- <input type="image" src="Sophia.jpg" name="activity_img"/></td> -->
		<!-- <td><input type = "file" name = "tetttt"></td> -->
		</tr>
		<tr>
		    <td>活动类型：</td>
			<td><input name="activity_type" type="checkbox" value="学术"/>学术
			<input name="activity_type" type="checkbox" value="体育"/>体育
			<input name="activity_type" type="checkbox" value="公益"/>公益
			<input name="activity_type" type="checkbox" value="游戏"/>游戏
			<input name="activity_type" type="checkbox" value="舞蹈"/>舞蹈
			<input name="activity_type" type="checkbox" value="科技"/>科技
			<input name="activity_type" type="checkbox" value="其他"/>其他</td>
		</tr>
		<tr>
		<td>报名开始时间:</td>
		<td><input type="datetime-local" name="start_time" /></td>
		</tr>
		<tr>
		<td>报名截止时间:</td>
		<td><input type="datetime-local" name="end_time" /></td>
		</tr>
		</table>
		<input name="club_name" type="hidden" value=<jsp:getProperty name="regManager" property="club_name"/> />
		<input id="nap20" class="napkeeComponent napkeeButton btn" type="submit" value="发布" />
	</form>
	</div>
</body>
</html>
	