;***** constantes *****
h0000 <
h0001 <
h0002 <
h0100 <
hE300 <
hFF00 <
hFFFF <
h0FFE <
AmLoad <
AmDownload <
h0003 <
;***** variaveis para DUMPER() *****
DUMP_INI  <
DUMP_TAM  <
DUMP_UL   <
DUMP_BL   <
DUMP_EXE  <
DUMP_PT   <
DUMP_LIM  <
DUMP_Count <
DUMP_CS <
DUMP_CTE <
DUMPER >

;***** variaveis para PRINTF() *****
PRINT_DISCO <
PRINT_UL <
PRINTF_ACC <


& /0000

;**************************** DUMPER() ***************************************;

DUMPER  $ /0001
        LD hE300
        MM PRINT_DISCO
        LD DUMP_UL
        MM PRINT_UL
        LD DUMP_BL
        MM DUMP_Count
        LD DUMP_INI ;inicio
        MM DUMP_PT
        LD DUMP_TAM  ;32 words
        * h0002 ; 64 endereços
        + DUMP_INI
        MM DUMP_LIM

        LV DUMP_INI
        SC PRINTF
        LV DUMP_TAM
        SC PRINTF

headerblock LV DUMP_PT
            SC PRINTF
            LD DUMP_TAM
            - DUMP_BL
            JN blocoincompleto1
            JP blococompleto1

blococompleto        LD DUMP_Count
        JZ fimDeUmBloco
        ;Imprime o que esta no acumulador, aqui eh a memoria
        LD DUMP_PT
        SC PRINTF
        ;  Atualiza CheckSUM
        + DUMP_CS
        MM DUMP_CS
        ;
        LD DUMP_PT
        +  h0002
        MM DUMP_PT
        LD DUMP_Count
        - h0001
        MM DUMP_Count
        LD DUMP_TAM
        - h0001
        MM DUMP_TAM
        JP blococompleto
endDp   RS DUMPER

fimDeUmBloco    LV DUMP_CS
                SC PRINTF
                LD DUMP_BL
                MM DUMP_Count
                JP headerblock

blocoincompleto LD DUMP_TAM
                JZ dumpfooter
                LD DUMP_PT
                SC PRINTF
                LD DUMP_PT
                +  h0002
                MM DUMP_PT
                LD DUMP_TAM
                - h0001
                MM DUMP_TAM
                JP blocoincompleto

dumpfooter      LV DUMP_CS
                SC PRINTF       
                LV DUMP_EXE
                SC PRINTF
                JP endDp

blocoincompleto1 LV DUMP_TAM
                 SC PRINTF
                JP blocoincompleto
                
blococompleto1  LV DUMP_BL
                SC PRINTF
                JP blococompleto

;**************************** PRINTF() ***************************************;



PRINTF $ /0001
        MM PRINTF_ACC
        LD PRINT_DISCO ;carrega o tipo do dispositivo
        +  PRINT_UL ;soma com a UL do disp
        MM pr_wr
        LD AmLoad
        +  PRINTF_ACC
        MM pr_rd
pr_rd   $  /0001
pr_wr   $  /0001 ;PD /3UL
endPrintF RS PRINTF

# PACK

