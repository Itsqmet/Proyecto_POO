/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itsqm.servlet;

import com.itsqm.acceso.Categorias;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoriasS", urlPatterns = {"/CategoriasS"})

public class CategoriasServlet extends HttpServlet {

    //Polimorfismo
    //GET   = dominio.com/Proyecto01/pag.jsp?crud=delete&txtId=3
    //POST  = dominio.com/Proyecto01/pag.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("crud");
        if (menu.equals("select")) {
            //Read
            selectCategorias(request, response);
        } else if (menu.equals("update")) {
            //Update
            updateCategorias(request, response);
        } else if (menu.equals("insert")) {
            //Insert
            insertCategorias(request, response);
        } else if (menu.equals("delete")) {
            //Delete
            deleteCategorias(request, response);
        }

    }

    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        
    }
     */
    //Delete
    private void deleteCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html"); //Formato permite escribir dentro de html
            PrintWriter pw = response.getWriter();
            int id = Integer.parseInt(request.getParameter("txtId"));
            Categorias c = new Categorias();
            boolean r = c.deleteCategorias(id);
            pw.println(r); //escribir en el navegador el resultado
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //Create

    private void insertCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            String categoria = request.getParameter("txtCategoria");
            String fecha = request.getParameter("txtFecha");
            Categorias c = new Categorias();
            boolean r = c.insertCategorias(categoria, fecha);
            pw.println(r);
        } catch (Exception e) {
        }

    }

    //update
    private void updateCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            int id = Integer.parseInt(request.getParameter("numId"));
            String categoria = request.getParameter("txtCategoria");
            String fecha = request.getParameter("txtFecha");
            Categorias c = new Categorias();
            boolean r = c.updateCategorias(id,categoria, fecha);
            pw.println(r);

        } catch (Exception e) {
        }

    }

    //Read
    private void selectCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            String buscar = request.getParameter("txtBuscar");
            Categorias c = new Categorias();
            ResultSet rs = c.selectCategorias(buscar);
            String tabla = "<table class='table table-hover'>";
            tabla += "<thead class='thead-dark'>";
            tabla += "<thead>";
            tabla += "<tr>";
            tabla += "<th>ID";
            tabla += "</th>";
            tabla += "<th>CATEGORIA";
            tabla += "</th>";
            tabla += "<th>FECHA";
            tabla += "</th>";
            tabla += "<th>Accion";
            tabla += "</th>";
            tabla += "</tr>";
            tabla += "</thead>";
            tabla += "<tbody>";
            //<tag>  apertura
            //</tag> cierre
            while (rs.next()) {
                tabla += "<tr>";
                tabla += "<td>" + rs.getInt("id");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("categoria");
                tabla += "</td>";
                tabla += "<td>" + rs.getString("fecha");
                tabla += "</td>";
                tabla += "<td>";
                tabla += "<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#actualizarModal' onclick=\"cargarDatosActualizar('"+rs.getInt("id")+"','"+rs.getString("categoria")+"','"+rs.getString("fecha")+"')\">Actualizar</button>";
                tabla += "<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#eliminarModal' onclick=\"cargarIdEliminar('"+rs.getInt("id")+"')\">Eliminar</button>";
                tabla += "</td>";
                tabla += "</tr>";
            }
            tabla += "</tbody>";
            tabla += "</table>";

            //imprimir tabla
            pw.println(tabla);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}