<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login FAESP</title>

    </head>


    <%
        try {

            // carregar o driver jdbc (java/jre/lib/ext)
            Class.forName("org.postgresql.Driver");
            out.println("Consegui carregar driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/banco_de_dados_faesp", "postgres", "postgres");
            out.println("Consegui conectar com sucesso");

            Statement st = con.createStatement();
            out.println("statement ok");

            ResultSet rs = st.executeQuery("SELECT * FROM LOGIN");
            out.println("resultset ok");
            //20.2: o erro que aparece é:
            //Erro de conexao com o banco: org.postgresql.util.PSQLException: 
            //Operação requer um ResultSet rolável, mas este ResultSet é FORWARD_ONLY (somente para frente)
            rs.first();
            out.println("usuario=" + rs.getString("log_usuario"));

        } catch (ClassNotFoundException erroClass) {
            out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);
        } catch (SQLException erroSQL) {
            out.println("Erro de conexao com o banco: " + erroSQL);
        }


    %>

    <img src="faesp.png">
    <form method="POST" action="">
        Nome <input type="text" name="nome" size="40">
        <br>
        Idade <input type="text" name="senha" size="3">
        <br>
        <input type="submit" value="Acessar">
    </form>

</html>
