<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Register as a student</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/SRegister.css">


  </head>
  <body>
  <div class="linear"></div>
    <form action="SRegServlet" method="post">
		<table id="nap6" class="napkeeComponent napkeeCanvas">
		<tr>
			<td>设置昵称(唯一):</td>
			<td> <input type="text" name="student_nickname" /> </td>
		</tr>
		<tr>
			<td>真实姓名:</td>
			<td> <input type="text" name="student_name" /> </td>
		</tr>
		<tr>
			<td>学号:</td>
			<td> <input type="text" name="student_id" /> </td>
		</tr>
		<tr>
			<td>密码:</td>
			<td> <input type="password" name="student_password" /></td>
		</tr>
		<tr>
			<td>联系方式:</td>
			<td> <input type="text" name="student_phone" /></td>
		</tr>		
		<tr>
			<td>选择所在学校:</td>
			<td><select name="student_university">
 			<option value="中山大学">中山大学</option>
  			<option value="广州大学">广州大学</option>
  			<option value="华南理工大学">华南理工大学</option>
  			<option value="其他">其他</option>
			</select></td>
		</tr>
		<tr>
			<td>选择所在学院:</td>
			<td><select name="student_college">
 			<option value="软件学院">软件学院</option>
  			<option value="环境学院">环境学院</option>
  			<option value="中山医">中山医</option>
  			<option value="信科院">信科院</option>
  			<option value="工学院">工学院</option>
  			<option value="管理学院">管理学院</option>
  			<option value="传设院">传设院</option>
  			<option value="资管">资管</option>
  			<option value="其他">其他</option>
			</select></td>
		</tr>
		<tr>
			<td>性别:</td>
			<td>男<input type="radio" checked="checked" name="student_sex" value="男"/>
			女<input type="radio" name="student_sex" value="女"/></td>
		</tr>
		</table>
		<input id="nap7" class="napkeeComponent napkeeButton btn" type="submit" value="确定提交"/>
	</form>
	

	<a id="nap9" class="napkeeComponent" href="index.jsp">已有账号，直接登录</a>
  </body>
</html>
