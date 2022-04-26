
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
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="style/hotelDetails.css"></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family' rel='stylesheet'>

        <!-- test -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div>
        <div class="navi-bar grid grid-rows-1">
            <div class="grid grid-cols-12 content-center navi">
                <div class="col-span-8 flex justify-start gap-7">
                    <a href="#" class="navi-link">
                        Home
                    </a>
                    <a class="navi-link-active">
                        Hotel
                    </a>
                    <a class="navi-link">
                        Review
                    </a>
                </div>
            </div>
        </div>
        <div class="grid">
            <div class="grid grid-rows-1 row_1">
                <div class="grid grid-cols-12 row1-cols mt-2 ml-5 mr-5">
                    <div class="col-start-2 col-span-10 row1-col1">
                        <div class="carouselCard grid grid-cols-12 justify-between">
                            <div id="carouselExampleControls" class="carousel slide col-span-12" data-ride="carousel" data-interval="4000">
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                    <img class="d-block w-100" src="https://www.seotami.com/wp-content/uploads/2020/11/blackhat-wallpapers-29428-5216465.jpg" style="width:100%; height:400px" alt="First slide">
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block w-100" src="https://wallpapers-hub.art/wallpaper-images/225903.jpg" style="width:100%; height:400px" alt="Second slide">
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block w-100" src="https://images.alphacoders.com/107/thumb-1920-10711.png" style="width:100%; height:400px" alt="Third slide">
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" style="height:400px;width: 10%;">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" style="height:400px;width: 10%;">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
                        </div>
                        
                         <%
                             int hotelid=Integer.parseInt(request.getParameter("hotel_id"));
                                Connection conn = Database.getConnection();

                                PreparedStatement pst = conn.prepareStatement("SELECT hotel.name,hotel.contact_num, hotel.email,hotel.address,reviews.user,reviews.review,reviews.rating FROM hotel, reviews where hotel.id=reviews.hotel_id and hotel.id="+hotelid);

                                ResultSet rs = pst.executeQuery();
                                int i=1;
                                if(rs.next()){
                                
                               
                              %>
                              
                        <div class="grid grid-cols-12">
                            <div class="title col-start-5 col-span-4">
                               <%= rs.getString(1)%>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-3 rows nameField">
                                Address 
                            </div>
                            <div class="col-span-8 rows" style="text-align: center;">
                            <%=rs.getString(4)%>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-3 rows nameField">
                                Contact Number
                            </div>
                            <div class="col-span-8 rows" style="text-align: center;">
                               <%=rs.getString(2)%>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-3 rows nameField">
                                Email
                            </div>
                            <div class="col-span-8 rows" style="text-align: center;">
                                <%=rs.getString(3)%>
                            </div>
                        </div>
                        <div class="grid grid-cols-12">
                            <div class="title_review col-start-0 col-span-2">
                                Reviews
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                                                        <%
                                                            
                                                            do{%>

                            <div class="col-span-1 rows justify-center">
                                <%=i%>
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                              <%=rs.getString(5)%>
                            </div>
                            <div class="col-span-5 rows" style="text-align: left;">
                                    <%=rs.getString(6)%>
                            </div>
                            <div class="col-span-2 rows">
                                     <%=rs.getString(7)%>
                            </div>
                            <%  i++;}while(rs.next());%>
                        </div>
                        <div class="table_footer flex justify-end">
                            <div><button class="insert_btn" data-toggle="modal" data-target="#addHotel">Add Review</button></div>
                        </div>
                    </div>
                </div>
            </div>
                            <%}%>
        </div>
    </div>
</body>
</html>