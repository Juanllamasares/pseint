Proceso JuegoAdivinanza
    //definicion de variables
    definir nIngresado como entero;
    definir nAdivinar como entero;
    definir nIntentos como entero;
    //datos de entrada del usuario
	escribir "ingrese numero";
	leer nIngresado;
	//numero a adivinar
	nAdivinar<-5;
	//proceso de seleccion
	mientras (nIngresado!=nAdivinar) Hacer
		si nIngresado<nAdivinar entonces
			//datos de salida
			escribir "muy bajo";
		SiNo
			//datos de salida
			escribir "muy alto";
		FinSi
		//datos de entrada del usuario
		escribir "ingrese numero";
		leer nIngresado;
	FinMientras
	//datos de salida
	escribir "ganaste";
	
FinProceso