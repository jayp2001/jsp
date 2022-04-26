 <%-- 
    Document   : user_home
    Created on : 22 Apr, 2022, 10:44:57 AM
    Author     : Dhruv
--%>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="style/hotelList.css"></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="">
        <div class="nav-bar grid grid-rows-1">
            <div class="grid grid-cols-12 content-center nav">
                <div class="col-span-8 flex justify-start gap-7">
                    <a href="http://localhost:8080/mavenproject1/dashboard.jsp" class="nav-link-active">
                        Home
                    </a>
                    <a class="nav-link">
                        Hotels
                    </a>
                    <a class="nav-link">
                        Review
                    </a>
                </div>
            </div>
        </div>
        <div class="grid">
            <div class="grid grid-rows-1 row_1">
                <div class="grid grid-cols-12 row1-cols mt-20 ml-5 mr-5">
                    <div class="col-start-3 col-span-8 row1-col1">
                        <div class="table_header">
                            Hotels
                        </div>
                         <%
                                Connection conn = Database.getConnection();

                                PreparedStatement pst = conn.prepareStatement("SELECT * FROM hotel ");

                                ResultSet rs = pst.executeQuery();
                                int i=1;
                                while (rs.next()) {
                                    int hotelid=rs.getInt(1);
                            %>
                            
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                                <div class="col-span-1 rows justify-center">
                                    <%=i%>
                                </div>
                                <div class="col-span-1">

                                </div>
                                <div class="col-span-5 rows" style="text-align: left;">
                                    <%=rs.getString(2)%>
                                </div>
                                <div class="col-span-3 rows" style="text-align: left;">
                                    <%=rs.getString(6)%>
                                </div>
                                      <div class="col-span-1 rows view_detalis">
                                            <form action="hotelDetails.jsp" method="post">
                                                <input type="hidden"  name="hotel_id" value=<%=hotelid%>>
                                                <button type="submit">
                                          <i class="fa fa-eye">
                                          </i>
                                                   </button>
                                            </form>
                            </div>  
                            </div>
                            <%
                                i++;
                                }


                            %>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
