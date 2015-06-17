<%@ page language="java" import="java.util.*,java.text.*,entity.Activity" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>List of Activities</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/AInfo.css">

  </head>
  
  <body>
  <div class="linear"></div>
    <jsp:useBean id="ListActivities" class="entity.ActivityList" scope="session"/>
    <!-- <img src="http://images.china.cn/attachement/jpg/site1000/20150613/001ec949fb2316e5b19d54.jpg" width="80" height="60"> -->
   
  
	<h1 id="nap0" class="napkeeComponent napkeeParagraph">当前正在进行的社团活动</h1>
	<table id="nap6" class="napkeeComponent napkeeCanvas">
	<tr>
	  	<td><a href="SoServlet?sort_type=activity_name">活动名称</a></td>
		<td>活动海报</td>
		<td><a href="SoServlet?sort_type=start_time">报名开始时间</a></td>
		<td><a href="SoServlet?sort_type=end_time">报名截止时间</a></td>
		<td><a href="SoServlet?sort_type=club_name">活动组织者</a></td>
		<td><a href="SoServlet?sort_type=activity_type">活动类型</a></td>
		<td>查看详情</td>
	</tr>
	 <%		 //缺活动详情***************************************************************************** 
	  	List<Activity> activities = ListActivities.getActivities();
	  	for(Activity a:activities)
	  	{
	  	
	  %>
	  	
	  	<tr>
	  	
	  	<td><a >&nbsp;<%=a.getActivity_name()%> </a></td>
	  	<td><img src=<%=a.getActivity_poster()%> width="80" height="60"></td>
	  	<td><%=a.getStart_time()%></td>
	  	<td><%=a.getEnd_time() %></td>
	  	<td><%=a.getOrganized_club() %></td>
	  	<td>
	  		<%String[] types = a.getActivity_type();
	  		  for(String t:types)
	  		  {
	  		%>
	  		<%=t%>&nbsp;
	  		<%}
	  		%>
	  	</td>
	  	<td>
	  	<form action="ADInfoServlet">
	  	<input name="activity_name" type="hidden" value=<%=a.getActivity_name()%> />
	  	<input name="Submit" type="submit" value="查看详情" >
	  	</form>
	  	</td>
		</tr>
		
	  <%
		}
	  %>		
	</table>
  </body>
</html>
