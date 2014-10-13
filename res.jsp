<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import = "java.sql.*"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
  <%@ page  import="java.sql.*"  %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
  <html>
    <head>
      <title>查询结果：</title>
    </head>
    
    <body>    
      此作者所著书籍：
    <h3>
	</h3> 
	<%
		
		String authorname;
		authorname = request.getParameter("AuthorName");
		out.print("作者："+authorname+"<br>");
		try {
		      Class.forName("com.mysql.jdbc.Driver");
		     System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		    }
		try {
		  String ID = "";
		  String sql = "";
	      Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","123456");
	      Statement stmt = connect.createStatement();
	      sql = "select *from author where name =\""+ authorname + "\"";
	      ResultSet rs1 = stmt.executeQuery(sql);
	      while(rs1.next()){
	      	ID=rs1.getString(1);
	      	}
	      
	      sql = "select *from book where AuthorID = \"" +ID+ "\"";
	      out.print("ID号："+ID+"<br>"+"<br>");
	      rs1 = stmt.executeQuery(sql);
	    	while (rs1.next()) {
		        out.print("书   名："+rs1.getString(2)+"<br>"+"ISBN :"+rs1.getString(1)+"<br>"+"出版社 ："+rs1.getString(4)+"<br>"+"出版日期："+rs1.getString(5)+"<br>"+"<br>");
		    }
	    }catch (Exception e) {
	      out.print("get data error!");
	      e.printStackTrace();
	     }
	 %>
     <form action="<%=basePath%>delet.jsp" >                       
           <input type = "submit" value="删除此作者书籍(ISBN)">
           <input type = "text" name = "Delet">                
     </form>
     <form action="<%=basePath%>Add.jsp" >                       
    <br><br>       
           录入数据<br>
    <td>ISBN码:<input type = "text" name = "ISBN"><br></td>
    <td>标      题 :<input type = "text" name = "Title"><br></td>
    <td>作者ID:<input type = "text" name = "AuthorID">(只支持已存在作者,ID：00000000-00000002之间)<br></td>
    <td>出版社:<input type = "text" name = "Publisher"><br></td>
    <td>出版日:<input type = "text" name = "Publishdate"><br></td>
    <td>价      格 :<input type = "text" name = "Price"><br></td> 
           <input type = "submit" value="添加书籍">        
     </form>
    </body>
  </html> 
