;***** constantes *****
h0000 >
h0001 >
h0002 >
h0003 >
h0004 >
h0100 >
hE300 >
hD300 >
hFF00 >
hFFFF >
hFFFC >
hFFFE >
h0FFE >
hBRAN >
hDASH >
hCJB  >
hEND  >
hCDU  >
hCLO  >
AmLoad >
AmDownload >
AmGD >


;***** variaveis para DUMPER() *****
DUMP_INI  >
DUMP_TAM  >
DUMP_UL   >
DUMP_BL   >
DUMP_EXE  >
DUMP_PT   >
DUMP_LIM  >
DUMP_Count >
DUMP_CS >
DUMP_CTE >
;***** variaveis para PRINTF() *****
PRINT_DISCO >
PRINT_UL >
PRINTF_ACC >

;***** variaveis para LOADER() *****
LOADER_UL >
LOADER_INI >
LOADER_TAM >
LOADER_FINAL >
LOADER_DATA_TEMP >

LOADER_BL_END >
LOADER_BL_TAM >
LOADER_BL_CS >

& /0000
;***** constantes *****
h0000 K /0000
h0001 K /0001 
h0002 K /0002
h0003 K /0003  
h0004 K /0004 
h0100 K /0100
hD300 K /D300  
hFF00 K /FF00
h0FFE K  /0FFE
AmLoad    K /8000
AmDownload k /9000
AmGD    K /D000
hE300 K /E300
hFFFF K  /FFFF
hFFFC K  /FFFC
hFFFE K  /FFFE
;****CONSTANTES PARA PROJETO
hBRAN K	 /2020
hDASH K  /2F2f ;// 
hCJB  K  /4A42 ;JB (maiúsculo!)
hEND  K  /2F2A ;/*
hCDU  K  /4455 ;DU
hCLO  K  /4C4F ;LO


;***** variaveis para DUMPER() *****
DUMP_INI  $ /0001
DUMP_TAM  $ /0001
DUMP_UL   $ /0001
DUMP_BL   $ /0001
DUMP_EXE  $ /0001
DUMP_PT   $ /0001
DUMP_LIM  $ /0001
DUMP_Count $ /0001
DUMP_CS   $ /0001
DUMP_CTE  $ /0001

;****VARIAVEIS PARA PROJETO
dadoLeituraTemp $	/0001


;***** variaveis para PRINTF() *****
PRINT_DISCO $ /0001
PRINT_UL $ /0001
PRINTF_ACC $ /0001

;***** variaveis para LOADER() *****
LOADER_UL $ /0001
LOADER_INI $ /0001
LOADER_TAM $ /0001
LOADER_FINAL $ /0001
LOADER_DATA_TEMP $ /0001

LOADER_BL_END $ /0001
LOADER_BL_TAM $ /0001
LOADER_BL_CS $ /0001
# VARIAVEIS