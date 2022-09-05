<%-- 
    Document   : CategoriaVista
    Created on : 27/07/2022, 21:12:12
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <script src="js/CategoriasJS.js"></script>
        <%@include file="./Librerias/libs.jsp"%> 
    </head>
    <body>
        <%@include file="./Librerias/menu.jsp"%>
        
        <div class="container" align="center">
            <h1>Categorias</h1>
            <hr>
            <form>
                <table>
                    <tr>
                        <td>
                            <label>Buscar</label>
                        </td>
                        <td>
                            <input type="text" id="buscarC" class="form-control"/>
                        </td>    
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" class="btn btn-primary"style="width: 80px; height: 40px"onclick="readCategorias()">Buscar</button> <!--width me ayuda a darle un tamaño igual a los botones-->
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button 
                                type="button" 
                                class="btn btn-success"
                                style="width: 80px; height: 40px"
                                data-toggle="modal"
                                data-target="#insertarModal">Insertar</button>
                        </td>
                    </tr>
                </table>
            </form>
            <hr>
            <div id="tablaCategorias"></div>
        </div>


        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal" id="insertarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Insertar Categoria</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body"align="center">
                        <form>
                            <table>
                                <tr>
                                    <td>
                                        <label>Categoria:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtCategoria" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFecha" class="form-control"/>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-success" onclick="insertCategorias()">Insertar</button>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeInsertar">Close</button>     
                    </div>

                </div>
            </div>
        </div>

        <!-- The Modal -->
        <div class="modal" id="actualizarModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Actualizar Categoria</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body"align="center">
                        Modal body..
                    </div>
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <label>ID</label>

                                </td>
                                <td>
                                    <input type="number" id="numId" class="form-control" readonly=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Categoria:</label>
                                </td>
                                <td>
                                    <input type="text" id="txtCategoriaUp" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Fecha:</label>
                                </td>
                                <td>
                                    <input type="date" id="txtFechaUp" class="form-control"/>
                                </td> 
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-success" onclick="updateCategorias()">Actualizar</button>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeUpdate">Close</button>     
                </div>
            </div>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal" id="eliminarModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Botón Eliminar</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body"align"center">
                    <input type="hidden" id="numIdDel"/>
                    <h3>Usted no está autorizado para eliminar esta categoría</h3>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="deleteCategorias()">SI</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteClose">Salir</button>     
                </div>
            </div>
        </div>
    </div>
</body>
</html>