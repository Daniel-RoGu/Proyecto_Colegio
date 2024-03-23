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
                value: item[0],
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
        }

    })

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
