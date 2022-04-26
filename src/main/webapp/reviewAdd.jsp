
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.mavenproject1.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int sessionid=(int)session.getAttribute("id");
if(sessionid==1){%>
<jsp:forward page="dashboard.jsp"/>
<%}
if(sessionid!=0&&sessionid!=1){
%>
<jsp:forward page="index.html"/>
<%}%>

<%
    String name=request.getParameter("user");
    String description=request.getParameter("description");
    String rating=request.getParameter("rating");
  int hotelid=Integer.parseInt(request.getParameter("submit"));
  
                                Connection conn = Database.getConnection();

                                PreparedStatement pst = conn.prepareStatement("Insert into reviews (user,review,rating,hotel_id) values(?,?,?,?)");
                                pst.setString(1,name);
                                pst.setString(2,description);
                                pst.setString(3,rating);
                                pst.setInt(4,hotelid);
                              pst.executeUpdate();
                              conn.close();%>
                                 <script>
            alert("Review Added Successfully");
            window.location.href = "http://localhost:8080/mavenproject1/addReview.jsp?hotel_id="+<%=hotelid%>;
        </script>
        
                               
                                
