<%-- 
    Document   : recommend
    Created on : Apr 3, 2017, 3:52:21 PM
    Author     : smu
--%>

<%@page import="entity.CustPreferenceWithTags"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="entity.LoginUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="connect.DisplayCustPreference"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.DatabaseConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" type="text/css" rel="stylesheet" />
        <title></title>
    </head>
    <body>
        <%
            LoginUser user = (LoginUser) session.getAttribute("user");
//            LoginUser user = (LoginUser) request.getAttribute("user");
        %>
        <h2><b>Recommendations</b></h2>
        <table border='' id='newTable'>
            <tr>
            <%
                int newCount = 0;
                int actualCount = 0;
                
                Connection conn = DatabaseConnectionManager.connect();
                DisplayCustPreference displayPreference = new DisplayCustPreference();
                ArrayList<CustPreferenceWithTags> recommend = displayPreference.displayPreference(conn, user.getId(), user.getPax());
                String course = recommend.get(0).getCourse();
                session.setAttribute("recommend", recommend);
                for (CustPreferenceWithTags c: recommend) {
                    newCount++;
                    actualCount++;
                    if(!course.equals(c.getCourse())) {
                        newCount = 1;
            %>
                    </tr><tr>
            <%
                    }
            %>
                <td><img src="<%= c.getImage() %>" height='250' alt="<%=c.getItem_desc()%>"><br>
                        <div class='caption'>
                            <%= c.getItem_id() + " " + c.getItem_desc() %><br>
                            <div class="category"><%= c.getCourse() %></div>
                            <input type="hidden" id="name<%=actualCount%>" value="<%=c.getItem_id()%>"><br>
                            <input type='text' id='qty<%=actualCount%>' value='1' class='itemQty'>
                            <input type="button" value="Add" onclick="addToCart(<%=actualCount%>)">
                        </div>
                </td>
            <%        
                if(newCount % 3 == 0) {
            %>
                    </tr><tr>
            <%
                }
                    course = c.getCourse();
                }
            %>
            </tr>
        </table>  
    </body>
    <script type="text/javascript">
        function addToCart(id) {
            var name = "name" + id;
            var qty = "qty" + id;
            if (document.getElementById(name) !== null && document.getElementById(qty) !== null) {
                var nameVal = document.getElementById(name).value;
                var qtyVal = document.getElementById(qty).value;
//                alert(nameVal + " " + qtyVal);
                $('.bodycontent').load('addToCart?item='+nameVal+"&qty="+qtyVal);
//                window.location.href = 'addToCart.java?item='+nameVal+"&qty="+qtyVal;
            }
        }
    </script>
</html>
