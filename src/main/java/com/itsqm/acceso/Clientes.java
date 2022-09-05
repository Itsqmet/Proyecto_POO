/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itsqm.acceso;

import com.itsqm.modelo.CBDD;
import java.sql.ResultSet;

/**
 *
 * @author DELL
 */
public class Clientes {

    private int id;
    private String nombre;
    private String documento;
    private String email;
    private String telefono;
    private String direccion;
    private String fecha_nacimiento;
    private String compras;
    private String ultima_compra;
    private String fecha;
    private String buscar;

    private CBDD cbdd;

    public String getBuscar() {
        return buscar;
    }

    public void setBuscar(String buscar) {
        this.buscar = buscar;
    }

    public Clientes() {
        cbdd = new CBDD();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getCompras() {
        return compras;
    }

    public void setCompras(String compras) {
        this.compras = compras;
    }

    public String getUltima_compra() {
        return ultima_compra;
    }

    public void setUltima_compra(String ultima_compra) {
        this.ultima_compra = ultima_compra;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;

    }

    public boolean insertClientes(String nombre, String documento, String email, String telefono, String direccion, String fecha_nacimiento, String compras, String ultima_compra, String fecha) {
        setNombre(nombre);
        setDocumento(documento);
        setEmail(email);
        setTelefono(telefono);
        setDireccion(direccion);
        setFecha_nacimiento(fecha_nacimiento);
        setCompras(compras);
        setUltima_compra(ultima_compra);
        setFecha(fecha);
        String sql = "INSERT INTO `clientes`"
                + "(`nombre`, `documento`,`email`,`telefono`,`direccion`,`fecha_nacimiento`,`compras`,`ultima_compra`,`fecha`) "
                + "VALUES ('" + getNombre() + "',"
                + "'" + getDocumento() + "',"
                + "'" + getEmail() + "',"
                + "'" + getTelefono() + "',"
                + "'" + getDireccion() + "',"
                + "'" + getFecha_nacimiento() + "',"
                + "'" + getCompras() + "',"
                + "'" + getUltima_compra() + "',"
                + "'" + getFecha() + "')";
        boolean r = cbdd.ejecutar(sql);
        return r;
    }

    public boolean deleteClientes(int id) {
        setId(id);
        String sql = "DELETE FROM `clientes` "
                + "WHERE `id` =" + getId();
        boolean r = cbdd.ejecutar(sql);
        return r;
    }

    public boolean updateClientes(int id, String nombre, String documento, String email, String telefono, String direccion, String fecha_nacimiento, String compras, String ultima_compra, String fecha) {
        setId(id);
        setNombre(nombre);
        setDocumento(documento);
        setEmail(email);
        setTelefono(telefono);
        setDireccion(direccion);
        setFecha_nacimiento(fecha_nacimiento);
        setCompras(compras);
        setUltima_compra(ultima_compra);
        setFecha(fecha);
        
        String sql = "UPDATE `clientes` \n"
                + "SET `nombre`='" + getNombre() + "',\n"
                + "`documento`='" + getDocumento() + ",\n"
                + "`email`='" + getEmail() + "',\n"
                + "`telefono`='" + getTelefono() + "',\n"
                + "`direccion`='" + getDireccion() + "',\n"
                + "`fecha_nacimiento`='" + getFecha_nacimiento() + "',\n"
                + "`compras`=" + getCompras() + ",\n"
                + "`ultima_compra`='" + getUltima_compra() + "',\n"
                + "`fecha`='" + getFecha() + "' \n"
                + "WHERE `id`= " + getId();
        System.out.print(sql);
        return cbdd.ejecutar(sql);
    }

    public ResultSet selectClientes(String buscar) {
        setBuscar(buscar);
        String sql = "SELECT * FROM `clientes` \n"
                + "WHERE `nombre` like '%"+getBuscar()+"%'";
        return cbdd.consulta(sql);
    }
}
