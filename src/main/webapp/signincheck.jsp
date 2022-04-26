<%-- 
    Document   : singincheck
    Created on : 14-Apr-2022, 12:31:01 pm
    Author     : jayparmar
--%>

<%@page import="java.sql.ResultSet"%>
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            try{
                Connection conn = Database.getConnection();
                
                PreparedStatement pst = conn.prepareStatement("SELECT * FROM USER WHERE uname=? and password=?");
                pst.setString(1, username);
                pst.setString(2, password);
                
                ResultSet rs = pst.executeQuery();
                
                if(rs.next()){
                    
                    session.setAttribute("id" , rs.getInt(6));
                   session.setAttribute("name",rs.getString(1));
                    response.sendRedirect("dashboard.jsp");
                }
                else{%>
                    <script>
            alert("Invalid Credentials");
            window.location.href ="http://localhost:8080/mavenproject1/";
        </script>
               <% }
            }catch(Exception e){
                out.print(e);
            }

            %>
    </body>
</html>
