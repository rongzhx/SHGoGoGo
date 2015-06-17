<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Activity Information</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/ADInfo.css">

  </head>
  
  <body>
  <div class="linear"></div>
	<jsp:useBean id="regActivity" class="entity.Activity" scope="session"/>
	<h1 id="nap0" class="napkeeComponent napkeeParagraph">社团活动之&nbsp;<jsp:getProperty name="regActivity" property="activity_name"/>&nbsp;活动详情</h1>
		<table id="nap6" class="napkeeComponent napkeeCanvas">			
		<tr>
			<td>活动描述</td>
			<td><jsp:getProperty name="regActivity" property="activity_describe"/></td>
		</tr>
		<tr>
			<td>活动地点</td>
			<td><jsp:getProperty name="regActivity" property="activity_location"/></td>
		</tr>
		<tr>
		<td>活动海报:</td>
		<%String poster = regActivity.getActivity_poster(); %>
		<td><img src=<%=poster%> width="80" height="60"></td>
		<!-- <input type="image" src="Sophia.jpg" name="activity_img"/></td> -->
		<!-- <td><input type = "file" name = "tetttt"></td> -->
		</tr>
		<tr>
		<td>报名开始时间:</td>
		<td><jsp:getProperty name="regActivity" property="start_time"/></td>
		</tr>
		<tr>
		<td>报名截止时间:</td>
		<td><jsp:getProperty name="regActivity" property="end_time"/></td>
		</tr>
		<tr>
		<td>已报名人数:</td>
		<td><jsp:getProperty name="regActivity" property="join_number"/></td>
		</tr>
		</table>
		
		<jsp:useBean id="regStudent" class="entity.Student" scope="session"/>
		<%String student_nickname = regStudent.getStudent_nickname(); %>
		<form action="SParServlet"> 
			<input name="student_nickname" type="hidden" value=<%=student_nickname%> />
			<input name="activity_name" type="hidden" value=<jsp:getProperty name="regActivity" property="activity_name"/> />
            <input id="nap7" class="napkeeComponent napkeeButton btn" name="Submit" type="submit" value="立即报名" />
		</form>

	 
	<br>
	
	<input id="nap8" class="napkeeComponent napkeeButton btn" type="button" onclick="window.location.href='AInfoServlet'" value="返回查看其它活动"> 
  </body>
</html>
