<!doctype html>
<html>
    <head>
        <title>Test JSP Page</title>
    </head>
    <body>
        <h1>It works!</h1>
        <UL>
            <%
                for (int i = 0; i < 5; ++i) {
                    out.println("<li>" + i + ". Hello, world!</li>");
                }
            %>
        </UL>
    </body>
</html>
