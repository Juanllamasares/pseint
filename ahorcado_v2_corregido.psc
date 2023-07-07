SubProceso Bienvenida()
	Escribir "       ***************************";
	Escribir "       ***El Juego Del Ahorcado***";
	Escribir "       ***************************";
	Escribir "            o--------o     ";
	Escribir "            |        |     ";
	Escribir "            |        O     ";
	Escribir "            |       /|\    ";
	Escribir "            |      _/ \_   ";
	Escribir "            |              ";
	Escribir "           _|_____________ ";
	esperar 5 Segundos;
	Limpiar Pantalla;
	
FinSubProceso
//=====================================================================================================================
SubProceso Mostrar_menu_pedir_opcion(opcion_dificultad Por Referencia)
	Escribir "         ****************";
	Escribir "         *MENU DE INICIO*";
	Escribir "         ****************";
	Escribir " 1  ------>   FACIL  -----> 10 intentos.";
	Escribir " 2  ------>  DIFICIL -----> 5 intentos";
	Escribir " 3  ------> SALIR DEL JUEGO ";
	Leer opcion_dificultad;
FinSubProceso
//=====================================================================================================================
SubProceso verificar_dificultad(opcion_dificultad Por Referencia)
	
	Mientras (opcion_dificultad > 3) o (opcion_dificultad < 1) Hacer
		Escribir "El nº ingresado no es valido,digite otro (1 - 2 - 3):";
		Leer opcion_dificultad;
	FinMientras
	
FinSubProceso
//=====================================================================================================================
SubProceso pedir_palabra_secreta_y_pista(palabra_secreta Por Referencia,pista Por Referencia)
	Definir opcion_palabra Como Entero;
	Escribir "¿Quiere ingresar una palabra secreta o prefiere usar una palabra al azar del juego?";
	Escribir "1 -> ingresar una palabra, 2 -> Palabra al azar del juego.";
	Leer opcion_palabra;
	
	Mientras (opcion_palabra > 2) o (opcion_palabra < 1) Hacer
		Escribir "El nº ingresado no es valido,digite otro (1 - 2):";
		Leer opcion_dificultad;
	FinMientras
	
	Segun opcion_palabra hacer
		1:	
			Escribir "Introdusca la palabra secreta: ";
			Leer palabra_secreta;
			palabra_secreta<-Mayusculas(palabra_secreta);
			Escribir "Introdusca una pista: ";
			Leer pista;
		2:
			seleccionar_palabra_secreta_y_pista(palabra_secreta,pista);
	FinSegun
	
	Limpiar Pantalla; //LIMPIO PANTALLA PARA EVITAR QUE EL JUGADOR NO VEA LO QUE DEBE ADIVINAR
	//CREO UN ARREGLO QUE CONTIENE LAS LETRAS DE LA PALABRA SECRETA
FinSubProceso
//=====================================================================================================================
SubProceso seleccionar_palabra_secreta_y_pista(palabra_secreta Por Referencia,pista Por Referencia)
	Definir n Como Entero;
	Definir palabras,pistas Como Caracter;
	
	Dimension palabras[10];
	palabras[0]<-"PSEUDOCODIGO";
	palabras[1]<-"FRAMEWORK";
	palabras[2]<-"INSERCION";
	palabras[3]<-"PROGRAMACION";
	palabras[4]<-"FUNDAMENTOS";
	palabras[5]<-"SUBPROCESO";
	palabras[6]<-"CONCATENAR";
	palabras[7]<-"COMPROMISO";
	palabras[8]<-"ALGORITMO";
	palabras[9]<-"CONJUNTOS";
	
	Dimension pistas[10];
	pistas[0]<-"Forma de expresar los distintos pasos que va a realizar un programa";
	pistas[1]<-"Entorno de trabajo en el desarrollo de software";
	pistas[2]<-"Metodo de ordenamiento,en programacion";
	pistas[3]<-"Proceso utilizado para idear y ordenar las acciones necesarias para realizar un proyecto";
	pistas[4]<-"Conocimientos que deben adquirirse antes de aprender un lenguaje de programacion";
	pistas[5]<-"Proceso por sí mismo, cuya finalidad hace parte de un Proceso más grande";
	pistas[6]<-"Metodo para unir letras o numeros utilizados por un usuario en pseint";
	pistas[7]<-"Uno de los valores de el Framework SCRUM";
	pistas[8]<-"Conjunto de instrucciones o reglas definidas y ordenadas que permite,solucionar un problema";
	pistas[9]<-"Uno de los 5 datos estructurados estaticos";
	
	n<-azar(10);
	
	palabra_secreta<-palabras[n];
	pista<-pistas[n];
	
	Limpiar Pantalla; 
	
FinSubProceso
//=====================================================================================================================
SubProceso mostrar_letras_acertadas(palabra_secreta,letras_acertadas)
	Definir i Como Entero;
	
	Para i<-0 hasta Longitud(palabra_secreta)-1 Hacer
	    //SI ADIVINA LA LETRA ENTONCES PONDRA LA LETRA EN SU LUGAR CORRESPONDIENTE
		Si letras_acertadas[i] Entonces
			Escribir sin saltar Subcadena(palabra_secreta,i,i)," ";
		SiNo //SINO PONDRA # EN LUGAR DE LA LETRA QUE DEBE ADIVINAR
			Escribir sin saltar " # ";
		FinSi
		
	FinPara
	
FinSubProceso
//=====================================================================================================================
SubProceso mostrar_pista_y_letras_usadas(pista,letras_usadas)
	Escribir "La pista es: * ",pista," *";
	Escribir "Las letras introducidas son: ",letras_usadas;
FinSubProceso

//=====================================================================================================================
SubProceso pedir_y_comprobar_letra_ingresada(letra_introducida Por Referencia)
	Repetir 
		Escribir "Introduce una letra:";
		Leer letra_introducida;
		//COMPRUEBO DE QUE INGRESE SOLO 1 LETRA
		Si Longitud(letra_introducida)<>1 Entonces
			Escribir "Solo puedes colocar 1 letra";
		FinSi
	Hasta Que Longitud(letra_introducida)=1;
	
	letra_introducida<-Mayusculas(letra_introducida);
	
FinSubProceso
//=====================================================================================================================
Funcion letra_acertada <- adivino_letra(letra_introducida,palabra_secreta,letras_acertadas Por Referencia)
	Definir letra_acertada Como Logico;
	Definir i Como Entero;
	
	letra_acertada<-Falso;
	
	Para i<-0 hasta Longitud(palabra_secreta)-1 Hacer
		Si Subcadena(palabra_secreta,i,i)=letra_introducida Entonces
			letras_acertadas[i]<-Verdadero;
			letra_acertada<-Verdadero;
		FinSi
	FinPara
	Escribir "";
FinFuncion
//=====================================================================================================================
SubProceso  Mostrar_ahorcado(fallos,intentos)
	Escribir "";
	Escribir "Te quedan ",intentos, " intentos";
	Escribir "";
	Segun fallos Hacer
		0:
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
		1:
			Escribir "                ";
			Escribir "                ";
			Escribir "                ";
			Escribir "                ";
			Escribir "                ";
			Escribir "                ";
			Escribir "_______________ ";
		2:
			Escribir " o--------o     ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		3:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		4:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		5:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |        |     ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
			
		6:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |       /|     ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		7:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |       /|\    ";
			Escribir " |              ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		8:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |       /|\    ";
			Escribir " |       /      ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		9:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |       /|\    ";
			Escribir " |       / \    ";
			Escribir " |              ";
			Escribir "_|_____________ ";
		10:
			Escribir " o--------o     ";
			Escribir " |        |     ";
			Escribir " |        O     ";
			Escribir " |       /|\    ";
			Escribir " |      _/ \_    ";
			Escribir " |              ";
			Escribir "_|_____________ ";
	FinSegun
	Escribir "";
FinSubProceso
//=====================================================================================================================
SubProceso contador_de_fallos_e_intentos(opcion_dificultad,intentos Por Referencia,fallos Por Referencia,letra_acertada)
	Segun opcion_dificultad hacer
		1:
			si letra_acertada=Falso Entonces
				fallos<-fallos+1;
				intentos<-intentos-1;
			FinSi
		2:
			si no letra_acertada Entonces
				fallos<-fallos+2;
				intentos<-intentos-1;
			FinSi
	FinSegun
FinSubProceso
//=====================================================================================================================
SubProceso contador_de_aciertos(letras_acertadas,palabra_secreta,aciertos Por Referencia)
	Definir i Como Entero;
	Para i<-0 hasta Longitud(palabra_secreta)-1 Hacer
		Si letras_acertadas[i] Entonces
			aciertos<-aciertos+1;
		FinSi
	FinPara
FinSubProceso
//=====================================================================================================================
SubProceso Mostrar_final(fallos,intentos)
	si fallos=10 Entonces
		Mostrar_ahorcado(fallos,intentos);
		Escribir "¡PERDISTE!";
	SiNo
		Mostrar_ahorcado(fallos,intentos);
		Escribir "¡GANASTE!";
	FinSi
FinSubProceso
//=====================================================================================================================
Proceso EL_JUEGO_DEL_AHORCADO_V1
	Definir letra_introducida,letras_usadas,palabra_secreta,pista Como Caracter;
	Definir fallos,opcion_dificultad,i,aciertos,intentos Como Entero;
	Definir letras_acertadas,letra_acertada Como Logico;
	
	Bienvenida();
	
	Mostrar_menu_pedir_opcion(opcion_dificultad);
	
	verificar_dificultad(opcion_dificultad);
	
	Limpiar Pantalla;
	//INICIALIZO VARIABLES
	letras_usadas<-"";
	fallos<-0;
	letra_acertada<-falso;
	
	si (opcion_dificultad=1) o (opcion_dificultad=2) Entonces
		Segun opcion_dificultad hacer
			1:
		      intentos<-10; //DIFICULTAD FACIL=10 INTENTOS PARA FALLAR
			2:
			  intentos<-5; //DIFICULTAD FACIL=5 INTENTOS PARA FALLAR
		FinSegun
	  
		
		pedir_palabra_secreta_y_pista(palabra_secreta,pista);
		
		Dimension letras_acertadas[Longitud(palabra_secreta)];
		//CADA LETRA DE LA PALABRA ESTARA EN FALSO HASTA QUE ADIVINE Y SE VUELVA VERDADERO MAS ADELANTE
		Para i<-0 hasta Longitud(palabra_secreta)-1 Hacer
			letras_acertadas[i]<-Falso;
		FinPara
		//SE REPITE EL PROCESO HASTA QUE ADIVINE TODAS LAS LETRAS O TENGA Nº CANTIDAD DE FALLOS
		Repetir 
			
			aciertos<-0;
			//MUESTRA LA CANTIDAD DE LETRAS DE LA PALABRA COMO # Y SE IRAN DESBLOQUEANDO Y MOSTRANDO LA LETRA A MEDIDA QUE ADIVINE
			mostrar_letras_acertadas(palabra_secreta,letras_acertadas);
			//LLAMA A LA FUNCION QUE DIBUJA EL AHORCADO DEPENDIENDO DE LA CANTIDAD DE FALLOS
			Mostrar_ahorcado(fallos,intentos);
			//MUESTRA LA PISTA Y LAS LETRAS QUE HA UTILIZADO 
			mostrar_pista_y_letras_usadas(pista,letras_usadas);
			//COMPRUEBA DE QUE INGRESE 1 SOLA LETRA
			pedir_y_comprobar_letra_ingresada(letra_introducida);
			//GUARDO EN LETRAS LAS LETRAS QUE VA INGRESANDO
			letras_usadas<-Concatenar(letras_usadas,Concatenar(letra_introducida,"-"));
			//VERIFICO DE QUE LA LETRA INGRESADA ESTE EN EL ARREGLO (LLAMANDO A LA FUNCION)
			letra_acertada <- adivino_letra(letra_introducida,palabra_secreta,letras_acertadas);
			//SI NO ADIVINA , LETRA ACERTADA SERA FALSO Y HABRA FALLADO Y SUS INTENTOS SE REDUCEN
			contador_de_fallos_e_intentos(opcion_dificultad,intentos,fallos,letra_acertada);
			//CUENTO LA CANTIDAD DE ACIERTOS RECORRIENDO EL ARREGLO DE LAS LETRAS DE LA PALABRA
			contador_de_aciertos(letras_acertadas,palabra_secreta,aciertos);
			
			Limpiar Pantalla;
			
		Hasta Que aciertos=Longitud(palabra_secreta) o fallos=10 
		
		Escribir "La palabra secreta era : ",palabra_secreta;
		
		Mostrar_final(fallos,intentos);
	FinSi
	
	si (opcion_dificultad=3) Entonces
		Escribir "ADIOS!!!";
	FinSi
	
FinProceso
