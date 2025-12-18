/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author jtafu
 */
public class Pelicula {

    private int id_pelicula;
    private String titulo;
    private String descripcion;
    private Integer anio_estreno;
    private Integer duracion_minutos;
    private Integer id_categoria;
    private String poster_url;
    private String banner_url;
    private String trailer_url;
    private String categoria;

    public Pelicula() {
    }

    public Pelicula(int id_pelicula, String titulo, String descripcion, Integer anio_estreno, Integer duracion_minutos, Integer id_categoria, String poster_url, String banner_url, String trailer_url) {
        this.id_pelicula = id_pelicula;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.anio_estreno = anio_estreno;
        this.duracion_minutos = duracion_minutos;
        this.id_categoria = id_categoria;
        this.poster_url = poster_url;
        this.banner_url = banner_url;
        this.trailer_url = trailer_url;
    }

    public Pelicula(String titulo, String descripcion, Integer anio_estreno, Integer duracion_minutos, Integer id_categoria, String poster_url, String banner_url, String trailer_url) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.anio_estreno = anio_estreno;
        this.duracion_minutos = duracion_minutos;
        this.id_categoria = id_categoria;
        this.poster_url = poster_url;
        this.banner_url = banner_url;
        this.trailer_url = trailer_url;
    }

    /**
     * @return the id_pelicula
     */
    public int getId_pelicula() {
        return id_pelicula;
    }

    /**
     * @param id_pelicula the id_pelicula to set
     */
    public void setId_pelicula(int id_pelicula) {
        this.id_pelicula = id_pelicula;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the anio_estreno
     */
    public Integer getAnio_estreno() {
        return anio_estreno;
    }

    /**
     * @param anio_estreno the anio_estreno to set
     */
    public void setAnio_estreno(Integer anio_estreno) {
        this.anio_estreno = anio_estreno;
    }

    /**
     * @return the duracion_minutos
     */
    public Integer getDuracion_minutos() {
        return duracion_minutos;
    }

    /**
     * @param duracion_minutos the duracion_minutos to set
     */
    public void setDuracion_minutos(Integer duracion_minutos) {
        this.duracion_minutos = duracion_minutos;
    }

    /**
     * @return the id_categoria
     */
    public Integer getId_categoria() {
        return id_categoria;
    }

    /**
     * @param id_categoria the id_categoria to set
     */
    public void setId_categoria(Integer id_categoria) {
        this.id_categoria = id_categoria;
    }

    /**
     * @return the poster_url
     */
    public String getPoster_url() {
        return poster_url;
    }

    /**
     * @param poster_url the poster_url to set
     */
    public void setPoster_url(String poster_url) {
        this.poster_url = poster_url;
    }

    /**
     * @return the banner_url
     */
    public String getBanner_url() {
        return banner_url;
    }

    /**
     * @param banner_url the banner_url to set
     */
    public void setBanner_url(String banner_url) {
        this.banner_url = banner_url;
    }

    /**
     * @return the trailer_url
     */
    public String getTrailer_url() {
        return trailer_url;
    }

    /**
     * @param trailer_url the trailer_url to set
     */
    public void setTrailer_url(String trailer_url) {
        this.trailer_url = trailer_url;
    }
    @Override
    public String toString () {
        return id_pelicula + " | " + titulo + " | " + descripcion +" | " + anio_estreno;
    }

    /**
     * @return the categoria
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}