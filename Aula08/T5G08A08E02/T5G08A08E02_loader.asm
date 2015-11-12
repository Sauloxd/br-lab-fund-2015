;***** constantes *****
h0000 <
h0001 <
h0002 <
h0100 <
hE300 <
hD300 <
hFF00 <
hFFFF <
hFFFE <
h0FFE <
AmLoad <
AmDownload <
h0003 <
;***** variaveis para LOADER() *****
LOADER_UL <
LOADER_INI <
LOADER_TAM <
LOADER_FINAL <
LOADER_DATA_TEMP <
LOADER >


& /0000

;**************************** LOADER() ***************************************;

LOADER  $ /0001
          SC READ
          MM LOADER_INI

          SC READ
          MM LOADER_TAM
          *  h0002
          +  LOADER_INI
          MM LOADER_FINAL
          -  h0FFE ;verifica se cabe na memoria
          JN cabeNaMemoria
          LD hFFFE
          JP endLD

cabeNaMemoria JZ endLD
              SC READ
              ; ACC -> data
              MM LOADER_DATA_TEMP
              LD AmDownload
              + LOADER_INI
              MM ld_carmem
              LD LOADER_DATA_TEMP
ld_carmem     $   /0001
              LD LOADER_INI
              + h0002
              MM LOADER_INI
              - LOADER_FINAL
              JP cabeNaMemoria

endLD   RS LOADER

READ $ /0001
      LD hD300
      +  LOADER_UL
      MM ld_ins0
ld_ins0   $ /0001 ;LEU primeira palavra : end inicial
     RS READ

# PACK

