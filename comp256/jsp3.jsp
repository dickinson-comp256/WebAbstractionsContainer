<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Accssing a Database from a JSP</title>
    </head>
    <body>
        <p>Customers:</p>
        <OL>
            <%
            // Initialize the connection to the database.
            Class.forName("org.sqlite.JDBC");
            Connection conn =
                DriverManager.getConnection("jdbc:sqlite:/db/Northwind.db");

            // Build an SQL statement
            Statement stat = conn.createStatement();
            String country = request.getParameter("country");
            String query =
              "SELECT CompanyName,City " +
              "FROM Customers " +
              "WHERE Country='" + country + "';";

            // Run the SQL statement
            ResultSet rs = stat.executeQuery(query);

            // Iterate through the ResultSet and display each one.
            while (rs.next()) {
                out.println("<li>" + rs.getString("CompanyName") +
                  ", " + rs.getString("City")+ "</li>");
            }

            rs.close();
            conn.close();
            %>
        </OL>
    </body>
</html>
