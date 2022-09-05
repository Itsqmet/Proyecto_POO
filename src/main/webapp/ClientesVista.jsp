<%-- 
    Document   : ClientesVista
    Created on : 28/06/2022, 22:01:42
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <script src="js/ClientesJS.js"></script>
        <%@include file="./Librerias/libs.jsp"%> 
    </head>
    <body>
        
        <%@include file="./Librerias/menu.jsp"%>

        <div class="container"align="center">
                
            <h1>Clientes</h1>
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
                            <button type="button" class="btn btn-primary" style="width:80px; height:40px"onclick="readClientes()">Buscar</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button 
                                type="button" 
                                class="btn btn-success" 
                                style ="width:80px; height: 40px"
                                data-toggle="modal" 
                                data-target="#insertarModal">Insertar</button> 
                        </td>
                    </tr>
                </table>
            </form>
            <hr>
            <div id="tablaClientes"></div>
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
                        <h4 class="modal-title">Insertar Clientes</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body"align="center">
                        <form>
                            <table>

                                <tr>
                                    <td>
                                        <label>Nombre:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtNombre" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Documento:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtDocumento" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Email:</label>
                                    </td>
                                    <td>
                                        <input type="email" id="txtEmail" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Telefono:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtTelefono" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Direccion:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtDireccion" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha Nacimiento:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFecha_Nacimiento" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Compras:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtCompras" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Ultima Compra:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtUltima_Compra" class="form-control"/> 
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
                                        <button type="button" class="btn btn-success" onclick="insertClientes()">Insertar</button>
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
                        <h4 class="modal-title">Actualizar Clientes</h4>
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
                                        <label>Nombre:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtNombreUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Documento:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtDocumentoUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Email:</label>
                                    </td>
                                    <td>
                                        <input type="email" id="txtEmailUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Telefono:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtTelefonoUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Direccion:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtDireccionUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Fecha Nacimiento:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtFecha_NacimientoUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Compras:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="txtComprasUp" class="form-control"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Ultima Compra:</label>
                                    </td>
                                    <td>
                                        <input type="date" id="txtUltima_CompraUp" class="form-control"/> 
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
                                        <button type="button" class="btn btn-success" onclick="updateClientes()">Actualizar</button>
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
                <div class="modal-body"align="center">
                    <input type="hidden" id="numIdDel"/>
                    <h3>Usted no está autorizado para eliminar esta categoría</h3>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="deleteClientes()">SI</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteClose">Salir</button>     
                </div>
            </div>
        </div>
    </div>
</body>
</html>
