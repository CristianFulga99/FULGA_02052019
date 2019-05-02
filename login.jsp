<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<html>
    <body>
        <%
          String connection = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=fulga.cristian;password=xxx123#";
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          Connection conn = DriverManager.getConnection(connection);
          
          Statement stmt = conn.createStatement();
          
          String sql = "select * from Cittadino where Username ='" + request.getParameter("Username") + "' and Password ='" + request.getParameter("psw")+"'";
          
          ResultSet rs = stmt.executeQuery(sql);
          
          if(rs.next()){
              response.sendRedirect("cancella.html");
          }else{
              out.println("Utente non trovato " + request.getParameter("username")+ " o password sbagliata.");
          }
          
          rs.close();
          
          conn.close();
          %>
          </body>
</html>