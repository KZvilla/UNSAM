//Cristian Conrado,Villafañez Sobrecasa
//Librerías.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <errno.h>
#include <ctype.h>

//Struct.
typedef struct date
{
    int dia;
    char mes[4];
    int anio;
} Date;

typedef struct comp
{
    int orden;
    int corred;
    Date fecha;
    int edad;
    char pais[4];
    float tiempo;
} Competidores;

typedef struct compBin
{
    int orden;
    int corred;
    Date fecha;
    int edad;
    char pais[4];
    float tiempo;
    int activo;
} CompetidoresBin;

//Prototipos de funciones principales.
/*1*/   void listarTxt();
/*2*/   void crearBin();
/*3*/   void migrarABin();
/*4*/   void listaDat();
/*5*/   void altaDeComp();
/*6*/   void buscar();

//Prototipos de funciones auxiliares.
/*1*/   void lecturaBin();
/*2*/   void buscarPorID(int orden);
/*3*/   void buscarPorCorredor(int corredo);
/*4*/   int menuDat();
/*5*/   void filtrarActivo();
/*6*/   void filtrarPais();
/*7*/   void filtraRango();
/*8*/   int validarTexto(char texto[]);
/*9*/  void aMayuscula(CompetidoresBin *auxPais);
/*10*/   int validarOrden(int orden);
/*11*/  void plantillaCeros(CompetidoresBin * aux);
/*12*/  int validarNum(CompetidoresBin * aux);
/*13*/  void aMinuscula(CompetidoresBin *auxMes);
/*14*/  int validarMes(CompetidoresBin aux);
/*15*/  int esUnMes(char mes[]);
/*16*/  int validarAnio(CompetidoresBin aux);

int main()
{
//Variables.
    //int corredor;
    //int orden;
//Función para condicionar el aleatorio.
    srand(time(NULL));
//LLamados a funciones principales.
    //listarTxt();
    //crearBin();
    //migrarABin();
    listaDat();
    //altaDeComp();


//LLamados a funciones auxiliares.
    //lecturaArchivoFormato();
    //lecturaBin();
    //buscarPorID(orden = 1/*recordar borra el valor*/);
    //buscarPorCorredor(corredor = 5051/*recordar borra el valor*/);

    return 0;
}

///Funciones principales.

///Esta función se encarga de mostrar en pantalla los datos del archivo competidores.csv crudos.
/*1*/   void listarTxt()
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCorredors;
    //Variables auxiliares
    Competidores aux;
    char pc;    //Esta variable comodín servirá para "capturar" los ";".
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Se abre el archivo.
    datoCorredors = fopen("corredores_v1.csv","r");

    if(datoCorredors!=NULL)
    {
        while(fscanf(datoCorredors,"%d %c %d %c %d %c %[^;] %c %d %c %d %c %[^;] %c %f",&aux.orden,&pc,&aux.corred,&pc,&aux.fecha.dia,&pc,aux.fecha.mes,&pc,&aux.fecha.anio,&pc,&aux.edad,&pc,aux.pais,&pc,&aux.tiempo)!=EOF)
        {
            printf("%d;%d;%d;%s;%d;%d;%s;%.6f\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo);
        }

    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    //Se cierra el archivo.
    fclose(datoCorredors);
    //Generamos un proceso para limpiar la consola.
    getchar();
    system("cls");
}
///Esta función se encarga de crear un nuevo archivo binario llamado "competidores.dat".
/*2*/   void crearBin()
{
    FILE *binComp;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Intentamos abrir el archivo en solo lectura, de no existir lo creara, caso contrario informara de su existencia.
    binComp = fopen("competidores.dat", "r");
    if(errno == 2) // EL error con valor 2 corresponde a "no existe el archivo".
    {
        binComp=fopen("competidores.dat","wb");
    }
    else
    {
        printf("El archivo ya existe.\n");
        getchar();
        system("cls");
    }
    //Esto informara si ocurre un error al intentar crear al archivo ajeno al error 2.
    if (errno != 0 && errno !=2)
    {
        printf("Error en la creaci%cn del archivo, el mismo corresponde a: '%s'\n",162,strerror(errno));
        getchar();
        system("cls");
    }
    fclose(binComp);
}
///Esta función se encarga de migrar de competidores.csv a competidores.dat.
/*3*/   void migrarABin()
{
    //Abrimos ambos archivos.
    FILE*datosComp;
    FILE*datosCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno=0;
    //Definimos un auxiliar.
    CompetidoresBin aux;
    char pc;
    //LLamamos ambos archivos y controlamos los posibles errores.
    datosComp = fopen("corredores_v1.csv","r");
    if(datosComp == NULL)
    {
        printf("No se a podido abrir el archivo csv.\n");
        printf("El error corresponde a: '%s'\n",strerror(errno));
    }
    datosCompBin = fopen("competidores.dat","wb");
    if(datosCompBin == NULL)
    {
        printf("No se a podido abrir el archivo dat.\n");
        printf("El error corresponde a: '%s'\n",strerror(errno));
    }
    //Abiertos ambos archivos, se procede cargar la primera linea del competidores.csv, adicionar la columna de datos activo y se procede a guardarla en competidores.dat
    while (fscanf(datosComp,"%d %c %d %c %d %c %[^;] %c %d %c %d %c %[^;] %c %f ",&aux.orden,&pc,&aux.corred,&pc,&aux.fecha.dia,&pc,aux.fecha.mes,&pc,&aux.fecha.anio,&pc,&aux.edad,&pc,aux.pais,&pc,&aux.tiempo)!=EOF)
    {
        aux.activo = 1;
        fwrite(&aux,sizeof(CompetidoresBin),1,datosCompBin);
    }
    fclose(datosComp);
    fclose(datosCompBin);
}
///Esta función se encarga de mostrar un menú con diversas opciones a la hora de visualizar los datos.
/*4*/void listaDat()
{
    //Variables.
    int opcion;
    do
    {
        //LLamo al menú.En cada caso, salvo el de salida, se pisa el valor de "opcion" con -1 para volver al menú.
        opcion = menuDat();
        switch(opcion)
        {
        case 1:
            lecturaBin();
            opcion = -1;
            break;
        case 2:
            filtrarActivo();
            opcion = -1;
            break;
        case 3:
            filtrarPais();
            opcion = -1;
            break;
        case 4:
            filtraRango();
            opcion = -1;
            break;
        case 5:
            exit(0);
            break;
        default:
            printf("Opci%cn elegida no valida\n",162);
            getchar();
            system("cls");
            break;
        }
    }
    while(opcion>6 || opcion<0);

}
///Esta función se encarga de las altas de nuevos competidores.
/*5*/ void altaDeComp()
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variables auxiliares.
    CompetidoresBin aux;
    int filaUltimoDato;
    int altaOrden;
    int flag;
    int j;
    char textoAux[30];
    char textoAuxCortado[4];
    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb+");
    //EL siguiente bloque imprime en consola, el archivo binario.
    if(datoCompBin!=NULL)
    {
        do
        {
            printf("_________________________________________________________\n \n");
            printf("Ingrese el numero de orden del competidor\n");
            printf("_________________________________________________________\n \n");
            scanf("%d", &altaOrden);
            fflush(stdin);
        }
        while(validarOrden(altaOrden)== 1);

        /*En primera instancia nos fijamos si el orden ingresado es menor o = al ultimo orden, de esta
        manera sabemos si tendremos que buscar un 0 para planchar directamente el dato o agregar 0 hasta llegar a la fila del orden correspondiente.*/
        fseek(datoCompBin,0,SEEK_END);
        filaUltimoDato=ftell(datoCompBin)/sizeof(CompetidoresBin); // La ultima posición.
        printf("%d\n",filaUltimoDato);
        if(filaUltimoDato > altaOrden )     //No se toma en cuenta el igual por que seria un registro repetido.
        {
            //En primera instancia debemos mover el puntero hacia la posición la cual debería estar llena de ceros.
            fseek(datoCompBin,0,SEEK_SET);  //Reiniciamos la posición.
            fseek(datoCompBin,(altaOrden-1)*sizeof(CompetidoresBin),SEEK_SET); //Esto moverá el pointer hacia la ubicación deseada.
            //Comenzamos el guardado una vez ubicado el pointer.
            aux.orden = altaOrden;
            aux.activo = 1;
            //El numero de corredor se valida si es numero como tal.
            do
            {
                printf("Ingrese el numero de corredor.\n");
                scanf("%d",&aux.corred);
                fflush(stdin);
            }
            while(validarNum(&aux) == 1);

            printf("Ingrese el ingrese la fecha del registro siguiendo el patr%cn: d%ca / mes / a%co \n",161,163,164);

            //Cargamos el día, como mínimo es 1 y como máximo 31.
            printf("d%ca:\n",161);
            do
            {
                flag = 0;
                scanf("%d",&aux.fecha.dia);
                fflush(stdin);
                if(aux.fecha.dia>=32 || aux.fecha.dia <= 0)
                {
                    printf("El d%ca ingresado no es valido.\n",161);
                    flag = 1;
                }
            }
            while(flag == 1);

            //Cargamos el mes,hay que controlar en primera instancia, que el texto ingresado sea un texto y un mes, luego convertirlo(recortarlo y pasarlo a minúscula).
            //el Mes tiene doble validación por que aparte de validar al mes como texto, hay que validar al mes con respecto al día ingresado.
            printf("Mes(no utilizar n%cmeros):\n",163);
            do
            {
                do
                {
                    gets(textoAux);
                    fflush(stdin);
                }
                while(validarTexto(textoAux)==1 || esUnMes(textoAux) == 1);
                //Se recorta el mismo.
                for (j=0; j<3; j++)
                {
                    textoAuxCortado[j]=textoAux[j];
                }
                //Movemos el texto cortado a nuestra variable.
                strcpy(aux.fecha.mes,textoAuxCortado);
                //Convertimos en minúscula.
                aMinuscula(&aux);
            }
            while(validarMes(aux) == 1);

            //Para validar el año se toma como referencia el año mas bajo registrado y el actual.
            printf("A%co:\n",164);

            do
            {
                scanf("%d",&aux.fecha.anio);
                fflush(stdin);
            }
            while(validarAnio(aux) == 1);

            //Para la edad filtramos números negativos y acepta edades de elfos.
            printf("Ingrese el ingrese la edad. \n");
            do
            {
                flag = 0;
                scanf("%d",&aux.edad);
                fflush(stdin);
                if(aux.edad<0)
                {
                    flag = 1;
                }
            }
            while(flag==1);

            //Al igual que el mes, el país sigue un tratamiento de validación idéntico.
            printf("Ingrese el pa%cs de or%cgen. \n",161,161);
            do
            {
                gets(textoAux);
                fflush(stdin);
            }
            //Pero a diferencia de los meses, no se valida si el país existe o no.
            while(validarTexto(textoAux)==1);
            //Se recorta el mismo.
            for (j=0; j<3; j++)
            {
                textoAuxCortado[j]=textoAux[j];
            }
            //Movemos el texto cortado a nuestra variable estructurada.
            strcpy(aux.pais,textoAuxCortado);
            //Convertimos en ,mayúscula.
            aMayuscula(&aux);

            //Para los tiempos se tomara solo aquellos positivos.
            printf("Ingrese el tiempo registrado. \n");
            do
            {
                scanf("%f",&aux.tiempo);
                fflush(stdin);
            }
            while(aux.tiempo<0);

            printf("Carga exitosa, se procederá a realizar el guardado.\n");
            //Finalmente guardamos lo almacenado en el CompetidroesBin aux.
            fwrite(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        }
        else
        {
            //LLamamos la función de ceros y llenamos de cero nuestra auxiliar.
            plantillaCeros(&aux);
            for (int i; i<(altaOrden -filaUltimoDato -1); i++)  //Restamos 1, recordemos que completa con ceros y fwrite aumenta en 1 el pointer de esta manera estaremos en la posicion indicada al escribir.
            {
                fwrite(&aux,sizeof(CompetidoresBin),1,datoCompBin);
            }
            aux.orden = altaOrden;
            aux.activo = 1;
            //Cargamos el numero de corredor, al igual que el orden debe ser positivo y un numero.
            do
            {
                printf("Ingrese el numero de corredor.\n");
                scanf("%d",&aux.corred);
                fflush(stdin);
            }
            while(validarNum(&aux) == 1);

            printf("Ingrese el ingrese la fecha del registro siguiendo el patr%cn: d%ca / mes / a%co \n",161,163,164);
            //Cargamos el día, como mínimo es 1 y como máximo 31.
            printf("d%ca:\n",161);
            do
            {
                flag = 0;
                scanf("%d",&aux.fecha.dia);
                fflush(stdin);
                if(aux.fecha.dia>=32 || aux.fecha.dia <= 0)
                {
                    printf("El dia ingresado no es valido.\n");
                    flag = 1;
                }
            }
            while(flag == 1);

            //Cargamos el mes,hay que controlar en primera instancia, que el texto ingresado sea un texto y un mes, luego convertirlo(recortarlo y pasarlo a minúscula).
            //el Mes tiene doble validación por que aparte de validar al mes como texto, hay que validar al mes con respecto al día ingresado.
            printf("Mes(no utilizar n%cmeros):\n",163);
            do
            {
                do
                {
                    gets(textoAux);
                    fflush(stdin);
                }
                while(validarTexto(textoAux)==1 || esUnMes(textoAux) == 1);
                //Se recorta el mismo.
                for (j=0; j<3; j++)
                {
                    textoAuxCortado[j]=textoAux[j];
                }
                //Movemos el texto cortado a nuestra variable.
                strcpy(aux.fecha.mes,textoAuxCortado);
                //Convertimos en minúscula.
                aMinuscula(&aux);
            }
            while(validarMes(aux) == 1);

            //Para validar el año se toma como referencia el año mas bajo registrado y el actual.
            printf("A%co:\n",164);
            do
            {
                scanf("%d",&aux.fecha.anio);
                fflush(stdin);
            }
            while(validarAnio(aux) == 1);

            //Para la edad filtramos números negativos y acepta edades de elfos.
            printf("Ingrese el ingrese la edad. \n");
            do
            {
                flag = 0;
                scanf("%d",&aux.edad);
                fflush(stdin);
                if(aux.edad<0)
                {
                    flag = 1;
                }
            }
            while(flag==1);

            //Al igual que el mes, el país sigue un tratamiento de validación idéntico.
            printf("Ingrese el pa%cs de or%cgen. \n",161,161);
            do
            {
                gets(textoAux);
                fflush(stdin);
            }
            //A diferencia de los meses, no se valida si el país existe o no. Simplemente que sea un texto
            while(validarTexto(textoAux)==1);
            //Se recorta el mismo.
            for (j=0; j<3; j++)
            {
                textoAuxCortado[j]=textoAux[j];
            }
            //Movemos el texto cortado a nuestra variable estructurada.
            strcpy(aux.pais,textoAuxCortado);
            //Convertimos en ,mayúscula.
            aMayuscula(&aux);

            //Para los tiempos se tomara solo aquellos positivos.
            printf("Ingrese el tiempo registrado. \n");
            do
            {
                scanf("%f",&aux.tiempo);
                fflush(stdin);
            }
            while(aux.tiempo<0);

            printf("Carga exitosa, se procederá a realizar el guardado.\n");
            //Finalmente guardamos.
            fwrite(&aux,sizeof(CompetidoresBin),1,datoCompBin);

        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    //testeo
    //Generamos un proceso para limpiar la consola.
    fclose(datoCompBin);
    getchar();
    system("cls");
}
///Esta función ofrece 2 tipos de búsqueda.Por orden y por corredor.
/*6*/   void buscar()
{
}



///Funciones auxiliares.-------------------

///Esta función se encarga de mostrar en pantalla los datos con formato en FILE del binario.
/*1*/   void lecturaBin()
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variable auxiliar.
    CompetidoresBin aux;
    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb");
    //EL siguiente bloque imprime en consola, el archivo binario.
    if(datoCompBin!=NULL)
    {
        printf(" _______________________________________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\t Activo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
        //Cargamos el stream para imprimir en pantalla los datos que corresponden a la primera fila.
        fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        while(!feof(datoCompBin))
        {
            if(aux.orden == 0)
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t\t|\t %d \t|\t %s \t|\t %f \t|\t %d \t\t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo,aux.activo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
            }
            else
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %f \t|\t %d \t\t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo,aux.activo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");

            }

            fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    //Generamos un proceso para limpiar la consola.
    getchar();
    system("cls");
}
///Esta función busca un competidor al recibir un numero de orden (int), muestra si este existe o informa si no.
/*2*/   void buscarPorID(int orden)
{
    Competidores aux;
    int flag = 0;
    char pc;
    FILE*datoCorredors;
    datoCorredors = fopen("corredores_v1.csv","r");
    if(datoCorredors!=NULL)
    {
        printf(" _______________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|\n");
        while(fscanf(datoCorredors,"%d %c %d %c %d %c %[^;] %c %d %c %d %c %[^;] %c %f",&aux.orden,&pc,&aux.corred,&pc,&aux.fecha.dia,&pc,aux.fecha.mes,&pc,&aux.fecha.anio,&pc,&aux.edad,&pc,aux.pais,&pc,&aux.tiempo)!=EOF)
        {
            if(orden == aux.orden)
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %.6f \t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|\n");
                flag = 1;
                break;
            }
        }

        if(flag == 0)
        {
            system("cls");
            printf("El competidor ingresado no existe\n");
        }
        fclose(datoCorredors);
    }
    else
    {
        printf("Error de apertura del archivo");
    }
}
///Esta función busca un competidor al recibir un numero de corredor (int), muestra si este existe o informa si no.
/*3*/   void buscarPorCorredor(int corredor)
{
    Competidores aux;
    int flag = 0;
    char pc;
    FILE*datoCorredors;
    datoCorredors = fopen("corredores_v1.csv","r");
    if(datoCorredors!=NULL)
    {
        printf(" _______________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|\n");
        while(fscanf(datoCorredors,"%d %c %d %c %d %c %[^;] %c %d %c %d %c %[^;] %c %f",&aux.orden,&pc,&aux.corred,&pc,&aux.fecha.dia,&pc,aux.fecha.mes,&pc,&aux.fecha.anio,&pc,&aux.edad,&pc,aux.pais,&pc,&aux.tiempo)!=EOF)
        {
            if(corredor == aux.corred)
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %.6f \t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|\n");
                flag = 1;
                break;
            }
        }

        if(flag == 0)
        {
            system("cls");
            printf("\t \t El competidor ingresado no existe.\n");
        }
        fclose(datoCorredors);
    }
    else
    {
        printf("Error de apertura del archivo");
    }
}
///Esta función genera un menú para la función listarDat.
/*4*/   int menuDat()
{
    int opcion;
    printf("_________________________________________________________\n \n");
    printf("\t\t Seleccione una opci%cn: \n",162);
    printf("_________________________________________________________\n \n");
    printf(" 1 - Listar todos los competidores,activos e inactivos. \n");
    printf(" 2 - Listar solo los activos. \n");
    printf(" 3 - Listar por pa%cs ingresado.  \n",161);
    printf(" 4 - Listar dentro de un rango de tiempo. \n");
    printf(" 5 - Cerrar men%c. \n",163);
    printf("_________________________________________________________\n \n");
    scanf("%d",&opcion);
    fflush(stdin);

    return opcion;
}
///Esta función filtra por activo, diseñada para la función principal listarDat.
/*5*/ void filtrarActivo()
{
//Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variable auxiliar.
    CompetidoresBin aux;
    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb");
    //EL siguiente bloque imprime en consola, el archivo binario filtrando aquellos con activo = 1.
    if(datoCompBin!=NULL)
    {
        printf(" _______________________________________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\t Activo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
        //Cargamos el stream para imprimir en pantalla los datos que corresponden a la primera fila.
        fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        while(!feof(datoCompBin))
        {
            if(aux.activo == 1)
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %.6f \t|\t %d \t\t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo,aux.activo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
            }
            fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    fclose(datoCompBin);
    //Generamos un proceso para limpiar la consola.
    getchar();
    system("cls");
}
///Esta función filtra por país, diseñada para la función principal listarDat.
/*6*/   void filtrarPais()
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variables auxiliar.
    CompetidoresBin aux;
    CompetidoresBin auxPais;
    char pais[30];
    char paisAux[4];
    int j;
    int flag =0;
    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb");
    //EL siguiente bloque imprime en consola, el archivo binario filtrando según un país ingresado por teclado.
    if(datoCompBin!=NULL)
    {
        do
        {
            printf("Ingrese un pa%cs primeras auxPais del pa%cs a buscar.\n",161,161);
            gets(pais);
        }
        while(validarTexto(pais)==1);
        //Recortamos el texto.
        for (j=0; j<3; j++)
        {
            paisAux[j] = pais[j];
        }
        //Finalmente desplazamos el string recortado hacia el aux estructurado.
        strcpy(auxPais.pais,paisAux);
        //Convertimos el string ingresado en mayúscula.
        aMayuscula(&auxPais);
        //Comenzamos a la búsqueda.
        printf(" _______________________________________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\t Activo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
        //Cargamos el stream para imprimir en pantalla los datos que corresponden a la primera fila.
        fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        while(!feof(datoCompBin))
        {
            if(strcmp(auxPais.pais,aux.pais) == 0)
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %.6f \t|\t %d \t\t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo,aux.activo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
                flag = 1;
            }
            fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        }
        if(flag == 0 )
        {
            system("cls");
            printf("No se han encontrado competidores del pa%cs: %s",161,auxPais.pais);
        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    //Generamos un proceso para limpiar la consola.
    getchar();
    system("cls");
}
///Esta función filtra por un determinado rango, diseñada para la función principal listarDat.
/*7*/   void filtraRango()
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variable auxiliar.
    CompetidoresBin aux;
    float tMax,tMin;
    int flag = 0;
    int encontrado = 0;
    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb");
    //EL siguiente bloque imprime en consola, el archivo binario filtrado por un máximo y mínimo.
    if(datoCompBin!=NULL)
    {
        printf("Ingrese un rango de b%csqueda valido.\n",163);
        printf("_________________________________________________________\n \n");

        //Validamos los rangos ingresados, que sean positivos y que no sean disjuntos.
        do
        {
            printf("Ingrese la cota superior de b%csqueda.\n",163);
            scanf("%f",&tMax);
            fflush(stdin);
            printf("Ingrese la cota inferior de b%csqueda.\n",163);
            scanf("%f",&tMin);
            fflush(stdin);
            if (tMax < tMin || tMax < 0 || tMin < 0 )
            {
                printf("Los valores no son validos, no se puede crear un rango\n");
                printf("_________________________________________________________\n \n");
                flag = 1;
            }
            else flag = 0;
        }
        while(tMax<0 || tMin<0 || flag == 1);
        printf(" _______________________________________________________________________________________________________________________________________________________\n");
        printf("|\t Orden \t|\t Corredor \t|\t Fecha \t\t\t|\t Edad \t|\t Pa%cs \t|\t Tiempo \t|\t Activo \t|\n",161);
        printf("|\t\t|\t\t\t|\t D%ca|Mes|A%co \t\t|\t\t|\t\t|\t\t\t|\t\t\t|\n",161,164);
        printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
        //Cargamos el stream para imprimir en pantalla los datos que corresponden a la primera fila.
        fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        while(!feof(datoCompBin))
        {
            if(aux.tiempo < tMax && aux.tiempo > tMin )
            {
                printf("|\t %d \t|\t %d \t\t|\t %d | %s | %d \t|\t %d \t|\t %s \t|\t %.6f \t|\t %d \t\t|\n",aux.orden,aux.corred,aux.fecha.dia,aux.fecha.mes,aux.fecha.anio,aux.edad,aux.pais,aux.tiempo,aux.activo);
                printf("|_______________|_______________________|_______________________________|_______________|_______________|_______________________|_______________________|\n");
                encontrado = 1;
            }
            fread(&aux,sizeof(CompetidoresBin),1,datoCompBin);
        }
        if(encontrado == 0)
        {
            system("cls");
            printf("No se encontraron corredores dentro de los rango de tiempo: %.2f - %.2f", tMax,tMin);
        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
    }
    //Generamos un proceso para limpiar la consola.
    getchar();
    system("cls");
}
///Valida un texto, verificando si pertenece al alfabeto.
/*8*/ int validarTexto(char texto[])
{
    int boolean = 0;
    int i;
    //Controlo si es un numero.
    for (i=0; i < 30 && texto[i] != '\0'; i++)
    {
        if(isalpha(texto[i]) != 0 && texto[i] != '\0')
        {
            boolean = 0;
        }
        else
        {
            printf("No ha ingresado un texto valido, re intente nuevamente.\n");
            boolean = 1;
            return boolean;
        }
    }
    //Controlo el insertar enter.
    if(strcmp(texto,"\n")<0)
    {
        printf("No ha ingresado un texto valido, re intente nuevamente.\n");
        boolean = 1;
        return boolean;
    }


    return boolean;
}
///Transforma un texto "pais" con el struct CompetidorBin a mayúscula.
/*9*/ void aMayuscula(CompetidoresBin *auxPais)
{
    int i;
    for ( i = 0; i < 3 && (*auxPais).pais[i] != '\0'; i++ )
    {
        (*auxPais).pais[i] = (unsigned char)toupper((*auxPais).pais[i]);
    }
}
///Esta función verifica si un orden es valido y de serlo si es repetido.
/*10*/   int validarOrden(int orden)
{
    //Definimos el nombre de nuestro archivo.
    FILE*datoCompBin;
    //Definimos errno como 0, para controlar los errores que puedan suceder.
    errno = 0;
    //Definimos variable auxiliar.
    CompetidoresBin auxEscritura;
    CompetidoresBin auxBusqueda;
    int boolean = 0;
    //En primera instancia, verificamos que orden ingresado se un numero y positivo.Comparando con el Ascii de A/a hasta Z/z.
    if((orden >= 0x41 && orden <= 0x7A) || orden <=0)
    {
        printf("El valor ingreso no es valido, por favor ingrese otro.(presione enter para re intentar)\n");
        boolean = 1;
        getchar();
        system("cls");
        return boolean;
    }

    //Abrimos el archivo.
    datoCompBin = fopen("competidores.dat","rb");
    //EL siguiente bloque imprime en consola, el archivo binario buscando match entre el orden ingresado y alguno preexistente.
    if(datoCompBin!=NULL)
    {
        auxBusqueda.orden = orden;
        //Movemos el pointer hacia la posición donde se encuentra el orden cargado.
        fseek(datoCompBin, (auxBusqueda.orden -1)*sizeof(CompetidoresBin), SEEK_SET);
        //Leemos toda linea desde la ubicación del puntero.
        fread(&auxEscritura,sizeof(CompetidoresBin),1,datoCompBin);
        //Comparamos si los valores de de orden son igual, de serlo quiere decir que el corredor ya existía.
        if(auxEscritura.orden == auxBusqueda.orden)
        {
            printf("Ya existe un competidor registrado con dicho orden, por favor ingrese otro.(presione enter para re intentar)\n");
            boolean=1;
            getchar();
            system("cls");
            return boolean;
        }
    }
    else
    {
        printf("Error en la apertura del archivo, el mismo corresponde a: '%s'\n",strerror(errno));
        getchar();
        system("cls");
    }
    fclose(datoCompBin);
    return boolean;
}
///Esta función plancha con ceros nuestra variable auxiliar estructurada o en caso de baja física llena con ceros la posición.
/*11*/  void plantillaCeros(CompetidoresBin * aux)
{
    char cero[]= {"0"};

    (*aux).orden = 0;
    (*aux).corred = 0;
    (*aux).fecha.dia = 0;
    strcpy((*aux).fecha.mes,cero);
    (*aux).fecha.anio = 0;
    (*aux).edad = 0;
    strcpy((*aux).pais,cero);
    (*aux).tiempo = 0;
    (*aux).activo = 0;
}
///Esta función valida un numero de una variable auxiliara estructurada, tipo CompetidoresBin.
/*12*/  int validarNum(CompetidoresBin * aux)
{
    int boolean = 0;
    if(((*aux).corred >= 0x41 && (*aux).corred <= 0x7A) || (*aux).corred <=0)
    {
        printf("El valor ingreso no es valido, por favor ingrese otro.\n");
        boolean = 1;
        return boolean;
    }
    return boolean;
}
///Esta función convierte le texto "mes" a minúscula un mes de una variable aux estructurada con CompetidoresBin.
/*13*/ void aMinuscula(CompetidoresBin * auxMes)
{
    int i;
    for ( i = 0; i < 3 && (*auxMes).fecha.mes[i] != '\0'; i++ )
    {
        (*auxMes).fecha.mes[i] = (unsigned char)tolower((*auxMes).fecha.mes[i]);
    }
}
///Esta función controla que el mes ingresado es valido, toma en cuenta el día ingresan.
/*14*/  int validarMes(CompetidoresBin aux)
{
    int boolean = 0;
    //En esta instancia se sabe que es un mes, pero hay que verificar que el día ingresado sea tenga sentido con respecto al mes.
    if(aux.fecha.dia == 31)
    {
        if( strcmp(aux.fecha.mes,"ene")==0 || strcmp(aux.fecha.mes,"mar")==0 || strcmp(aux.fecha.mes,"may")==0 || strcmp(aux.fecha.mes,"jul")==0 || strcmp(aux.fecha.mes,"ago")==0 || strcmp(aux.fecha.mes,"oct")==0 || strcmp(aux.fecha.mes,"dic")==0)
        {
            boolean = 0;
            return boolean;
        }
        printf("El mes ingresado no se condice con el d%ca, revea el dato e int%cntelo nuevamente.\n",161,130);
        boolean = 1;
    }
    else if (aux.fecha.dia == 30)
    {
        if( strcmp(aux.fecha.mes,"abr")==0 || strcmp(aux.fecha.mes,"jun")==0 || strcmp(aux.fecha.mes,"sep")==0 || strcmp(aux.fecha.mes,"nov")==0)
        {
            boolean = 0;
            return boolean;
        }
        printf("El mes ingresado no se condice con el d%ca, revea el dato e int%cntelo nuevamente.\n",161,130);
        boolean = 1;
    }
    else if(aux.fecha.dia == 28)
    {
        if(strcmp(aux.fecha.mes,"feb")==0)
        {
            boolean = 0;
            return boolean;
        }
        printf("El mes ingresado no se condice con el d%ca, revea el dato e int%cntelo nuevamente.\n",161,130);
        boolean = 1;
    }

    return boolean;
}
///Esta función controla que el testo sea un mes.
/*15*/  int esUnMes(char mes[])
{
    int boolean = 0;
    char auxMes[30];
    int i;
    strcpy(auxMes,mes);
    for ( i = 0; i < 30 && auxMes[i] != '\0'; i++ )
    {
        auxMes[i] = (unsigned char)tolower(auxMes[i]);
    }
    if(strcmp(auxMes,"enero")!=0 && strcmp(auxMes,"marzo")!=0 && strcmp(auxMes,"mayo")!=0 && strcmp(auxMes,"julio")!=0 && strcmp(auxMes,"agosto")!=0 && strcmp(auxMes,"octubre")!=0 && strcmp(auxMes,"diciembre")!=0 && strcmp(auxMes,"abril")!=0 && strcmp(auxMes,"junio")!=0 && strcmp(auxMes,"septiembre")!=0 && strcmp(auxMes,"noviembre") && strcmp(auxMes,"febrero")!=0)
    {
        boolean = 1;
        printf("No se ha ingresado un mes valido.\n");
        return boolean;
    }
    return boolean;
}
///Esta función, se encarga de validar el año, usa como referencia el menor año registrado (2015) y el año actual en el que se ejecuta el programa.
/*16*/  int validarAnio(CompetidoresBin aux)
{
    int boolean = 0;
    int anioActual;
    int anioMin = 2015;
    //Usando time.c cargamos la fecha actual en la cual se ejecuta el programa.
    time_t tiempo=time(NULL);
    struct tm tiempoActual=*localtime(&tiempo);
    //Apartamos el anioactual
    anioActual = tiempoActual.tm_year + 1900;
    if (aux.fecha.anio < anioMin || aux.fecha.anio > anioActual )
    {
        boolean = 1;
        printf("El a%co ingresado no es valido.\n",164);
    }
    return boolean;
}
