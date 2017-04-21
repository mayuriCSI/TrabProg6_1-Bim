<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login FAESP</title>
    </head>
    <body>
        <img src="faesp.jpg" style="width:100px; height:100px">
        <form method="POST" action="principal.jsp">
            Nome <input type="text" name="nome" size="40">
            </br>
            </br>
            Senha <input type="text" name="senha" size="10">
            </br>
            </br>
            <input type="submit" value="Acessar">
        </form>


        <%
            try {
                // carregar o driver jdbc (java/jre/lib/ext)
                Class.forName("org.postgresql.Driver");
                out.println("Consegui carregar driver ");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/banco_de_dados_faesp",
                        "postgres", "postgres");
                out.println("Consegui conectar com sucesso ");

                Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                //out.println("statement ok");
                ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE LOG_USUARIO = '"
                        + request.getParameter("nome") + "' AND LOG_SENHA = '" + request.getParameter("senha") + "'");
                // caso o SELECT retorne somente 1 row

                if (rs.next()) {
                    response.sendRedirect("principal.jsp");
                } else {
                    out.println("Nome ou senha incorretos!");
                }

            } catch (ClassNotFoundException erroClass) {
                out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);
            } catch (SQLException erroSQL) {
                out.println("Erro de conexao com o banco: " + erroSQL);
            }
        %>
    </body>
</html>