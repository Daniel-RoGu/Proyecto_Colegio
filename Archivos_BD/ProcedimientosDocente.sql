/*-------orden de ejecucion de scripts ---------- Script Nº6*/
use bdColegio;

/*--------------------------Registrar Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocente` $$
create procedure `registrarDocente`(
    horasTrabaja varchar(45),
    nomSede varchar(400),
    documento varchar(400),    
    lugarExpedicionDoc varchar(400),    
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad int,
    telCelular varchar(100),
    telFijo varchar(100),
    correoUss varchar(400),
    direccionUss varchar(400),
    barrioUss varchar(400),
    fechaNacimientoUss varchar(400),
    tipoSangre varchar(400),
    tipoDocumento varchar(400),
    nombreDiscapacidad varchar(400),
    nombreSisben varchar(400),
    nombreGenero varchar(400),
    nombreEps varchar(400),
    nombreEstrato varchar(400)
) 
begin
	call registrarUsuario((SELECT CAST(documento AS SIGNED)), nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
						  direccionUss, barrioUss, fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero,
                          nombreEps, nombreEstrato, "Docente");
	insert into Docente (estadoDocente, horasLaboralesSemanales, lugarExpedicionDocumento, fkidentificacion, fkidSede)
				value("Activo", horasTrabaja, lugarExpedicionDoc, (SELECT CAST(documento AS SIGNED)), (select ObtenerIdSede(nomSede)));
END$$

/*--------------------------Registrar Docente Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteGrado` $$
create procedure `registrarDocenteGrado`(
    nombreDocente varchar(400),
    nomGrupo varchar(400)
) 
begin
	declare identificacionDocente long;
    declare identificacionGrupo varchar(400);
    set identificacionDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion);
	set identificacionGrupo = (select g.idGrado from gradogrupo as gg 
							   inner join Grados as g on gg.fkidGrado = g.idGrado
                               where gg.grupoGrado = nomGrupo);
	insert into DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado)				
				value("Activo", identificacionDocente, identificacionGrupo );
END$$

/*--------------------------Registrar Docente Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteGrado2` $$
create procedure `registrarDocenteGrado2`(
    idDocente varchar(400),
    gradroRef int
) 
begin
    declare identificacionGrupo varchar(400);
	insert into DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado)				
				value("Activo", idDocente, (select ObtenerIdGrado(gradroRef)));
END$$

/*--------------------------Registrar Docente Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteAsignatura` $$
create procedure `registrarDocenteAsignatura`(
    nombreDocente varchar(400),
    asignatura varchar(400)
    /*horasSemanalesRef int*/
) 
begin
	declare identificacionDocente long;
    set identificacionDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion);
	insert into DocenteAsignatura (estadoDocenteAsignatura, fkidDocente, fkidAsignatura)				
				value("Asignado", identificacionDocente, (select ObtenerIdAsignatura(asignatura)) );
END$$

/*--------------------------Obtener Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDocente` $$
create procedure `obtenerDocente`(identificacion varchar(400)) 
begin
	SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
            COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, ''))) AS Docente
    FROM Docente 
    inner join Usuario on Docente.fkidentificacion = Usuario.identificacion
    where Docente.fkidentificacion = (CAST(identificacion AS SIGNED));
END$$

/*--------------------------Obtener Docentes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDocentes` $$
CREATE PROCEDURE `obtenerDocentes`() 
BEGIN
    SELECT  Docente.idDocente as IdDocente,
			(CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
            COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, ''))) AS Docente
    FROM Docente 
    INNER JOIN Usuario ON Docente.fkidentificacion = Usuario.identificacion;
END$$

/*--------------------------Obtener Estudiantes Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesGrupo` $$
create procedure `obtenerEstudiantesGrupo`(nomGrupo varchar(400)) 
begin
	select distinct Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, 
		   Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, 
           Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, 
           COALESCE((select ObtenerNombreTipoSangre(Us.fkidTipoSangre)), 'Sin definir') as tipoSangre,
           COALESCE((select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)), 'Sin definir') as tipoDocumento, 
           COALESCE((select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)), 'Sin definir') as nombreDiscapacidad, 
           COALESCE((select ObtenerNombreSisben(Us.fkidSisben)), 'Sin definir') as nombreSisben,
           COALESCE((select ObtenerNombreGenero(Us.fkidGenero)), 'Sin definir') as nombreGenero, 
           COALESCE((SELECT ObtenerNombreEPS(Us.fkidEPS)), 'Sin definir') AS nombreEPS, 
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato
	From GradoGrupo as gg
    inner join estudiantesGradoGrupo as egg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Estudiante as e on egg.fkidEstudiante = e.idEstudiante
    inner join Usuario as Us on e.Usuario_identificacion = Us.identificacion
    where gg.grupoGrado = nomGrupo;
    
END$$

/*--------------------------Obtener Sede Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerSedeDocente` $$
CREATE PROCEDURE `obtenerSedeDocente`(identificacion varchar(400)) 
BEGIN
    SELECT s.nombreSede AS Sede
    FROM Docente 
    INNER JOIN Sede as s ON Docente.fkidSede = s.idSede
    where Docente.idDocente = (select ObtenerIdDocente(CAST(identificacion AS SIGNED)));
END$$

/*--------------------------Obtener Docentes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteSede` $$
create procedure `ObtenerDocenteSede`(
	sedeRef varchar(400)
) 
begin
    SELECT  d.idDocente as IdDocente,
			CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
				  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci as Docentes
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Docentes Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocentesSedeGrado` $$
create procedure `ObtenerDocentesSedeGrado`(
	sedeRef varchar(400),
    nomGrupo varchar(400)
) 
begin
	declare nomGrado varchar(400);
    set nomGrado = (select g.nombreGrado from Grados as g
				   inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo);
    SELECT  d.idDocente as IdDocente,
			CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
				  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci as Docentes
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    left join DocentesGrado as dg on dg.fkidDocente = d.idDocente 
    inner join Grados as g on dg.fkidGrado = g.idGrado and g.nombreGrado = nomGrado
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Informacion Docentes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocenteSede` $$
create procedure `ObtenerInfoDocenteSede`(
	sedeRef varchar(400)
) 
begin
    SELECT d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
           COALESCE(d.horasLaboralesSemanales, "Sin Definir") as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS		   
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Informacion Docentes Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocentesSedeGrado` $$
create procedure `ObtenerInfoDocentesSedeGrado`(
	sedeRef varchar(400),
    nomGrupo varchar(400)
) 
begin
	declare nomGrado varchar(400);
    
    set nomGrado = (select g.nombreGrado from Grados as g
				   inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo);
                   
    SELECT d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
           d.horasLaboralesSemanales as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS				   
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    left join DocentesGrado as dg on dg.fkidDocente = d.idDocente 
    inner join Grados as g on dg.fkidGrado = g.idGrado and g.nombreGrado = nomGrado
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Informacion Todos los Docentes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocentesTodos` $$
create procedure `ObtenerInfoDocentesTodos`() 
begin                   
    SELECT d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
           d.horasLaboralesSemanales as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS				   
	From Docente as d  
    inner join Usuario as u on d.fkidentificacion = u.identificacion;
END$$

/*--------------------------Obtener Informacion Docentes Vista Asignacion Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoGradosAsignaturasDocentes` $$
create procedure `ObtenerInfoGradosAsignaturasDocentes`(identificadorDocente int) 
begin                   
    SELECT CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede			   
	From Docente as d  
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where d.idDocente = identificadorDocente;
END$$

/*--------------------------Obtener Informacion Docentes Vista Asignacion Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `GradosAsignaturasDocentes` $$
CREATE PROCEDURE `GradosAsignaturasDocentes`(sedeRef VARCHAR(400), GradoRef VARCHAR(400), nomAsignatura VARCHAR(400)) 
BEGIN
	Declare idGradoRef int;
    set idGradoRef = (select ObtenerIdGrado(GradoRef));
	
    SELECT subconsulta1.Documento, subconsulta1.NombreDocente
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente
        FROM Asignatura AS a
        INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura
        INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE a.nombreAsignatura = nomAsignatura
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente
        FROM Sede AS s
        INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
        INNER JOIN Grados AS g ON sg.fkidGrado = idGrado
        INNER JOIN DocentesGrado AS dg ON dg.fkidGrado = g.idGrado
        INNER JOIN Docente AS d ON dg.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE s.nombreSede = sedeRef AND g.idGrado = idGradoRef
    ) AS subconsulta2 ON subconsulta1.NombreDocente = subconsulta2.NombreDocente;
END$$
DELIMITER ;

/*--------------------------Obtener Asignaturas Del Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `AsignaturasDelDocente` $$
CREATE PROCEDURE `AsignaturasDelDocente`(sedeRef VARCHAR(400), GradoRef VARCHAR(400), identificacionDocente BigInt) 
BEGIN
	Declare idGradoRef int;
    Set idGradoRef = (select ObtenerIdGrado(GradoRef));
	
    SELECT subconsulta1.IdentificadorAsignatura, subconsulta1.Asignatura
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT a.idAsignatura as IdentificadorAsignatura, a.nombreAsignatura as Asignatura
        FROM Sede as s
        inner join Docente as d on d.fkidSede = s.idSede
        inner join DocenteAsignatura as da on da.fkidDocente = d.idDocente
        inner join Asignatura as a on da.fkidAsignatura = a.idAsignatura
        where s.nombreSede = sedeRef and d.fkidentificacion = identificacionDocente
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT a.idAsignatura as IdentificadorAsignatura, a.nombreAsignatura as Asignatura
        FROM Sede as s
        inner join Docente as d on d.fkidSede = s.idSede
        inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
        inner join Grados as g on dg.fkidGrado = g.idGrado
        inner join SedeGrados as sg on sg.fkidGrado = g.idGrado and sg.fkidSede = s.idSede
        left join GradoGrupo as gg on gg.fkidGrado = g.idGrado
        inner join AsignaturaGradoGrupo as agg on agg.fkidGradoGrupo = gg.idGradoGrupo
        inner join Asignatura as a on agg.fkidAsignatura = a.idAsignatura
    ) AS subconsulta2 ON subconsulta1.IdentificadorAsignatura = subconsulta2.IdentificadorAsignatura;
END$$
DELIMITER ;

/*--------------------------Obtener Asignaturas del Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerAsignaturasGrado` $$
create procedure `ObtenerAsignaturasGrado`(sedeRef varchar(400), idGradoRef int) 
begin    
    SELECT a.nombreAsignatura as Asignatura		   
	From Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado and g.idGrado = idGradoRef
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado
	inner join asignaturaGradoGrupo as agg on agg.fkidGradoGrupo = gg.idGradoGrupo
	inner join Asignatura as a on agg.fkidAsignatura = a.idAsignatura
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Grupos del Docente -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteGrupos` $$
create procedure `ObtenerDocenteGrupos`(sedeRef varchar(400), GradoRef varchar(400), documentoDocente bigint) 
begin
	declare idGradoSede int;
    set idGradoSede = (select distinct g.idGrado from Sede as s
					   inner join SedeGrados as sg on sg.fkidSede = s.idSede
                       inner join Grados as g on sg.fkidGrado = g.idGrado
                       where s.nombreSede = sedeRef and g.nombreGrado = GradoRef);
    
    SELECT distinct gg.idGradoGrupo as IdentificadorGrupo, gg.grupoGrado as Grupo	
    From Docente as d 
    inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
    inner join Grados as g on dg.fkidGrado = g.idGrado
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado
    where d.fkidentificacion = documentoDocente and g.nombreGrado = GradoRef and g.idGrado = idGradoSede;

END$$

/*--------------------------Obtener Grupos del Docente -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteGrados` $$
create procedure `ObtenerDocenteGrados`(sedeRef varchar(400), documentoDocente bigint) 
begin
    SELECT distinct g.idGrado as IdentificadorGrado, g.nombreGrado as Grado		   
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede
    inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
    inner join Grados as g on dg.fkidGrado = g.idGrado
    inner join SedeGrados as sg on sg.fkidGrado = g.idGrado
    where s.nombreSede = sedeRef and d.fkidentificacion = documentoDocente and sg.fkidSede = s.idSede;
END$$

/*--------------------------Registrar Docente Asignatura y Grupo de Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `RegistrarAsignaturaGrupoDocente` $$
create procedure `RegistrarAsignaturaGrupoDocente`(idDocenteRef varchar(400), idGradoRef int, asignaturaRef varchar(400), horasSemanalesRef int) 
begin
	declare nombreDocente varchar(400);
    declare identificadorDocente int;
	declare nombreAsignatura varchar(400);
    declare grado int;
    /*(select ObtenerIdDocente(CAST(identificacion AS SIGNED))*/
    set nombreDocente = (SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
						 COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, '')))
						 FROM Docente 
						 inner join Usuario on Docente.fkidentificacion = Usuario.identificacion
						 where Docente.idDocente = (CAST(idDocenteRef AS SIGNED)));
    set identificadorDocente = (select d.idDocente from Docente as d 
								where d.idDocente = (CAST(idDocenteRef AS SIGNED)));
    set nombreAsignatura = (select a.nombreAsignatura from Asignatura as a 
						    where a.nombreAsignatura = asignaturaRef);
    set grado = (select g.idGrado from Grados as g 
				 where g.idGrado = idGradoRef);
    
    if ((FunExisteDocenteAsignaturaGrado(identificadorDocente, nombreAsignatura, grado)) = 0) then
		call registrarDocenteAsignatura(nombreDocente, nombreAsignatura, horasSemanalesRef);
		insert DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado) value ("Activo", identificadorDocente, grado);
		select 1;
	ELSE
		select 0;
	end if;
END$$

/*--------------------------Obtener Periodos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerPeriodos` $$
create procedure `ObtenerPeriodos`() 
begin
    SELECT p.idPeriodoAcademico as IdPeriodo, p.periodoAcademico as Periodo		   
	From PeriodoAcademico as p;
END$$

/*--------------------------Registrar Docente Notas e Inasistencia-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteNotasAsistenciasPeriodo` $$
create procedure `registrarDocenteNotasAsistenciasPeriodo`(
    nombreDocente varchar(400),
    asignatura varchar(400),
    idEstudiante int,
    PeriodoNota varchar(400),
    nota float,
    nFallas int
) 
begin
	declare idNotafinal int;
    declare puestoGeneral int;
    declare puestoGrupo int;
    declare idPeriodoNota int;
    declare periodos int;   
    
	if ((FunexisteNotaDefinitivaPeriodo(idPeriodoNota)) = 0) then	
		set idPeriodoNota = (select obtenerIdPeriodo(PeriodoNota));
		/*set periodos = (select count(*) as RegistroPeriodos from PeriodoAcademico);
		set idNotafinal = (select nf.idNotaDefinitiva from NotaFinal limit 1);*/
        
		insert into NotaDefinitivaPeriodo (notaGeneral, estadoNota, puestoNota, fkidPeriodoAcademico, fkidAsignatura, fkidNotaFinal) 
		value (0, "Por definir", 0, idPeriodoNota, (select ObtenerIdAsignatura(asignatura)), null);
        
		insert into NotasEstudiante (estadoNota, notaDefinitiva, puestoNota, fkidNotaDefinitivaPeriodo, fkidEstudiante) 
		value ("Cargada", nota, 0, idPeriodoNota, idEstudiante);        
		
        update NotaDefinitivaPeriodo set notaGeneral = (select ne.notaDefinitiva from NotasEstudiante as ne where ne.fkidEstudiante = idEstudiante), estadoNota = "Registrada"
		where NotaDefinitivaPeriodo.fkidPeriodoAcademico = idPeriodoNota and fkidAsignatura = (select ObtenerIdAsignatura(asignatura));   
        
        call PosicionandoEstudiantesGrupo(idEstudiante);
    end if;
	
END$$

/*--------------------------Registrar Nota Año Academico-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `NotaAnnoAcademico` $$
create procedure `NotaAnnoAcademico`(
    calificacionAño float
) 
begin
	declare periodos int;
	set periodos = (select count(*) as RegistroPeriodos from PeriodoAcademico);
    
	if (((FunexisteNotaFinal()) = 0) and periodos = 4) then
		insert into NotaFinal (añoElectivo, calificacionAño, estadoCalificacionAño) 
        value ((SELECT YEAR(NOW())), calificacionAño, "Finalizada");
    end if;
END$$

/*------Registrar Posicionamiento Estudiantes Grupo-----*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `PosicionandoEstudiantesGrupo` $$
create procedure `PosicionandoEstudiantesGrupo`(
    idEstudianteRef bigint
) 
begin
    SET @contador = 0;
	-- Realizamos la consulta ordenando por la columna de interés
	SELECT @contador := @contador + 1 AS posicionRef
	FROM NotasEstudiante as ne
	WHERE ne.fkidEstudiante <> idEstudianteRef
	ORDER BY ne.notaDefinitiva;
        
	if ((FunexistePuestoEstudiantePeriodo(idEstudianteRef)) = 0) then 
		insert into PuestosGrupo (idEstudianteGrupo, posicion, nota, estadoPuesto)
        value (idEstudianteRef, 0, nota, "Activo");
        
        update NotasEstudiante set puestoNota = @contador
        where NotasEstudiante.fkidEstudiante = idEstudianteRef;
        
        update NotaDefinitivaPeriodo set puestoNota = @contador
        where  NotaDefinitivaPeriodo.idNotas= (select ne.fkidNotaDefinitivaPeriodo from NotasEstudiante as ne 
											   where ne.fkidEstudiante = idEstudianteRef);		
	else
		update PuestosGrupo set posicion = @contador;
        
        update NotasEstudiante set puestoNota = @contador
        where NotasEstudiante.fkidEstudiante = idEstudianteRef;
    end if;    
END;
//
DELIMITER ;

/*--------------------------Obtener Notas y Fallas del Estudiante -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasFallasEstudiante` $$
create procedure `ObtenerNotasFallasEstudiante`(documentoEstudiante bigint, asignaturaRef varchar(400), periodoRef varchar(400)) 
begin    
    
		SELECT subconsulta1.Identificacion, subconsulta1.Estudiante, subconsulta2.Nota, subconsulta1.Fallas
		FROM (
			-- Subconsulta 1
		SELECT DISTINCT e.Usuario_identificacion as Identificacion,
						(SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
						COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, '')))) as Estudiante,
						a.nFallas as Fallas
		From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join AsistenciaEstudiante as ae on ae.fkidEstudiante = e.idEstudiante
        inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
        inner join Asignatura as asig on a.fkidAsignatura = asig.idAsignatura
        left join PeriodoAcademico as pa on ae.fkidPeriodoAcademico = pa.idPeriodoAcademico
        where u.identificacion = documentoEstudiante and asig.nombreAsignatura = asignaturaRef and 	pa.periodoAcademico = periodoRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT e.Usuario_identificacion as Identificacion, ndp.notaDefinitiva as Nota
        From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
        inner join NotaDefinitivaPeriodo as ndp on ne.fkidNotaDefinitivaPeriodo = ndp.idNotas
        inner join PeriodoAcademico as pa on ndp.fkidPeriodoAcademico = pa.idPeriodoAcademico
        where u.identificacion = documentoEstudiante and pa.periodoAcademico = periodoRef
    ) AS subconsulta2 ON subconsulta1.Identificacion = subconsulta2.Identificacion;

END$$


