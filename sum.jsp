<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>书籍查询</title>
  </head>
  	
  <body>
   	  书籍查询：
          <br/>
          <form action="<%=basePath%>Lab23/sum.action" >
          		作者名字：               
              	<input type = "text" name = "AuthorName">                 
              	<input type = "submit" value="查询">               
          </form>
          <form action="<%=basePath%>Add.jsp" >                       
      <br><br>          
                 录入数据<br>
    <td>ISBN码:<input type = "text" name = "ISBN"><br></td>
    <td>标      题 :<input type = "text" name = "Title"><br></td>
    <td>作者ID:<input type = "text" name = "AuthorID">(只支持已存在作者)<br></td>
    <td>出版社:<input type = "text" name = "Publisher"><br></td>
    <td>出版日:<input type = "text" name = "Publishdate"><br></td>
    <td>价      格 :<input type = "text" name = "Price"><br></td>
                <input type = "submit" value="添加书籍">      
     	  </form>
  </body>
</html>
