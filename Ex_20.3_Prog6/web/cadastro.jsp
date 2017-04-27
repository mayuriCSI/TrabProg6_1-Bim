<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Logins</title>
    </head>
    <body>
        <p><img src="faesp.jpg">
            <br>
            <strong><u>Manutenção da base de logins</u></strong></p>
        <p><a href="cadUsuario.jsp?">NOVO REGISTRO</a></p>
        <p><a href="cadastro.jsp?ordenacao=crescente">CRESCENTE</a></p>
        <p><a href="cadastro.jsp?ordenacao=decrescente">DECRESCENTE</a></p>
        <table border="1">
            <tbody>
                <tr>
                    <td>Código</td>
                    <td>Nome</td>
                    <td>Senha</td>
                    <td>Nível</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <%
                    try {
                        // carregar o driver jdbc (java/jre/lib/ext)
                        Class.forName("org.postgresql.Driver");
                        out.println("Consegui carregar driver ");
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/banco_de_dados_faesp",
                                "postgres", "postgres");
                        Statement st = con.createStatement();

                        if (request.getParameter("acao") != null) //
                        {
                            if (request.getParameter("acao").contains("excluir")) {
                                out.println("apagando " + request.getParameter("codigo"));
                                st.executeUpdate("DELETE FROM LOGIN WHERE log_codigo = " + request.getParameter("codigo"));
                            }
                        }

                        String ordenacao = "";
                        if (request.getParameter("ordenacao") != null) {
                            if (request.getParameter("ordenacao").contains("crescente")) {
                                ordenacao = "order by log_codigo ASC";
                            }

                            if (request.getParameter("ordenacao").contains("decrescente")) {
                                ordenacao = "order by log_codigo DESC";
                            }
                        }
                        ResultSet rs = st.executeQuery("SELECT * FROM LOGIN " + ordenacao);
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("log_codigo")%></td>
                    <td><%=rs.getString("log_usuario")%></td>
                    <td><%out.println(rs.getString("log_senha")); %></td>
                    <td><%out.println(rs.getString("log_nivel"));%></td>
                    <td><a href="alteraUsuario.jsp?codigo=<%=rs.getString("log_codigo")%>&usuario=<%=rs.getString("log_usuario")%>&senha=<%=rs.getString("log_senha")%>&nivel=<%=rs.getString("log_nivel")%>">EDITAR</a></td>
                    <td><a href="cadastro.jsp?acao=excluir&codigo=<%=rs.getString("log_codigo")%>">APAGAR</a></td>
                </tr>
                <% }
                    } catch (ClassNotFoundException erroClass) {
                        out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);
                    } catch (SQLException erroSQL) {
                        out.println("Erro de conexao com o banco: " + erroSQL);
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
