/*-------orden de ejecucion de scripts ---------- Script Nº5*/
USE db_aa74fb_bdcoleg;

/*--------------------------Registrar Funcionario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarFuncionario` $$
create procedure `registrarFuncionario`(
    documento varchar(400),
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad varchar(400),
    telCelular varchar(400),
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
    nombreEstrato varchar(400),
    firmaFuncionario longblob,
    sede varchar(400)
) 
begin
	call registrarUsuario((SELECT CAST(documento AS SIGNED)), nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, (SELECT CAST(edad AS SIGNED)), telCelular, telFijo, correoUss, direccionUss, barrioUss, 
						  fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero, nombreEps, nombreEstrato, "Coordinador");
	insert into Funcionario (firmaFuncionario, estadoFuncionario, Usuario_identificacion, fkidSede)
				value(firmaFuncionario, "Activo", (SELECT CAST(documento AS SIGNED)), (select ObtenerIdSede(sede)));
END$$

/*--------------------------Registrar ModalidadEducativa-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarModalidadEducativa` $$
create procedure `registrarModalidadEducativa`(
    nomModalidadEducativa varchar(400)
) 
begin
	insert into modalida_educativa (nombreModalidad, estadoModalidad)
				value(nomModalidadEducativa, "Activa");
END$$

/*--------------------------Registrar Matricula-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarMatricula` $$
create procedure `registrarMatricula`(
    jornadaEs varchar(400),
    fechaInicioM varchar(400),
    fechaFinM varchar(400),
    esInternado varchar(400),
    gradoEst varchar(400),
    grupoEst varchar(400),
    identificacionEst varchar(400),
    identificacionFuncionario varchar(400),
    nombreSede varchar(400)
) 
begin
	declare fechaTermina varchar(400);
    declare esInternadoM varchar(400);
    SET fechaTermina = IFNULL(fechaFinM, 'Sin registro');
    set esInternadoM = IFNULL(esInternado, 'Sin registro');
	insert into Matricula (jornada, fechaInicio, fechaFin, internadoEstado, gradoEstudiante, grupoEstudiante, estadoMatricula, fkidEstudiante,
						   fkidFuncionario, fkidSede)
				value(jornadaEs, fechaInicioM, fechaTermina, esInternadoM, gradoEst, grupoEst, "Activa", (select ObtenerIdEstudiante((SELECT CAST(identificacionEst AS SIGNED)))), 
                (select ObtenerIdFuncionario((SELECT CAST(identificacionFuncionario AS SIGNED)))), (select ObtenerIdSede(nombreSede)) );
END$$

/*--------------------------Registrar Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSede` $$
create procedure `registrarSede`(
    nomSede varchar(400)
) 
begin
	insert into Sede (nombreSede, internadoDisponibilidad, estadoSede, fk_idModalida_Educativa)
				value(nomSede, "No", "Activa", (select ObtenerIdModalidadEducativa("Sin definir")));
END$$

/*--------------------------Registrar Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAsignatura` $$
create procedure `registrarAsignatura`(
    nomAsignatura varchar(400)
) 
begin
	insert into Asignatura (nombreAsignatura, estadoAsignatura)
				value(nomAsignatura, "Activa");
END$$

/*--------------------------Registrar Tipo Nota-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoNota` $$
create procedure `registrarTipoNota`(
    nomTpNota varchar(400)
) 
begin
	insert into tipoNota (tipoNota, porcentajeNota, estadoNota)
				value(nomTpNota, "Sin definir", "Activo");
END$$

/*--------------------------Registrar Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGrado` $$
create procedure `registrarGrado`(
    nomGrado varchar(400)
) 
begin
	if (existeGradoRetorno(nomGrado) = 0) then
		insert into Grados (nombreGrado, estadoGrado)
				value(nomGrado, "Activo");
    end if;
END$$

/*--------------------------Registrar GradoGrupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGradoGrupo` $$
create procedure `registrarGradoGrupo`(
    nomGrado varchar(400),
    nomGradoGrupo varchar(400)
) 
begin
	call registrarGrado(nomGrado);
    if (existeGrupoRetorno(nomGradoGrupo) = 0) then
		insert into GradoGrupo (nombreTitular, grupoGrado, estadoGrupoGrado, fkidGrado)
					value("Por definir", nomGradoGrupo, "Activo", (select ObtenerIdGrado(nomGrado)) );
		IF (nomGrado = "0") THEN        
			CALL registrarAsignaturaGradoGrupo2("ACTIVIDADRECTORA_ARTE", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("ACTIVIDADRECTORA_JUEGO", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("ACTIVIDADRECTORA_MEDIO_AMBIENTE", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("ACTIVIDADRECTORA_LITERATURA", nomGradoGrupo, 5);
						
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_CORPORAL", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_COMUNICATIVA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_ESTETICA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_ESPIRITUAL", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_COGNITIVA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("ETICA Y VALORES", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("DIMENSION_SOCIO_AFECTIVA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "1") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "2") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "3") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "4") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "5") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "6") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "7") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "8") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "9") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("MATEMATICAS", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS NATURALES", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS SOCIALES", nomGradoGrupo, 5);
			CALL registrarAsignaturaGradoGrupo2("RELIGIÓN", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "10") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 7);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("QUIMICA", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("FISICA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS POLITICAS", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("FILOSOFIA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("TRIGONOMETRIA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;

		IF (nomGrado = "11") THEN
			CALL registrarAsignaturaGradoGrupo2("ESPAÑOL", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("INGLES", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("ÉTICA Y VALORES", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("EDU. FÍSICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("INFORMÁTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("PROYECTO PEDAGÓGICO PRODUCTIVO", nomGradoGrupo, 7);
			CALL registrarAsignaturaGradoGrupo2("ECOLOGÍA", nomGradoGrupo, 1);
			CALL registrarAsignaturaGradoGrupo2("ARTÍSTICA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("EMPRENDIMIENTO", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("QUIMICA", nomGradoGrupo, 4);
			CALL registrarAsignaturaGradoGrupo2("FISICA", nomGradoGrupo, 3);
			CALL registrarAsignaturaGradoGrupo2("CIENCIAS POLITICAS", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("FILOSOFIA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("TRIGONOMETRIA", nomGradoGrupo, 2);
			CALL registrarAsignaturaGradoGrupo2("CONVIVENCIA", nomGradoGrupo, 0);
		END IF;
    end if;
END$$

/*--------------------------Registrar Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSedeGrado` $$
create procedure `registrarSedeGrado`(
    nomSede varchar(400),
    nomGrado varchar(400)
) 
begin
	insert into SedeGrados (estadoGradoSede, fkidSede, fkidGrado)
				value("Activo", (select ObtenerIdSede(nomSede)), (select ObtenerIdGrado(nomGrado)) );
END$$

/*--------------------------Registrar Estudiantes Grado-Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstudiantesGradoGrupo` $$
create procedure `registrarEstudiantesGradoGrupo`(
    identificacionEst varchar(400),
    grupoGrado varchar(400)
) 
begin
	insert into EstudiantesGradoGrupo (rendimientoGeneral, estadoEstudianteGG, fkidEstudiante, fkidGradoGrupo)
				value("Sin definir", "Activo", (select ObtenerIdEstudiante(CAST(identificacionEst AS SIGNED))), (select ObtenerIdGradoGrupo(grupoGrado)) );
END$$

/*--------------------------Registrar Asignaturas del Grado-Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAsignaturaGradoGrupo` $$
create procedure `registrarAsignaturaGradoGrupo`(
    nomAsignatura varchar(400),
    grupoGrado varchar(400)
) 
begin
	insert into AsignaturaGradoGrupo (estadoAsignaturaGG, fkidGradoGrupo, fkidAsignatura)
				value("Disponible", (select ObtenerIdGradoGrupo(grupoGrado)), (select ObtenerIdAsignatura(nomAsignatura)) );
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAsignaturaGradoGrupo2` $$
create procedure `registrarAsignaturaGradoGrupo2`(
    nomAsignatura varchar(400),
    grupoGrado varchar(400),
    horaSemana int
) 
begin
	insert into AsignaturaGradoGrupo (estadoAsignaturaGG, horasSemanales, fkidGradoGrupo, fkidAsignatura)
				value("Disponible", horaSemana, (select ObtenerIdGradoGrupo(grupoGrado)), (select ObtenerIdAsignatura(nomAsignatura)) );
END$$

/*--------------------------Registrar Competencias Asignaturas-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarCompetenciasAsignatura` $$
create procedure `registrarCompetenciasAsignatura`(
    nomCompetencia varchar(400),
    objCompetencia varchar(400),
    competenciaDetalle varchar(400),
    nomAsignatura varchar(400)
) 
begin
	insert into Competencias (nombreCompetencia, objetivoCompetencia, informacionCompetencia, estadoCompetencia, fkidAsignatura)
				value(nomCompetencia, objCompetencia, competenciaDetalle, "Disponible", (select ObtenerIdAsignatura(nomAsignatura)) );
END$$

/*--------------------------Registrar Periodo Academico-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPeriodoAcademico` $$
create procedure `registrarPeriodoAcademico`(
    nomPeriodo varchar(400),
    inicia varchar(400),
    termina varchar(400),
    annoElectivo varchar(400)
) 
begin
	insert into periodoAcademico (periodoAcademico, fechaInicio, fechaFin, estadoPeriodo, añoElectivo)
				value(nomPeriodo, inicia, termina, "Disponible", annoElectivo);
END$$

/*--------------------------Obtener Periodo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerPeriodosAcademico` $$
create procedure `ObtenerPeriodosAcademico`(
) 
begin
	select p.idPeriodoAcademico as IdPeriodo, p.periodoAcademico as Periodo, p.fechaInicio as Comienza, p.fechaFin as Termina,
		   p.estadoPeriodo as Estado
	from PeriodoAcademico as p;
END$$

/*--------------------------Obtener Periodo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarPeriodosAcademico $$
CREATE PROCEDURE actualizarPeriodosAcademico(
  idPeriodoRef INT,
  estadoPeriodoRef VARCHAR(400)
) 
BEGIN
  IF estadoPeriodoRef = 'Habilitado' THEN
    
    UPDATE PeriodoAcademico
    SET estadoPeriodo = "Desabilitado"
    WHERE idPeriodoAcademico != idPeriodoRef;
    
    UPDATE PeriodoAcademico
	SET estadoPeriodo = "Habilitado"
	WHERE idPeriodoAcademico = idPeriodoRef;
    
    select 1;
  ELSE IF estadoPeriodoRef = 'Desabilitado' then		
		UPDATE PeriodoAcademico
		SET estadoPeriodo = "Desabilitado"
		WHERE idPeriodoAcademico = idPeriodoRef;
    END IF;
	
	select 1;
  END IF;
END$$
DELIMITER ;

/*--------------------------Obtener Sedes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSedes` $$
create procedure `ObtenerSedes`(
) 
begin
	SELECT Sede.idSede AS IdSede, Sede.nombreSede AS Sede
	FROM Sede
	GROUP BY nombreSede;
END$$

/*--------------------------Obtener Tipos de Sangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoSangre` $$
create procedure `ObtenerTipoSangre`(
) 
begin
	select ts.idTipoSangre as IdTipoSangre, ts.nombreTipoSangre as TipoSangre from tipoSangre as ts
    GROUP BY nombreTipoSangre;
END$$

/*--------------------------Obtener Tipos de Documento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoDocumento` $$
create procedure `ObtenerTipoDocumento`(
) 
begin
	select distinct td.idTipoDocumento as idTipoDocumento, td.nombreTipoDocumento as TipoDocumento from tipoDocumento as td
    GROUP BY nombreTipoDocumento;
END$$


/*--------------------------Obtener Tipos Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDiscapacidad` $$
create procedure `obtenerDiscapacidad`(
) 
begin
	select distinct d.idDiscapacidad as IdDiscapacidad, d.nombreDiscapacidad as Discapacidad from Discapacidad as d
    GROUP BY nombreDiscapacidad;
END$$


/*--------------------------Obtener Tipos Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerSisben` $$
create procedure `obtenerSisben`(
) 
begin
	select distinct s.idSisben as IdSisben, s.nombreSisben as Siben from Sisben as s
    GROUP BY nombreSisben;
END$$


/*--------------------------Obtener Generos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGenero` $$
create procedure `obtenerGenero`(
) 
begin
	select distinct g.idGenero as IdGenero, g.nombreGenero as Genero from Genero as g
    GROUP BY nombreGenero;
END$$


/*--------------------------Obtener EPSs-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEPS` $$
create procedure `obtenerEPS`(
) 
begin
	select distinct EPS.idEPS as IdEPS, EPS.nombreEPS as EPS from EPS
    GROUP BY nombreEPS;
END$$


/*--------------------------Obtener Estratos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstrato` $$
create procedure `obtenerEstrato`(
) 
begin
	select distinct e.idEstrato as IdEstrato, e.nombreEstrato as Estrato from Estrato as e
    GROUP BY nombreEstrato;
END$$

/*--------------------------Obtener Asignaturas-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerAsignaturas` $$
create procedure `obtenerAsignaturas`(
) 
begin
	select distinct a.idAsignatura as IdAsignatura, a.nombreAsignatura as Asignatura from Asignatura as a
    GROUP BY nombreAsignatura;
END$$

/*--------------------------Obtener Grupos por Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGruposGrado` $$
create procedure `obtenerGruposGrado`(
) 
begin
	select distinct gg.idGradoGrupo as IdGradoGrupo, gg.grupoGrado as Grupo from GradoGrupo as gg
    GROUP BY grupoGrado;
END$$

/*--------------------------Obtener Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGrados` $$
create procedure `obtenerGrados`(
) 
begin
	select distinct g.idGrado as IdGrado, g.nombreGrado as Grado from Grados as g
    GROUP BY nombreGrado;
END$$

/*--------------------------Obtener Grupos por Grado de Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGruposGradoSede` $$
create procedure `obtenerGruposGradoSede`(
	sedeRef varchar(400),
	gradoRef varchar(400)
) 
begin
	select DISTINCT gg.idGradoGrupo as IdGradoGrupo, gg.grupoGrado as Grupo 
    from Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado and g.nombreGrado = gradoRef
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado  
    where s.nombreSede = sedeRef;
END$$


/*--------------------------Obtener Grado de Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGradosXSede` $$
create procedure `obtenerGradosXSede`(
	sedeGradoGrupo varchar(400)
) 
begin
	select DISTINCT g.idGrado as IdGrado, g.nombreGrado as Grupo 
    from Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado 
    where s.nombreSede = sedeGradoGrupo
    order by nombreGrado asc;
END$$

/*--------------------------Obtener Estudiantes Sede_Grado-------------------------*/
/*DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudianteSedeGrado` $$
create procedure `obtenerEstudianteSedeGrado`(
	nomSede varchar(400),
    nomGrupo varchar(400)
) 
begin
	select distinct Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, (select ObtenerNombreTipoSangre(Us.fkidTipoSangre)) as tipoSangre,
           (select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)) as tipoDocumento, (select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)) as nombreDiscapacidad, (select ObtenerNombreSisben(Us.fkidSisben)) as nombreSisben,
           (select ObtenerNombreGenero(Us.fkidGenero)) as nombreGenero, (select ObtenerNombreEPS(Us.fkidEPS)) as nombreEPS, (select ObtenerNombreEstrato(Us.fkidEstrato)) as nombreEstrato
	From Sede as s
    inner join sedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado
    inner join gradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo
    inner join estudiantesGradoGrupo as egg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Estudiante as e on egg.fkidEstudiante = e.idEstudiante
    inner join Usuario as Us on e.Usuario_identificacion = Us.identificacion
    where s.nombreSede = nomSede;
END$$*/

DROP PROCEDURE IF EXISTS `obtenerEstudianteSedeGrado` $$
create procedure `obtenerEstudianteSedeGrado`(
	nomSede varchar(400),
    nomGrado varchar(400)
) 
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
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato, g.nombreGrado as Grado, 
           gg.grupoGrado as Grupo
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante 
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo  
    inner join Grados as g on gg.fkidGrado = g.idGrado 
    inner join sedeGrados as sg on sg.fkidGrado = g.idGrado 
    inner join Sede as s on sg.fkidSede = s.idSede
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante and m.fkidSede = s.idSede
    where s.nombreSede = nomSede and g.nombreGrado = nomGrado;
END$$

/*--------------------------Obtener Estudiantes Sede Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSedeGrupo` $$
create procedure `obtenerEstudiantesSedeGrupo`(nomSede varchar(400), nomGrupo varchar(400)) 
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
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante 
    inner join GradoGrupo as gg on gg.grupoGrado = nomGrupo and egg.fkidGradoGrupo = gg.idGradoGrupo  
    inner join Grados as g on gg.fkidGrado = g.idGrado 
    inner join sedeGrados as sg on sg.fkidGrado = g.idGrado 
    inner join Sede as s on sg.fkidSede = s.idSede
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante and m.fkidSede = s.idSede
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Obtener Estudiantes Sede Grupo 2-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSedeGrupo2` $$
create procedure `obtenerEstudiantesSedeGrupo2`(nomSede varchar(400), nomGrupo varchar(400)) 
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
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato, g.nombreGrado as Grado, 
           gg.grupoGrado as Grupo
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante 
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo  
    inner join Grados as g on gg.fkidGrado = g.idGrado 
    inner join sedeGrados as sg on sg.fkidGrado = g.idGrado 
    inner join Sede as s on sg.fkidSede = s.idSede
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante and m.fkidSede = s.idSede
    where s.nombreSede = nomSede and gg.grupoGrado = nomGrupo;
    
END$$

/*--------------------------Obtener Estudiantes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSede` $$
create procedure `obtenerEstudiantesSede`(nomSede varchar(400)) 
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
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante
    inner join Sede as s on m.fkidSede = s.idSede
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Obtener Estudiantes Sede 2-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSede2` $$
create procedure `obtenerEstudiantesSede2`(nomSede varchar(400)) 
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
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato, g.nombreGrado as Grado, 
           gg.grupoGrado as Grupo
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante
    inner join Sede as s on m.fkidSede = s.idSede
    left join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Registrar Imagen-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarImagen` $$
create procedure `registrarImagen`(
 IN nombreImagen VARCHAR(400),
 IN datosImagen BLOB
) 
begin
	insert Imagenes (propietarioImagen, imagen) values (nombreImagen, datosImagen);
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarImagen2` $$
create procedure `registrarImagen2`(
 IN propietarioIdRef LONG,
 IN nombreImagen VARCHAR(400),
 IN datosImagen LONGTEXT, 
 IN tipoPropietarioRef VARCHAR(400) 
) 
begin
	insert Imagenes (propietarioId, propietarioImagen, datos_imagen, tipoPropietario) values (propietarioIdRef, nombreImagen, datosImagen, tipoPropietarioRef);
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarFoto` $$
create procedure `registrarFoto`(
 IN propietarioIdRef BIGINT,
 IN nombreImagenRef VARCHAR(400),
 IN datosImagenRef LONGTEXT
) 
begin
	declare idFotoUp int;
	if((select FunexisteFotoEstudiante(propietarioIdRef)) > 0) then
		set idFotoUp = (select f.idFoto from Fotos as f where f.propietarioId = propietarioIdRef);
		update Fotos set nombreFoto = nombreImagenRef, datos_Foto = datosImagenRef
        where idFoto = idFotoUp;
	else 
		insert Fotos (propietarioId, nombreFoto, datos_Foto) values (propietarioIdRef, nombreImagenRef, datosImagenRef);
    end if;
	
END$$

/*--------------------------Obtener Imagen-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerImagen` $$
create procedure `obtenerImagen`(
 IN nombreImagenRef VARCHAR(400)
) 
begin
	Select i.propietarioImagen as NombreImagen, i.imagen as ContenidoImagen
    From Imagenes as i
    Where i.propietarioImagen = nombreImagenRef;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerImagen2` $$ /*FIRMAS*/
create procedure `obtenerImagen2`(
 IN nombreArchivoRef VARCHAR(400)
) 
begin
	Select i.propietarioId as DocumentoPropietario, i.propietarioImagen as NombreImagen, i.datos_imagen as ContenidoImagen, i.tipoPropietario as Propietario
    From Imagenes as i
    Where i.propietarioImagen = nombreArchivoRef
    order by i.propietarioId desc limit 1;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerFirmaTitular` $$ /*FIRMA TITULAR*/
create procedure `obtenerFirmaTitular`(
 IN DocDueñoRef long
) 
begin
	Select i.propietarioId as DocumentoPropietario, i.propietarioImagen as NombreImagen, i.datos_imagen as ContenidoImagen, i.tipoPropietario as Propietario
    From Imagenes as i
    Where i.propietarioId = DocDueñoRef
    order by i.propietarioId desc limit 1;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerFoto` $$
create procedure `obtenerFoto`(
 IN propietarioIdRef VARCHAR(400)
) 
begin
	Select f.propietarioId as IdPropietario, f.nombreFoto as NombreImagen, f.datos_Foto as ContenidoImagen
    From Fotos as f
    Where f.propietarioId = propietarioIdRef;
END$$

/*--------------------------Obtener Imagen-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerTutilarGrupoxGrupo` $$
create procedure `obtenerTutilarGrupoxGrupo`(
 IN nomGrupo VARCHAR(400)
) 
begin
	/*select ObtenerNombreCompletoDocente(identificacionDocente long)*/
	Declare nombreTitular Varchar(400);
    set nombreTitular = (Select gg.nombreTitular as NombreTitular
						 From GradoGrupo as gg
						 Where gg.grupoGrado = nomGrupo);
	Select d.fkIdentificacion as IdentificacionDocente, (select ObtenerNombreCompletoDocente(d.fkIdentificacion)) as Docente
    From Docente as d
    Inner join Usuario as u on d.fkIdentificacion = u.identificacion
    Where (CONCAT(COALESCE(u.primerNombreUsuario, ''), CASE WHEN u.segundoNombreUsuario IS NOT NULL THEN ' ' ELSE '' END, 
				  COALESCE(u.segundoNombreUsuario, ''), ' ', COALESCE(u.primerApellidoUsuario, ''), ' ', 
				  COALESCE(u.segundoApellidoUsuario, '')
		   )) COLLATE utf8mb4_unicode_ci = nombreTitular;
END$$

