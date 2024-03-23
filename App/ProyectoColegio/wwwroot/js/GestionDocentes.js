window.onload = async function () {

    selectorSede("");
    listargradosTodos("");
    obtenerlistadocentes(); 

}


function selectorSede(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {
  

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdatefiltro("selectsede", newArray, valor);
        }

    })


    activarEscuchaSelect();

}


function listargradosTodosDocente(valor) {

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


function listargradosDocente(valor, Nombre) {

    fetchGet('Funcionario/ListarGradoSede/?sede=' + Nombre, function (data) {

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

function activarEscuchaSelect() {

    var selectElement = document.getElementById("selectsede");


    selectElement.addEventListener("change", function () {


        var selectedText = selectElement.options[selectElement.selectedIndex].text;
        console.log(selectedText)
        if (selectedText === 'TODOS') { listargradosTodosDocente("") } else { listargradosDocente("", selectedText) };


    });
}



function listarTiposDeSangre(valor) {

    fetchGet('Funcionario/ListarTiposDeSangre', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttiposangre", newArray, valor);
        }

    })

}

function selectorSedeDocente(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectsededocente", newArray, valor);
        }

    })




}

function ListarTiposDeDocumento(valor) {

    fetchGet('Funcionario/ListarTiposDeDocumento', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttipodocumento", newArray, valor);
        }

    })

}

function ListarDiscapacidades(valor) {

    fetchGet('Funcionario/ListarDiscapacidades', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttipodiscapacidad", newArray, valor);
        }

    })

}

function ListarSisben(valor) {

    fetchGet('Funcionario/ListarSisben', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttiposisben", newArray, valor);
        }

    })

}

function ListarGeneros(valor) {

    fetchGet('Funcionario/ListarGeneros', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttipogenero", newArray, valor);
        }

    })

}

function ListarEPS(valor) {

    fetchGet('Funcionario/ListarEPS', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttipoeps", newArray, valor);
        }

    })

}

function ListarEstratos(valor) {

    fetchGet('Funcionario/ListarEstratos', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selecttipoestrato", newArray, valor);
        }

    })

}




function listargradosTodos(valor) {

    fetchGet('Funcionario/ListarGrados', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdatefiltro("selectgrados", newArray, valor);
        }

    })

}








function obtenerlistadocentes() {
    let identificacion = document.getElementById('identificacionD').value.trim();
    let sede = document.getElementById('selectsede').value;
    let grado = document.getElementById('selectgrados').value;
    identificacion = identificacion.length > 0 ? identificacion : null;
    sede = sede === 'TODOS' ? null : sede;
    grado = grado === 'TODOS' ? null : grado;
    console.log(identificacion + '----' + sede +'----'+ grado)

    fetchGet('Funcionario/ListarDocentesTodos/?identificacion=' + identificacion + '&sede=' + sede + '&grupo=' + grado, function (data) {

        generatableProfesores(data);  

    })


}



function generatableProfesores(data) {



    let tabla = generarTablaCargueInventario(
        data,
        [

            { valor: "Datos Personales", size: "25" },
            { valor: "Datos de Contacto", size: "25" },
            { valor: "Informaci�n Laboral", size: "20" },
            { valor: "Informaci�n Adicional", size: "20" },
            { valor: "Opciones", size: "10" },
        ],

        [
            [
                { titulo: "Nombre completo", valor: "nombreDocente" },
                { titulo: "Documento", valor: "identificacion" },
                { titulo: "Tipo de sangre", valor: "tipoSangre" },
                { titulo: "Genero", valor: "genero" },
            ],
            [
                { titulo: "N�mero de tel�fono", valor: "telefonoFijo" },
                { titulo: "Direcci�n", valor: "direccion" },
                { titulo: "Tel�fono", valor: "telefonoCelular" },
                { titulo: "Correo", valor: "correo" },
            ],
            [
                { titulo: "Sede de trabajo", valor: "sede" },
                { titulo: "Horas de trabajo", valor: "horasTrabajo" },
            ],
            [
                { titulo: "Discapacidad", valor: "discapacidad" },
                { titulo: "SISBEN", valor: "sisben" },
                { titulo: "Estrato", valor: "estrato" },
                { titulo: "EPS", valor: "eps" },
            ]
        ],
        "idDocente"
    )

    document.getElementById("tableprofesores").innerHTML = tabla;
    PaginationTable(10, 'tabladocentes')

}



function generarTablaCargueInventario(
    data,
    cabezera,
    propiedades,
    propiedadId
) {
    console.log(cabezera)

    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead >";
    contenedor += "<tr>";

    // Generar cabecera de la tabla
    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody id='tabladocentes' >";

    // Generar filas de la tabla
    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";


        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m + 1].valor}' class="table_colums">`;
            let subpro = propiedades[m];

            // Generar contenido de las celdas
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

        // Botones de acci�n para cada fila
        contenedor += "<td><div class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" onclick="asignarDocente(${data[i][propiedadId]})" data-toggle="modal" data-target="#Asignargrado">Asignar Grado</a>`;
        contenedor += "</div></td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}



//function guardardocente() {
//    let frm = new FormData();
//    let docuemnto = document.getElementById('').value;
//    frm.append('docuemto', docuemnto);
//    fetchPostText('', frm, function (res) {

//        if (res === '1') {

//            console.log('dato guardado correctamentre')

//        } else {

//            console.log('error')
//        }

//    })

//}


function AgregarDocentes() {

    listarTiposDeSangre("");
    ListarTiposDeDocumento("");
    ListarDiscapacidades("");
    ListarSisben("");
    ListarGeneros("");
    ListarEPS("");
    ListarEstratos("");
    selectorSedeDocente("");
}


function guardardocentes() {

    let primerNombre = document.getElementById("Primernombredocente").value;
    let segundoNombre = document.getElementById("Segundonombredocente").value;
    let primerApellido = document.getElementById("primerapellido").value;
    let segundoApellido = document.getElementById("segundopellido").value;
    let documento = document.getElementById("documentoDocente").value;
    let tipoDocumento = document.getElementById("selecttipodocumento").value;
    let fechaNacimiento = document.getElementById("fechanacimiento").value;
    let edad = document.getElementById("edad").value;
    let tipoSangre = document.getElementById("selecttiposangre").value;
    let celular = document.getElementById("celulardocente").value;
    let telefonoFijo = document.getElementById("telefonofijo").value;
    let correo = document.getElementById("correo").value;
    let tipoDiscapacidad = document.getElementById("selecttipodiscapacidad").value;
    let direccion = document.getElementById("direccion").value;
    let sisben = document.getElementById("selecttiposisben").value;
    let genero = document.getElementById("selecttipogenero").value;
    let eps = document.getElementById("selecttipoeps").value;
    let estrato = document.getElementById("selecttipoestrato").value;
    let horasTrabajo = document.getElementById("horasTrabajo").value;
    let sede = document.getElementById("selectsededocente").value;


    let frm = new FormData();


    frm.append('nombreUsuario', primerNombre);
    frm.append('segundoNombreUsuario', segundoNombre);
    frm.append('apellidoUsuario', primerApellido);
    frm.append('segundoApellidoUsuario', segundoApellido);
    frm.append('identificacion', documento);
    frm.append('tpDocumento', tipoDocumento);
    frm.append('fechaNacimiento', fechaNacimiento);
    frm.append('edad', edad);
    frm.append('tipoSangre', tipoSangre);
    frm.append('telefonoCelular', celular);
    frm.append('telefonoFijo', telefonoFijo);
    frm.append('correo', correo);
    frm.append('discapacidad', tipoDiscapacidad);
    frm.append('direccion', direccion);
    frm.append('sisben', sisben);
    frm.append('genero', genero); 
    frm.append('eps', eps);
    frm.append('estrato', estrato);
    frm.append('HorasLabora', horasTrabajo);
    frm.append('NombreSede', sede);

    fetchPostText('Funcionario/RegistrarDocenteRetorno', frm, function (res) {

        if (res !== '1') {

        } else {
            obtenerlistadocentes(); 
            document.getElementById("botoncancelarDocente").click(); 

        }


    })

    

    
}


function limpiarModalDocentes() {

    listarTiposDeSangre("");
    ListarTiposDeDocumento("");
    ListarDiscapacidades("");
    ListarSisben("");
    ListarGeneros("");
    ListarEPS("");
    ListarEstratos("");
    borrarContenidoPorClase("formularioDocente")

}



function asignarDocente(documento) {

    document.getElementById('documentoDocente').value = documento;  


    detallesdocentes(documento);  
    listarmateriasgrados(documento)


}


function listarMateriaporGrado(valor, Nombre, grado) {

    fetchGet('Funcionario/ListarAsignaturasGrupo/?sede=' + Nombre + '&grado=' + grado, function (data) {
        console.log(data)

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item,
                text: item,
            }));

            selectdate("selectMaterias", newArray, valor);
          
        } else {
            selectdate("selectMaterias", [], valor);

        }

    })


}

function activarEscuchaSelectMateria(Nombre) {

    var selectElement = document.getElementById("selectgrado");


    selectElement.addEventListener("change", function () {


        var selectedText = selectElement.value;


        console.log('sede ' + Nombre + ' grado ' + selectedText)
        selectedText !== 'Selecciona una opci�n' ? listarMateriaporGrado("", Nombre, selectedText) : ''



    });
}





function listarGradoporsedeF(valor, Nombre) {

    fetchGet('Funcionario/ListarGradoSede/?sede=' + Nombre, function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectgrado", newArray, valor);
            activarEscuchaSelectMateria(Nombre)
        } else {
            selectdate("selectgrado", [], valor);

        }

    })
 

}



function asignaragradoMateria() {

    let sede = document.getElementById('sedeDocente').value
    listarGradoporsedeF("", sede)






}







function detallesdocentes(docente) {

    fetchGet('Funcionario/ListarDocentesSedeGrupoInfoParcial/?idRef=' + docente, function (data) {


        document.getElementById('detallesDocentes').innerHTML = `<span class="text__bold">Codigo docente:</span><span class="text__normal"> ${data[0][1]}</span><br>
                            <span class="text__bold">Nombre completo:  </span><span class="text__normal">${data[0][0]}</span><br>
                            <span class="text__bold">Sede: </span><span class="text__normal"> ${data[0][2]}</span><br>
                             <input type="hidden" id="sedeDocente" value="${data[0][2]}" />`


    })


}

function listarmateriasgrados(docentes) {

    fetchGet('Funcionario/ListarDocenteSedeInfoGradoAsignatura/?idRef=' + docentes, function (data) {


        let tabla = GenerarTabla(data, [{ valor: 'NR', size: "5" }, { valor: "Grado", size: "30" }, { valor: 'materia', size: "30" }], ['grado', 'asignatura',]);
        document.getElementById("tablamaterias").innerHTML = tabla;


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
        contenedor += "<td data-label='' class = 'column-color text-center' >" + (i + 1) + "</td>";
        for (var m = 0; m < propiedades.length; m++) {
            contenedor += "<td><div class=''> <p class='d-inline-block m-0 p-0''>" + data[i][propiedades[m]] + " </p></div></td>";

        }

        contenedor += "</tr>";
    }
    contenedor += "</tbody>";
    contenedor += "</table>";




    return contenedor;

}



function guardarasignaturasDocente() {

    let docente = document.getElementById('documentoDocente').value;
    let grado = document.getElementById('selectgrado').value;
    let materia = document.getElementById('selectMaterias').value;  

    let frm = new FormData(); 

    frm.append('idDocenteRef', docente)
    frm.append('idGradoRef', grado)
    frm.append('asignaturaRef', materia)

    fetchPostText('Funcionario/RegistrarDocenteGradoAsignaturaRetorno', frm, function (res) {

        if (res === '1') {
            listarmateriasgrados(docente)
            document.getElementById('asignarcerraModal').click()
        }



    })



}

function limpiarAsignarMateriaModal() {
    let sede = document.getElementById('sedeDocente').value
    listarGradoporsedeF("", sede)
    selectdate("selectMaterias", [], valor);
    
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

