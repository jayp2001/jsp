<%-- 
    Document   : edit_hotel_details.jsp
    Created on : 14-Apr-2022, 4:08:43 pm
    Author     : jayparmar
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.mavenproject1.Database"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String hotel_name = request.getParameter("hotel_name");
    String hotel_address = request.getParameter("hotel_address");
    String hotel_contact = request.getParameter("hotel_contact");
    String hotel_details = request.getParameter("hotel_details");
    String hotel_id = request.getParameter("hotel_id");
    Part filePart = request.getPart("hotel_img");
    InputStream inputStream = null;
    if (filePart != null) {
        // prints out some information for debugging
        System.out.println(filePart.getName());
        System.out.println(filePart.getSize());
        System.out.println(filePart.getContentType());

        // obtains input stream of the upload file
        inputStream = filePart.getInputStream();
    }

    Connection conn = Database.getConnection();
    PreparedStatement pst = conn.prepareStatement("UPDATE hotel set name=? , address=? , contact_num=?, details=?,image=? WHERE id=?");

//    if (inputStream != null) {
        // fetches input stream of the upload file for the blob column
        pst.setString(1, hotel_name);
        pst.setString(2, hotel_address);
        pst.setString(3, hotel_contact);
        pst.setString(4, hotel_details);
        pst.setBlob(5, inputStream);
        pst.setString(6, hotel_id);
//    }

    pst.executeUpdate();

//    response.sendRedirect("dashboard.jsp");


%>