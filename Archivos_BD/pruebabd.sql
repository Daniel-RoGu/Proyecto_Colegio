-- MySQL Script generated by MySQL Workbench
-- Tue Mar 12 12:27:32 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `TipoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoDocumento` ;

CREATE TABLE IF NOT EXISTS `TipoDocumento` (
  `idTipoDocumento` INT NOT NULL,
  `nombreTipoDocumento` VARCHAR(45) NOT NULL,
  `estadoTipoDocumento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoSangre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoSangre` ;

CREATE TABLE IF NOT EXISTS `TipoSangre` (
  `idTipoSangre` INT NOT NULL,
  `nombreTipoSangre` VARCHAR(45) NOT NULL,
  `estadoTipoSangre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoSangre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Discapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discapacidad` ;

CREATE TABLE IF NOT EXISTS `Discapacidad` (
  `idDiscapacidad` INT NOT NULL,
  `nombreDiscapacidad` VARCHAR(45) NOT NULL,
  `estadoDiscapacidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiscapacidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sisben`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sisben` ;

CREATE TABLE IF NOT EXISTS `Sisben` (
  `idSisben` INT NOT NULL,
  `nombreSisben` VARCHAR(45) NOT NULL,
  `estadoSisben` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSisben`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL,
  `nombreRol` VARCHAR(45) NOT NULL,
  `estadoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Estrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estrato` ;

CREATE TABLE IF NOT EXISTS `Estrato` (
  `idEstrato` INT NOT NULL,
  `nombreEstrato` VARCHAR(45) NOT NULL,
  `estadoEstrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EPS` ;

CREATE TABLE IF NOT EXISTS `EPS` (
  `idEPS` INT NOT NULL,
  `nombreEPS` VARCHAR(45) NOT NULL,
  `estadoEPS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEPS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genero` ;

CREATE TABLE IF NOT EXISTS `Genero` (
  `idGenero` INT NOT NULL,
  `nombreGenero` VARCHAR(45) NOT NULL,
  `estadoGenero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `identificacion` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `segundoNombreUsuario` VARCHAR(45) NULL,
  `primerApellidoUsuario` VARCHAR(45) NOT NULL,
  `segundoApellidoUsuario` VARCHAR(45) NULL,
  `edadUsuario` INT NOT NULL,
  `telefonoCelular` VARCHAR(10) NULL,
  `telefonoFijo` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `direccion` VARCHAR(200) NULL,
  `barrioUbicacionUsuario` VARCHAR(45) NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `estadoUsuario` VARCHAR(45) NOT NULL,
  `fkidTipoDocumento` INT NOT NULL,
  `fkidTipoSangre` INT NOT NULL,
  `fkidDiscapacidad` INT NOT NULL,
  `fkidSisben` INT NOT NULL,
  `fkidRol` INT NOT NULL,
  `fkidEstrato` INT NOT NULL,
  `fkidEPS` INT NOT NULL,
  `fkidGenero` INT NOT NULL,
  PRIMARY KEY (`identificacion`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC) VISIBLE,
  INDEX `fk_Usuario_TipoDocumento1_idx` (`fkidTipoDocumento` ASC) VISIBLE,
  INDEX `fk_Usuario_TipoSangre1_idx` (`fkidTipoSangre` ASC) VISIBLE,
  INDEX `fk_Usuario_Discapacidad1_idx` (`fkidDiscapacidad` ASC) VISIBLE,
  INDEX `fk_Usuario_Sisben1_idx` (`fkidSisben` ASC) VISIBLE,
  INDEX `fk_Usuario_Rol1_idx` (`fkidRol` ASC) VISIBLE,
  INDEX `fk_Usuario_Estrato1_idx` (`fkidEstrato` ASC) VISIBLE,
  INDEX `fk_Usuario_EPS1_idx` (`fkidEPS` ASC) VISIBLE,
  INDEX `fk_Usuario_Genero1_idx` (`fkidGenero` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_TipoDocumento1`
    FOREIGN KEY (`fkidTipoDocumento`)
    REFERENCES `TipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoSangre1`
    FOREIGN KEY (`fkidTipoSangre`)
    REFERENCES `TipoSangre` (`idTipoSangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Discapacidad1`
    FOREIGN KEY (`fkidDiscapacidad`)
    REFERENCES `Discapacidad` (`idDiscapacidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Sisben1`
    FOREIGN KEY (`fkidSisben`)
    REFERENCES `Sisben` (`idSisben`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`fkidRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Estrato1`
    FOREIGN KEY (`fkidEstrato`)
    REFERENCES `Estrato` (`idEstrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_EPS1`
    FOREIGN KEY (`fkidEPS`)
    REFERENCES `EPS` (`idEPS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Genero1`
    FOREIGN KEY (`fkidGenero`)
    REFERENCES `Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permiso` ;

CREATE TABLE IF NOT EXISTS `Permiso` (
  `idPermiso` INT NOT NULL,
  `nombrePermiso` VARCHAR(45) NOT NULL,
  `estadoPermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RolPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolPermiso` ;

CREATE TABLE IF NOT EXISTS `RolPermiso` (
  `idRolPermiso` INT NOT NULL,
  `nombreVista` VARCHAR(50) NOT NULL,
  `vistaRaiz` VARCHAR(50) NOT NULL,
  `fkidRol` INT NOT NULL,
  `fkidPermiso` INT NOT NULL,
  PRIMARY KEY (`idRolPermiso`),
  INDEX `fk_RolPermiso_Rol1_idx` (`fkidRol` ASC) VISIBLE,
  INDEX `fk_RolPermiso_Permiso1_idx` (`fkidPermiso` ASC) VISIBLE,
  CONSTRAINT `fk_RolPermiso_Rol1`
    FOREIGN KEY (`fkidRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolPermiso_Permiso1`
    FOREIGN KEY (`fkidPermiso`)
    REFERENCES `Permiso` (`idPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estudiante` ;

CREATE TABLE IF NOT EXISTS `Estudiante` (
  `idEstudiante` INT NOT NULL,
  `codigoEstudiante` VARCHAR(45) NOT NULL,
  `ciudadNacimiento` VARCHAR(45) NOT NULL,
  `ciudadResidencia` VARCHAR(45) NOT NULL,
  `ciudadExpedicionDocumento` VARCHAR(45) NOT NULL,
  `paisOrigen` VARCHAR(45) NOT NULL,
  `asistenciaAcademicaEspecial` VARCHAR(200) NOT NULL,
  `desplazadoEstado` VARCHAR(45) NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  INDEX `fk_Estudiante_Usuario1_idx` (`Usuario_identificacion` ASC) VISIBLE,
  CONSTRAINT `fk_Estudiante_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modalida_Educativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Modalida_Educativa` ;

CREATE TABLE IF NOT EXISTS `Modalida_Educativa` (
  `idModalida_Educativa` INT NOT NULL,
  `nombreModalidad` VARCHAR(45) NOT NULL,
  `estadoModalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModalida_Educativa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sede` ;

CREATE TABLE IF NOT EXISTS `Sede` (
  `idSede` INT NOT NULL,
  `nombreSede` VARCHAR(45) NOT NULL,
  `internadoDisponibilidad` VARCHAR(45) NOT NULL,
  `estadoSede` VARCHAR(45) NOT NULL,
  `fk_idModalida_Educativa` INT NOT NULL,
  PRIMARY KEY (`idSede`),
  INDEX `fk_Sede_Modalida_Educativa1_idx` (`fk_idModalida_Educativa` ASC) VISIBLE,
  CONSTRAINT `fk_Sede_Modalida_Educativa1`
    FOREIGN KEY (`fk_idModalida_Educativa`)
    REFERENCES `Modalida_Educativa` (`idModalida_Educativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Docente` ;

CREATE TABLE IF NOT EXISTS `Docente` (
  `idDocente` INT NOT NULL,
  `estadoDocente` VARCHAR(45) NOT NULL,
  `horasLaboralesSemanales` INT NOT NULL,
  `fkidentificacion` INT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idDocente`),
  INDEX `fk_Docente_Usuario1_idx` (`fkidentificacion` ASC) VISIBLE,
  INDEX `fk_Docente_Sede1_idx` (`fkidSede` ASC) VISIBLE,
  CONSTRAINT `fk_Docente_Usuario1`
    FOREIGN KEY (`fkidentificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Funcionario` ;

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `idFuncionario` INT NOT NULL,
  `firmaFuncionario` LONGBLOB NOT NULL,
  `estadoFuncionario` VARCHAR(45) NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `fk_Funcionario_Usuario1_idx` (`Usuario_identificacion` ASC) VISIBLE,
  INDEX `fk_Funcionario_Sede1_idx` (`fkidSede` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grados` ;

CREATE TABLE IF NOT EXISTS `Grados` (
  `idGrado` INT NOT NULL,
  `nombreGrado` VARCHAR(45) NOT NULL,
  `estadoGrado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SedeGrados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SedeGrados` ;

CREATE TABLE IF NOT EXISTS `SedeGrados` (
  `idSedeGrados` INT NOT NULL,
  `estadoGradoSede` VARCHAR(45) NOT NULL,
  `fkidSede` INT NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idSedeGrados`),
  INDEX `fk_SedeGrupos_Sede1_idx` (`fkidSede` ASC) VISIBLE,
  INDEX `fk_SedeGrados_Grados1_idx` (`fkidGrado` ASC) VISIBLE,
  CONSTRAINT `fk_SedeGrupos_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SedeGrados_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GradoGrupo` ;

CREATE TABLE IF NOT EXISTS `GradoGrupo` (
  `idGradoGrupo` INT NOT NULL,
  `nombreTitular` VARCHAR(100) NULL,
  `grupoGrado` VARCHAR(45) NOT NULL,
  `estadoGrupoGrado` VARCHAR(45) NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idGradoGrupo`),
  INDEX `fk_GradoGrupo_Grados1_idx` (`fkidGrado` ASC) VISIBLE,
  CONSTRAINT `fk_GradoGrupo_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asignatura` ;

CREATE TABLE IF NOT EXISTS `Asignatura` (
  `idAsignatura` INT NOT NULL,
  `nombreAsignatura` VARCHAR(45) NOT NULL,
  `estadoAsignatura` VARCHAR(45) NOT NULL,
  `horasSemanales` INT NOT NULL,
  PRIMARY KEY (`idAsignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Horario` ;

CREATE TABLE IF NOT EXISTS `Horario` (
  `idHorario` INT NOT NULL,
  `horaInicio` VARCHAR(45) NOT NULL,
  `horaFin` VARCHAR(45) NOT NULL,
  `fechaHorario` VARCHAR(45) NOT NULL,
  `diaHorario` VARCHAR(45) NOT NULL,
  `estadoHorario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PeriodoAcademico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PeriodoAcademico` ;

CREATE TABLE IF NOT EXISTS `PeriodoAcademico` (
  `idPeriodoAcademico` INT NOT NULL,
  `periodoAcademico` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NOT NULL,
  `estadoPeriodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodoAcademico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NotaFinal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaFinal` ;

CREATE TABLE IF NOT EXISTS `NotaFinal` (
  `idNotaDefinitiva` INT NOT NULL,
  `añoElectivo` VARCHAR(45) NOT NULL,
  `calificacionAño` FLOAT NOT NULL,
  `estadoCalificacionAño` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNotaDefinitiva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NotaDefinitivaPeriodo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaDefinitivaPeriodo` ;

CREATE TABLE IF NOT EXISTS `NotaDefinitivaPeriodo` (
  `idNotas` INT NOT NULL,
  `notaGeneral` DOUBLE NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
  `fkidPeriodoAcademico` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  `fkidNotaFinal` INT NOT NULL,
  PRIMARY KEY (`idNotas`),
  INDEX `fk_NotaDefinitiva_PeriodoAcademico1_idx` (`fkidPeriodoAcademico` ASC) VISIBLE,
  INDEX `fk_NotaDefinitiva_Asignatura1_idx` (`fkidAsignatura` ASC) VISIBLE,
  INDEX `fk_NotaDefinitivaPeriodo_NotaFinal1_idx` (`fkidNotaFinal` ASC) VISIBLE,
  CONSTRAINT `fk_NotaDefinitiva_PeriodoAcademico1`
    FOREIGN KEY (`fkidPeriodoAcademico`)
    REFERENCES `PeriodoAcademico` (`idPeriodoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaDefinitiva_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaDefinitivaPeriodo_NotaFinal1`
    FOREIGN KEY (`fkidNotaFinal`)
    REFERENCES `NotaFinal` (`idNotaDefinitiva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Competencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Competencias` ;

CREATE TABLE IF NOT EXISTS `Competencias` (
  `idCompetencias` INT NOT NULL,
  `nombreCompetencia` VARCHAR(450) NOT NULL,
  `objetivoCompetencia` VARCHAR(450) NOT NULL,
  `informacionCompetencia` VARCHAR(450) NULL,
  `estadoCompetencia` VARCHAR(45) NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idCompetencias`),
  INDEX `fk_Competencias_Asignatura1_idx` (`fkidAsignatura` ASC) VISIBLE,
  CONSTRAINT `fk_Competencias_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Matricula` ;

CREATE TABLE IF NOT EXISTS `Matricula` (
  `idMatricula` INT NOT NULL,
  `jornada` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NULL,
  `internadoEstado` VARCHAR(45) NOT NULL,
  `gradoEstudiante` VARCHAR(45) NOT NULL,
  `grupoEstudiante` VARCHAR(45) NOT NULL,
  `estadoMatricula` VARCHAR(45) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidFuncionario` INT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Estudiante1_idx` (`fkidEstudiante` ASC) VISIBLE,
  INDEX `fk_Matricula_Funcionario1_idx` (`fkidFuncionario` ASC) VISIBLE,
  INDEX `fk_Matricula_Sede1_idx` (`fkidSede` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Funcionario1`
    FOREIGN KEY (`fkidFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Observaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Observaciones` ;

CREATE TABLE IF NOT EXISTS `Observaciones` (
  `idObservacion` INT NOT NULL,
  `descripcionObservacion` VARCHAR(450) NOT NULL,
  `estadoObservacion` VARCHAR(45) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidFuncionario` INT NOT NULL,
  PRIMARY KEY (`idObservacion`),
  INDEX `fk_Observaciones_Estudiante1_idx` (`fkidEstudiante` ASC) VISIBLE,
  INDEX `fk_Observaciones_Funcionario1_idx` (`fkidFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Observaciones_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Observaciones_Funcionario1`
    FOREIGN KEY (`fkidFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Asistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asistencia` ;

CREATE TABLE IF NOT EXISTS `Asistencia` (
  `idAsistencia` INT NOT NULL,
  `nFallas` VARCHAR(45) NOT NULL,
  `estadoAsistencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAsistencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstudiantesGradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EstudiantesGradoGrupo` ;

CREATE TABLE IF NOT EXISTS `EstudiantesGradoGrupo` (
  `idEstudianteGG` INT NOT NULL,
  `rendimientoGeneral` VARCHAR(45) NULL,
  `estadoEstudianteGG` VARCHAR(45) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidGradoGrupo` INT NOT NULL,
  PRIMARY KEY (`idEstudianteGG`),
  INDEX `fk_EstudiantesGrupo_Estudiante1_idx` (`fkidEstudiante` ASC) VISIBLE,
  INDEX `fk_EstudiantesGrupo_GradoGrupo1_idx` (`fkidGradoGrupo` ASC) VISIBLE,
  CONSTRAINT `fk_EstudiantesGrupo_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstudiantesGrupo_GradoGrupo1`
    FOREIGN KEY (`fkidGradoGrupo`)
    REFERENCES `GradoGrupo` (`idGradoGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocenteAsignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocenteAsignatura` ;

CREATE TABLE IF NOT EXISTS `DocenteAsignatura` (
  `idDocenteAsignatura` INT NOT NULL,
  `estadoDocenteAsignatura` VARCHAR(45) NOT NULL,
  `fkidDocente` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idDocenteAsignatura`),
  INDEX `fk_DocenteAsignatura_Docente1_idx` (`fkidDocente` ASC) VISIBLE,
  INDEX `fk_DocenteAsignatura_Asignatura1_idx` (`fkidAsignatura` ASC) VISIBLE,
  CONSTRAINT `fk_DocenteAsignatura_Docente1`
    FOREIGN KEY (`fkidDocente`)
    REFERENCES `Docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocenteAsignatura_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocentesGrado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocentesGrado` ;

CREATE TABLE IF NOT EXISTS `DocentesGrado` (
  `idDocenteGrado` INT NOT NULL,
  `estadoDocenteGrado` VARCHAR(45) NOT NULL,
  `fkidDocente` INT NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idDocenteGrado`),
  INDEX `fk_DocentesGrado_Docente1_idx` (`fkidDocente` ASC) VISIBLE,
  INDEX `fk_DocentesGrado_Grados1_idx` (`fkidGrado` ASC) VISIBLE,
  CONSTRAINT `fk_DocentesGrado_Docente1`
    FOREIGN KEY (`fkidDocente`)
    REFERENCES `Docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocentesGrado_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AsistenciaEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AsistenciaEstudiante` ;

CREATE TABLE IF NOT EXISTS `AsistenciaEstudiante` (
  `idAsistenciaGradoGrupo` INT NOT NULL,
  `estadoAsistencia` VARCHAR(45) NOT NULL,
  `fkidAsistencia` INT NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  PRIMARY KEY (`idAsistenciaGradoGrupo`),
  INDEX `fk_AsistenciaEstudiante_Asistencia1_idx` (`fkidAsistencia` ASC) VISIBLE,
  INDEX `fk_AsistenciaEstudiante_Estudiante1_idx` (`fkidEstudiante` ASC) VISIBLE,
  CONSTRAINT `fk_AsistenciaEstudiante_Asistencia1`
    FOREIGN KEY (`fkidAsistencia`)
    REFERENCES `Asistencia` (`idAsistencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsistenciaEstudiante_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoNota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoNota` ;

CREATE TABLE IF NOT EXISTS `TipoNota` (
  `idTipoNota` INT NOT NULL,
  `tipoNota` VARCHAR(45) NOT NULL,
  `porcentajeNota` VARCHAR(45) NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoNota`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NotasEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotasEstudiante` ;

CREATE TABLE IF NOT EXISTS `NotasEstudiante` (
  `idNotaEstudiante` INT NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
  `notaDefinitiva` FLOAT NOT NULL,
  `fkidTipoNota` INT NULL,
  `fkidNotaDefinitivaPeriodo` INT NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  PRIMARY KEY (`idNotaEstudiante`),
  INDEX `fk_NotasEstudiante_TipoNota1_idx` (`fkidTipoNota` ASC) VISIBLE,
  INDEX `fk_NotasEstudiante_NotaDefinitivaPeriodo1_idx` (`fkidNotaDefinitivaPeriodo` ASC) VISIBLE,
  INDEX `fk_NotasEstudiante_Estudiante1_idx` (`fkidEstudiante` ASC) VISIBLE,
  CONSTRAINT `fk_NotasEstudiante_TipoNota1`
    FOREIGN KEY (`fkidTipoNota`)
    REFERENCES `TipoNota` (`idTipoNota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotasEstudiante_NotaDefinitivaPeriodo1`
    FOREIGN KEY (`fkidNotaDefinitivaPeriodo`)
    REFERENCES `NotaDefinitivaPeriodo` (`idNotas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotasEstudiante_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Familiar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Familiar` ;

CREATE TABLE IF NOT EXISTS `Familiar` (
  `identificacionFamiliar` INT NOT NULL,
  `nombreFamiliar` VARCHAR(80) NOT NULL,
  `ocupacionFamiliar` VARCHAR(80) NOT NULL,
  `correoFamiliar` VARCHAR(200) NULL,
  `celularFamiliar` VARCHAR(10) NULL,
  `parentescoFamiliar` VARCHAR(80) NOT NULL,
  `responsabilidadEconomicaEstudiante` VARCHAR(250) NOT NULL,
  `estadoAcudiente` VARCHAR(45) NOT NULL,
  `Dezplazado` VARCHAR(400) NULL,
  `fechaNacimiento` VARCHAR(400) NULL,
  `nivelEscolaridad` VARCHAR(400) NULL,
  `ubicacion` VARCHAR(400) NULL,
  `Genero_idGenero` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  PRIMARY KEY (`identificacionFamiliar`),
  INDEX `fk_Acudiente_Genero1_idx` (`Genero_idGenero` ASC) VISIBLE,
  INDEX `fk_Acudiente_Estudiante1_idx` (`Estudiante_idEstudiante` ASC) VISIBLE,
  CONSTRAINT `fk_Acudiente_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acudiente_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `horarioGradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horarioGradoGrupo` ;

CREATE TABLE IF NOT EXISTS `horarioGradoGrupo` (
  `idHorarioGradoGrupo` INT NOT NULL,
  `estadoHorarioGG` VARCHAR(45) NOT NULL,
  `fkidHorario` INT NOT NULL,
  `fkidGradoGrupo` INT NOT NULL,
  PRIMARY KEY (`idHorarioGradoGrupo`),
  INDEX `fk_detalleHorario_Horario1_idx` (`fkidHorario` ASC) VISIBLE,
  INDEX `fk_detalleHorario_GradoGrupo1_idx` (`fkidGradoGrupo` ASC) VISIBLE,
  CONSTRAINT `fk_detalleHorario_Horario1`
    FOREIGN KEY (`fkidHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleHorario_GradoGrupo1`
    FOREIGN KEY (`fkidGradoGrupo`)
    REFERENCES `GradoGrupo` (`idGradoGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `horarioAsignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horarioAsignatura` ;

CREATE TABLE IF NOT EXISTS `horarioAsignatura` (
  `idhorarioAsignatura` INT NOT NULL,
  `estadoHorarioAsignatura` VARCHAR(45) NOT NULL,
  `fkidHorario` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idhorarioAsignatura`),
  INDEX `fk_horarioAsignatura_Horario1_idx` (`fkidHorario` ASC) VISIBLE,
  INDEX `fk_horarioAsignatura_Asignatura1_idx` (`fkidAsignatura` ASC) VISIBLE,
  CONSTRAINT `fk_horarioAsignatura_Horario1`
    FOREIGN KEY (`fkidHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horarioAsignatura_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `horarioAsistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horarioAsistencia` ;

CREATE TABLE IF NOT EXISTS `horarioAsistencia` (
  `idhorarioAsistencia` INT NOT NULL,
  `estadoHorarioAsistencia` VARCHAR(45) NOT NULL,
  `fkidHorario` INT NOT NULL,
  `fkidAsistencia` INT NOT NULL,
  PRIMARY KEY (`idhorarioAsistencia`),
  INDEX `fk_horarioAsistencia_Horario1_idx` (`fkidHorario` ASC) VISIBLE,
  INDEX `fk_horarioAsistencia_Asistencia1_idx` (`fkidAsistencia` ASC) VISIBLE,
  CONSTRAINT `fk_horarioAsistencia_Horario1`
    FOREIGN KEY (`fkidHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horarioAsistencia_Asistencia1`
    FOREIGN KEY (`fkidAsistencia`)
    REFERENCES `Asistencia` (`idAsistencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asignaturaGradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `asignaturaGradoGrupo` ;

CREATE TABLE IF NOT EXISTS `asignaturaGradoGrupo` (
  `idasignaturaGradoGrupo` INT NOT NULL,
  `estadoAsignaturaGG` VARCHAR(45) NOT NULL,
  `fkidGradoGrupo` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  INDEX `fk_asignaturaGradoGrupo_GradoGrupo1_idx` (`fkidGradoGrupo` ASC) VISIBLE,
  INDEX `fk_asignaturaGradoGrupo_Asignatura1_idx` (`fkidAsignatura` ASC) VISIBLE,
  PRIMARY KEY (`idasignaturaGradoGrupo`),
  CONSTRAINT `fk_asignaturaGradoGrupo_GradoGrupo1`
    FOREIGN KEY (`fkidGradoGrupo`)
    REFERENCES `GradoGrupo` (`idGradoGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignaturaGradoGrupo_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
