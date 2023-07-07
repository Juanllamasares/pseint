// Algoritmo de la burbuja
SubAlgoritmo burbuja (listaDeElementos Por Referencia,cantElementos)
    Definir intercambiado Como Logico;
    Definir n,i como Entero; // i=>iterador sobre listaDeElementos
    Definir auxiliar como Entero;
	Definir iteracion como Entero;
	
	n<- cantElementos - 1;
	iteracion <- 0;
    Repetir
		intercambiado <- Falso;
		Para i<-0 Hasta n-1-iteracion Con Paso 1 Hacer
			// si este par no esta ordenado
			Si listaDeElementos[i]>listaDeElementos[i+1] Entonces
				// intercambiamos y recordamos 
				// que algo ha cambiado
				auxiliar <- listaDeElementos[i];
				listaDeElementos[i] <- listaDeElementos[i+1];
				listaDeElementos[i+1] <- auxiliar;
				intercambiado <- Verdadero;
			FinSi
		FinPara   
		iteracion <- iteracion + 1;
		
    Hasta Que no intercambiado //hasta que no hay mas intercambios
FinSubAlgoritmo


// Algoritmo de ordenamiento por insercion
SubAlgoritmo Insercion (listaDeElementos Por Referencia, cantElementos)
    Definir n como Entero; // longitud de listaDeElementos
    Definir i,k como Entero;// iterador de listaDeElementos
    Definir j como Entero; // para moverme sobre la lista
    Definir elemento como Entero;
	
	n<-cantElementos-1;
	
    Para i<-1 Hasta n Con Paso 1 Hacer
		elemento <- listaDeElementos[i];
		j <- i-1;
		Mientras (j>=0) y (listaDeElementos[j] > elemento) Hacer
			listaDeElementos[j+1] <- listaDeElementos[j];
			j <- j-1;
		FinMientras
		
		listaDeElementos[j+1] <- elemento;
		
		
    FinPara
FinSubAlgoritmo





// Algoritmo de seleccion
SubAlgoritmo Seleccion (listaDeElementos, cantElementos)
	Definir n como Entero; // longitud de listaDeElementos
	Definir i como Entero;// iterador sobre listaDeElementos
	Definir j como Entero;
	Definir minimo como Entero;
	Definir auxiliar como Entero;
	
	n <- cantElementos - 1;
	Para i<-0 Hasta n-1 Con Paso 1 Hacer
		minimo <- i;
		Para j<-i+1 Hasta n Con Paso 1 Hacer
			// si este par no està ordenado
			Si listaDeElementos[j] < listaDeElementos[minimo] Entonces
				// encontramos un nuevo minimo
				minimo <- j;
			FinSi
		FinPara
		// intercambiamos el actual con le minimo encontrado
		auxiliar <- listaDeElementos[minimo];
		listaDeElementos[minimo] <- listaDeElementos[i];
		listaDeElementos[i] <- auxiliar;	
	FinPara
FinSubAlgoritmo



Proceso Ordenacion
	Definir listaDeElementos como Entero;
	Definir tamanio como entero;
	
	
	Definir i como Entero;
	Definir metodoElegido Como Entero;
	
	tamanio <-5;
	Dimension listaDeElementos[5];
	//lleno el arreglo
	listaDeElementos[0] <- 2;
	listaDeElementos[1] <- 1;
	listaDeElementos[2] <- 3;
	listaDeElementos[3] <- 5;
	listaDeElementos[4] <- 4;
//	listaDeElementos[5] <- 3;
//	listaDeElementos[6] <- 7;
//	listaDeElementos[7] <- 6;
	
	
	//Muestro el arreglo Inicial
	Escribir "Arreglo original";
	Para i <- 0 Hasta tamanio-1 con Paso 1 hacer
		Escribir Sin Saltar listaDeElementos[i];
	FinPara
	Escribir "";
	
	Escribir "Selecciones el método de ordenación:";
	Escribir "1: Inserción";
	Escribir "2: Burbuja";
	Escribir "3: Selección";
	Leer metodoElegido;
	
	Escribir "Presione una tecla para ordenar";
	esperar tecla;
	
	Segun metodoElegido Hacer
		1:
			Insercion(listaDeElementos, tamanio);
		2:
			Burbuja(listaDeElementos, tamanio);
		De Otro Modo:
			Seleccion(listaDeElementos, tamanio);
	FinSegun
	
	
	Para i <- 0 Hasta tamanio-1 con Paso 1 hacer
		Escribir Sin Saltar listaDeElementos[i];
	FinPara
	Escribir "";
	
FinProceso
