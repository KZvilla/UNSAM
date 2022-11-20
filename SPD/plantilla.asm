;--------------------------------------------------------------------------------------------
;Texto JUEGO acto  -- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texA00 db "$"     ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texA01 db "$"
    texA02 db "$"                             
    texA03 db "$"
    texA04 db "$"
    texA05 db "$"
    texA06 db "$"
    texA07 db "$"
    texA08 db "$"
    texA09 db "$"
    texA0A db "$"
    texA0E db "                   Elija una opcion.$"                          ;Plantilla
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ACTO  -- Acronimo: JO = juego opciones, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------
    texJA0OPA1 db "$"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJA0OPA2 db "$"     
    texJA0OPA3 db "$"
    texJA0OPA4 db "$"
    texJA0OPA5 db "$"
    texJA0OPA6 db "$"
    texJA0OPA7 db "$"
    texJA0OPA8 db 0DCh, 24h

    texJA0OPB1 db "$"     
    texJA0OPB2 db "$"
    texJA0OPB3 db "$"
    texJA0OPB4 db "$"
    texJA0OPB5 db "$"
    texJA0OPB6 db "$"
    texJA0OPB7 db "$"
    texJA0OPB8 db 0DCh, 24h

    texJA0OPC1 db "$"     
    texJA0OPC2 db "$"
    texJA0OPC3 db "$"
    texJA0OPC4 db "$"
    texJA0OPC5 db "$"
    texJA0OPC6 db "$"
    texJA0OPC7 db "$"
    texJA0OPC8 db 0DCh, 24h
;--------------------------------------------------------------------------------------------
;Texto consecuencias  -- Acronimo: CONA = Condicion Acto, A"numero" = numero de acto
;OPCION[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------   
    texCONA0A1     db "$"
    texCONA0A2     db "$"   
    texCONA0A3     db "$"   
    texCONA0A4     db "$"   
    texCONA0A5     db "$"
    texCONA0A6     db "$"
    texCONA0A7     db "$"
    texCONA0A8     db "$"
    texCONA0A9     db "$"
    texCONA0AA     db "$"
    texCONA0AB     db "$"
    texCONA0AE     db "Presione una tecla para continuar.$"

    texCONA0B1     db "$"
    texCONA0B2     db "$"   
    texCONA0B3     db "$"             
    texCONA0B4     db "$"
    texCONA0B5     db "$"
    texCONA0B6     db "$"
    texCONA0B7     db "$"
    texCONA0B8     db "$"
    texCONA0B9     db "$"
    texCONA0BA     db "$"
    texCONA0BB     db "$"
    texCONA0BE     db "Presione una tecla para continuar.$"

    texCONA0C1     db "$"
    texCONA0C2     db "$"
    texCONA0C3     db "$"   
    texCONA0C4     db "$"   
    texCONA0C5     db "$"
    texCONA0C6     db "$"
    texCONA0C7     db "$"
    texCONA0C8     db "$"
    texCONA0C9     db "$"
    texCONA0CA     db "$"
    texCONA0CB     db "$"          
    texCONA0CE     db "Presione una tecla para continuar.$"