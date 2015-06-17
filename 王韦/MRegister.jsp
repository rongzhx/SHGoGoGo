<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Register a club</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/MRegister.css">
	

  </head>
  <body>
  <div class="linear"></div>
    <h1 id="nap1" class="napkeeComponent napkeeLabel">欢迎您的社团加入社活GOGOGO!</h1>
	<form action="MRegServlet" method="post">
		<table id="nap4" class="napkeeComponent napkeeLabel ">
		<tr>
			<td>社团名称:</td>
			<td> <input type="text" name="club_name" /> </td>
		</tr>
		<tr>
			<td>密码:</td>
			<td> <input type="password" name="manager_password" /></td>
		</tr>
		<tr>
			<td>社团简介：</td>
			<td><textarea name="club_describe"></textarea></td>
		</tr>
		<tr>
			<td>社团Logo：</td>
			<td><input type="text" name="club_icon"/></td>
		</tr>
		<tr>
		    <td>社团类型：</td>
			<td><input name="club_type" type="checkbox" value="学术"/>学术
			<input name="club_type" type="checkbox" value="体育"/>体育
			<input name="club_type" type="checkbox" value="公益"/>公益
			<input name="club_type" type="checkbox" value="其他"/>其他</td>
		</tr>
		</table>
		<input id="nap20" class="napkeeComponent napkeeButton btn" type="submit" value="确定"/>
	</form>
	

	<a id="nap21" class="napkeeComponent napkeeButton btn" href="index.jsp">已有账号，直接登录</a>
  </body>
</html>
