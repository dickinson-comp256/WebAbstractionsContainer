<!doctype html>
<html>
    <head>
        <title>Hello World JSP</title>
    </head>
    <body>
        <h1>Java Server Page</h1>

        <%
        // Java Code!
        String name = "Arabella";
        out.println("<p><em>Hello</em> "
          + name + "!</p>");
        %>

        <p>The end.</p>
    </body>
</html>
