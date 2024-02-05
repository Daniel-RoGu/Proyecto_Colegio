use bdColegio;

/*--------------------------Registrar TipoSangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoSangre` $$
create procedure `registrarTipoSangre`(
    nomTpSangre varchar(45)
) 
begin
	insert into TipoSangre (nombreTipoSangre, estadoTipoSangre)
				value(nomTpSangre, "Activo");
END$$

/*--------------------------Registrar TipoDocumento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoDocumento` $$
create procedure `registrarTipoDocumento`(
    nomTpDocumento varchar(45)
) 
begin
	insert into TipoDocumento (nombreTipoDocumento, estadoTipoDocumento)
				value(nomTpDocumento, "Activo");
END$$

/*--------------------------Registrar Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDiscapacidad` $$
create procedure `registrarDiscapacidad`(
    nomDiscapacidad	 varchar(45)
) 
begin
	insert into Discapacidad (nombreDiscapacidad, estadoDiscapacidad)
				value(nomDiscapacidad, "Activo");
END$$

/*--------------------------Registrar Genero-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGenero` $$
create procedure `registrarGenero`(
    nomGenero varchar(45)
) 
begin
	insert into Genero (nombreGenero, estadoGenero)
				value(nomGenero, "Activo");
END$$

/*--------------------------Registrar EPS-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEPS` $$
create procedure `registrarEPS`(
    nomEPS varchar(300)
) 
begin
	insert into EPS (nombreEPS, estadoEPS)
				value(nomEPS, "Activo");
END$$

/*--------------------------Registrar Estrato-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstrato` $$
create procedure `registrarEstrato`(
    nomEstrato varchar(45)
) 
begin
	insert into Estrato (nombreEstrato, estadoEstrato)
				value(nomEstrato, "Activo");
END$$

/*--------------------------Registrar Rol-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRol` $$
create procedure `registrarRol`(
    nomRol varchar(45)
) 
begin
	insert into Rol (nombreRol, estadoRol)
				value(nomRol, "Activo");
END$$

/*--------------------------Registrar Permiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPermiso` $$
create procedure `registrarPermiso`(
    nomPermiso varchar(45)
) 
begin
	insert into Permiso (nombrePermiso, estadoPermiso)
				value(nomPermiso, "Activo");
END$$

/*--------------------------Registrar RolPermiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRolPermiso` $$
create procedure `registrarRolPermiso`(
    nombreInterfaz varchar(60),
    nombreCarpetaRaiz varchar(60),
    nombreRol varchar(60),
    nombrePermiso varchar(60)
) 
begin
	insert into RolPermiso (nombreVista, vistaRaiz, fkidRol, fkidPermiso)
				value(nombreInterfaz, nombreCarpetaRaiz, (select ObtenerIdRol(nombreRol)), (select ObtenerIdPermiso(nombrePermiso)));
END$$

/*--------------------------Registrar Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSisben` $$
create procedure `registrarSisben`(
    nomSisben varchar(45)
) 
begin
	insert into Sisben (nombreSisben, estadoSisben)
				value(nomSisben, "Activo");
END$$

/*--------------------------Registrar Usuario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarUsuario` $$
create procedure `registrarUsuario`(
	documento int,
	nomUsuario varchar(40),
    nom2Usuario varchar(45),
    apellidoUsuario varchar(45),
    apellido2Usuario varchar(45),
    edad int,
    telCelular varchar(45),
    telFijo varchar(10),
    correoUss varchar(45),
    direccionUss varchar(200),
    barrioUss varchar(45),
    fechaNacimientoUss varchar(45),
    tipoSangre varchar(45),
    tipoDocumento varchar(45),
    nombreDiscapacidad varchar(45),
    nombreSisben varchar(45),
    nombreGenero varchar(45),
    nombreEps varchar(45),
    nombreEstrato varchar(45),
    nombreRol varchar(45)
) 
begin
	insert into Usuario (identificacion, primerNombreUsuario, segundoNombreUsuario, primerApellidoUsuario, segundoApellidoUsuario, edadUsuario,
						   telefonoCelular, telefonoFijo, correo, direccion, barrioUbicacionUsuario, fechaNacimiento, estadoUsuario, fkidTipoDocumento,
                           fkidTipoSangre, fkidDiscapacidad, fkidSisben, fkidRol, fkidEstrato, fkidEPS, fkidGenero)
				value(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
					   direccionUss, barrioUss, fechaNacimientoUss, "Activo", (select ObtenerIdTipoDocumento(tipoDocumento)), (select ObtenerIdTipoSangre(tipoSangre)), 
					   (select ObtenerIdDiscapacidad(nombreDiscapacidad)), (select ObtenerIdSisben(nombreSisben)), (select ObtenerIdRol(nombreRol)), (select ObtenerIdEstrato(nombreEstrato)), 
                       (select ObtenerIdEPS(nombreEps)), (select ObtenerIdGenero(nombreGenero)));
END$$

/*--------------------------Registrar Estudiante-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstudiante` $$
create procedure `registrarEstudiante`(
	documento int,
	nomUsuario varchar(40),
    nom2Usuario varchar(45),
    apellidoUsuario varchar(45),
    apellido2Usuario varchar(45),
    edad int,
    telCelular varchar(45),
    telFijo varchar(10),
    correoUss varchar(45),
    direccionUss varchar(200),
    barrioUss varchar(45),
    fechaNacimientoUss varchar(45),
    tipoSangre varchar(45),
    tipoDocumento varchar(45),
    nombreDiscapacidad varchar(45),
    nombreSisben varchar(45),
    nombreGenero varchar(45),
    nombreEps varchar(45),
    nombreEstrato varchar(45),
    codigoStudent varchar(100),
    ciudadNacimientoEs varchar(100),
    ciudadResidenciaEs varchar(100),
    ciudadExpedicionDocumentoEs varchar(100),
    paisOrigenEs varchar(100),
    asistenciaAcademicaEspecialEs varchar(200),
    desplazadoEstadoEs varchar(100)
) 
begin
	call registrarUsuario(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss, direccionUss, barrioUss, 
						  fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero, nombreEps, nombreEstrato, "Estudiante");
	insert into Estudiante (codigoEstudiante, ciudadNacimiento, ciudadResidencia, ciudadExpedicionDocumento, paisOrigen,
                           asistenciaAcademicaEspecial, desplazadoEstado, Usuario_identificacion)
				value(codigoStudent, ciudadNacimientoEs, ciudadResidenciaEs, ciudadExpedicionDocumentoEs, paisOrigenEs,
                      asistenciaAcademicaEspecialEs, desplazadoEstadoEs, documento);
END$$

/*--------------------------Registrar Acudiente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAcudiente` $$
create procedure `registrarAcudiente`(
    identificacionAcudienteEs int,
    nombreAcudienteEs varchar(100),
    apellidoAcudienteEs varchar(100),
    correoAcudienteEs varchar(150),
    celularAcudienteEs varchar(12),
    parentescoAcudienteEs varchar(100),
    responsabilidadEconomicaAcudienteEs varchar(100),
    generoAcudienteEs varchar(45),
    identificacionEstudianteEs int
) 
begin
	insert into Acudiente (identificacionAcudiente, nombreAcudiente, apellidoAcudiente, correoAcudiente, celularAcudiente, 
						   parentescoEstudiante, responsabilidadEconomicaEstudiante, estadoAcudiente, Genero_idGenero, Estudiante_idEstudiante)
				value(identificacionAcudienteEs, nombreAcudienteEs, apellidoAcudienteEs, correoAcudienteEs, celularAcudienteEs, parentescoAcudienteEs,
					  responsabilidadEconomicaAcudienteEs, "Activo", (select ObtenerIdGenero(generoAcudienteEs)), (select ObtenerIdEstudiante(identificacionEstudianteEs)));
END$$

/*--------------------------Registrar ModalidadEducativa-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarModalidadEducativa` $$
create procedure `registrarModalidadEducativa`(
    nomModalidadEducativa varchar(45)
) 
begin
	insert into ModalidadEducativa (nombreModalidad, estadoModalidad)
				value(nomModalidadEducativa, "Activa");
END$$

/*--------------------------Registrar Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSede` $$
create procedure `registrarSede`(
    nomSede varchar(350),
    esInternado varchar(45),
    nomModalidadEducativa varchar(350)
) 
begin
	insert into Sede (nombreSede, internadoDisponibilidad, estadoSede, fk_idModalidadEducativa)
				value(nomSede, esInternado, "Activa", (select ObtenerIdModalidadEducativa(nomModalidadEducativa)));
END$$

/*--------------------------Registrar Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocente` $$
create procedure `registrarDocente`(
    horasTrabaja varchar(45),
    documento int,
    nomSede varchar(350),
	nomUsuario varchar(40),
    nom2Usuario varchar(45),
    apellidoUsuario varchar(45),
    apellido2Usuario varchar(45),
    edad int,
    telCelular varchar(45),
    telFijo varchar(10),
    correoUss varchar(45),
    direccionUss varchar(200),
    barrioUss varchar(45),
    fechaNacimientoUss varchar(45),
    tipoSangre varchar(45),
    tipoDocumento varchar(45),
    nombreDiscapacidad varchar(45),
    nombreSisben varchar(45),
    nombreGenero varchar(45),
    nombreEps varchar(45),
    nombreEstrato varchar(45),
    nombreRol varchar(45)
) 
begin
	call registrarUsuario(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
						  direccionUss, barrioUss, fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero,
                          nombreEps, nombreEstrato, nombreRol);
	insert into Docente (estadoDocente, horasLaboralesSemanales, Usuario_identificacion, Sede_idSede)
				value("Activo", horasTrabaja, (select ObtenerIdUsuario(documento)), (select ObtenerIdSede(nomSede)));
END$$