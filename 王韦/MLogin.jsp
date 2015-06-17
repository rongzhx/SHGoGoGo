<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


	<head>
		<title>Manager Login</title>
		<link href="css/Mlogin.css" type="text/css" rel="stylesheet" />	
	</head>
<body>
	<div class="linear"></div>
	<div id="nap0" class="napkeeComponent napkeeParagraph" cellspacing="0" cellpadding="0">请您登陆以进行相关社团活动的管理<br/></div>
	<form action="MLoginServlet" method="post">
		<table id="nap6" class="napkeeComponent napkeeCanvas" cellspacing="0" cellpadding="0">
		<tr>
			<td>用户名</td>
			<td> <input type="text" value=""  name="club_name" /> </td>
		</tr>
		<tr>
			<td>密码</td>
			<td> <input type="password" name="manager_password" /></td>
		</tr>
		</table>
		<input id="nap7" class="napkeeComponent napkeeButton btn" type="submit" value="登录"/>
	</form>
	<form action="SLogin.jsp">
		<input id="nap8" class="napkeeComponent napkeeButton btn" type="submit" value="转去学生登录"/>
	</form>
	<a id="nap9" class="napkeeComponent" href="Register.jsp">没有账号，去注册</a>
	</form>
  </body>
</html>
