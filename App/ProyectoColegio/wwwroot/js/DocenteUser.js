window.onload = function ()
{
    listarGrados("");  

}


function listarGrados(valor) {
    fetchGet('Funcionario/ListarGradosDocente', function (data) {
        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("gradoDocente", newArray, valor);
            activarEscuchaSelectGrados();  
        }

    })



}


function listarGruposGrado(valor, grado) {


    fetchGet('Funcionario/ListarGruposDocente/?grado=' + grado, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("GrupoGradoDocente", newArray, valor);
        }

    })

}



function activarEscuchaSelectGrados() {

    var selectElement = document.getElementById("gradoDocente");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        if (selectedValue !== "") { listarGruposGrado("", selectedValue) }
        if (selectedValue !== "") { listarAsignaturasDocente("", selectedValue) }



    });
}




function listarAsignaturasDocente(valor, grado) {


    fetchGet('docente/ListarDocenteAsignaturas/?grado=' + grado, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("idAsignaturasDocente", newArray, valor);
        
            activarEscuchaSelectMateria(); 
        }

    })

}



function listarEstudiantesGrupos(valor, grupo) {
    let documento = document.getElementById('inputsearch').value;
    fetchGet('docente/ListarEstudiantesSedeGrupo/?grupo=' + grupo + '&identificacion=' + documento, function (data) {

        generaTablaEstudiantes(data)
    })


}



function generaTablaEstudiantes(data) {
    let cabezera = [
        { valor: "Datos del estudiante", size: 30 },
        { valor: "Nota", size: 30 },
        { valor: "Fallas", size: 30 }
    ];

    var propiedades = [
        [
            { titulo: "Nombre completo", valor: "nombreUsuario" },
            { titulo: "Documento", valor: "identificacion" }
        ],
        [
            { titulo: "Nota", valor: "edad" }
        ],
        [
            { titulo: "Fallas", valor: "grado" }
        ]
       
    ];

    let tabla = generarTablaEstudiantes(data, cabezera, propiedades,
        "identificacion");

    document.getElementById("tablaEstudiantesNotas").innerHTML = tabla


}


function generarTablaEstudiantes(data, cabezera, propiedades) {
    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead>";
    contenedor += "<tr>";


    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }
    contenedor += "<th style='width: 10%;'>";
    contenedor += "<input type='submit' class='form-control form-control-sm bg-primary text-white px-0 mx-0' value='generar plantilla'>";
    contenedor += "</th>";

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody>";


    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";

        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m].valor}' class="table_colums">`;
            let subpro = propiedades[m];


            for (let k = 0; k < subpro.length; k++) {
                contenedor += ` <div class="colums__text py-0 my-0">
                                        <span class="text__bold">${subpro[k].titulo} :</span>
                                        <span class="text__normal">${data[i][subpro[k].valor].toString().toUpperCase()}</span>
                                    </div>`;
            }

            contenedor += "</td>";
        }

        contenedor += "<td><div class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" data-target="#agregarNotas">Agregar Notas</a>`;
        contenedor += "</div></td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}


function activarEscuchaSelectMateria() {

    var selectElement = document.getElementById("idAsignaturasDocente");


    selectElement.addEventListener("change", function () {

        let grupo = document.getElementById('GrupoGradoDocente').value

        if (grupo !== "") {
            listarEstudiantesGrupos("", grupo)
        } else {
            document.getElementById('tablaEstudiantesNotas').innerHTML = "<p>seleciona materia</p>"
        }
        

    });
}


function guardarEstudiante() {
    let estudiante = document.getElementById('documenteEstudiante').value
    let notas = document.getElementById('notasEstudiante').value;
    let fallas = document.getElementById('fallaestudiante').value;

    let frm = new FormData();
    frm.append('', estudiante);
    frm.append('', notas);
    frm.append('', fallas);
    fetchPostText('', frm, function (res) {

        document.getElementById('cerraModalNotas').click();  

    })






}


function limpiarNotasModal() {

    borrarContenidoPorClase('notasEstudiante')

}


function borrarContenidoPorClase(clase) {

    var inputs = document.querySelectorAll('.' + clase);

    inputs.forEach(function (input) {

        if (input.type === 'text' || input.type === 'textarea') {

            input.value = '';
        } else if (input.type === 'checkbox') {

            input.checked = false;
        } else {

            input.value = '';
        }
    });
}
