<%-- 
    Document   : delete
    Created on : 14-Apr-2022, 1:26:06 pm
    Author     : jayparmar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.mavenproject1.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String id = request.getParameter("id");
           
           out.print(id);
           
           Connection conn = Database.getConnection();
           
             PreparedStatement pst = conn.prepareStatement("DELETE FROM hotel WHERE id=?");
             pst.setString(1, id);
             
             pst.executeUpdate();
             
            
            response.sendRedirect("dashboard.jsp");
        
           
       %>
    </body>
</html>
