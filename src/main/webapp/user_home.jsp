 <%-- 
    Document   : user_home
    Created on : 22 Apr, 2022, 10:44:57 AM
    Author     : Dhruv
--%>

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
                    <a href="#" class="nav-link-active">
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
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                        <div class="table_row grid grid-cols-12 justify-between content-center">
                            <div class="col-span-1 rows justify-center">
                                1
                            </div>
                            <div class="col-span-1">

                            </div>
                            <div class="col-span-6 rows" style="text-align: left;">
                                Jay Parmar
                            </div>
                            <div class="col-span-3 rows" style="text-align: left;">
                                India
                            </div>
                            <div class="col-span-1 rows view_detalis">
                                <i class="fa fa-eye"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
