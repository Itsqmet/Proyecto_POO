
window.onload = function () {
    readCategorias();
};
function readCategorias() {
    let buscar = document.getElementById('buscarC').value;
    //localhost:8080/JSP_VESP/CategoriasS?crud=select&txtBuscar=
    $.ajax({
        data: {
            "crud": "select",
            "txtBuscar": buscar
        },
        url: "./CategoriasS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos) {
            document.getElementById('tablaCategorias').innerHTML = datos;
        }
    });

}
function insertCategorias() {
    let cat = document.getElementById('txtCategoria').value;
    let fech = document.getElementById('txtFecha').value;

    $.ajax({
        data: {
            "crud": "insert",
            "txtCategoria": cat,
            "txtFecha": fech
        },
        url: "./CategoriasS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos) {
            datos = datos.trim();
            if (datos === 'true') {
                alert("Categoría insertada");
            } else {
                alert("Categoría no insertada");

            }
            document.getElementById('closeInsertar').click();
            readCategorias();

        }
    });
}
function fechaDatosCategorias(id, cat, fech) {
    debugger
    document.getElementById('numId').value = id;
    document.getElementById('txtCategoriaUp').value = cat;
    document.getElementById('txtFechaUp').value = fech;
    var fecha = moment (fech);
    var anio = fecha.format ('YYYY')
    if (parseInt(anio)<2022){
        alert("No actualizada");
    }else{
        $('#actualizarModal').modal ('show');
    }

}

function cargarDatosActualizar(id, cat, fec) {
    document.getElementById('numId').value = id;
    document.getElementById('txtCategoriaUp').value = cat;
    document.getElementById('txtFechaUp').value = fec;
}
function updateCategorias() {

    let id = document.getElementById('numId').value;
    let cat = document.getElementById('txtCategoriaUp').value;
    let fech = document.getElementById('txtFechaUp').value;

    $.ajax({
        data: {
            "crud": "update",
            "numId": id,
            "txtCategoria": cat,
            "txtFecha": fech
        },
        url: "./CategoriasS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function (datos) {
            datos = datos.trim();
            if (datos === 'true') {
                alert("Categoría actualizada");
            } else {
                alert("Categoría no actualizada");

            }
            document.getElementById('closeUpdate').click();
            readCategorias();

        }
    });
}

function cargarIdEliminar(id) {
    document.getElementById('numIdDel').value = id;
}

function deleteCategorias() {
    let id = document.getElementById('numIdDel').value;
    $.ajax({
        data: {
            "crud": "delete",
            "txtId": id

        },
        url: "./CategoriasS",
        async: true,
        type: "GET",
        dataType: "text",
        success: function(datos) {
            datos = datos.trim();
            if(datos === 'true') {
                alert("Categorias eliminadas");
            } else {
                alert("Categorias no eliminado");
            }
            document.getElementById('deleteClose').click();
            readCategorias();
        }
    });
}



