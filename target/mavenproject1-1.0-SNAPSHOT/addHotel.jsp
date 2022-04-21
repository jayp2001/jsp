<%-- 
    Document   : addHotel
    Created on : 15-Apr-2022, 9:03:06 pm
    Author     : jayparmar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream"%>
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
    String hotel_name = request.getParameter("hotel_name");
    String hotel_address = request.getParameter("hotel_address");
    String hotel_contact = request.getParameter("hotel_contact");
    String hotel_details = request.getParameter("hotel_details");
    String country = request.getParameter("country");
    String email = request.getParameter("email");
//    Part filePart = request.getPart("hotel_img");
//    InputStream inputStream = null;
//    if (filePart != null) {
//        // prints out some information for debugging
//        System.out.println(filePart.getName());
//        System.out.println(filePart.getSize());
//        System.out.println(filePart.getContentType());
//
//        // obtains input stream of the upload file
//        inputStream = filePart.getInputStream();
//    }

    Connection conn = Database.getConnection();
    PreparedStatement pst = conn.prepareStatement("INSERT INTO hotel (name,address,contact_num,details,country,email) VALUES (?,?,?,?,?,?)");

//    if (inputStream != null) {
        // fetches input stream of the upload file for the blob column
        pst.setString(1, hotel_name);
        pst.setString(2, hotel_address);
        pst.setString(3, hotel_contact);
        pst.setString(4, hotel_details);
        pst.setString(5, country);
        pst.setString(6, email);
//    }

    pst.executeUpdate();

    response.sendRedirect("dashboard.jsp");


       %>
    </body>
</html>
