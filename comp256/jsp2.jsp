<!doctype html>
<html>
    <head>
        <title>Hello World JSP</title>
    </head>
    <body>
        <h1>Java Server Page</h1>

        <%
        // Java Code!
        String firstName = request.getParameter("first_name");
        out.println("<p><em>Hello</em> "
          + firstName + "!</p>");
        %>
    </body>
</html>
