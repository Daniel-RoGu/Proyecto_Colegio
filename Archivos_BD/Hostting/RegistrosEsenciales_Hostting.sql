/*-------orden de ejecucion de scripts ---------- Script Nº9*/
USE db_aa74fb_bdcoleg;
/*
call registrarEstrato("ESTRATO 1");
call registrarEstrato("ESTRATO 2");
call registrarEstrato("ESTRATO 3");
call registrarEstrato("ESTRATO 4");
call registrarEstrato("ESTRATO 5");
call registrarEstrato("ESTRATO 6");

call registrarTipoDocumento("CC:CÉDULA DE CIUDADANÍA");
call registrarTipoSangre("O +");
call registrarRol("Estudiante");
call registrarRol("Coordinador");
call registrarRol("Docente");
call registrarRol("Administrador");
call registrarModalidadEducativa("Sin definir");
call registrarSede('LA AGUILILLA');
call registrarUsuario(9518, "Admin", null, "Admin", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "Administrador");
call registrarFuncionario(12987357, "Eva", null, "Sukuy", "Turu", 45, "32165584", null, "Alguien@Tu.lalo", "Donde", null, "1981-12-18", "O +", "CC:CÉDULA DE CIUDADANÍA", 
						  "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "5", null, "LA AGUILILLA");
call registrarFuncionario(40783263, "Araly", null, "Nuñes", "Sanjuan", null, null, null, null, null, null, null, null, null, 
						  null, null, null, null, null, null, "LA AGUILILLA");
          */                
/*---------------------------------------------------REGISTRO PERIODO ACADEMICO------------------------------------------------------*/
												/* dia/mes */	/*
call registrarPeriodoAcademico("Primer Periodo", "01/22", "04/05"); 
call registrarPeriodoAcademico("Segundo Periodo", "04/08", "06/14"); 
call registrarPeriodoAcademico("Tercer Periodo", "07/08", "09/13"); 
call registrarPeriodoAcademico("Cuarto Periodo", "09/16", "11/29"); 
*/
/*--------------------------------------------------------REGISTRO GRADOS------------------------------------------------------------*/
/*
call registrarGrado("0");                     
call registrarGrado("1");                     
call registrarGrado("2");                     
call registrarGrado("3");                     
call registrarGrado("4");                     
call registrarGrado("5");                     
call registrarGrado("6");                     
call registrarGrado("7");                     
call registrarGrado("8");                     
call registrarGrado("9");                     
call registrarGrado("10");                     
call registrarGrado("11");                     
*/
/*--------------------------------------------------------REGISTRO ASIGNATURAS------------------------------------------------------------*/

/*---------- GRADO 0º ----------*/
/*
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ACTIVIDADRECTORA_ARTE", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ACTIVIDADRECTORA_JUEGO", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ACTIVIDADRECTORA_MEDIO_AMBIENTE", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ACTIVIDADRECTORA_LITERATURA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_CORPORAL", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COMUNICATIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESTETICA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESPIRITUAL", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COGNITIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ETICA Y VALORES", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_SOCIO_AFECTIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CONVIVENCIA", "Activa"); 
*/
/*---------- GRADO Basica Primaria 1° a 5° ----------*/ /* Total, horas por grupo - 30*/
/*---------- GRADO Basica Secundaria  6° a 9° ----------*/ /* Total, horas por grupo - 35*/
/*---------- GRADO Media Tecnica  10° a 11° ----------*/ /* Total, horas por grupo - 37*/
/*
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ESPAÑOL", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("INGLES", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("MATEMATICAS", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CIENCIAS NATURALES", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CIENCIAS SOCIALES", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("RELIGIÓN", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ÉTICA Y VALORES", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("EDU. FÍSICA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("INFORMÁTICA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("PROYECTO PEDAGÓGICO AGROECOLÓGICO", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("PROYECTO PEDAGÓGICO PRODUCTIVO", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ECOLOGÍA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ARTÍSTICA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("EMPRENDIMIENTO", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("QUIMICA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("FISICA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CIENCIAS POLITICAS", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("FILOSOFIA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("TRIGONOMETRIA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ECONOMIA", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CONVIVENCIA", "Activa");
*/

/*
	REGISTRO GRADOS SEDE, REGISTRO DOCENTES y REGISTRO ASIGNATURAS DOCENTES. se deben ejecutar despues de haber cargado el CSV
*/

/*--------------------------------------------------------REGISTRO GRADOS SEDE------------------------------------------------------------*/
/*
call registrarSedeGrado("LA AGUILILLA", 0); 
call registrarSedeGrado("LA AGUILILLA", 1); 
call registrarSedeGrado("LA AGUILILLA", 2); 
call registrarSedeGrado("LA AGUILILLA", 3); 
call registrarSedeGrado("LA AGUILILLA", 4); 
call registrarSedeGrado("LA AGUILILLA", 5); 
call registrarSedeGrado("LA AGUILILLA", 6); 
call registrarSedeGrado("LA AGUILILLA", 7); 
call registrarSedeGrado("LA AGUILILLA", 8); 
call registrarSedeGrado("LA AGUILILLA", 9); 
call registrarSedeGrado("LA AGUILILLA", 10); 
call registrarSedeGrado("LA AGUILILLA", 11); 

call registrarSedeGrado("ALTA RIVERA", 0); 
call registrarSedeGrado("ALTA RIVERA", 1); 
call registrarSedeGrado("ALTA RIVERA", 2); 
call registrarSedeGrado("ALTA RIVERA", 3); 
call registrarSedeGrado("ALTA RIVERA", 4); 
call registrarSedeGrado("ALTA RIVERA", 5);

call registrarSedeGrado("ALTO BRILLANTE", 0); 
call registrarSedeGrado("ALTO BRILLANTE", 1); 
call registrarSedeGrado("ALTO BRILLANTE", 2); 
call registrarSedeGrado("ALTO BRILLANTE", 3); 
call registrarSedeGrado("ALTO BRILLANTE", 4); 
call registrarSedeGrado("ALTO BRILLANTE", 5);

call registrarSedeGrado("ALTO RIECITO", 0); 
call registrarSedeGrado("ALTO RIECITO", 1); 
call registrarSedeGrado("ALTO RIECITO", 2); 
call registrarSedeGrado("ALTO RIECITO", 3); 
call registrarSedeGrado("ALTO RIECITO", 4); 
call registrarSedeGrado("ALTO RIECITO", 5);

call registrarSedeGrado("BAJO RIECITO", 0); 
call registrarSedeGrado("BAJO RIECITO", 1); 
call registrarSedeGrado("BAJO RIECITO", 2); 
call registrarSedeGrado("BAJO RIECITO", 3); 
call registrarSedeGrado("BAJO RIECITO", 4); 
call registrarSedeGrado("BAJO RIECITO", 5);

call registrarSedeGrado("EL BRILLANTE BAJO", 0); 
call registrarSedeGrado("EL BRILLANTE BAJO", 1); 
call registrarSedeGrado("EL BRILLANTE BAJO", 2); 
call registrarSedeGrado("EL BRILLANTE BAJO", 3); 
call registrarSedeGrado("EL BRILLANTE BAJO", 4); 
call registrarSedeGrado("EL BRILLANTE BAJO", 5);

call registrarSedeGrado("EL EDEN", 0); 
call registrarSedeGrado("EL EDEN", 1); 
call registrarSedeGrado("EL EDEN", 2); 
call registrarSedeGrado("EL EDEN", 3); 
call registrarSedeGrado("EL EDEN", 4); 
call registrarSedeGrado("EL EDEN", 5);

call registrarSedeGrado("EL RETORNO", 0); 
call registrarSedeGrado("EL RETORNO", 1); 
call registrarSedeGrado("EL RETORNO", 2); 
call registrarSedeGrado("EL RETORNO", 3); 
call registrarSedeGrado("EL RETORNO", 4); 
call registrarSedeGrado("EL RETORNO", 5);

call registrarSedeGrado("LA NUTRIA", 0); 
call registrarSedeGrado("LA NUTRIA", 1); 
call registrarSedeGrado("LA NUTRIA", 2); 
call registrarSedeGrado("LA NUTRIA", 3); 
call registrarSedeGrado("LA NUTRIA", 4); 
call registrarSedeGrado("LA NUTRIA", 5);

call registrarSedeGrado("LA RIVERA BAJA", 0); 
call registrarSedeGrado("LA RIVERA BAJA", 1); 
call registrarSedeGrado("LA RIVERA BAJA", 2); 
call registrarSedeGrado("LA RIVERA BAJA", 3); 
call registrarSedeGrado("LA RIVERA BAJA", 4); 
call registrarSedeGrado("LA RIVERA BAJA", 5);

call registrarSedeGrado("LIBANO ALTO", 0); 
call registrarSedeGrado("LIBANO ALTO", 1); 
call registrarSedeGrado("LIBANO ALTO", 2); 
call registrarSedeGrado("LIBANO ALTO", 3); 
call registrarSedeGrado("LIBANO ALTO", 4); 
call registrarSedeGrado("LIBANO ALTO", 5);

call registrarSedeGrado("LOS ANDES", 0); 
call registrarSedeGrado("LOS ANDES", 1); 
call registrarSedeGrado("LOS ANDES", 2); 
call registrarSedeGrado("LOS ANDES", 3); 
call registrarSedeGrado("LOS ANDES", 4); 
call registrarSedeGrado("LOS ANDES", 5);

call registrarSedeGrado("MONTE BELLO", 0); 
call registrarSedeGrado("MONTE BELLO", 1); 
call registrarSedeGrado("MONTE BELLO", 2); 
call registrarSedeGrado("MONTE BELLO", 3); 
call registrarSedeGrado("MONTE BELLO", 4); 
call registrarSedeGrado("MONTE BELLO", 5);

call registrarSedeGrado("MONTERREY", 0); 
call registrarSedeGrado("MONTERREY", 1); 
call registrarSedeGrado("MONTERREY", 2); 
call registrarSedeGrado("MONTERREY", 3); 
call registrarSedeGrado("MONTERREY", 4); 
call registrarSedeGrado("MONTERREY", 5);

call registrarSedeGrado("VILLANUEVA", 0); 
call registrarSedeGrado("VILLANUEVA", 1); 
call registrarSedeGrado("VILLANUEVA", 2); 
call registrarSedeGrado("VILLANUEVA", 3); 
call registrarSedeGrado("VILLANUEVA", 4); 
call registrarSedeGrado("VILLANUEVA", 5);

/*--------------------------------------------------------REGISTRO DOCENTES------------------------------------------------------------*/
/*
call registrarDocente(null, "LA AGUILILLA", "1116919521", "EL DONCELLO", "ANGELA", "JIMENA", "LOZANO", "CASTAÑO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1116919521)), 0);
call registrarDocenteGrado2((select ObtenerIdDocente(1116919521)), 1);

call registrarDocente(null, "LA AGUILILLA", "96360484", "PUERTO RICO", "RENAN", "EIGMER", "LOZANO", "OSPINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(96360484)), 2);
call registrarDocenteGrado2((select ObtenerIdDocente(96360484)), 3);
                      
call registrarDocente(null, "LA AGUILILLA", "30519429", "PUERTO RICO", "CLAUDIA", "MILENA", "MONSALVE", null, null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(30519429)), 4);
call registrarDocenteGrado2((select ObtenerIdDocente(30519429)), 5); 

call registrarDocente(null, "LA AGUILILLA", "40730500", "DONCELLO", "DORA", "EMILSEN", "CASAS", "GOMEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 11);  

call registrarDocente(null, "LA AGUILILLA", "1061756986", "POPAYAN", "ANGELA", "PAOLA", "GUERREO", "IDROBO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 11); 
 
call registrarDocente(null, "LA AGUILILLA", "6801569", "FLORENCIA", "JHON", "FREDY", "TIQUE", "BASTO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 11);
    
call registrarDocente(null, "LA AGUILILLA", "40777716", "FLORENCIA", "ISMA", "LEICER", "FRANCO", "CARDONA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 11); 
      
call registrarDocente(null, "LA AGUILILLA", "1117547026", "FLORENCIA", "LAURA", "VANNESZA", "MARROQUIN", "GUASAQUILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 11); 
        
call registrarDocente(null, "LA AGUILILLA", "96360868", "PUERTO RICO", "WILLIAM", null, "GARCIA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 11);

call registrarDocente(null, "LA AGUILILLA", "38557758", "CALI", "ISID", "YOHANA", "PERDOMO", "ISANOA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 10);  

call registrarDocente(null, "LA AGUILILLA", "17690054", "FLORENCIA", "CRISTIAN", "FABIAN", "DUSSAN", "JARAMILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 11);

call registrarDocente(null, "ALTA AGUILILLA", "1117522074", "FLORENCIA", "ARNULFO", null, "OSORIO", "MANRIQUE", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 5);  	

call registrarDocente(null, "ALTA RIVERA", "82362603", "TADO", "YUBER", "ANTONIO", "MARTINEZ", "MOSQUERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 5);  	

call registrarDocente(null, "ALTO BRILLANTE", "1115951826", "PUERTO RICO", "MARIA", "ALEJANDRA", "CABRERA", "HENAO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 5);  	

call registrarDocente(null, "ALTO RIECITO", "30519921", "PUERTO RICO", "BLANA", "YUBELI", "PERDOMO", "SALAZAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 5);  	

call registrarDocente(null, "BAJO RIECITO", "1116203968", "CURILLO", "VICTOR", "ALFONSO", "GASCA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 5);  	

call registrarDocente(null, "EL BRILLANTE BAJO", "6804417", "FLORENCIA", "CAMILO", "ANDRES", "CONDE", "FACUNDO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 5);  	

call registrarDocente(null, "EL EDEN", "1117499417", "FLORENCIA", "DIANA", "MILENA", "RUIZ", "TOCORA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 5);  	

call registrarDocente(null, "EL RETORNO", "17650041", "FLORENCIA", "SAMUEL", null, "SANCHEZ", "SANCHEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 5);
  
call registrarDocente(null, "LA NUTRIA", "96359789", "PUERTO RICO", "HENRY", null, "ALVAREZ", "URIZA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 5);  	
  
call registrarDocente(null, "LA RIVERA BAJA", "1085174360", "GUAMAL", "JORGE", "ELIECER", "BANDERA", "MEJIA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 5);  	
  
call registrarDocente(null, "LIBANO ALTO", "30518761", "PUERTO RICO", "MARIA", "LINA", "ORTIZ", "TRUJILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 5);  	
  
call registrarDocente(null, "LOS ANDES", "12192408", "GARZON", "ADOLFO", null, "RIVERA", "CABRERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 5);	
  
call registrarDocente(null, "MONTE BELLO", "1024579502", "BOGOTA D.C.", "MATEO", null, "SALAZAR", "SERNA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 5);  	
  
call registrarDocente(null, "MONTERREY", "4831345", "ISTMINA CHOCO", "LUIS", "GILBERTO", "SANCHEZ", "PEREA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 5);  	
  
call registrarDocente(null, "VILLANUEVA", "96351351", "EL DONCELLO", "VICENTE", null, "CANO", "CUELLAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 5);  	
*/

/*--------------------------------------------------------REGISTRO ASIGNATURAS DOCENTES------------------------------------------------------------*/
/*
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "MATEMATICAS");
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "CIENCIAS NATURALES");  
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "EDU. FÍSICA"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "INGLES"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "ARTISTICA"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "RELIGION"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "ESPAÑOL"); 
call registrarDocenteAsignatura("RENAN EIGMER LOZANO OSPINA", "ECOLOGIA"); 

call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "MATEMATICAS"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "EDU. FISICA"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "INGLES"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ARTISTICA"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "INFORMÁTICA"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "RELIGION"); 
call registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ESPAÑOL"); 

CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "ETICA Y VALORES");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "DIMENSION_SOCIO_AFECTIVA");
CALL registrarDocenteAsignatura("ANGELA JIMENA LOZANO CASTAÑO", "CONVIVENCIA");

/*
call registrarDocenteAsignatura("DORA EMILSEN CASAS GOMEZ", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("DORA EMILSEN CASAS GOMEZ", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("DORA EMILSEN CASAS GOMEZ", "ECONOMIA"); 

call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "MATEMATICAS");  
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "EDU. FISICA"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "INGLES"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "ARTISTICA"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "INFORMÁTICA"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "RELIGION"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "ESPAÑOL"); 
call registrarDocenteAsignatura("CLAUDIA MILENA MONSALVE", "ECOLOGIA"); 

call registrarDocenteAsignatura("ANGELA PAOLA GUERREO IDROBO", "INGLES"); 
call registrarDocenteAsignatura("ANGELA PAOLA GUERREO IDROBO", "EDU. FISICA"); 
call registrarDocenteAsignatura("ANGELA PAOLA GUERREO IDROBO", "ÉTICA Y VALORES"); 

call registrarDocenteAsignatura("JHON FREDY TIQUE BASTO", "ESPAÑOL"); 

call registrarDocenteAsignatura("ISMA LEICER FRANCO CARDONA", "MATEMATICAS"); 
call registrarDocenteAsignatura("ISMA LEICER FRANCO CARDONA", "FISICA"); 
call registrarDocenteAsignatura("ISMA LEICER FRANCO CARDONA", "TRIGONOMETRIA"); 

call registrarDocenteAsignatura("LAURA VANNESZA MARROQUIN GUASAQUILLO", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("LAURA VANNESZA MARROQUIN GUASAQUILLO", "ECOLOGIA"); 

call registrarDocenteAsignatura("WILLIAM GARCIA MEDINA", "EDU. FISICA"); 
call registrarDocenteAsignatura("WILLIAM GARCIA MEDINA", "INFORMÁTICA"); 

call registrarDocenteAsignatura("ISID YOHANA PERDOMO ISANOA", "EMPRENDIMIENTO"); 
call registrarDocenteAsignatura("ISID YOHANA PERDOMO ISANOA", "FILOSOFIA"); 
call registrarDocenteAsignatura("ISID YOHANA PERDOMO ISANOA", "ARTISTICA"); 
call registrarDocenteAsignatura("ISID YOHANA PERDOMO ISANOA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("ISID YOHANA PERDOMO ISANOA", "RELIGION"); 

call registrarDocenteAsignatura("CRISTIAN FABIAN DUSSAN JARAMILLO", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("CRISTIAN FABIAN DUSSAN JARAMILLO", "QUIMICA"); 

call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "MATEMATICAS");  
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "EDU. FISICA"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "INGLES"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "ARTISTICA"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "INFORMÁTICA"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "RELIGION"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "ESPAÑOL"); 
call registrarDocenteAsignatura("ARNULFO OSORIO MANRIQUE", "ECOLOGIA");
/*
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "MATEMATICAS");  
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "EDU. FISICA"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "INGLES"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ARTISTICA"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "RELIGION"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ESPAÑOL"); 
call registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ECOLOGIA");

CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERAO", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "ETICA Y VALORES");
CALL registrarDocenteAsignatura("YUBER ANTONIO MARTINEZ MOSQUERA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "MATEMATICAS");  
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "EDU. FISICA"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "INGLES"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ARTISTICA"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "INFORMÁTICA"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "RELIGION"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ESPAÑOL"); 
call registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ECOLOGIA");

CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "ETICA Y VALORES");
CALL registrarDocenteAsignatura("MARIA ALEJANDRA CABRERA HENAO", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "MATEMATICAS");  
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "EDU. FISICA"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "INGLES"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ARTISTICA"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "INFORMÁTICA"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "RELIGION"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ESPAÑOL"); 
call registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ECOLOGIA");

CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("BLANA YUBELI PERDOMO SALAZAR", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "MATEMATICAS");  
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "EDU. FISICA"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "INGLES"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ARTISTICA"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "RELIGION"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ESPAÑOL"); 
call registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ECOLOGIA");

CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("VICTOR ALFONSO GASCA MEDINA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "MATEMATICAS");  
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "EDU. FISICA"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "INGLES"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ARTISTICA"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "INFORMÁTICA"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "RELIGION"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ESPAÑOL"); 
call registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ECOLOGIA");

CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("CAMILO ANDRES CONDE FACUNDO", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "MATEMATICAS"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "EDU. FISICA"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "INGLES"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ARTISTICA"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "RELIGION"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ESPAÑOL"); 
call registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ECOLOGIA");

CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("DIANA MILENA RUIZ TOCORA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "MATEMATICAS"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "EDU. FISICA"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "INGLES"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ARTISTICA"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "INFORMÁTICA"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "RELIGION"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ESPAÑOL"); 
call registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ECOLOGIA");

CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("SAMUEL SANCHEZ SANCHEZ", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "MATEMATICAS");  
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "EDU. FISICA"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "INGLES"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ARTISTICA"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "RELIGION"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ESPAÑOL"); 
call registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ECOLOGIA");

CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("HENRY ALVAREZ URIZA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "MATEMATICAS");  
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "EDU. FISICA"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "INGLES"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ARTISTICA"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "RELIGION"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ESPAÑOL"); 
call registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ECOLOGIA");

CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("JORGE ELIECER BANDERA MEJIA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "MATEMATICAS");  
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "EDU. FISICA"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "INGLES"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ARTISTICA"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "INFORMÁTICA"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "RELIGION"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ESPAÑOL"); 
call registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ECOLOGIA");

CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("MARIA LINA ORTIZ TRUJILLO", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "MATEMATICAS");  
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "EDU. FISICA"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "INGLES"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ARTISTICA"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "RELIGION"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ESPAÑOL"); 
call registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ECOLOGIA");

CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("ADOLFO RIVERA CABRERA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "MATEMATICAS"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "EDU. FISICA"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "INGLES"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ARTISTICA"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "RELIGION"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ESPAÑOL"); 
call registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ECOLOGIA");

CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("MATEO SALAZAR SERNA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "MATEMATICAS");  
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "EDU. FISICA"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "INGLES"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ARTISTICA"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "INFORMÁTICA"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "RELIGION"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ESPAÑOL"); 
call registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ECOLOGIA");

CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("LUIS GILBERTO SANCHEZ PEREA", "DIMENSION_SOCIO_AFECTIVA");

call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "MATEMATICAS"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "CIENCIAS NATURALES"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "EDU. FISICA"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "INGLES"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "PROYECTO PEDAGOGICO PRODUCTIVO"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ÉTICA Y VALORES"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "CIENCIAS SOCIALES"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ARTISTICA"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "INFORMÁTICA"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "RELIGION"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ESPAÑOL"); 
call registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ECOLOGIA");

CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ACTIVIDADRECTORA_ARTE");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ACTIVIDADRECTORA_JUEGO");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ACTIVIDADRECTORA_MEDIO_AMBIENTE");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "ACTIVIDADRECTORA_LITERATURA");						
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_CORPORAL");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_COMUNICATIVA");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_ESTETICA");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_ESPIRITUAL");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_COGNITIVA");
CALL registrarDocenteAsignatura("VICENTE CANO CUELLAR", "DIMENSION_SOCIO_AFECTIVA");
*/
/* MODIFICAR SI ES NECESARIO
UPDATE GradoGrupo
SET fkidGrado = 207000
WHERE idGradoGrupo = 208100;
*/




				