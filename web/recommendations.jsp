<%-- 
    Document   : index
    Created on : 1 Apr, 2017, 10:35:46 PM
    Author     : User 2
--%>

<%@page import="entity.LoginUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
        <title>Begin Order</title>
    </head>
    <body>
        <div class='container'>
            <div class='sidebar'>
                <% 
                    LoginUser user = (LoginUser) session.getAttribute("user");
                    if (user == null) {
                        response.sendRedirect("index.jsp");
                    }
                %>
                <h3>Welcome, <%=user.getId() %></h3>
                <ul class="openmenu">
                    <li onclick="changeContent('summary');">View Summary</a></li>
                    <li onclick="changeContent('recommend');">Begin Order
<!--                        <ul id="submenu">
                            <li onclick="changeContent('main');">Mains</li>
                            <li onclick="changeContent('snack');">Snacks</li>
                            <li onclick="changeContent('dessert');">Desserts</li>
                            <li onclick="changeContent('drinks');">Drinks</li>
                        </ul>-->
                    </li>
                    <li onclick="changeContent('cart');">View Cart</li>
                </ul>
            </div>

            <div class='bodycontent'></div>
        </div>
    </body>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#submenu").hide();
            $('.bodycontent').load('recommend.jsp');
        });
        $('li.openmenu').click(function() {
            $('li.openmenu').not(this).find('#submenu').hide();
            $(this).find('#submenu').toggle();
         });
         
        function changeContent(page) {
            var url = page + '.jsp';
            $('.bodycontent').load(url);
        }
        
    </script>
</html>
