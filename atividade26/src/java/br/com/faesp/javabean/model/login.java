package br.com.faesp.javabean.model;

public class login {

    private int log_codigo;
    private String log_nome;
    private String log_senha;
    private String log_nivel;

    public boolean verificaUsuario(String nome, String senha) {
        if (log_nome != null && log_senha != null) {
            if (log_nome.equals(nome) && log_senha.equals(senha)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public void setLog_codigo(int log_codigo) {
        this.log_codigo = log_codigo;
    }

    public void setLog_nome(String log_nome) {
        this.log_nome = log_nome;
    }

    public void setLog_senha(String log_senha) {
        this.log_senha = log_senha;
    }

    public void setLog_nivel(String log_nivel) {
        this.log_nivel = log_nivel;
    }

    public int getLog_codigo() {
        return log_codigo;
    }

    public String getLog_nome() {
        return log_nome;
    }

    public String getLog_senha() {
        return log_senha;
    }

    public String getLog_nivel() {
        return log_nivel;
    }

}
