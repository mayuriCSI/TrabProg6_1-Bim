<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cadastro de usuários</title>
    </head>
    <h1>Cadastro de usuários</h1>
    <body>

        <% if (request.getParameter("acao") == null) {
        %>

        <form id="formInserirUsuario" name="frmCadastrar" method="post" action="cadUsuario.jsp?acao=gravar">
            <label>Código:
                <input name="tf_log_codigo" type="text" id="tf_log_codigo" size="20" maxlength="20"/>
            </label>
            <p>
                <label>Login:
                    <input name="tf_log_usuario" type="text" id="tf_log_usuario" size="20" maxlength="20" />
                </label>
                <label>Senha:
                    <input name="tf_log_senha" type="password" id="tf_log_senha" size="20" maxlength="20" />
                </label>
            </p>
            <p>
                <label>Nível:
                    <input name="tf_log_nivel" type="text" id="tf_log_nivel" size="5" maxlength="1" />
                </label>
            </p>
            <p>
                <label>
                    <input type="submit" name="Gravar" id="gravar" value="gravar" />
                </label>
                <label></label>
                <input type="reset" name="Limpar" id="Limpar" value="Limpar" />
            </p>
        </form>

        <%
            } else {

                try {
                    // carregar o driver jdbc (java/jre/lib/ext)
                    Class.forName("org.postgresql.Driver");
                    out.println("Consegui carregar driver ");
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/banco_de_dados_faesp",
                            "postgres", "postgres");

                    out.println("conexao ao BD!");

                    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE LOG_USUARIO = '"
                            + request.getParameter("nome") + "' AND LOG_SENHA = '" + request.getParameter("senha") + "'");


                } catch (ClassNotFoundException erroClass) {
                    out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);
                } catch (SQLException erroSQL) {
                    out.println("Erro de conexao com o banco: " + erroSQL);
                }

            }
        %>
    </body>
</html>