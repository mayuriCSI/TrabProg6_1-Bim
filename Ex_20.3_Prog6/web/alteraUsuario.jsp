<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Alteração de usuários</title>
    </head>
    <h1>Alteração de usuários</h1>
    <body>

        <% if (request.getParameter("acao") == null) {
        %>

        <form id="formAlterarUsuario" name="frmAlterar" method="post" action="alteraUsuario.jsp?acao=alterar ">
            <label>Código:
                <input name="tf_log_codigo" type="text" id="tf_log_codigo" size="20" abled="abled" value="<%=request.getParameter("codigo")%>"/>
            </label>
            <p>

                <label>Login:
                    <input name="tf_log_usuario" type="text" id="tf_log_usuario" size="20" maxlength="20" value="<%=request.getParameter("usuario")%>"/>
                </label>
                <label>Senha:
                    <input name="tf_log_senha" type="password" id="tf_log_senha" size="20" maxlength="20" value="<%=request.getParameter("senha")%>" />
                </label>
            </p>
            <p>
                <label>Nível:
                    <input name="tf_log_nivel" type="text" id="tf_log_nivel" size="5" maxlength="1" value="<%=request.getParameter("nivel")%>"/>
                </label>
            </p>
            <p>
                <label>
                    <input type="submit" name="Gravar" id="gravar" value="Atualizar" />
                </label>
                <label></label>
                <input type="reset" name="Limpar" id="Limpar" value="Limpar" />
            </p>
        </form>

        <%
            } else {
                if (request.getParameter("tf_log_usuario").length() == 0) {
                    response.sendRedirect("cadUsuario.jsp");
                } else if (request.getParameter("tf_log_senha").length() == 0) {
                    response.sendRedirect("cadUsuario.jsp");
                } else if (request.getParameter("tf_log_nivel").length() == 0) {
                    response.sendRedirect("cadUsuario.jsp");
                } else {
                    try {
                        // carregar o driver jdbc (java/jre/lib/ext)
                        Class.forName("org.postgresql.Driver");
                        out.println("Consegui carregar driver ");
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/banco_de_dados_faesp",
                                "postgres", "postgres");
                        out.println("conexao ao BD!");

                        Statement st = con.createStatement();

                        String sql = ("UPDATE LOGIN SET log_usuario='" + request.getParameter("tf_log_usuario")
                                + "',log_senha='" + request.getParameter("tf_log_senha")
                                + "',log_nivel='" + request.getParameter("tf_log_nivel")
                                + "' WHERE log_codigo = " + request.getParameter("tf_log_codigo"));
                        out.println(sql);
                        st.executeUpdate(sql);

                    } catch (ClassNotFoundException erroClass) {
                        out.println(erroClass.getMessage());
                    } catch (SQLException erroSQL) {
                        out.println(erroSQL.getMessage());
                    }
                }

            }
        %>
    </body>
</html>