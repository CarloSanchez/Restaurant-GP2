/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidad;

/**
 *
 * @author USUARIO
 */
public class Usuario 
{
    private String idUsuario;
    private String login;
    private String password;
    private String estado;
    private String idTipoUsuario;
    private String usuarioo;

    public Usuario() {
        this.idUsuario="";
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(String idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public String getUsuarioo() {
        return usuarioo;
    }

    public void setUsuarioo(String usuarioo) {
        this.usuarioo = usuarioo;
    }

   
    

    
}