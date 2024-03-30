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


/*--------------------------Obtener Nombre Usuario -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNombreDocente` $$
create procedure `ObtenerNombreDocente`(documento bigint) 
begin    
		SELECT (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
						 COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) as Docente
        From Usuario as u
		inner join Docente as d on d.fkidentificacion = u.identificacion
        where u.identificacion = documento;

END$$

/*--------------------------Obtener Nombre Usuario -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNombreEstudiante` $$
create procedure `ObtenerNombreEstudiante`(documento bigint) 
begin    
		SELECT (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
						 COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) as Estudiante
        From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        where u.identificacion = documento;

END$$

/*--------------------------Obtener iNFO Estudiante -------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerEstudiantesTodosXGrupo` $$
CREATE PROCEDURE `ObtenerEstudiantesTodosXGrupo`(GrupoRef VARCHAR(400), asignaturaRef VARCHAR(400), periodoRef VARCHAR(400)) 
BEGIN 
    DECLARE idGrupoRef INT;
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));
    
    SELECT ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante
    FROM Estudiante AS e
    INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
    WHERE egg.fkidGradoGrupo = idGrupoRef; 
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerEstudiantesNotasXGrupo` $$
CREATE PROCEDURE `ObtenerEstudiantesNotasXGrupo`(GrupoRef VARCHAR(400), asignaturaRef VARCHAR(400), periodoRef VARCHAR(400)) 
BEGIN 
    DECLARE idGrupoRef INT;
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));   
    
    SELECT COALESCE(subconsulta2.NombreEstudiante, 'Sin registro') AS NombreEstudiante, COALESCE(subconsulta2.DocEstudiante, 'Sin registro') AS DocumentoEstudiante, 
           COALESCE(subconsulta1.NotaPeriodo, 'Sin registro') AS Nota, COALESCE(subconsulta1.Asignatura, 'Sin registro') AS Asignatura,
           COALESCE((select obtenerCargaHorariaAsignatura(subconsulta1.Asignatura, GrupoRef)), 'Sin registro') AS CargaHoraria,
           COALESCE((select obtenerSumaInasistenciasEstudianteAnno(subconsulta2.idEstudiante, subconsulta1.Asignatura, subconsulta1.Periodo)), 'Sin registro') AS Inasistencias,
           COALESCE(subconsulta1.Periodo, 'Sin registro') AS Periodo, 
           COALESCE((select obtenerPromedioAsignaturaEstudiantePeriodo(subconsulta2.idEstudiante, subconsulta1.Asignatura, GrupoRef)), 'Sin registro') AS NotaFinal
    FROM (
        -- Subconsulta 1
        SELECT ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante, 
               ndp.NotaGeneral AS NotaPeriodo, 
               ObtenerNombreAsignatura(ndp.fkidAsignatura) AS Asignatura, 
               periodoRef AS Periodo
        FROM GradoGrupo AS gg
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Estudiante AS e ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN NotasEstudiante AS ne ON ne.fkidEstudiante = e.idEstudiante
        INNER JOIN NotaDefinitivaPeriodo AS ndp ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        INNER JOIN Asignatura AS a ON ndp.fkidAsignatura = a.idAsignatura
        WHERE egg.fkidGradoGrupo = idGrupoRef AND a.nombreAsignatura = asignaturaRef AND ndp.fkidPeriodoAcademico = obtenerIdPeriodo(periodoRef)
    ) AS subconsulta1
    Right JOIN (
        -- Subconsulta 2
        SELECT e.idEstudiante AS idEstudiante, e.Usuario_identificacion AS DocEstudiante, ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante
        FROM Estudiante AS e
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
        WHERE egg.fkidGradoGrupo = idGrupoRef 
    ) AS subconsulta2 ON subconsulta1.NombreEstudiante = subconsulta2.NombreEstudiante;
END$$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerEstudiantesNotasXGrupo2` $$
CREATE PROCEDURE `ObtenerEstudiantesNotasXGrupo2`(idEstudianteRef int, GrupoRef VARCHAR(400), periodoRef VARCHAR(400)) 
BEGIN 
    DECLARE idGrupoRef INT;
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));   
    
    SELECT COALESCE(subconsulta2.NombreEstudiante, 'Sin registro') AS NombreEstudiante, 
		   COALESCE(subconsulta2.DocEstudiante, 'Sin registro') AS DocumentoEstudiante,
           COALESCE(subconsulta1.NotaPeriodo, 'Sin registro') AS Nota, 
           COALESCE(subconsulta2.Asignatura, 'Sin registro') AS Asignatura,
           COALESCE((select obtenerCargaHorariaAsignatura(subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS CargaHoraria,
           COALESCE((select obtenerSumaInasistenciasEstudianteAnno(subconsulta2.idEstudiante, subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS Inasistencias,
           COALESCE(subconsulta1.Periodo, 'Sin registro') AS Periodo, 
           COALESCE((select obtenerPromedioAsignaturaEstudiantePeriodo(subconsulta2.idEstudiante, subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS NotaFinal
    FROM (
        -- Subconsulta 1
        SELECT e.idEstudiante AS idEstudiante2, ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante, ndp.NotaGeneral AS NotaPeriodo, periodoRef AS Periodo,
        a.idAsignatura As identificadorAsignatura2
        FROM GradoGrupo AS gg
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Estudiante AS e ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN NotasEstudiante AS ne ON ne.fkidEstudiante = e.idEstudiante
        INNER JOIN NotaDefinitivaPeriodo AS ndp ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        INNER JOIN Asignatura AS a ON ndp.fkidAsignatura = a.idAsignatura
        WHERE gg.idGradoGrupo = (SELECT ObtenerIdGradoGrupo(GrupoRef)) AND ndp.fkidPeriodoAcademico = obtenerIdPeriodo(periodoRef)
    ) AS subconsulta1
    RIGHT JOIN (
        -- Subconsulta 2
        SELECT e.idEstudiante AS idEstudiante, e.Usuario_identificacion AS DocEstudiante, 
        ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante,
        ObtenerNombreAsignatura(agg.fkidAsignatura) AS Asignatura,
        a.idAsignatura As identificadorAsignatura
        FROM Estudiante AS e
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN GradoGrupo AS gg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN asignaturaGradoGrupo AS agg ON agg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Asignatura AS a ON agg.fkidAsignatura = a.idAsignatura
        WHERE e.Usuario_identificacion = idEstudianteRef
    ) AS subconsulta2 ON subconsulta2.idEstudiante = subconsulta1.idEstudiante2 
      AND subconsulta2.identificadorAsignatura = subconsulta1.identificadorAsignatura2;
END$$

DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerEstudiantesNotasXGrupoInfoParcial` $$
CREATE PROCEDURE `ObtenerEstudiantesNotasXGrupoInfoParcial`(DocEstudianteRef BIGINT, GrupoRef VARCHAR(400)) 
BEGIN 
    DECLARE idGrupoRef INT;
    DECLARE idEstudianteRef INT; 
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));   
    SET idEstudianteRef = (SELECT ObtenerIdEstudiante(DocEstudianteRef));
    
    SELECT DISTINCT
           COALESCE(subconsulta2.Asignatura, 'Sin registro') AS Asignatura, 
           COALESCE((select obtenerCargaHorariaAsignatura(subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS CargaHoraria, 
           COALESCE((select obtenerSumaInasistenciasEstudianteAnno(subconsulta2.idEstudiante, subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS Inasistencias,
           COALESCE((select obtenerPromedioAsignaturaEstudiantePeriodo(subconsulta2.idEstudiante, subconsulta2.Asignatura, GrupoRef)), 'Sin registro') AS NotaFinal
    FROM (
        -- Subconsulta 1
        SELECT e.idEstudiante AS idEstudiante2, ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante, ndp.NotaGeneral AS NotaPeriodo,
        a.idAsignatura As identificadorAsignatura2
        FROM GradoGrupo AS gg
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Estudiante AS e ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN NotasEstudiante AS ne ON ne.fkidEstudiante = e.idEstudiante
        INNER JOIN NotaDefinitivaPeriodo AS ndp ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        INNER JOIN Asignatura AS a ON ndp.fkidAsignatura = a.idAsignatura
        WHERE gg.idGradoGrupo = (SELECT ObtenerIdGradoGrupo(GrupoRef))
    ) AS subconsulta1
    RIGHT JOIN (
        -- Subconsulta 2
        SELECT e.idEstudiante AS idEstudiante, e.Usuario_identificacion AS DocEstudiante, 
        ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante,
        ObtenerNombreAsignatura(agg.fkidAsignatura) AS Asignatura,
        a.idAsignatura As identificadorAsignatura
        FROM Estudiante AS e
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN GradoGrupo AS gg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN asignaturaGradoGrupo AS agg ON agg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Asignatura AS a ON agg.fkidAsignatura = a.idAsignatura
        WHERE e.Usuario_identificacion = DocEstudianteRef
    ) AS subconsulta2 ON subconsulta2.idEstudiante = subconsulta1.idEstudiante2 
      AND subconsulta2.identificadorAsignatura = subconsulta1.identificadorAsignatura2;
END$$

DELIMITER ;

/*--------------------------Obtener Notas Estudiantes -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSumaNotaMateriaPeriodos` $$
create procedure `ObtenerSumaNotaMateriaPeriodos`(idEstudianteRef int, Asignatura varchar(400), grupoRef varchar(400)) 
begin    
		declare sumaNotasEstudiante float;
        declare numeroNotas int;
        declare periodos int;
        set periodos = 4;
        
        set sumaNotasEstudiante = (SELECT SUM(ndp.notaGeneral) as Nota
									From Estudiante as e 
									inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
									inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
									where e.IdEstudiante = idEstudianteRef and ndp.fkidAsignatura = (select ObtenerIdAsignatura(Asignatura))
                                    );
		select idEstudianteRef as idEstudiante, sumaNotasEstudiante / periodos as PromedioAsignatura;
END$$

/*--------------------------Obtener Suma Inasistencias Estudiantes -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSumaInasistenciasMateriaPeriodos` $$
create procedure `ObtenerSumaInasistenciasMateriaPeriodos`(idEstudianteRef int, Asignatura varchar(400), grupoRef varchar(400)) 
begin    
		declare sumaInasistenciasEstudiante int;       
        
        set sumaInasistenciasEstudiante = (SELECT SUM(ae.nFallas) as Fallas
									From Estudiante as e 
									inner join AsistenciaEstudiante as ae on ae.fkidEstudiante = e.idEstudiante
									inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
									where e.IdEstudiante = idEstudianteRef and a.fkidAsignatura = (select ObtenerIdAsignatura(Asignatura))
                                    );
		select idEstudianteRef as idEstudiante, sumaInasistenciasEstudiante as Inasistencias;
END$$
