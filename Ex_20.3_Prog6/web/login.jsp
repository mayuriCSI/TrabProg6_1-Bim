<html>
    <form action=ServletLogar method=get>
        <table border="1">
            <tr>
                <td>Usuário:</td>
                <td><input type="text" name="usuario"></td>
            </tr>
            <tr>
                <td>Senha:</td>
                <td><input type="password" name="senha"></td>
            </tr>
            <tr>
                <td><input type="reset" value="Limpar"></td>
                <td><input type="submit" name="acessar" value="Acessar"></td>
            </tr>
        </table>
    </form>

    <tr>
        <td colspan="2">
            <h2><%
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.println(message);
                } else {
                    out.println("Digite usuário e senha!");
                }
                %>
            </h2>
        </td>
    </tr>
</html>