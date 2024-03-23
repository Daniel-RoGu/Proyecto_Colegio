/*-------orden de ejecucion de scripts ---------- Script Nº8*/
use bdColegio;

/*--------------------------Obtener Informacion Estudiante Familiares Certificados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoFamiliaresEstudiante_Certificados` $$
create procedure `ObtenerInfoFamiliaresEstudiante_Certificados`(
	identificacionEst varchar(400)
) 
begin
     SELECT CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		    COLLATE utf8mb4_unicode_ci AS Estudiante, u.edadUsuario AS Edad,
			u.telefonoCelular AS Celular, u.telefonoFijo AS Fijo, u.correo AS Corre, u.direccion AS DireccioEstudiante, 
            u.barrioUbicacionUsuario AS Barrio, u.fechaNacimiento AS FechaNacimientoEstudiante, u.estadoUsuario AS EstadoEstudiante,
            (select ObtenerNombreTipoSangre(u.fkidTipoSangre)) AS TipoSangreEstudiante,
			(select ObtenerNombreTipoDocumento(u.fkidTipoDocumento)) AS TipoDocumentoEstudiante, 
            (select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)) AS Discapacidad, 
            (select ObtenerNombreSisben(u.fkidSisben)) AS Sisben,
			(select ObtenerNombreGenero(u.fkidGenero)) AS Genero, (select ObtenerNombreEPS(u.fkidEPS)) AS EPS, 
            (select ObtenerNombreEstrato(u.fkidEstrato)) AS Estrato, g.nombreGrado AS Grado, gg.grupoGrado as Grupo,
            f.nombreFamiliar AS Familiar, f.ocupacionFamiliar AS Ocupacion, f.celularFamiliar AS CelularFamiliar,
            f.parentescoFamiliar AS Parentesco, f.responsabilidadEconomicaEstudiante AS ResponsabilidadEconomica,
            f.estadoAcudiente AS EstadoAcudiente, f.esDezplazado AS Desplasado, f.fechaNacimiento AS FechaNacimientoAcudiente,
            f.nivelEscolaridad AS NivelEscolaridadAcudiente, f.ubicacion AS UbicacionAcudiente
    From Usuario as u
    inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
    inner join Familiar as f on f.Estudiante_idEstudiante = e.idEstudiante
    Left join EstudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado
    where u.identificacion = (select ObtenerDocEstudiante(CAST(identificacionEst AS SIGNED)));
    
END$$