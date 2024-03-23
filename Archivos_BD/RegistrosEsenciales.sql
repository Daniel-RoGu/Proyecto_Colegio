use bdcolegio;

call registrarTipoDocumento("CC:CEDULA");
call registrarRol("Estudiante");
call registrarRol("Coordinador");
call registrarRol("Docente");
call registrarModalidadEducativa("Sin definir");
call registrarSede('Central');
call registrarFuncionario(12987357, "Eva", null, "Sukuy", "Turu", 45, "32165584", null, "Alguien@Tu.lalo", "Donde", null, "1981-12-18", "O +", "CC:CEDULA", 
						  "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "5", null, "Central");
                          
                          
/*--------------------------------------------------------REGISTRO ASIGNATURAS------------------------------------------------------------*/

/*---------- GRADO 0º ----------*/
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_ARTE", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_JUEGO", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_MEDIO_AMBIENTE", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_LITERATURA", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_ETICA_Y_VALORES", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_CORPORAL", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COMUNICATIVA", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESTETICA", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESPIRITUAL", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COGNITIVA", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ETICA Y VALORES", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_SOCIO_AFECTIVA", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CONVIVENCIA", "Activa", 0); 

/*---------- GRADO Basica Primaria 1° a 5° ----------*/
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Español", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Inglés", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Matemáticas", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias Naturales", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias sociales", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Religión", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ética y valores", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Edu. Física", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Informática", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Proyecto Pedagógico Agroecológico", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ecología", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Artística", "Activa", 2); 
/* Total, horas por grupo - 30*/

/*---------- GRADO Basica Secundaria  6° a 9° ----------*/
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Español", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Inglés", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Matemáticas", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias Naturales", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias sociales", "Activa", 5); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Religión", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ética y valores", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Edu. Física", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Informática", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Proyecto Pedagógico Productivo", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ecología", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Artística", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Emprendimiento", "Activa", 2); 
/* Total, horas por grupo - 35*/

/*---------- GRADO Media Tecnica  10° a 11° ----------*/
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Español", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Inglés", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Quimica", "Activa", 4); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Fisica", "Activa", 3); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias Politicas", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Filosofia", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ética y valores", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Edu. Física", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Informática", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Proyecto Pedagógico Productivo", "Activa", 7); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ecología", "Activa", 1); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Artística", "Activa", 2); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Emprendimiento", "Activa", 2); 
/* Total, horas por grupo - 37*/

/*--------------------------------------------------------REGISTRO DOCENTES------------------------------------------------------------*/
call registrarDocente(null, "LA AGUILILLA", "1116919521", "EL DONCELLO", "ANGELA", "JIMENA", "LOZANO", "CASTAÑO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("ANGELA JIMENA LOZANO CASTAÑO", 0);
call registrarDocenteGrado2("ANGELA JIMENA LOZANO CASTAÑO", 1);

call registrarDocente(null, "LA AGUILILLA", "96360484", "PUERTO RICO", "RENAN", "EIGMER", "LOZANO", "OSPINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2("RENAN EIGMER LOZANO OSPINA", 2);
call registrarDocenteGrado2("RENAN EIGMER LOZANO OSPINA", 3);
                      
call registrarDocente(null, "LA AGUILILLA", "30519429", "PUERTO RICO", "CLAUDIA", "MILENA", "MONSALVE", null, null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("CLAUDIA MILENA MONSALVE", 4);
call registrarDocenteGrado2("CLAUDIA MILENA MONSALVE", 5); 

call registrarDocente(null, "LA AGUILILLA", "40730500", "DONCELLO", "DORA", "EMILSEN", "CASAS", "GOMEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 6);
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 7);  
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 8);  
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 9);  
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 10);  
call registrarDocenteGrado2("DORA EMILSEN CASAS GOMEZ", 11);  

call registrarDocente(null, "LA AGUILILLA", "1061756986", "POPAYAN", "ANGELA", "PAOLA", "GUERREO", "IDROBO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 6);
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 7);  
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 8);  
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 9);  
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 10);  
call registrarDocenteGrado2("ANGELA PAOLA GUERREO IDROBO", 11); 
 
call registrarDocente(null, "LA AGUILILLA", "6801569", "FLORENCIA", "JHON", "FREDY", "TIQUE", "BASTO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 6);
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 7);  
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 8);  
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 9);  
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 10);  
call registrarDocenteGrado2("JHON FREDY TIQUE BASTO", 11); 
    
call registrarDocente(null, "LA AGUILILLA", "40777716", "FLORENCIA", "ISMA", "LEICER", "FRANCO", "CARDONA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 6);
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 7);  
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 8);  
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 9);  
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 10);  
call registrarDocenteGrado2("ISMA LEICER FRANCO CARDONA", 11); 
      
call registrarDocente(null, "LA AGUILILLA", "1117547026", "FLORENCIA", "LAURA", "VANNESZA", "MARROQUIN", "GUASAQUILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 6);
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 7);  
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 8);  
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 9);  
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 10);  
call registrarDocenteGrado2("LAURA VANNESZA MARROQUIN GUASAQUILLO", 11); 
        
call registrarDocente(null, "LA AGUILILLA", "96360868", "PUERTO RICO", "WILLIAM", null, "GARCIA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 6);
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 7);  
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 8);  
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 9);  
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 10);  
call registrarDocenteGrado2("WILLIAM GARCIA MEDINA", 11); 

call registrarDocente(null, "LA AGUILILLA", "38557758", "CALI", "ISID", "YOHANA", "PERDOMO", "ISANOA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2("ISID YOHANA PERDOMO ISANOA", 6);
call registrarDocenteGrado2("ISID YOHANA PERDOMO ISANOA", 7);  
call registrarDocenteGrado2("ISID YOHANA PERDOMO ISANOA", 8);  
call registrarDocenteGrado2("ISID YOHANA PERDOMO ISANOA", 9);  
call registrarDocenteGrado2("ISID YOHANA PERDOMO ISANOA", 10);  

call registrarDocente(null, "LA AGUILILLA", "17690054", "FLORENCIA", "CRISTIAN", "FABIAN", "DUSSAN", "JARAMILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("CRISTIAN FABIAN DUSSAN JARAMILLO", 8);  
call registrarDocenteGrado2("CRISTIAN FABIAN DUSSAN JARAMILLO", 9);  
call registrarDocenteGrado2("CRISTIAN FABIAN DUSSAN JARAMILLO", 10);  
call registrarDocenteGrado2("CRISTIAN FABIAN DUSSAN JARAMILLO", 11);

call registrarDocente(null, "ALTA AGUILILLA", "1117522074", "FLORENCIA", "ARNULFO", null, "OSORIO", "MANRIQUE", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 0);  
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 1);  
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 2);  
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 3);  	
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 4);  	
call registrarDocenteGrado2("ARNULFO OSORIO MANRIQUE", 5);  	

call registrarDocente(null, "ALTA RIVERA", "82362603", "TADO", "YUBER", "ANTONIO", "MARTINEZ", "MOSQUERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 0);  
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 1);  
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 2);  
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 3);  	
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 4);  	
call registrarDocenteGrado2("YUBER ANTONIO MARTINEZ MOSQUERA", 5);  	

call registrarDocente(null, "ALTO BRILLANTE", "1115951826", "PUERTO RICO", "MARIA", "ALEJANDRA", "CABRERA", "HENAO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 0);  
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 1);  
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 2);  
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 3);  	
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 4);  	
call registrarDocenteGrado2("MARIA ALEJANDRA CABRERA HENAO", 5);  	

call registrarDocente(null, "ALTO RIECITO", "30519921", "PUERTO RICO", "BLANA", "YUBELI", "PERDOMO", "SALAZAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 0);  
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 1);  
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 2);  
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 3);  	
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 4);  	
call registrarDocenteGrado2("BLANA YUBELI PERDOMO SALAZAR", 5);  	

call registrarDocente(null, "BAJO RIECITO", "1116203968", "CURILLO", "VICTOR", "ALFONSO", "GASCA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 0);  
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 1);  
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 2);  
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 3);  	
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 4);  	
call registrarDocenteGrado2("VICTOR ALFONSO GASCA MEDINA", 5);  	

call registrarDocente(null, "EL BRILLANTE BAJO", "6804417", "FLORENCIA", "CAMILO", "ANDRES", "CONDE", "FACUNDO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 0);  
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 1);  
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 2);  
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 3);  	
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 4);  	
call registrarDocenteGrado2("CAMILO ANDRES CONDE FACUNDO", 5);  	

call registrarDocente(null, "EL EDEN", "1117499417", "FLORENCIA", "DIANA", "MILENA", "RUIZ", "TOCORA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 0);  
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 1);  
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 2);  
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 3);  	
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 4);  	
call registrarDocenteGrado2("DIANA MILENA RUIZ TOCORA", 5);  	

call registrarDocente(null, "EL RETORNO", "17650041", "FLORENCIA", "SAMUEL", null, "SANCHEZ", "SANCHEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 0);  
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 1);  
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 2);  
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 3);  	
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 4);  	
call registrarDocenteGrado2("SAMUEL SANCHEZ SANCHEZ", 5);
  
call registrarDocente(null, "LA NUTRIA", "96359789", "PUERTO RICO", "HENRY", null, "ALVAREZ", "URIZA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 0);  
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 1);  
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 2);  
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 3);  	
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 4);  	
call registrarDocenteGrado2("HENRY ALVAREZ URIZA", 5);  	
  
call registrarDocente(null, "LA RIVERA BAJA", "1085174360", "GUAMAL", "JORGE", "ELIECER", "BANDERA", "MEJIA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 0);  
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 1);  
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 2);  
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 3);  	
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 4);  	
call registrarDocenteGrado2("JORGE ELIECER BANDERA MEJIA", 5);  	
  
call registrarDocente(null, "LIBANO ALTO", "30518761", "PUERTO RICO", "MARIA", "LINA", "ORTIZ", "TRUJILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 0);  
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 1);  
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 2);  
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 3);  	
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 4);  	
call registrarDocenteGrado2("MARIA LINA ORTIZ TRUJILLO", 5);  	
  
call registrarDocente(null, "LOS ANDES", "12192408", "GARZON", "ADOLFO", null, "RIVERA", "CABRERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 0);  
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 1);  
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 2);  
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 3);  	
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 4);  	
call registrarDocenteGrado2("ADOLFO RIVERA CABRERA", 5);	
  
call registrarDocente(null, "MONTEBELLO", "1024579502", "BOGOTA D.C.", "MATEO", null, "SALAZAR", "SERNA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 0);  
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 1);  
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 2);  
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 3);  	
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 4);  	
call registrarDocenteGrado2("MATEO SALAZAR SERNA", 5);  	
  
call registrarDocente(null, "MONTERREY", "4831345", "ISTMINA CHOCO", "LUIS", "GILBERTO", "SANCHEZ", "PEREA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 0);  
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 1);  
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 2);  
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 3);  	
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 4);  	
call registrarDocenteGrado2("LUIS GILBERTO SANCHEZ PEREA", 5);  	
  
call registrarDocente(null, "VILLANUEVA", "96351351", "EL DONCELLO", "VICENTE", null, "CANO", "CUELLAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 0);  
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 1);  
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 2);  
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 3);  	
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 4);  	
call registrarDocenteGrado2("VICENTE CANO CUELLAR", 5);  	






				