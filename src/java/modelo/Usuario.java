/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author jtafu
 */
public class Usuario {

    private int id_usuario;
    private String usuario;
    private String passdword;
    private String email;
    private String rol;

    public Usuario(int id_usuario, String usuario, String passdword, String email, String rol) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.passdword = passdword;
        this.email = email;
        this.rol = rol;

    }

    /**
     * @return the id_usuario
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * @param id_usuario the id_usuario to set
     */
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the passdword
     */
    public String getPassdword() {
        return passdword;
    }

    /**
     * @param passdword the passdword to set
     */
    public void setPassdword(String passdword) {
        this.passdword = passdword;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the rol
     */
    public String getRol() {
        return rol;
    }

    /**
     * @param rol the rol to set
     */
    public void setRol(String rol) {
        this.rol = rol;
    }
}
