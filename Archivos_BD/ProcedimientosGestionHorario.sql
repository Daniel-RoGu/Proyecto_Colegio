/*-------orden de ejecucion de scripts ---------- Script Nº7*/
use bdColegio;


/*--------------------------Registrar horario-------------------------*/
/*
DELIMITER $$
DROP PROCEDURE IF EXISTS `RegistrarHorario` $$
create procedure `RegistrarHorario`(
nombreSedeRH varchar(400), 
nomAsignatura varchar(400), 
nomGrupo varchar(400),
nomDocente varchar(400), 
identificacionDocente varchar(400), 
diaHorarioClase varchar(400), 
rangoHorario varchar(400)
) 
begin
	IF (select existeDocenteHorario(nomDocente, nomAsignatura)) = 1 then
		SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
/*		SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
/*		INSERT horario (horaInicio, horaFin, fechaHorario, diaHorario, estadoHorario) value (horaInicioClase, horaFinClase, "", diaHorarioClase, "Asignado");
		/*Considerar la eliminacion de la "fechaHorario" en caso de no ser necesaria o permitir su nulidad para posibles usos*/
/*		SET grupoSelect = (select gg.fkidGradoGrupo 
						   from Sede as s
						   inner join SedeGrados as sg on sg.fkidSede = s.idSede
						   inner join Grados as g on sg.fkidGrado
						   inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo
						   where s.nombreSede = nombreSedeRH);
		INSERT horarioGradoGrupo (estadoHorarioGG, fkidHorario, fkidGradoGrupo) value ("Asignado", (select ObtenerIdHorario(horaInicioClase, horaFinClase))
																						,(select ObtenerIdGradoGrupo(nomGrupo)));
		INSERT horarioAsignatura (estadoHorarioAsignatura, fkidHorario, fkidAsignatura) value ("Asignado", (select ObtenerIdHorario(horaInicioClase, horaFinClase));																								, (select ObtenerIdAsignatura(nomAsignatura)))
    End IF;
	
END$$
*/
/*--------------------------Registrar horario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS RegistrarHorario $$
CREATE PROCEDURE RegistrarHorario(
    IN nombreSedeRH VARCHAR(400), 
    IN nomAsignatura VARCHAR(400), 
    IN nomGrupo VARCHAR(400),
    IN nomDocente VARCHAR(400), 
    IN identificacionDocente VARCHAR(400), 
    IN diaHorarioClase VARCHAR(400), 
    IN rangoHorario VARCHAR(400)
) 
BEGIN
    DECLARE horaInicioClase VARCHAR(5);
    DECLARE horaFinClase VARCHAR(5);
    DECLARE grupoSelect INT;

    IF (SELECT existeDocenteHorario(nomDocente, nomAsignatura)) = 0 THEN
        SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
        SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/

        INSERT INTO horario (horaInicio, horaFin, fechaHorario, diaHorario, estadoHorario) 
        VALUES (horaInicioClase, horaFinClase, "", diaHorarioClase, "Asignado");

        SET grupoSelect = (SELECT gg.fkidGradoGrupo 
                           FROM Sede AS s
                           INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
                           INNER JOIN Grados AS g ON sg.fkidGrado = g.idGrado
                           INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
                           WHERE s.nombreSede = nombreSedeRH);

        INSERT INTO horarioGradoGrupo (estadoHorarioGG, fkidHorario, fkidGradoGrupo) 
        VALUES ("Asignado", (SELECT ObtenerIdHorario(horaInicioClase, horaFinClase)), grupoSelect);

        INSERT INTO horarioAsignatura (estadoHorarioAsignatura, fkidHorario, fkidAsignatura) 
        VALUES ("Asignado", (SELECT ObtenerIdHorario(horaInicioClase, horaFinClase)), (SELECT ObtenerIdAsignatura(nomAsignatura)));
    END IF;
END$$
DELIMITER ;
