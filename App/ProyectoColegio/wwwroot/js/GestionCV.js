window.onload = function () {

    selectorSede("")
    listargradosTodos("");  
    listarestudiantes("");
    
}

function selectorSede(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));
            activarEscuchaSelect();
            selectdatefiltro("selectsede", newArray, valor);
        }

    })


  

}


function listargradosTodos(valor) {

    fetchGet('Funcionario/ListarGrados', function (data) {
       

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdatefiltro("selectgrados", newArray, valor);
        } else {
            selectdatefiltro("selectgrados", [], valor);
        }

    })

}


function listargrados(valor, Nombre) {

    fetchGet('Funcionario/ListarGradoSede?sede=' + Nombre, function (data) {


       

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selectgrados", newArray, valor);
        } else {
            selectdate("selectgrados", [], valor);

        }

    })

}




function listarParentescoFamiliaresRegistrados(valor, identidicacion) {
 

    fetchGet('Funcionario/ListarTiposFamiliarEstudiante/?identificacion=' + identidicacion, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item,
                text: item,
            }));

            selectdate("parentezcosEstudiante", newArray, valor);
        }

    })

}



function activarEscuchaSelect() {

    var selectElement = document.getElementById("selectsede");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedText === 'TODOS') { listargradosTodos("") } else { listargrados("", selectedText) };


    });
}


function listarestudiantes() {
    let sedes = document.getElementById("selectsede").value
    let grados = document.getElementById("selectgrados").value
    let idetificacion = document.getElementById('inputsearch').value.trim()


    if (sedes === 'TODOS') {
        sedes = null
    }

    if (grados === 'TODOS') {
        grados = null

    }

    fetchGet(`Funcionario/ListarEstudiantesSedeGrupo/?sede=${sedes}&grupo=${grados}&identificacion=${idetificacion}`, function (data) {

        generatableProfesores(data)
    })



}



function generatableProfesores(data) {



    let tabla = generarTablaCargueInventario(
        data,
        [

            {
                valor: "Informaci�n General", size: "30" },
            { valor: "Informaci�n M�dica", size: "30" },
            { valor: "Informaci�n Socioecon�mica", size: "25" },
     
            { valor: "Opciones", size: "15" },
        ],

        [
            [
                { titulo: "Codigo estudiante", valor: "codigoEstudiante" },
                { titulo: "Nombre completo", valor: "nombreUsuario" },
                { titulo: "Documento", valor: "identificacion" },
                { titulo: "Tipo documento", valor: "tipoDocumento" },
            ],
            [
                { titulo: "Tipo sangre", valor: "tipoSangre" },
                { titulo: "Eps", valor: "eps" },
                { titulo: "Discapacidad", valor: "discapacidad" },

            ],
            [
                { titulo: "Estrato", valor: "estrato" },
                { titulo: "sisben", valor: "sisben" },
            ],
      
        ],
        "identificacion"
    )

    document.getElementById("idestudiantes").innerHTML = tabla;
    PaginationTable(10, "bodyTableGestioncv")


}

function generarTablaCargueInventario(
    data,
    cabezera,
    propiedades,
    propiedadId
) {


    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead >";
    contenedor += "<tr>";

    // Generar cabecera de la tabla
    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody id='bodyTableGestioncv'>";


    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";


        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m + 1].valor}' class="table_colums">`;
            let subpro = propiedades[m];


            for (let k = 0; k < subpro.length; k++) {
                contenedor += ` <div class="colums__text py-0 my-0">
                                        <span class="text__bold">${subpro[k].titulo
                    } :</span>
                                        <span class="text__normal">${data[
                    i
                    ][subpro[k].valor]}</span>
                                    </div>`;
            }

            contenedor += "</td>";
        }


        contenedor += "<td class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" onclick="gestionFamiliarestudiante(${data[i][propiedadId]})" data-toggle="modal" data-target="#gestionFamiliar">Gestion familiar</a>
                            <a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" data-target="#Registrobservacion">Observaciones </a>`;
        contenedor += "</td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}

function gestionFamiliarestudiante(documento) {
    document.getElementById("documentoEstudiante").value = documento
    obtenerDatosEstudiante(documento)

    listarFamiliares(documento); 
   



}

function botoagregarFamliar() {
    let documento = document.getElementById("documentoEstudiante").value
    listarParentescoFamiliaresRegistrados("", documento);
}




function listarFamiliares(estudiante) {



    fetchGet('Funcionario/retornarFamiliaresEstudiante/?identificacion=' + estudiante, function (data) {


        let tabla = GenerarTabla(data, [{ valor: 'Nombre', size: "30" }, { valor: "Vinculo", size: "30" }, { valor: 'Acudiente', size:"20" }], ['nombresFamiliar', 'parentescoFamiliar', 'estadoAcudiente']);
        document.getElementById("tablaFamiliar").innerHTML = tabla;


    })
}


function obtenerDatosEstudiante(documento) {

    fetchGet('Funcionario/obtenerInfoEstudiantePrincipalFamiliar/?identificacion=' + documento, function (data) {
        document.getElementById("datosEstudiante").innerHTML = `  <span class="text__bold">Codigo estudiante: </span><span class="text__normal">${data[0]}</span><br>
                            <span class="text__bold">Nombre completo: </span><span class="text__normal">${data[1]}</span><br>`;
       

    })



}








function GenerarTabla(data, cabezera, propiedades) {
    var contenedor = "";
    contenedor += "<table class='table table__information table__modals py-0 my-0'>";
    contenedor += "<thead>";
    contenedor += "<tr >";
    for (var i = 0; i < cabezera.length; i++) {
        contenedor += "<th  class='' style='width:" + cabezera[i].size + "%;'>" + cabezera[i].valor + "</th>"

    }
    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody >";

    for (var i = 0; i < data.length; i++) {
        contenedor += "<tr>";

        for (var m = 0; m < propiedades.length; m++) {
            contenedor += "<td><div class=''> <p class='d-inline-block m-0 p-0''>" + data[i][propiedades[m]] + " </p></div></td>";

        }

        contenedor += "</tr>";
    }
    contenedor += "</tbody>";
    contenedor += "</table>";




    return contenedor;

}


function guardarFamiliarEstudiante() {
    let frm = new FormData(); 

    let nombreCompleto = document.getElementById("nombreCompleto").value;
    let documento = document.getElementById("documento").value;
    let fechaNacimiento = document.getElementById("fechanacimineto").value;
    let ocupacion = document.getElementById("ocupacion").value;
    let parentesco = document.getElementById("parentezcosEstudiante").value;
    let numeroCelular = document.getElementById("numeroceular").value;
    let nivelEscolaridad = document.getElementById("escolaridad").value;
    let direccionFamiliar = document.getElementById("direccionfamiliar").value;
    let desplazado = document.getElementById("desplazado").checked;
    let acudiente = document.getElementById("acudiente").checked;
    let responsabilidadEconomica = document.getElementById("responsabilidadecomica").checked;
    let estudiante = document.getElementById('documentoEstudiante').value


    desplazado = desplazado === true ? 'SI' : 'NO'
    acudiente = acudiente === true ? 'SI' : 'NO'
    responsabilidadEconomica = responsabilidadEconomica === true ? 'SI' : 'NO'


    frm.append('nombresFamiliar', nombreCompleto);
    frm.append('identificacionFamiliar', documento);
    frm.append('fechaNacimiento', fechaNacimiento.toString());
    frm.append('ocupacionFamiliar', ocupacion);
    frm.append('parentescoFamiliar', parentesco);
    frm.append('celularFamiliar', numeroCelular);
    frm.append('nivelEscolaridad', nivelEscolaridad);
    frm.append('ubicacion', direccionFamiliar);
    frm.append('desplazado', desplazado.toString());
    frm.append('estadoAcudiente', acudiente.toString());
    frm.append('responsabilidadEconomicaEstudiante', responsabilidadEconomica.toString());
    frm.append('identificacionEstudiante', estudiante)
    for (let pair of frm.entries()) {
        console.log(pair[0] + ': ' + pair[1]);
    }

    fetchPostText('Funcionario/GuardarFamiliarEstudiante', frm, function (res) {

        if (res !== '1') {


        } else {
            let documento = document.getElementById("documentoEstudiante").value
            listarFamiliares(documento); 
            document.getElementById('cancelarFamiliar').click()
        }
    })


}
function limpiarModalAgregarFamiliar() {


    borrarContenidoPorClase("familiarcv")
    resetSelect('parentezcosEstudiante')
    resetSelect('escolaridad')
    


}



function filtrosEstudiantes() {
    let idetificacion = document.getElementById('inputsearch').value.trim();
    let sedes = document.getElementById('selectsede').value
    let grados = document.getElementById('selectgrados').value


    idetificacion = idetificacion.length === 0 ? null : idetificacion;
    sedes = sedes === 'TODOS' ? null : sedes;
    grados = grados === 'TODOS' ? null : grados;




   


    fetchGet(`Funcionario/ListarEstudiantesSedeGrupo/?sede=${sedes}&grupo=${grados}&identificacion=${idetificacion}`, function (data) {

        generatableProfesores(data);  


    })

}

function PaginationTable(filasPorPagina, table) {
    let paginaActual = 1
    const tabla = document.getElementById(table);
    let filas = tabla.rows;

    let TotalFilas = filas.length

    const totalPaginas = Math.ceil(TotalFilas / filasPorPagina);
    document.getElementById("controPaginacionInPut").setAttribute("max", totalPaginas)
    document.getElementById("controPaginacionInPut").value = paginaActual;
    function mostrarPagina(pagina) {
        for (let i = 0; i < TotalFilas; i++) {
            if (i < (pagina * filasPorPagina) && i >= ((pagina - 1) * filasPorPagina)) {
                filas[i].style.display = "table-row";
            } else {
                filas[i].style.display = "none";
            }
        }
        const primerRegistro = ((pagina - 1) * filasPorPagina) + 1;
        const ultimoRegistro = Math.min(pagina * filasPorPagina, TotalFilas);


        const infoPaginacion = document.getElementById("page");
        infoPaginacion.textContent = `Mostrando Registros ${primerRegistro} - ${ultimoRegistro} de ${TotalFilas}`;
    }

    function botones() {
        document.getElementById("btn_next").addEventListener("click", function () {

            if (paginaActual <= totalPaginas - 1) {

                paginaActual = parseInt(paginaActual + 1)
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_prev").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = paginaActual - 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })




        document.getElementById("btn_inicio").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_inicio").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_final").addEventListener("click", function () {

            if (paginaActual <= totalPaginas - 1) {


                paginaActual = totalPaginas
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })


        document.getElementById("controPaginacionInPut").addEventListener("input", function () {

            let pagina = this.value.replace(/\s/g, '')
            if (pagina > 0 && pagina <= TotalFilas) {
                paginaActual = pagina
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            } else {
                paginaActual = paginaActual

                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;
            }
        })

    }

    mostrarPagina(paginaActual);
    botones();
}
