<%-- 
    Document   : cart
    Created on : Apr 4, 2017, 2:37:12 AM
    Author     : smu
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="entity.CustPreferenceWithTags"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Orders</h1>
        <table border='' id='newTable'>
            <tr>
            <%
            HashMap<CustPreferenceWithTags, Integer> orders = (HashMap) session.getAttribute("orders");
            if (orders == null) {
            %>
            <h3 style="font-weight: normal;">You have not ordered anything yet</h3>
            <%
            } else {
                Set set = orders.entrySet();
                Iterator iterator = set.iterator();
                int newCount = 0;
                while(iterator.hasNext()) {
                    Map.Entry me2 = (Map.Entry)iterator.next();
                    newCount++;
                    CustPreferenceWithTags c = (CustPreferenceWithTags) me2.getKey();
                    
            %>
                <td><img src="<%= c.getImage() %>" height='250' alt="<%=c.getItem_desc()%>"><br>
                        <div class='caption'>
                            <%= c.getItem_id() + " " + c.getItem_desc() %><br>
                            <span class="category"><%= c.getCourse() %></span>
                            <input type='text' value='<%=me2.getValue()%>' class='itemQty' disabled="">
                        </div>
                </td>
            <%        
                if(newCount % 3 == 0) {
            %>
                    </tr><tr>
            <%
                        }
                    }
                }
            %>
            </tr>
        </table> 
        
    </body>
</html>
