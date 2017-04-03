<!-- 
    Document   : index
    Created on : 1 Apr, 2017, 10:35:46 PM
    Author     : User 2-->


<%@page import="connect.LoadCustPreference"%>
<%@page import="connect.AverageSpending"%>
<%@page import="connect.UpdateCustomerOutletCount"%>
<%@page import="connect.Bootstrap"%>
<%@page import="connect.LoadCategory"%>
<%@page import="connect.LoadSatisfactionValues"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.DatabaseConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" type="text/css" rel="stylesheet" />
        <title>Welcome</title>
    </head>
    <body class='index'>
        <% 
            Connection conn = DatabaseConnectionManager.connect();
            Statement check = conn.createStatement();
            ResultSet result = check.executeQuery("SHOW TABLES LIKE 'users';");
            boolean hasNext = result.next();
            if (!hasNext) {
                boolean success = Bootstrap.bootstrap(conn);
                if (success) {
                    LoadSatisfactionValues satisfactionV = new LoadSatisfactionValues();
                    boolean satLoad = satisfactionV.loadSatisfactionValues(conn);
                    boolean catLoad = LoadCategory.loadCategory(conn);    
                    boolean updateCustCount = UpdateCustomerOutletCount.updateCustomerOutletCount(conn);
                    boolean prefLoad = LoadCustPreference.loadPreference(conn);
                    AverageSpending.updateUserAverageSpending(conn);
                    if (!prefLoad || !satLoad) {
                        System.out.println("Error");
                    }
                } 
            }
                    Statement stmt = conn.createStatement();
                    ResultSet rs;
                     rs = stmt.executeQuery("SELECT customerid FROM users WHERE customerid != '0'");
                %>
            <div id='login-form' class="center">
                <form action='login' method='post'>
                    Enter Customer ID:
                    <select name='customerid'>
                        <% 
                            while ( rs.next() ) {
                                String id = rs.getString("customerid");
                        %>
                        <option value="<%=id %>"><%=id %></option>
                        <%
                            }
                        %>
                    </select>
                    <br>
                    <br>
                    Enter Number of Customers:
                    <input type ="number" name ="numberOfCust" value='1'><br>
                    <br>
                    Enter Dietary Preferences:
                    <input type ="text" name ="preferences"><br>
                    <br>
                    Enter budget
                    <input type="number" step="5" name="budget" value="10"><br>
                    <br>
                    <% 
                        session = request.getSession();
                        String error = (String) session.getAttribute("error");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <div class='error'> <%= error %></div><br>

                    <input type ="submit" value="Submit" class='submit'>
                </form>
        </div>
    </body>
</html>
