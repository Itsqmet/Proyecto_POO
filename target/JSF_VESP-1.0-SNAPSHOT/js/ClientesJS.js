window.onload = function () {
    readClientes();
};
function readClientes() {
    let buscar = document.getElementById('buscarC').value;
    //localhost:8080/JSP_VESP/CLientesS?crud=select&txtBuscar=
    $.ajax({
        data: {
            "crud": "select",
            "txtBuscar": buscar
        },
        url: "./ClientesS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos) {

            document.getElementById('tablaClientes').innerHTML = datos;
        }
    });

}
function insertClientes() {
    let nom = document.getElementById('txtNombre').value;
    let docu = document.getElementById('txtDocumento').value;
    let ema = document.getElementById('txtEmail').value;
    let telef = document.getElementById('txtTelefono').value;
    let direc = document.getElementById('txtDireccion').value;
    let fecha_nacim = document.getElementById('txtFecha_Nacimiento').value;
    let comp = document.getElementById('txtCompras').value;
    let ultima_comp = document.getElementById('txtUltima_Compra').value;
    let fec = document.getElementById('txtFecha').value;

    $.ajax({
        data: {
            "crud": "insert",
            "txtNombre": nom,
            "txtDocumento": docu,
            "txtEmail": ema,
            "txtTelefono": telef,
            "txtDireccion": direc,
            "txtFecha_nacimiento": fecha_nacim,
            "txtCompras": comp,
            "txtUltima_compra": ultima_comp,
            "txtFecha": fec

        },
        url: "./ClientesS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos) {
            datos = datos.trim();
            if (datos === 'true') {
                alert("Clientes insertados");
            } else {
                alert("Clientes no insertados");

            }
            document.getElementById('closeInsertar').click();
            readClientes();

        }
    });
}

function fechaDatosClientes(id, nom, doc, ema, tel, dir, fecha_nac, com, ultima_com, fec) {
    debugger
    document.getElementById('numId').value = id;
    document.getElementById('txtNombreUp').value = nom;
    document.getElementById('txtDocumentoUp').value = doc;
    document.getElementById('txtEmailUp').value = ema;
    document.getElementById('txtTelefonoUp').value = tel;
    document.getElementById('txtDireccionUp').value = dir;
    document.getElementById('txtFecha_NacimientoUp').value = fecha_nac;
    document.getElementById('txtComprasUp').value = com;
    document.getElementById('txtUltima_CompraUp').value = ultima_com;
    document.getElementById('txtFechaUp').value = fec;
    var fecha = moment(fec);
    var anio = fecha.format('YYYY')
    if (parseInt(anio) < 2022) {
        alert("No actualizada");
    } else {
        $('#actualizarModal').modal('show');
    }
}
    function cargarDatosActualizar(id, nom, docu, ema, tel, dir, fecha_nac, com, ultima_com, fec) {
        document.getElementById('numId').value = id;
        document.getElementById('txtNombreUp').value = nom;
        document.getElementById('txtDocumentoUp').value = docu;
        document.getElementById('txtEmailUp').value = ema;
        document.getElementById('txtTelefonoUp').value = tel;
        document.getElementById('txtDireccionUp').value = dir;
        document.getElementById('txtFecha_NacimientoUp').value = fecha_nac;
        document.getElementById('txtComprasUp').value = com;
        document.getElementById('txtUltima_CompraUp').value = ultima_com;
        document.getElementById('txtFechaUp').value = fec;

    }

    function updateClientes() {
        let id = document.getElementById('numId').value;
        let nombre = document.getElementById('txtNombreUp').value;
        let documento = document.getElementById('txtDocumentoUp').value;
        let email = document.getElementById('txtEmailUp').value;
        let telefono = document.getElementById('txtTelefonoUp').value;
        let direccion = document.getElementById('txtDireccionUp').value;
        let fecha_nacimiento = document.getElementById('txtFecha_NacimientoUp').value;
        let compras = document.getElementById('txtComprasUp').value;
        let ultima_compra = document.getElementById('txtUltima_CompraUp').value;
        let fecha = document.getElementById('txtFechaUp').value;

        $.ajax({
            data: {
                "crud": "update",
                "numId": id,
                "txtNombre": nombre,
                "txtDocumento": documento,
                "txtEmail": email,
                "txtTelefono": telefono,
                "txtDireccion": direccion,
                "txtFecha_nacimiento": fecha_nacimiento,
                "txtCompras": compras,
                "txtUltima_compra": ultima_compra,
                "txtFecha": fecha

            },
            url: "./ClientesS",
            async: true,
            type: "GET",
            dataType: "text",
            success: function (datos) {
                datos = datos.trim();
                if (datos === 'true') {
                    alert("Clientes actualizados");
                } else {
                    alert("Clientes no actualizados");

                }
                document.getElementById('closeUpdate').click();
                readClientes();

            }
        });
    }

   function cargarIdEliminar(id) {
    document.getElementById('numIdDel').value = id;
}

function deleteClientes() {
    let id = document.getElementById('numIdDel').value;
    $.ajax({
        data: {
            "crud": "delete",
            "txtId": id

        },
        url: "./ClientesS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function(datos) {
            datos = datos.trim();
            if(datos === 'true') {
                alert("Clientes eliminados");
            } else {
                alert("Clientes no eliminado");
            }
            document.getElementById('deleteClose').click();
            readClientes();

            }
        });
    }


