<%@ page language="java" import="java.util.*,java.text.*,entity.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Student Information</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/SInfo.css">

  </head>
  
  <body>
  <div class="linear"></div>
    <jsp:useBean id="regStudent" class="entity.Student" scope="session"/>
	<h1 id="nap0" class="napkeeComponent napkeeParagraph">Hi &nbsp;Dear <jsp:getProperty name="regStudent" property="student_nickname"/>
	 &nbsp;小伙伴</h1>
	<table id="nap6" class="napkeeComponent napkeeCanvas">
		<tr>
			<td>真实姓名</td>
			<td><jsp:getProperty name="regStudent" property="student_name"/></td>
		</tr>
		<tr>
			<td>学号:</td>
			<td><jsp:getProperty name="regStudent" property="student_id"/> </td>
		</tr>
		<tr>
			<td>联系方式:</td>
			<td><jsp:getProperty name="regStudent" property="student_phone"/></td>
		</tr>		
		<tr>
			<td>所在学校:</td>
			<td><jsp:getProperty name="regStudent" property="student_university"/></td>
		</tr>
		<tr>
			<td>填写所在学院:</td>
			<td><jsp:getProperty name="regStudent" property="student_college"/></td>
		</tr>
		<tr>
			<td>性别:</td>
			<td><jsp:getProperty name="regStudent" property="student_sex"/></td>
		</tr>
	</table>
	<div  id="nap7" class="napkeeComponent napkeeCanvas">
	 您已踏足的活动：<br>
	<table id="nap2" class="napkeeComponent napkeeCanvas">
	  <% 
	  	List<String> activities = regStudent.getJoin_activities();
	  	for(String a:activities)
	  	{
	  	
	  %>

	  	<tr>
	  	<td>
		  	 <a href="ADInfoServlet?activity_name=<%=a%>"><%=a%></a>
		</td>
		</tr>   
	  <%
		}
	  %>		
		</table>	
		</div>

		<input type="button" id="nap8" class="napkeeComponent napkeeButton btn" onclick="window.location.href='AInfoServlet'" value="去浏览正在进行的活动"> 
		<input type="button" id="nap9" class="napkeeComponent napkeeButton btn" onclick="window.location.href='index.jsp'" value="退出"> 
  </body>
</html>
