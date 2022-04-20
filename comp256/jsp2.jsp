<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SQLite Demo</title>
    </head>
    <body>
        <%
        Class.forName("org.sqlite.JDBC");
        Connection conn =
            DriverManager.getConnection("jdbc:sqlite:/db/Northwind.db");
	 %>
            
        <p>Customers:</p>
        <OL>
            <%
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM Customers;");

            while (rs.next()) {
                out.println("<li>" + rs.getString("CompanyName") + "</td>");
            }
 
            rs.close();
            %>
        </OL>

	<%
        conn.close();
        %>        
    </body>
</html>
