<%-- 
    Document   : edit_retrice
    Created on : 14-Apr-2022, 3:29:42 pm
    Author     : jayparmar
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.mavenproject1.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("hotel_id");

    Connection conn = Database.getConnection();

    PreparedStatement pst = conn.prepareStatement("SELECT * FROM hotel WHERE id=?");
    pst.setString(1, id);

    JSONObject object = new JSONObject();

    ResultSet rs = pst.executeQuery();

    while (rs.next()) {

        object.put("name", rs.getString("name"));
        object.put("address", rs.getString("address"));
        object.put("contact_num", rs.getString("contact_num"));
        object.put("details", rs.getString("details"));

        Blob blob = rs.getBlob("image");

        InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

        inputStream.close();
        outputStream.close();
        
        object.put("image", base64Image);
    }

    response.setContentType("application/json");

    response.getWriter().write(object.toString());
    response.getWriter().flush();
    response.getWriter().close();


%>
