<%@ page language="java" import="java.util.*,java.text.*,entity.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Manager(Club) Information</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/MInfo.css">


  </head>
  <body>
  <div class="linear"></div>
    <jsp:useBean id="regManager" class="entity.Manager" scope="session"/>
	<h1 id="nap0" class="napkeeComponent napkeeParagraph">Welcome&nbsp;<jsp:getProperty name="regManager" property="club_name"/>管理者大人</h1>
	<table id="nap6" class="napkeeComponent napkeeCanvas">
		<tr>
			<td>社团名称</td>
			<td> <jsp:getProperty name="regManager" property="club_name"/> </td>
		</tr>

		<tr>
		<td>社团信息</td>
		<td><jsp:getProperty name="regManager" property="club_describe"/></td>
		</tr>
		<tr>
			<td>类型</td>
			<td>
			  <%		  
			  	String[] types = regManager.getClub_type();
			  	if(types!=null)
			  	{
			  	for(String t:types)
			  	{
			  	
			  %>
			   	<a><%=t%>&nbsp;</a>
			  <%
				}}
			  %>
			</td>
		</tr>		
</table>
	<div  id="nap7" class="napkeeComponent napkeeCanvas">
	<% 
		request.setCharacterEncoding("utf-8");
	%>
	贵社团所举办的活动：<br>
		<table>
	 <%		 //缺活动详情***************************************************************************** 
	  	List<String> activities = regManager.getHold_activities();
	  	for(String a:activities)
	  	{
	  		System.out.println(a);
	  %>
	  	
	  	<tr>
	  	<td>
	 		 <a href="MADInfoServlet?activity_name=<%=a%>"><%=a%></a>
	 	</td>
		</tr>
		
	  <%
		}
	  %>		
	</table>

	  </div>
		
	
	
	<input id="nap8" type="button" class="napkeeComponent napkeeButton btn" onclick="window.location.href='MPublish.jsp'" value="发布一个新活动"> 
	<input type="button" id="nap9" class="napkeeComponent napkeeButton btn" onclick="window.location.href='index.jsp'" value="退出"> 
  </body>
</html>
