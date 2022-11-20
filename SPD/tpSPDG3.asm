.8086
.model small
.stack 100h
;--------------------------------------------------------------------------------------------
;DATA SEGMENT
;--------------------------------------------------------------------------------------------
.data
;--------------------------------------------------------------------------------------------
;Variables
;-------------------------------------------------------------------------------------------- 
    nombre          db 10 dup(24h), 24h              ;Nombre de solo 10 caracteres.           ;Nombre de solo 10 caracteres.
    fabio           db "Fabio:", 24h              ;Nombre de solo 10 caracteres.           ;Nombre de solo 10 caracteres.
    decision        db 0 , 24h
    chau            db "Gracias por jugar!$"
    copyR           db "(R)CRISTIAN VILLAFANEZ"
    copyR2          db "VALENTINO BORTOLUSSI | DIEGO ALEGRE"
    copyR3          db "MARTIN DE LOJO | MATIAS DI STEFANO"
    contin          db "Continuara...$"
    coordX          db ?
    coordY          db ?
;--------------------------------------------------------------------------------------------
;Banderas
;-------------------------------------------------------------------------------------------- 
    tomoAgua                    db 0
    cansancio                   db 0
    asientoParticular           db 0
    fallarPreFabio              db 0
;--------------------------------------------------------------------------------------------
;Texto LOGO - LOGO
;-------------------------------------------------------------------------------------------- 

    texto0     db "$"
    texto1     db "UNSAM - Escuela de CyT.$"                             ;LIMITE DE CARACTERES ES 30 por renglon punto inlcluido
    texto2     db "$"
    texto3     db "$"
    texto4     db "$"
    textoEnter db "PULSE UNA TECLA PARA INICIAR.$"
    texto6     db "$"
    texto7     db "Construido y programado por:$"
    texto8     db "    Cris   Valen    Pipo    $"
    textoE     db "        Mati   Martin       $"
    dibujo  db 00h,00h,03h,03h,03h,03h,00h,00h,00h,00h,00h,03h,03h,03h,03h,00h ;11*14 8 | f*C 
            db 00h,00h,03h,0Fh,0Fh,0Fh,03h,03h,00h,03h,03h,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,00h
            db 00h,00h,03h,03h,03h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,03h,03h,03h,00h
            db 00h,00h,00h,00h,00h,00h,03h,03h,0Fh,03h,03h,00h,00h,00h,00h,00h
            db 00h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h,00h,00h,00h,00h,00h
    datamul db 16,32,48,64,80,96,112,128,144,160,176
;--------------------------------------------------------------------------------------------
;Texto Instrucciones
;-------------------------------------------------------------------------------------------- 
    textoINS0     db "Bienvenido al simulador de SPD.$"     ;LIMITE DE CARACTERES ES 30 por renglon punto inlcluido
    textoINS1     db "En el transcurso del juego te $"   
    textoINS2     db "enfrentaras a diversos eventos$"
    textoINS3     db "en los cuales se te ofreceran$"
    textoINS4     db "opciones para lidiar con ellos$"
    textoINS5     db "Utilice el mouse para interac-$"
    textoINS6     db "tuar con dichas opciones. $"
    textoINS7     db "Ingrese un alias sin espacios$"
    textoINS8     db "Alias: $"
    textoINS9     db "Desea guardar Y/N "
    textoINSA     db "$"
    textoINSE     db "Presione una tecla para continuar.$"
;--------------------------------------------------------------------------------------------
;Texto PROLOGO
;--------------------------------------------------------------------------------------------      
    prog0 db "Eres un estudiante de la UNSAM,$"
    prog1 db "alumno de SPD. Es el 7 de septiembre$"
    prog2 db "del 2022. Son las 17:45 y a las$"
    prog3 db "18:00 empieza la clase.$"
    prog4 db "Recien llegas a la entrada de la$"
    prog5 db "universidad del lado de Miguelete$"
    prog6 db "(los aularios) y ves el Tornabus$"
    prog7 db "a lo lejos, apuras el paso para no$"
    prog8 db "perderlo, pero de repente una mujer$"
    prog9 db "te interrumpe...$"
    progE db "Presione una tecla para continuar...$"
;--------------------------------------------------------------------------------------------
;Texto JUEGO acto 0 -- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texJA00 db "Mujer (de aspecto raro):$"
    texJA01 db "-Hola, disculpa que te moleste$"
    texJA02 db "pero estamos vendiendo$"                             ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texJA03 db "botellas de agua$"
    texJA04 db "y recaudando lo que ganamos$"
    texJA05 db "para mejorar las instalaciones$"
    texJA06 db "de la universidad.$"
    texJA07 db "...$"
    texJA08 db "...$"
    texJA0A db "... quiere comprar?-$"
    texJA0E db "                   Elija una opcion.$"                          ;Plantilla
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ACTO 0 -- Acronimo: JO = juego opciones, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------                                       ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJA0OPA1 db "Seguis de  $"     
    texJA0OPA2 db "largo como $"
    texJA0OPA3 db "sino       $"
    texJA0OPA4 db "hubieras   $"
    texJA0OPA5 db "escuchado  $"
    texJA0OPA6 db "nada.      $"
    texJA0OPA8 db 0DCh, 24h

    ;ACA HAY UN FLAG (flag agua)                                                            
    texJA0OPB1 db "Hoy te$"     
    texJA0OPB2 db "sentis$"
    texJA0OPB3 db "bondadoso y$"
    texJA0OPB4 db "compras una$"
    texJA0OPB5 db "botella$"
    texJA0OPB6 db "de agua.$"
    texJA0OPB8 db 0DCh, 24h

    texJA0OPC1 db "Usas$"     
    texJA0OPC2 db "la excusa$"
    texJA0OPC3 db "maestra: $"
    texJA0OPC4 db "No tengo$"
    texJA0OPC5 db "plata.$"
    texJA0OPC6 db "(si tenes)$"
    texJA0OPC8 db 0DCh, 24h
;--------------------------------------------------------------------------------------------
;Texto consecuencias 0 -- Acronimo: CONA = Condicion Acto, A"numero" = numero de acto
;OPCION[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------   
    texCONA0A1     db "Seguis tu camino y llegas al$"     ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texCONA0A2     db "Tornabus.$"   
    ;renglon 3 nombre
    texCONA0A4     db "-Si tardaba un minuto mas lo perdia-$"   
    texCONA0A5     db "Despues de un paseo agradable llegas$"
    texCONA0A6     db "al tornavias y te dirijis camino$"
    texCONA0A7     db "al laboratorio de computacion IV...$"
    texCONA0AE     db "Presione una tecla para continuar.$"

    texCONA0B1     db "Tu respuesta fue ingeniosa,$"            ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texCONA0B2     db "... pero perdiste el Tornabus.$"   
    texCONA0B3     db "Caminas hasta el tornavias$"             
    texCONA0B4     db "y con el tiempo justo$"
    texCONA0B5     db "llegas hasta el laboratorio $"
    texCONA0B6     db "de computacion IV$"
    texCONA0B7     db "sentandote adelante, en el unico$"
    texCONA0B8     db "lugar vacio que queda...$"
    texCONA0BE     db "Presione una tecla para continuar.$"

    ;renglon 1 nombre
    texCONA0C2     db "-Nunca vi a alguien tardar tanto$"         ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texCONA0C3     db "en vender una botella-$"   
    texCONA0C4     db "Lastimosamente  perdiste el Tornabus$"   
    texCONA0C5     db "y caminas hasta el tornavias,$"
    texCONA0C6     db "cansado de la larga caminata tomas$"
    texCONA0C7     db "agua, con el tiempo justo llegas$"
    texCONA0C8     db "hasta el laboratorio$"
    texCONA0C9     db "de computacion IV y$"
    texCONA0CA     db "te sentas adelante en el unico$"
    texCONA0CB     db "lugar vacio que queda...$"                          ;SETEAR FLAG: CANSADO EN 1
    texCONA0CE     db "Presione una tecla para continuar.$"
;--------------------------------------------------------------------------------------------
;Texto JUEGO ENTRE ACTO 0-- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texJEA00 db "Terminaste llegando temprano al aula$"
    texJEA01 db "y notas 3 lugares vacios:$"
    texJEA0E db "                   Elija una opcion.$"                          ;Plantilla
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ENTRE ACTO 0 -- Acronimo: JEA = juego ENTRE ACTO, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------
    texJEA0OPA1 db "Adelante,$"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJEA0OPA2 db "vulnerable$"     
    texJEA0OPA3 db "a las$"
    texJEA0OPA4 db "preguntas$"
    texJEA0OPA5 db "tramposas$"
    texJEA0OPA6 db "de Fabio.$"
    texJEA0OPA8 db 0DCh, 24h

    ;ACA HAY UN FLAG (flag agua)                                                            
    texJEA0OPB1 db "Atras,$"     
    texJEA0OPB2 db "no llegas$"
    texJEA0OPB3 db "ni a ver ni$"
    texJEA0OPB4 db "a escuchar$"
    texJEA0OPB5 db "nada de la$"
    texJEA0OPB6 db "clase.$"
    texJEA0OPB8 db 0DCh, 24h

    texJEA0OPC1 db "En el $"     
    texJEA0OPC2 db "medio,$"
    texJEA0OPC3 db "como un$"
    texJEA0OPC4 db "alumno$"
    texJEA0OPC5 db "promedio.$"
    texJEA0OPC8 db 0DCh, 24h
;--------------------------------------------------------------------------------------------
;Texto JUEGO acto 1
;--------------------------------------------------------------------------------------------
    texJA10 db "Llega uno de los profesores de la$"
    texJA11 db "materia a la clase, el mismisimo$"
    texJA12 db "Fabio Sergio Bruschetti.$"                            ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texJA13 db "Hoy, miercoles, toca parcialito$"
    texJA14 db "y como es habitual 'estudiaste'.$"
    texJA15 db "Pero el mismo esta compuesto$"
    texJA16 db "por una sola pregunta:$"
    texJA17 db "$"
    texJA18 db "En operaciones binarias con signo,$"
    texJA19 db "indicar la operacion que$"
    texJA1A db "arroja sobre flujo (overflow)$"
    texJA1E db "                   Elija una opcion.$"                                                   
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ACTO 1
;--------------------------------------------------------------------------------------------
    texJA1OPA1 db "    100$"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJA1OPA2 db "     +$"     
    texJA1OPA3 db "    100$"
    texJA1OPA8 db 0DCh, 24h
                                                         
    texJA1OPB1 db "    111$"     
    texJA1OPB2 db "     +$"
    texJA1OPB3 db "    111$"
    texJA1OPB8 db 0DCh, 24h

    texJA1OPC1 db "    011$"     
    texJA1OPC2 db "     +$"
    texJA1OPC3 db "    110$"
    texJA1OPC8 db 0DCh, 24h
;--------------------------------------------------------------------------------------------
;Texto consecuencias  -- Acronimo: CONA = Condicion Acto, A"numero" = numero de acto
;OPCION[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------   
    texCONA1A2     db "-mmm... que raro un parcialito$"   
    texCONA1A3     db "con una sola consigna-$"   
    texCONA1AE     db "Presione una tecla para continuar.$"

    texCONA1B2     db "-mmm... que raro un parcialito$"   
    texCONA1B3     db "con una sola consigna-$"             
    texCONA1B4     db "...$"
    texCONA1B5     db "$"
    texCONA1B7     db "-Carry... algo con el carry-$"
    texCONA1BE     db "Presione una tecla para continuar.$"

    ;Textos auxiliares, para mejorar la trama
    texCONA1AUX0   db "Felicitaciones, 10!$"
    texCONA1AUX1   db "Uy!! que pena...$"
;--------------------------------------------------------------------------------------------
;Texto JUEGO ENTRE ACTO 1-- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texJEA10 db "Luego del estresante parcialito,$"
    texJEA11 db "Fabio enciende el proyector$"
    texJEA12 db "y comienza a dar la teoria del dia.$"               ;Plantilla
    texJEA13 db "Luego de unos minutos$"                             ;Plantilla
    texJEA14 db "Fabio pregunta al publico$"                         ;Plantilla
    texJEA15 db "lo siguiente... $"                                  ;Plantilla
    texJEA1E db "Presione una tecla para continuar.$"

    ;Texto auxiliar

    texJEA1AUX1 db "-Cuantas combinaciones binarias$"
    texJEA1AUX2 db "distintas con n bits$"
    texJEA1AUX3 db "se pueden formar?-$"
    texJEA1AUXE db "                   Elija una opcion.$" 
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ENTRE ACTO 1 -- Acronimo: JEA = juego ENTRE ACTO, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------
    texJEA1OPA1 db " n$"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJEA1OPA2 db "6$"     
    texJEA1OPA8 db 0DCh, 24h
                                                            
    texJEA1OPB1 db " n$"     
    texJEA1OPB2 db "2$"
    texJEA1OPB8 db 0DCh, 24h

    texJEA1OPC1 db "  n$"     
    texJEA1OPC2 db "10$"
    texJEA1OPC8 db 0DCh, 24h    
;--------------------------------------------------------------------------------------------
;Texto JUEGO ENTRE ACTO 1BIS -- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texJEA1BIS0 db "Luego del estresante parcialito,$"
    texJEA1BIS1 db "Fabio enciende el proyector$"
    texJEA1BIS3 db "y comienza a dar la teoria del dia.$"
    texJEA1BIS4 db "Del cansancio de la caminata$"
    texJEA1BIS5 db "te quedas dormido.....$"
    texJEA1BISE db "Presione una tecla para continuar.$"

    ;Texto auxiliar
    texJEA1BISAUX  db "Te despertas desorientado...$"

    ;Texto auxiliar
    texJEA1BISAUX0 db "Un companiero te sacude el hombro$"
    texJEA1BISAUX1 db "y ni bien te despertas Fabio$"
    texJEA1BISAUX2 db "te mira fijamente a los ojos$"
    texJEA1BISAUX3 db "y pregunta....$"
    texJEA1BISAUX6 db "-Cuantas combinaciones binarias$"
    texJEA1BISAUX7 db "distintas con n bits$"
    texJEA1BISAUX8 db "se pueden formar?-$"
    texJEA1BISAUXE db "                   Elija una opcion.$" 
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ENTRE ACTO 1BIS -- Acronimo: JEA = juego ENTRE ACTO, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------
    texJEA1BISOPA1 db " n$"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJEA1BISOPA2 db "6$"     
    texJEA1BISOPA8 db 0DCh, 24h
                                                            
    texJEA1BISOPB1 db " 2$"     
    texJEA1BISOPB2 db "n$"
    texJEA1BISOPB8 db 0DCh, 24h

    texJEA1BISOPC1 db "  n$"     
    texJEA1BISOPC2 db "10$"
    texJEA1BISOPC8 db 0DCh, 24h       
;Texto consecuencias  -- Acronimo: CONEA = Condicion entre Acto, A"numero" = numero de acto
;OPCION[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------   
    texCONEA1A1     db "Ves como le pregunta a un companiero$"   
    texCONEA1A2     db "(sentado adelante)$"   
    texCONEA1A3     db "la clasica pregunta de SPD$"   
    texCONEA1A7     db "Luego da inicio al intervalo.$"   
    texCONEA1AE     db "Presione una tecla para continuar.$"
  
    texCONEA1B2     db "-#@%&!-$"             
    texCONEA1B3     db "-Bueno, estas medio flojo-$"
    texCONEA1B7     db "Luego da inicio al intervalo.$"
    texCONEA1BE     db "Presione una tecla para continuar.$"

    texCONE1C2     db "-Excelente, despues vemos$"   
    texCONE1C3     db "si promocionas-$"             
    texCONE1C7     db "Luego da inicio al intervalo.$"
    texCONE1CE     db "Presione una tecla para continuar.$"
;--------------------------------------------------------------------------------------------
;CODE SEGMENT
;--------------------------------------------------------------------------------------------
.code
;--------------------------------------------------------------------------------------------
;Funciones EXTERNAS
;--------------------------------------------------------------------------------------------
    extrn ESPERA:proc
;--------------------------------------------------------------------------------------------
;Programa principal
;--------------------------------------------------------------------------------------------     
    main proc
    ;Preparo los segmentos
        mov ax, @data
        mov ds, ax   
;--------------------------------------------------------------------------------------------
;Seteo del margenes principales
;--------------------------------------------------------------------------------------------
            call limpiaBuffer
            call dibCuadro  
;--------------------------------------------------------------------------------------------
;Dibujar LOGO
;--------------------------------------------------------------------------------------------
    ;Seteo dibujo
            push di                 ;profilaxis
            push bx
            xor bx,bx               ;Limpio bx
            mov dx, 23              ;cord y centramos el logo
            mov cx, 45              ;cord x
            mov di, 0               ;Inicializo el index
        dibujar:
            mov ah, 0ch             ;Int 10 dibujar pixel
            mov al, [dibujo+di]     ;Dibujo el primer color
            int 10h

            inc di                  ;Incrementamos para pasar al sig color
            inc cx                  ;avanzamos en el eje x
            xor ax,ax               ;Limpiamos AX
            mov al, datamul[bx]     ;movemos el primer valor del array para comparar el fin de linea    di: 0029 AX: 5600  
            cmp di, ax
            je incr
            jmp ultimoPix
        incr:                       ;En el caso de llegar al fin de linea, se incrementa el eje Y y se avanza al siguiente corte de linea
            inc dx
            inc bx
            mov cx, 45              ;Reiniciamos la posicion del eje X para el comienzo de la linea nueva.
        ultimoPix:                 
            cmp di, 175             ;Posicion final de corte
            jne dibujar
            pop bx
            pop di
;--------------------------------------------------------------------------------------------
;Seteo de Texto Menu principal
;--------------------------------------------------------------------------------------------
            mov ah, 02h     ;Colocar Cursor
            mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
            mov dh, 50      ;Fila
            mov dl, 00      ;Columna
            int 10h
    ;Seteamos el primer renglon            
            mov ah, 02h     ;Colocar Cursor
            mov dh, 03      ;Fila
            mov dl, 8      ;Columna
            int 10h

            lea dx, texto1 
            mov ah, 09h
            int 21h
    ;Seteamos el cuarto renglon
            
            mov ah, 02h     ;Colocar Cursor
            mov dh, 10      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto4  
            mov ah, 09h
            int 21h

    ;Seteamos el quinto renglon
            
            mov ah, 02h     ;Colocar Cursor
            mov dh, 10      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, textoEnter  
            mov ah, 09h
            int 21h
    ;Seteamos el sexto renglon
            
            mov ah, 02h     ;Colocar Cursor
            mov dh, 14      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto6  
            mov ah, 09h
            int 21h
    ;Seteamos el septimo renglon
            
            mov ah, 02h     ;Colocar Cursor
            mov dh, 17      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto7  
            mov ah, 09h
            int 21h

    ;Seteamos el octavo renglon
            mov ah, 02h     ;Colocar Cursor
            mov dh, 19      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto8  
            mov ah, 09h
            int 21h
    ;Seteamos el noveno renglon
            mov ah, 02h     ;Colocar Cursor
            mov dh, 21      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, textoE  
            mov ah, 09h
            int 21h

            xor ax, ax
            mov ah, 1       ;2
            call ESPERA

            call limpiaTeclado
            call pausa
            call limpiaTeclado
;--------------------------------------------------------------------------------------------
;Instrucciones
;--------------------------------------------------------------------------------------------
        rend:
            call limpiaBuffer
            call dibCuadro
    ;Seteo el texo de las instrucciones
                mov ah, 02h             ;Colocar Cursor
                mov bh, 00              ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50              ;Fila
                mov dl, 00              ;Columna
                int 10h
        ;Seteamos el primer renglon            
                mov ah, 02h             ;Colocar Cursor
                mov dh, 03              ;Fila
                mov dl, 6               ;Columna
                int 10h

                lea dx, textoINS0       
                mov ah, 09h
                int 21h
        ;Seteamos el segundo renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 04              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS1       
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 05              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS2       
                mov ah, 09h
                int 21h
        ;Seteamos el cuarto renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 06              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS3       
                mov ah, 09h
                int 21h
        ;Seteamos el quinto renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 07              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS4       
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 08              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS5       
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 09              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS6       
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h             ;Colocar Cursor
                mov dh, 12              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS7       
                mov ah, 09h
                int 21h        

        ;Seteamos el octavo renglon 
                mov ah, 02h             ;Colocar Cursor
                mov dh, 14              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS8       
                mov ah, 09h
                int 21h

                push bx
                push cx
                push dx

                xor cx,cx
                xor bx,bx
                mov cl, 7
        ;Carga de nombre
            carga:
                mov ah, 1
                int 21h
                mov dl, al
                cmp al, 0dh             ; Detecto si un nombre es vacio
                je estaVacio
                cmp al, 20h             ; Detecto el uso de espacio, no permitido
                je reinicio
                cmp al, 08h             ; Detecto que tipeó backspace
                je irParaAtras
                mov nombre[bx], al
                inc bx
                loop carga 
                jmp finCarga
            estaVacio:
                cmp bx,0
                je cargaDeCero
                jmp finCarga
            irParaAtras:
                mov dl,20h              ; como el cursor retrocedió, imprimo un espacio sobre la letra que estaba
                mov ah,2
                int 21h

                mov dl,08h              ; Imprimo un "backspace" para que vuelva de nuevo para atrás el crusor
                mov ah,2
                int 21h
            
                cmp bx,0                ; me fijo si el índice está en la posición 0
                je cargaDeCero          ; Si está en la 0, reinicio la posicion
                mov nombre[bx], 24h     ; Pisamos el valor
                dec bx                  ; Decrementamos para no romper la variable nombre
                mov nombre[bx], 24h     ; y volvemos a pisar
                inc cx                  ; incrementamos cx para recuperar el loop
                jmp carga
            cargaDeCero:
                mov ah, 02h     
                mov dh, 14      
                mov dl, 13      
                int 10h
                jmp carga
            reinicio:
                pisar:
                    mov nombre[bx], 24h
                    inc bx
                    loop pisar
                jmp rend
            finCarga:
                 
        ;Seteamos el octavo renglon
                mov ah, 02h     
                mov dh, 16      
                mov dl, 06      
                int 10h

                lea dx, textoINS9  ;Pregunta si guardar el nombre
                mov ah, 09h
                int 21h

            ;Verificamos si desea guardar.
            preguntar:    
                mov ah, 1
                int 21h
                cmp al, "Y"
                je guarda
                cmp al, "y"
                je guarda
                cmp al, "N"
                je noGuarda
                cmp al, "n"
                je noGuarda
                cmp al, 08h
                je preguntar
            ;Evitamos que aparezca la letra ingresada
                mov dl,08h     
                mov ah,2
                int 21h

                mov dl,20h
                mov ah,2
                int 21h

            ;Para evitar romper el cuadro, reiniciamos la posicion
                mov ah, 0ch
                mov ah, 02h     
                mov dh, 16      
                mov dl, 24      
                int 10h

                jmp preguntar
            noGuarda:                               ;Si no guarda, renderiza de nuevo y limpia la variable nombre.
                xor bx, bx
                xor cx, cx
                mov cx, 7
                pisa:
                    mov nombre[bx], 24h
                    inc bx
                    loop pisa
                jmp rend
            guarda:

        ;Seteamos el noveno renglon
                mov ah, 02h     
                mov dh, 16      
                mov dl, 03      
                int 10h

                lea dx, textoINSE  ;Carga direccion nombre
                mov ah, 09h
                int 21h
          
                pop dx
                pop cx
                pop bx
     
                call limpiaTeclado
                call pausa
                call limpiaTeclado
;--------------------------------------------------------------------------------------------
;PROLOGO
;--------------------------------------------------------------------------------------------
    ;Limpio la buffers
            call limpiaBuffer
            call limpiaTeclado
    ;Seteo cuadro de texto
            call dibCuadroCentrado
    ;Seteo de texto.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocupa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog0  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog1 
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog2  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog3  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog4  
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog5  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog6  
                mov ah, 09h
                int 21h

        ;Seteamos el octavo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 09      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog7  
                mov ah, 09h
                int 21h
        ;Seteamos el noveno renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 10      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog8  
                mov ah, 09h
                int 21h
        ;Seteamos el decimo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 11      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog9  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 2       ;2
                call ESPERA

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, progE  
                mov ah, 09h
                int 21h
     
            call limpiaTeclado
            call pausa
            call limpiaTeclado
;--------------------------------------------------------------------------------------------
;ACTO 0
;--------------------------------------------------------------------------------------------
    ;Seteo Cuadro Texto(TAMAÑO MEDIANO)
            call limpiaBuffer
            call limpiaTeclado
            call dibCuadroTexto
    ;Seteo de texto.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA00  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA01  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA02  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA03  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA04  
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA05  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA06  
                mov ah, 09h
                int 21h

        ;Seteamos el octavo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 09      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA07  
                mov ah, 09h
                int 21h
        ;Seteamos el noveno renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 10      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA08  
                mov ah, 09h
                int 21h
        ;Seteamos el decimo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 11      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA0A  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA0E  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA0OPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el septimo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJA0OPA8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
            call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 15      ;Columna
                int 10h

                lea dx, texJA0OPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el octavo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 15+5      ;Columna
                 int 10h

                 lea dx, texJA0OPB8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;Seteo del margenes cuadro opcion der
            call opcionDER
    ;Seteo de opciones C.
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

        ;Seteamos el primer renglon

                 mov dh, 16      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC1  
                 mov ah, 09h
                 int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC5  
                 mov ah, 09h
                 int 21h        

        ;Seteamos el sexto renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC6  
                 mov ah, 09h
                 int 21h
        
        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 28+5      ;Columna
                 int 10h

                 lea dx, texJA0OPC8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;LLamo a la interaccion el mouse
                 call mouse
    ;Recupero la opcion elegida
                 mov decision, bl
    ;Compra la eleccion
                cmp bl, 1
                je opcionA
                cmp bl, 3                                                                         ;............................................
                je opcionBFIX                   ;SALTO CONDICIONAL MAYOR A 128 bytes
                cmp bl, 2
                je opcionCFIX                   ;SALTO CONDICIONAL MAYOR A 128 bytes

        opcionBFIX:
                    jmp NEAR ptr opcionB
        opcionCFIX:
                    jmp NEAR ptr opcionC
        opcionA:
                 call limpiaBuffer
                 call limpiaTeclado
                 call cuadroConsecuenciaMag
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

            ;Seteamos el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A1  
                 mov ah, 09h
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el nombre en el tercer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 10     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, nombre  
                 mov ah, 09h
                 int 21h
                 mov ah, 02
                 mov dl, ":"
                 int 21h

            ;Seteamos el cuarto renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 11     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A4  
                 mov ah, 09h
                 int 21h

            ;Seteamos el quinto renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 12     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A5  
                 mov ah, 09h
                 int 21h

            ;Seteamos el sexto renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 13      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A6 
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon    
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 14      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0A7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA
                 
            ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONA0AE  
                 mov ah, 09h
                 int 21h

                 jmp finActo0

        opcionB:
                call limpiaBuffer
                call limpiaTeclado
                call cuadroConsecuenciaCyan
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h
                
            ;Seteamos el primer renglon
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B1  
                 mov ah, 09h
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 10      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el cuarto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 11      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B4  
                 mov ah, 09h
                 int 21h

            ;Seteamos el quinto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 12      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B5 
                 mov ah, 09h
                 int 21h

            ;Seteamos el sexto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 13      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B6  
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 14      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B7 
                 mov ah, 09h
                 int 21h

            ;Seteamos el octavo renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 15      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0B8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el noveno renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0BE  
                 mov ah, 09h
                 int 21h
            ;Seteamo las banderas del evento
                 mov tomoAgua, 1
                 mov cansancio, 1

                 jmp finActo0

        opcionC:
                call limpiaBuffer
                call limpiaTeclado
                call cuadroConsecuenciaNormal
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h
                
            ;Seteamos el nombre en el primer renglon
                 mov dh, 6      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, nombre  
                 mov ah, 09h
                 int 21h
                 mov ah, 02
                 mov dl, ":"
                 int 21h

            ;Seteamos el segundo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 7      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el scuarto renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C4  
                 mov ah, 09h
                 int 21h

            ;Seteamos el quinto renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 10      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C5  
                 mov ah, 09h
                 int 21h

            ;Seteamos el sexto renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 11      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C6  
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 12      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C7  
                 mov ah, 09h
                 int 21h

            ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 13      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C8  
                 mov ah, 09h
                 int 21h

            ;Seteamos el noveno renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 14      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0C9  
                 mov ah, 09h
                 int 21h

            ;Seteamos el decimo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 15      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0CA  
                 mov ah, 09h
                 int 21h

            ;Seteamos el onceavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 16      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0CB  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el doceavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA0CE  
                 mov ah, 09h
                 int 21h

            ;Seteamo las banderas del evento
                 mov cansancio, 1

    finActo0:
        call limpiaTeclado
        call pausa    ;PAUSA
        call limpiaTeclado
;--------------------------------------------------------------------------------------------
;Entre-acto
;--------------------------------------------------------------------------------------------
                call limpiaBuffer
                cmp decision, 1
                je  entreActo0
                jmp finEntreActo0
        entreActo0:
                call dibCuadroTexto
    ;Seteo de texto.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA00  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon 
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA01  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA0E  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA0OPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJEA0OPA2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJEA0OPA3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJEA0OPA4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJEA0OPA5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJEA0OPA6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el octavo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJEA0OPA8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
            call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 15      ;Columna
                int 10h

                lea dx, texJEA0OPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJEA0OPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJEA0OPB3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJEA0OPB4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJEA0OPB5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJEA0OPB6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el septimo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 15+5      ;Columna
                 int 10h

                 lea dx, texJEA0OPB8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;Seteo del margenes cuadro opcion der
            call opcionDER
    ;Seteo de opciones C.
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

        ;Seteamos el primer renglon

                 mov dh, 16      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJEA0OPC1  
                 mov ah, 09h
                 int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJEA0OPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJEA0OPC3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJEA0OPC4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 20      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJEA0OPC5  
                 mov ah, 09h
                 int 21h

        ;Seteamos el septimo renglon     
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 28+5      ;Columna
                 int 10h

                 lea dx, texJEA0OPC8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;LLamo a la interaccion el mouse
                 call mouse
    ;Compra la eleccion
                cmp bl, 1
                je finEntreActo0
                cmp bl, 2                                                                         
                je opcionEA0                   
                cmp bl, 3
                je opcionEA0         
        opcionEA0:
                mov asientoParticular, 1
        finEntreActo0:
;-------------------------------------------------------------------------------------------
;ACTO 1
;--------------------------------------------------------------------------------------------
    ;Seteo Cuadro Texto(TAMAÑO MEDIANO)
                call limpiaBuffer
                call limpiaTeclado
                call dibCuadroTexto

    ;Seteo de texto.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA10  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA11  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA12  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA13  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA14  
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA15  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA16  
                mov ah, 09h
                int 21h

        ;Seteamos el noveno renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 10      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA18  
                mov ah, 09h
                int 21h
        ;Seteamos el decimo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 11      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA19  
                mov ah, 09h
                int 21h
        ;Seteamos el onceavo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 12      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA1A  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA1E  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 17      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA1OPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA1OPA2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA1OPA3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJA1OPA8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
                call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 17      ;Fila
                mov dl, 15      ;Columna
                int 10h

                lea dx, texJA1OPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA1OPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA1OPB3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 20      ;Columna
                 int 10h

                 lea dx, texJA1OPB8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion der
                call opcionDER            
    ;Seteo de opciones C.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 17      ;Fila
                mov dl, 28      ;Columna
                int 10h

                lea dx, texJA1OPC1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 19      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA1OPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 21      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA1OPC3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 33      ;Columna
                 int 10h

                 lea dx, texJA1OPC8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;LLamo a la interaccion el mouse
                 call mouse
    ;Recupero la opcion elegida
                 mov decision, bl
    ;Compra la eleccion
                cmp bl, 1
                je opcionCORR
                cmp bl, 2                                                                         ;............................................
                je opcionINC                  ;SALTO CONDICIONAL A 128 bytes
                cmp bl, 3
                je opcionINC                   ;SALTO CONDICIONAL A 128 bytes
        opcionCORR:
                 call limpiaBuffer
                 call cuadroConsecuenciaCyan
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

            ;Seteamos el nombre en el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, nombre  
                 mov ah, 09h
                 int 21h
                 mov ah, 02
                 mov dl, ":"
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1A2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 10     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1A3  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONA1AE  
                 mov ah, 09h
                 int 21h
            
                 call limpiaTeclado
                 call pausa
                 call limpiaTeclado

                 jmp finActoAUX0

        opcionINC:
                call limpiaBuffer
                call cuadroConsecuenciaCyan
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h
                
            ;Seteamos el nombre en el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, nombre  
                 mov ah, 09h
                 int 21h
                 mov ah, 02
                 mov dl, ":"
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1B2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 10      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1B3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el cuarto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 11      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1B4  
                 mov ah, 09h
                 int 21h

            ;Seteamos el quinto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 12      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1B5 
                 mov ah, 09h
                 int 21h

            ;Seteamos el nombre en el sexto renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 13      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, nombre  
                 mov ah, 09h
                 int 21h
                 mov ah, 02
                 mov dl, ":"
                 int 21h

            ;Seteamos el septimo renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 14      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1B7 
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el noveno renglon           
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONA1BE  
                 mov ah, 09h
                 int 21h
            
                 call limpiaTeclado
                 call pausa
                 call limpiaTeclado

                 jmp finActoAUX1

        finActoAUX0:
                call limpiaBuffer
            ;Centro el texto y lo colorizo
                call dibuarCuadroVerde

            ;Limpiamos registros
                xor cx, cx
                xor ax, ax
                xor bx, bx
                xor di, di
            ;Imprimimos el mensaje  lentamente
                mov di, 08                      ;Comlumna
                mov ch, 10                      ;Fila
                mov si, offset texCONA1AUX0

            imprimirCaracter0:
                mov AH, 02h
                mov BH, 00h     ; Pagina (dejar en cero)
                mov DX, DI      ; columna
                mov DH, ch      ; fila
                int 10h
      
                lodsb          ; Carga el caracter apuntado por DS:SI
                cmp AL, '$'    ; Fin de string
                je  fin0       ; Para de imprimir

                ; Imprime el caracter cargado
                mov AH,09H
                mov BH, 0      ; Pagina (dejar en cero)
                mov bl, 02h    ; Color (verde)
                push cx
                xor cx, cx
                mov cx, 1      ; Caracter
                int 10h

                xor cx, cx
                pop cx

                inc di
            ;Esperamos antes de impimir el siguiente caracter
                xor ax, ax
                mov al, 08      ;2
                call ESPERA
                jmp imprimirCaracter0
            fin0:

                xor ax, ax
                mov ah, 3       ;2
                call ESPERA

                call limpiaBuffer  
                jmp finActo1

        finActoAUX1:
                call limpiaBuffer
            ;Centro el texto y lo colorizo
                call dibuarCuadroRojo
            ;Limpiamos registros
                xor cx, cx
                xor ax, ax
                xor bx, bx
                xor di, di
            ;Imprimimos el mensaje lentamente
                mov di, 08                      ;Comlumna
                mov ch, 10                      ;Fila
                mov si, offset texCONA1AUX1

            imprimirCaracter1:
                mov AH, 02h
                mov BH, 00h     ; Pagina (dejar en cero)
                mov DX, DI      ; columna
                mov DH, ch      ; fila
                int 10h
      
                lodsb          ; Carga el primer caracter apuntado por DS:SI
                cmp AL, '$'    ; fin de string
                je  fin1       

                ; Imprime el caracter cargado
                mov AH, 09H
                mov BH, 0      ; Pagina
                mov bl, 04h    ; Color (ROJO)
                push cx
                xor cx, cx
                mov cx, 1      ; Caracteres a imprimir
                int 10h

                xor cx, cx
                pop cx

                inc di
            ;Esperamos antes de impimir el siguiente caracter
                xor ax, ax
                mov ax, 08      ;2
                call ESPERA
                jmp imprimirCaracter1
            fin1:

                xor ax, ax
                mov ah, 3       ;2
                call ESPERA
                call limpiaBuffer  
        finActo1:
;--------------------------------------------------------------------------------------------
;Entre-acto 1
;--------------------------------------------------------------------------------------------
    ;Limpiamos buffers                
                call limpiaBuffer
                call limpiaTeclado
    ;Verificamos banderas
                cmp asientoParticular, 1
                je finEntreActo1FIX
                cmp cansancio, 1
                je  continuar
                jmp NEAR ptr noCansado

                finEntreActo1FIX:
                    jmp NEAR ptr epilogoEntreActo1

                continuar:
                call dibCuadroCentrado

    ;Seteo de texto interludio.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h
        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BIS0  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BIS1  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BIS3  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BIS4  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BIS5  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 2       ;2
                call ESPERA

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISE  
                mov ah, 09h
                int 21h

                call limpiaTeclado
                call pausa
                call limpiaTeclado
    ;Texto color
                call limpiaBuffer
                call dibuarCuadroGris
    ;Limpiamos registros
                xor cx, cx
                xor ax, ax
                xor bx, bx
                xor di, di
    ;Imprimimos el mensaje lentamente
                mov di, 08                      ;Comlumna
                mov ch, 10                      ;Fila
                mov si, offset texJEA1BISAUX

        imprimirCaracter2:
                mov AH, 02h
                mov BH, 00h     ; Pagina (dejar en cero)
                mov DX, DI      ; columna
                mov DH, ch      ; fila
                int 10h
      
                lodsb          ; Carga el primer caracter apuntado por DS:SI
                cmp AL, '$'    ; fin de string
                je  fin2       

            ; Imprime el caracter cargado
                mov AH,09H
                mov BH, 0      ; Pagina
                mov bl, 07h    ; Color (ROJO)
                push cx
                xor cx, cx
                mov cx, 1      ; Caracteres a imprimir
                int 10h

                xor cx, cx
                pop cx

                inc di
            ;Esperamos antes de impimir el siguiente caracter
                xor ax, ax
                mov ax, 08      ;2
                call ESPERA
                jmp imprimirCaracter2
            fin2:

                xor ax, ax
                mov ah, 3       ;2
                call ESPERA
    ;Seteo de texto interactivo.
        ;Limpiamos buffers                
                call limpiaBuffer
                call limpiaTeclado
                call dibCuadroTexto

                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX0  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX1  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX2  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX3  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                mov dx, offset fabio
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX6  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX7  
                mov ah, 09h
                int 21h

        ;Seteamos el octavo renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 09      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUX8  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1BISAUXE  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16+2      ;Fila
                mov dl, 02+4      ;Columna
                int 10h

                lea dx, texJEA1BISOPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 02+4      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPA2  
                 mov ah, 09h
                 int 21h
        ;Seteamos el octavotexJEA1BISOPB1 renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPA8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
            call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16+2      ;Fila
                mov dl, 15+4      ;Columna
                int 10h

                lea dx, texJEA1BISOPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 15+4      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 15+5      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPB8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;Seteo del margenes cuadro opcion der
            call opcionDER
    ;Seteo de opciones C.
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

        ;Seteamos el primer renglon

                 mov dh, 16+2      ;Fila
                 mov dl, 28+3      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPC1  
                 mov ah, 09h
                 int 21h

        ;Seteamos el segundo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 28+3      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 28+5      ;Columna
                 int 10h

                 lea dx, texJEA1BISOPC8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;LLamo a la interaccion el mouse
                 call mouse
                 mov fallarPreFabio, 1    
                 jmp NEAR ptr opcionEA1INC

        noCansado:
                call dibCuadroCentrado
    ;Seteo de texto interludio.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h
        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA10  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA11  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA12  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA13  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA14  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                mov ah, 02h     ;Colocar Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA15  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 2       ;2
                call ESPERA

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1E  
                mov ah, 09h
                int 21h

                call limpiaTeclado
                call pausa
                call limpiaTeclado
    ;Seteo de texto interactivo.
        ;Limpiamos buffers                
                call limpiaBuffer
                call limpiaTeclado
                call dibCuadroTexto

                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, fabio  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1AUX1  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1AUX2  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocar Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1AUX3  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJEA1AUXE  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16+2      ;Fila
                mov dl, 02+4      ;Columna
                int 10h

                lea dx, texJEA1OPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 02+4      ;Columna
                 int 10h

                 lea dx, texJEA1OPA2  
                 mov ah, 09h
                 int 21h
        ;Seteamos el octavotexJEA1BISOPB1 renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJEA1OPA8  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
            call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16+2      ;Fila
                mov dl, 15+4      ;Columna
                int 10h

                lea dx, texJEA1OPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 15+4      ;Columna
                 int 10h

                 lea dx, texJEA1OPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 15+5      ;Columna
                 int 10h

                 lea dx, texJEA1OPB8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA
    ;Seteo del margenes cuadro opcion der
            call opcionDER
    ;Seteo de opciones C.
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

        ;Seteamos el primer renglon

                 mov dh, 16+2      ;Fila
                 mov dl, 28+3      ;Columna
                 int 10h

                 lea dx, texJEA1OPC1  
                 mov ah, 09h
                 int 21h

        ;Seteamos el segundo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 17+2      ;Fila
                 mov dl, 28+3      ;Columna
                 int 10h

                 lea dx, texJEA1OPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el octavo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 23      ;Fila
                 mov dl, 28+5      ;Columna
                 int 10h

                 lea dx, texJEA1OPC8  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 call ESPERA

    ;LLamo a la interaccion el mouse
                 call mouse
    ;Recupero la opcion elegida
                 mov decision, bl
    ;Compra la eleccion
                cmp bl, 2                                                                         
                je opcionEA1CORR


        opcionEA1INC:
                 call limpiaBuffer
                 call limpiaTeclado
                 call cuadroConsecuenciaMag
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

            ;Seteamos el nombre en el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, fabio  
                 mov ah, 09h
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONEA1B2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 10     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONEA1B3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 16      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONEA1B7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el salida renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONEA1BE  
                 mov ah, 09h
                 int 21h
            
                 call limpiaTeclado
                 call pausa
                 call limpiaTeclado

                 jmp finEntreActo1

        opcionEA1CORR:
                 call limpiaBuffer
                 call limpiaTeclado
                 call cuadroConsecuenciaCyan
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

            ;Seteamos el nombre en el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, fabio  
                 mov ah, 09h
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONE1C2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 10     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONE1C3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 16      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONE1C7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el salida renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONE1CE  
                 mov ah, 09h
                 int 21h
            
                 call limpiaTeclado
                 call pausa
                 call limpiaTeclado

                 jmp finEntreActo1

        epilogoEntreActo1:
                 call limpiaBuffer
                 call limpiaTeclado
                 call cuadroConsecuenciaNormal
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

            ;Seteamos el nombre en el primer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 8      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONEA1A1  
                 mov ah, 09h
                 int 21h

            ;Seteamos el segundo renglon           
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 9      ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONEA1A2  
                 mov ah, 09h
                 int 21h

            ;Seteamos el tercer renglon
                 mov ah, 02h    ;Colocar Cursor
                 mov dh, 10     ;Fila
                 mov dl, 2      ;Columna
                 int 10h

                 lea dx, texCONEA1A3  
                 mov ah, 09h
                 int 21h

            ;Seteamos el septimo renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 16      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONEA1A7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 2       ;2
                 call ESPERA

            ;Seteamos el salida renglon
                 mov ah, 02h     ;Colocar Cursor
                 mov dh, 18      ;Fila
                 mov dl, 2     ;Columna
                 int 10h

                 lea dx, texCONEA1AE  
                 mov ah, 09h
                 int 21h

                 call limpiaTeclado
                 call pausa
                 call limpiaTeclado
        finEntreActo1:
;--------------------------------------------------------------------------------------------
;EPILOGO
;--------------------------------------------------------------------------------------------
    ;Limpiamos los buffers
            call limpiaBuffer
            call limpiaTeclado

    ;Limpiamos registros
            xor cx, cx
            xor ax, ax
            xor bx, bx
            xor di, di
    ;Imprimimos el mensaje final lentamente
            mov di, 24                      ;Comlumna
            mov ch, 22                      ;Fila
            mov si, offset contin

        imprimirCaracter:
            mov AH, 02h
            mov BH, 00h    ; Setea el numero de pag
            mov DX, DI     ; El numero de columna esta en la parte baja C O n
            mov DH, ch      ; El numero de fila esta en la parte alta del BYTE
            int 10h
  
            lodsb          ; Carga el caracter desde DS:SI y lo deja en AL e incrementa SI
            cmp AL, '$'    ; Compara si llego al final
            je  fin        

            ; Imprime el caracter cargado
            mov AH,09H
            mov BH, 0      ; Setea el numero de pagina
            mov bl, 0Bh    ; Color (cyan)
            push cx
            xor cx, cx
            mov cx, 1      ; Contador de caracteres
            int 10h

            xor cx, cx
            pop cx

            inc di
        ;Esperamos antes de impimir el siguiente caracter
            xor ax, ax
            mov ax, 15      ;2
            call ESPERA
            jmp imprimirCaracter
        fin:
        ;Pausa
            call limpiaTeclado
            call pausa
            call limpiaTeclado

        ;Limpiamos el buffer de video
            call limpiaBuffer
    ;Creditos
        xor cx, cx
        mov ax, @data
        mov es, ax
        xor ax, ax
        xor bx, bx
        xor ax, ax 

        mov     bp, offset chau             ; ES:BP apunta a texto
        mov     dx, 0808h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 18                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR             ; ES:BP apunta a texto
        mov     dx, 1008h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 22                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR2             ; ES:BP apunta a texto
        mov     dx, 1203h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 35                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR3             ; ES:BP apunta a texto
        mov     dx, 1404h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 34                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h

        call limpiaTeclado
        call pausa
        call limpiaBuffer
        call limpiaTeclado
    ;Finalizo el programa
        mov ax, 4c00h
        int 21h
main endp
;Activa una pausa.
    pausa proc NEAR
            mov ah, 10h         ;activa una pausa (EXTERNA)
            int 16h
            ret
    pausa endp
;Funcion que dibuja cuadro grande
    dibCuadro proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Eje X
                mov dx, 10      ;DX = Eje Y 320   64k
        ;Seteo margen izq
            dibY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibY

        ;Seteo ESTO DIBUJA LA ESQUINA inf izq
                mov cx, 10      ;Eje X
                mov dx, 190     ;Eje Y

        ;Seteo margen inferior
            dibX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibX

        ;Seteo VUELVO A LA ESQUINA sup izq
                mov cx, 10     ;Eje x
                mov dx, 10     ;Eje y

        ;Seteo margen Superior
            dibX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10     ;cord y
                
        ;Seteo margen derecho
            dibY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibY2

        ;Seteo margen, esquina sup der
                mov cx, 9       ;CX = Coord X
                mov dx, 9       ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibaY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 189     ;Posicion final
                jne dibaY

        ;Seteo ESQUINA inf izq
                mov cx, 9       ;cord X
                mov dx, 189     ;cord Y

        ;Seteo margen inferior
            dibaX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 309     ;Posicion 1
                jne dibaX

        ;Seteo SQUINA sup izq
                mov cx, 9       ;cord x
                mov dx, 9       ;cord y

        ;Seteo margen Superior
            dibaX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 309     ;Posicion 1
                jne dibaX2

        ;Seteo ESQUINA sup der
                mov cx, 309     ;cord x
                mov dx, 09      ;cord y
                
        ;Seteo margen derecho
            dibaY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion 1
                jne dibaY2
                ret
    dibCuadro endp
;Limpia la pantalla(CAUSA FLICKERING)
    limpiaBuffer proc NEAR 
            mov ah, 00h         ;Peticion para habilitar VGA
            mov al, 13h         ;320 x 200  VGA
            int 10h
            
            mov ah, 0bh         ;Paleta de colores 256
            mov bx, 0000h       ;Negro
            int 10h             ;Setea background
            ret
    limpiaBuffer endp
;Funcion que dibuja un cuadro de texto centrado en aclaraciones, no interactivo
    dibCuadroCentrado proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 10      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTCY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 115     ;Posicion final
                jne dibCTCY

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 115     ;cord Y

        ;Seteo margen inferior
            dibCTCX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTCX

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 10      ;cord y

        ;Seteo margen Superior
            dibCTCX2:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0003h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTCX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10      ;cord y
                
        ;Seteo margen derecho
            dibCTCY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 116     ;Posicion 1
                jne dibCTCY2
                ret
    dibCuadroCentrado endp    
;Funcion que dibuja un cuadro de texto mediano.
    dibCuadroTexto proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 10      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 115     ;Posicion final
                jne dibCTY

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 115     ;cord Y

        ;Seteo margen inferior
            dibCTX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTX

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 10      ;cord y

        ;Seteo margen Superior
            dibCTX2:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0005h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10      ;cord y
                
        ;Seteo margen derecho
            dibCTY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 116     ;Posicion 1
                jne dibCTY2
                ret
    dibCuadroTexto endp
;Funcion que grafica la opcion izquierda
    opcionIZQ proc NEAR
        ;Seteo margen, esquina sup izq
                    mov cx, 10      ;CX = Coord X
                    mov dx, 125      ;DX = Coord Y 320   64k
            ;Seteo margen izq
                dibOPY:
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h   ;Color MAGENTA
                    int 10h

                    inc dx          ;Incrementa por el eje y
                    cmp dx, 190     ;Posicion final
                    jne dibOPY

            ;Seteo esquina inf izq
                    mov cx, 10      ;cord X
                    mov dx, 190     ;cord Y

            ;Seteo margen inferior
                dibOPX:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;Color MAGENTA
                    int 10h

                    inc cx          ;Incrementa por el eje x
                    cmp cx, 106     ;Posicion 1
                    jne dibOPX

            ;Seteo VUELVO esquina sup izq
                    mov cx, 10     ;cord x
                    mov dx, 125     ;cord y

            ;Seteo margen Superior
                dibOPX2:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;color MAGENTA
                    int 10h

                    inc cx          ;Incrementa por el eje x
                    cmp cx, 106     ;Posicion 1
                    jne dibOPX2

            ;Seteo esquina sup der
                    mov cx, 106     ;cord x
                    mov dx, 125     ;cord y
                    
            ;Seteo margen derecho
                dibOPY2:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;Color MAGENTA
                    int 10h

                    inc dx          ;Incrementa por el eje y
                    cmp dx, 191     ;Posicion 1
                    jne dibOPY2
                    ret
    opcionIZQ endp
;Funcion que grafica la opcion central
    opcionCEN proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 112      ;CX = Coord X
                mov dx, 125      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibOPCY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibOPCY

        ;Seteo esquina inf izq
                mov cx, 112      ;cord X
                mov dx, 190     ;cord Y

        ;Seteo margen inferior
            dibOPCX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 208     ;Posicion 1
                jne dibOPCX

        ;Seteo esquina sup izq
                mov cx, 112     ;cord x
                mov dx, 125     ;cord y

        ;Seteo margen Superior
            dibOPCX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 208     ;Posicion 1
                jne dibOPCX2

        ;Seteo esquina sup der
                mov cx, 208     ;cord x
                mov dx, 125     ;cord y
                
        ;Seteo margen derecho
            dibOPCY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibOPCY2
                ret
    opcionCEN endp
;Funcion que grafica la opcion derecha
    opcionDER proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 214     ;CX = Coord X
                mov dx, 125      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibOPDY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibOPDY

        ;Seteo esquina inf izq
                mov cx, 214      ;cord X
                mov dx, 190     ;cord Y

        ;Seteo margen inferior
            dibOPDX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibOPDX

        ;Seteo esquina sup izq
                mov cx, 214     ;cord x
                mov dx, 125     ;cord y

        ;Seteo margen Superior
            dibOPDX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibOPDX2

        ;Seteo esquina sup der
                mov cx, 310     ;cord x
                mov dx, 125     ;cord y
                
        ;Seteo margen derecho
            dibOPDY2:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibOPDY2
                ret
    opcionDER endp 
;Funcion que controla el mouse, devuelve la opcion legida por medio de BL
    mouse proc NEAR
    mov ah,02h
    mov bh,00  ;seteo en la primera fila
    mov dl,79d ;seteo en la ultima columna
    mov dh,00h
    int 10h
    ;imprimimos el caracter de la X ahi 
    mov ah,02h
    mov dl,'X'
    int 21h
   
    ; Activamos el handler del mouse
    mov ax,00h
    int 33h
    ; lo hacemos visible e indicamos esta etiqueta que nos sera de utilidad
    consultar:

    mov ax,01h
    int 33h
    ; Con esta funcion obtenemos el clic con el que se hizo y las coordenadas en pixeles
    ; de donde anda el cursor
    mov ax,03h
    int 33h
    
    cmp bx,1    ; si se presiono clic izquierdo
    je izquierda ; ve a una etiqueta que se llama izquierda 
    cmp bx,2    ; si no compara ahora a ver si no es clic derecho
    jmp consultar   ; si si es vuelve a consultar porque solo se debe validar con clic izquierdo
    
     izquierda:
        ; el valor de las lineas horizontales se van del registro cx a ax para dividirlos
        ; primero posicionamos el cursor en pantalla en las coordenadas (0,79)
        mov ax,cx
        mov bl,8    ; en bl se guarda el valor dde 8 porque para hacer la conversion es necesario
        div bl      ; se conoce como mickey el valor obtenido
        mov coordX,al   ; cuardamos el valor de la division en coordX
        
        mov ax,dx       ; aplicamos el mismo proceso 
        mov bl,8
        div bl
        mov coordY,al   ; se guarda en coordY
        
        cmp coordY, 23  ; Ahora comprobamos que este en ese rango en este caso en la fila 23
        je comprobar_vertical_opcion1   ; si es correcto ve a comprobar que este en la vertical igual
        cmp coordY, 0 ; comparo la coordenada y con la fila 0
        je cierre
        jmp consultar


        ;etiqueta para cerrar con "X" (tiene un rango de 3 valores en el eje x)
    cierre:
            cmp coordX, 78
            je finPrograma
            cmp coordX, 77
            je finPrograma
            cmp coordX, 76
            je finPrograma
            jmp consultar
        
        ;etiquetas para clickear las opciones de las cajas (tiene un rango de 3 valores en el eje x)
    comprobar_vertical_opcion1:
            cmp coordX, 14  ; 4FH = 79D 
            je salidaIZQ
            cmp coordX, 15
            je salidaIZQ       ; si es verdad sale del programa
            cmp coordX, 16
            je salidaIZQ
    comprobar_vertical_opcion2:
            cmp coordX, 39
            je salidaCEN
            cmp coordX, 40
            je salidaCEN       
            cmp coordX, 41
            je salidaCEN
    comprobar_vertical_opcion3:
            cmp coordX, 65
            je salidaDER
            cmp coordX, 66
            je salidaDER       
            cmp coordX, 67
            je salidaDER
            jmp consultar
            
    salidaIZQ:
        mov bl, 1
        jmp finMouse
    salidaCEN:
        mov bl, 2
        jmp finMouse
    salidaDER:
        mov bl, 3
        jmp finMouse

    finPrograma:
    ;Limpiamos el buffer de video
        mov ah, 00h         ;Peticion para habilitar VGA
        mov al, 13h         ;320 x 200  VGA
        int 10h
            
        mov ah, 0bh         ;Paleta de colores 256
        mov bx, 0000h       ;Negro
        int 10h             ;Setea background

        xor cx, cx
        mov ax, @data
        mov es, ax
        xor ax, ax
        xor bx, bx
        xor ax, ax 

        mov     bp, offset chau             ; ES:BP apunta a texto
        mov     dx, 0808h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 18                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR             ; ES:BP apunta a texto
        mov     dx, 1008h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 22                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR2             ; ES:BP apunta a texto
        mov     dx, 1203h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 35                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

        mov     bp, offset copyR3             ; ES:BP apunta a texto
        mov     dx, 1404h                   ; DH=Fila 0, DL=Columna 0
        mov     cx, 34                      ; Largo del texto
        mov     bx, 000Bh                   ; BH=Display page 0, BL=Attribute RedOnBlack
        mov     ah, 13h                     ; AH=Function number 13h, AL=WriteMode 0
        int     10h 

    ;Limpiamos buffer teclado
        push ax
        xor ax, ax
    masC:
        mov  ah, 01h            ; Lee estado del teclado
        int  16h                ; int 16h
        jz   terminarLimpiar    ; Buffer vacio
        mov  ah, 00h            ; Lee el primer caracter en espera y lo limpia
        int  16h                ; int 16h
        jmp  masc               ; Vee si hay mas caracteres
    terminarLimpiar:
        pop  ax
    ;Pausa
        mov ah, 10h         ;activa una pausa (EXTERNA)
        int 16h

    ;Limpiamos el buffer de video
        mov ah, 00h         ;Peticion para habilitar VGA
        mov al, 13h         ;320 x 200  VGA
        int 10h
            
        mov ah, 0bh         ;Paleta de colores 256
        mov bx, 0000h       ;Negro
        int 10h

    ;Forzamos el cierre del programa
        mov ax, 4c00h
        int 21h
    finMouse:
    mov ax,02h
    int 33h
    ret
    mouse endp
;Funcion que dibuja recuadro CONSECUENCIA MALA(MAGENTA)
    cuadroConsecuenciaMag proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYM:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYM

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXM:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXM

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2M:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0005h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2M

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2M:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2M
                ret
    cuadroConsecuenciaMag endp
;Funcion que dibuja recuadro CONSECUENCIA BUENA(CYAN)
    cuadroConsecuenciaCyan proc NEAR

        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYC:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYC

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXC:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXC

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2C:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0003h    ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2C

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2C:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2C
                ret         
    cuadroConsecuenciaCyan endp
;Funcion que dibuja recuadro CONSECUENCIA NEUTRA(MEZZCLA)
    cuadroConsecuenciaNormal proc NEAR

        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYN:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYN

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXN:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXN

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2N:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0005h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2N

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2N:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2N
                ret
    cuadroConsecuenciaNormal endp
;Funcion que limpia el buffer del teclado y evita overflow de caracteres
    limpiaTeclado proc NEAR
            push ax
            xor ax, ax
            mas:
            mov  ah, 01h        ; Lee estado del teclado
            int  16h            ; int 16h
            jz   terminar       ; Buffer vacio
            mov  ah, 00h        ; Lee el primer caracter en espera y lo limpia
            int  16h            ; int 16h
            jmp  mas            ; Vee si hay mas caracteres
            terminar:
            pop  ax
            ret
    limpiaTeclado endp
;Funcion que dibuja un recuadro ROJO
    dibuarCuadroRojo proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYR:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0004h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYR

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXR:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0004h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXR

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2R:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0004h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2R

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2R:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0004h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2R
                ret
    dibuarCuadroRojo endp
;Funcion que dibuja un recuadro VERDE
    dibuarCuadroVerde proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYV:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0002h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYV

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXV:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0002h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXV

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2V:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0002h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2V

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2V:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0002h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2V
                ret
    dibuarCuadroVerde endp
;Funcion que dibuja un recuadro GRIS
    dibuarCuadroGris proc NEAR
                ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 45      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTYG:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0007h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 155     ;Posicion final
                jne dibCTYG

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 155     ;cord Y

        ;Seteo margen inferior
            dibCTXG:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0007h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTXG

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 45      ;cord y

        ;Seteo margen Superior
            dibCTX2G:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0007h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2G

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 45      ;cord y
                
        ;Seteo margen derecho
            dibCTY2G:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0007h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 156     ;Posicion 1
                jne dibCTY2G
                ret
    dibuarCuadroGris endp
;Funcion que imprime a color un texto con una pequeña pausa fixeada
    imprimirLento proc NEAR
    imprimirLento endp
end