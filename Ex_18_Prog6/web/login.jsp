<!--assim nao da para acessar o driver-->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login FAESP</title>

        <%
            try {
                // carregar o driver jdbc (java/jre/lib/ext)
                Class.forName("org.postgresql.Driver");
                out.println("Consegui carregar driver");
            } catch (ClassNotFoundException erro) {
                out.println("Nao achei a Classe do Driver JDBC, erro: " + erro);
            }
        %>

    </head>
    <body>
        <img src="faesp.png"/>
        <form method="POST" action="">
            Nome <input type="text" name="nome" size="40">
            <br>
            Idade <input type="text" name="senha" size="3">
            <br>
            <input type="submit" value="Acessar">
        </form>
    </body>
</html>