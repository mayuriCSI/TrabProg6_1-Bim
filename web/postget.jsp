<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cadastro</title>
    </head>
    <body>
        O nome e a idade de entrada foram:
        <%
            String vnome;
            int vidade;
            vnome = request.getParameter("nome");
            vidade = Integer.parseInt(request.getParameter("idade"));
            out.println("Nome: " + vnome + " ; Idade: " + vidade);
        %>
    </body>
</html>