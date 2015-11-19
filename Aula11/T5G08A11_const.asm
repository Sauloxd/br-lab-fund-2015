;***** constantes *****
h0000 >
h0001 >
h0002 >
h0003 >
h0004 >
h0005 >
h000A >
h0010 >
h0030 >
h0037 >
h003A >
h0041 >
h0047 >
h0100 >
h1000 >
hE300 >
hD300 >
hFF00 >
hFFFF >
hFFFC >
hFFFE >
h0FFE >
AmLoad >
AmDownload >
AmGD >

;***** EXECUTA ****
EX_END_INI >
EX_VERIFICA_PAR >

;***** variaveis para MonitorBatch() *****
;****by Manjubs
hbb >
hDASH >
hJB  >
hEND  >
hDU  >
hLO  >
hEOL  >
hEX   >
hCL   >
numPar >
wordDU >

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

;***** variaveis para PACK() *****
packA   >
packB   > 


;***** variaveis para UNPACK() *****
unpackA >
unpackB >
temp >

;***** variaveis para CHTOI() *****
chtoiA  >
chtoiB  >
chtoiWordA >
chtoiWordB >
chtoiWordC >
chtoiWordD >
varNumberOrLetter >

;***** variaveis para ITOCH() *****
RES1       >
RES2       >
A1         >
A2         >
B1         >
B2         >

& /0000
;***** constantes *****
h0000 K /0000
h0001 K /0001 
h0002 K /0002
h0003 K /0003
h0004 K /0004
h0005 K /0005
h000A K /000A
h0010 K /0010
h0030 K /0030
h0037 K /0037
h003A K /003A
h0041 K /0041
h0047 K /0047
h0100 K /0100
h1000 K /1000
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

;***** variaveis para MonitorBatch() *****
;****by Manjubs
hbb K  /2020 ;bb
hDASH K  /2F2f ;// 
hJB  K  /4A42 ;JB (maiúsculo!)
hEND  K  /2F2A ;/*
hDU  K  /4455 ;DU
hLO  K  /4C4F ;LO
hEOL K  /0D0A
hEX  K  /4558
hCL  k	/434C

numPar  $  /0001
wordDU  $ /0001

;***** variaveis para PACK() *****
packA $ /0001 ;entrada 1 de PACK   
packB $ /0001 ;entrada 2 de PACK        

;***** variaveis para UNPACK() *****
unpackA $ /0001
unpackB $ /0001
temp $ /0001

;***** variaveis para CHTOI() *****
chtoiA  $ /0001 ; /3132
chtoiB  $ /0001 ; /3334
varNumberOrLetter $ /0001

chtoiWordA $ /0001 ;/0031
chtoiWordB $ /0001 ;/0032
chtoiWordC $ /0001 ;/0033
chtoiWordD $ /0001 ;/0034
chtoiFINAL $ /0001

;***** variaveis para ITOCH() *****
  RES1       $ /0001
  RES2       $ /0001
  A1         $ /0001
  A2         $ /0001
  B1         $ /0001
  B2         $ /0001

;***** EXECUTA ****
  EX_END_INI $  /0001
  EX_VERIFICA_PAR K /0FFF

# VARIAVEIS