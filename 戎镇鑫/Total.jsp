<%@ page language="java" import="java.util.*,java.text.*,entity.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Statistics of joining activities</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Total.css">

  </head>

  <body>
   <jsp:useBean id="ListStudents" class="entity.StudentList" scope="session"/>
   <table id="nap6" class="napkeeComponent napkeeCanvas">
	<tr>
		<td>序号</td>
		<td><a href="MSoServlet?sort_type=join_time&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">报名时间</a></td>
		<td><a href="MSoServlet?sort_type=student_name&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">姓名</a></td>
		<td><a href="MSoServlet?sort_type=student_id&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">学号</a></td>
		<td><a href="MSoServlet?sort_type=student_phone&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">联系方式</a></td>
		<td><a href="MSoServlet?sort_type=university&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">学校</a></td>
		<td><a href="MSoServlet?sort_type=major&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">学院</a></td>
		<td><a href="MSoServlet?sort_type=sex&activity_name=<jsp:getProperty name="ListStudents" property="activity_name"/>">性别</a></td>
	</tr>
	 <%		
	  	List<Student> studs = ListStudents.getStudents();
	  	List<String> jos = ListStudents.getJoin_time();
	  	int count = 1;
	  	for(int i = 0;i < studs.size();i++) {
	  %>
	 <tr>
	  <td><%=count%></td>
	  <td><%=jos.get(i)%></td>
	  <td><%=studs.get(i).getStudent_name()%></td>
	  <td><%=studs.get(i).getStudent_id()%></td>
	  <td><%=studs.get(i).getStudent_phone()%></td>
	  <td><%=studs.get(i).getStudent_university()%></td>
	  <td><%=studs.get(i).getStudent_college() %></td>
	  <td><%=studs.get(i).getStudent_sex()%></td>
	</tr>	
	  <%
			count++;
		}
	  %>
	</table>
<input id="nap8" class="napkeeComponent napkeeButton btn" type="button" onclick="window.location.href='MInfo.jsp'" value="返回信息页"> 
  </body>
</html>
