/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

/**
 *
 * @author Kevin_Paez
 */
public class Instrumento {
    private int idInstru;
    private String nombre;
    private String marca;
    private Double precio;
    private String descripcion;
    
    public Instrumento(){
        
    }

    public Instrumento(int idInstru, String nombre, String marca, Double precio, String descripcion) {
        this.idInstru = idInstru;
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public Instrumento(String nombre, String marca, Double precio, String descripcion) {
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public Instrumento(int idInstru) {
        this.idInstru = idInstru;
    }

    public Instrumento(int idInstru, String nombre, String marca) {
        this.idInstru = idInstru;
        this.nombre = nombre;
        this.marca = marca;
    }

    public int getIdInstru() {
        return idInstru;
    }

    public void setIdInstru(int idInstru) {
        this.idInstru = idInstru;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Instrumento{" + "idInstru=" + idInstru + ", nombre=" + nombre + ", marca=" + marca + ", precio=" + precio + ", descripcion=" + descripcion + '}';
    }
    
    
    
    
    
}
