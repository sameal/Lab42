<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import = "java.sql.*"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
  <%@ page  import="java.sql.*"  %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加书籍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    添加书籍： <br>
    <%
    	String isbn = request.getParameter("ISBN");
    	String title = request.getParameter("Title");
    	String authorid = request.getParameter("AuthorID");
    	String publisher = request.getParameter("Publisher");
    	String publishdate = request.getParameter("Publishdate");
    	String price = request.getParameter("Price");
    	try {
		     Class.forName("com.mysql.jdbc.Driver");
		     System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		    } 
	    try {     
		     String sql = "";
		     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","123456");
		     System.out.println("Success connect Mysql server!");
		     Statement stmt = connect.createStatement();
		     stmt.executeUpdate("insert into book values(\"" +isbn+ "\",'',\"" +authorid+ "\",'','','')");
		     sql = "update book set title = \"" +title+ "\" ,  Publisher =  \"" +publisher+ "\", Publishdate =  \"" +publishdate+ "\", Price =  \"" +price+ "\" where ISBN = \"" +isbn+ "\"";
		     stmt.executeUpdate(sql);
		     out.print("已添加。");
		 	 }catch (Exception e) {
		        System.out.print("get data error!");
		        e.printStackTrace();
		        out.print("error.");
		    } 
     %>
  </body>
</html>
