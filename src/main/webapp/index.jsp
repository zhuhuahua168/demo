<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HPE University Docker&Kubernetes Learning</title>
</head>
<body  align="center">

	<%   
java.sql.Connection conn=null;   
java.lang.String strConn;   
java.sql.Statement stmt=null;
java.sql.ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();   
try{
      Class.forName("com.mysql.jdbc.Driver");
       String ip=System.getenv("MYSQL_SERVICE_HOST");
       String port=System.getenv("MYSQL_SERVICE_PORT");
       String user = System.getenv("MYSQL_USER");
       String password = System.getenv("MYSQL_PASSWORD");
       ip=(ip==null)?"192.168.13.13":ip;
       port=(port==null)?"3306":port;
       user=(user==null)?"root":user;
       password=(password==null)?"123456":password;
      System.out.println("Connecting to database...");

      conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+ip+":"+port+"?useUnicode=true&characterEncoding=UTF-8", user,password);
      
      stmt = conn.createStatement();
      String sql = "show databases like 'HPE_APP'";
      rs =stmt.executeQuery(sql);
    if(!rs.next())
    {
      sql = "CREATE DATABASE HPE_APP DEFAULT CHARSET utf8 COLLATE utf8_general_ci";
      stmt.executeUpdate(sql);
      System.out.println("Database created successfully...");
      sql = "CREATE TABLE HPE_APP.T_USERS (ID INT NOT NULL AUTO_INCREMENT ,   USER_NAME VARCHAR(100),   LEVEL VARCHAR(20), PRIMARY KEY ( ID ))";
      stmt.executeUpdate(sql);
       System.out.println("table created successfully...");
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('me','100')";
      stmt.executeUpdate(sql);
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('our team','100')";
      stmt.executeUpdate(sql);
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('HPE','100')";
      stmt.executeUpdate(sql);
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('teacher','100')";
      stmt.executeUpdate(sql);
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('docker','100')";
      stmt.executeUpdate(sql);
      sql="insert into HPE_APP.T_USERS(USER_NAME,LEVEL) values('google','100')";
      stmt.executeUpdate(sql);
       System.out.println("demo records inserted successfully...");
      }
      %>
      <h2>测试tcsp版本1.0!</h2>
     <br></br>
	 <input type="button" value="Add..." onclick="location.href='input.html'" >
	     <br></br>
      <TABLE align="center"  border="1" width="600px">
   <TR>
      <TD>Name</TD>
      <TD>Level(Score)</TD>
   </TR>

      <%
      rs = stmt.executeQuery("SELECT * FROM  HPE_APP.T_USERS order by id desc");

    while(rs.next()) {
    System.out.println("find record");
%>
 <TR>
      <TD><%= rs.getString("USER_NAME") %></TD>
      <TD><%= rs.getString("LEVEL") %></TD>
   </TR>
<%   
    }
    %>
  </TABLE>
    <% 
      
   }catch(Exception se){
   se.printStackTrace();
   %>
   
  <h3> Error:<%= se %></h3>
   <%
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(Exception se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(Exception se){
         se.printStackTrace();
      }//end finally try
   }//end try
   
   System.out.println("Goodbye!");
   %>  
</body>
</html>
