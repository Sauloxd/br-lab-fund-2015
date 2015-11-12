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
hFFFC <
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

LOADER_BL_END <
LOADER_BL_TAM <
LOADER_BL_CS < 

LOADER >


& /0000

;**************************** LOADER() ***************************************;
LOADER $ /0001
          SC READ
          MM LOADER_INI
          SC READ
          MM LOADER_TAM
          *  h0002
          +  LOADER_INI
          MM LOADER_FINAL
          -  h0FFE ;verifica se cabe na memoria
          JN verifica
          LD hFFFE
          JP veryEnd

verifica      LD LOADER_TAM
              JZ endLD

lerBloco      SC READ
              MM LOADER_BL_END
              SC READ
              MM LOADER_BL_TAM

lerDadoBloco  LD LOADER_BL_TAM
              JZ verificaCS
              SC READ
              ; ACC -> data
              MM LOADER_DATA_TEMP
              + LOADER_BL_CS ;CHECKSUM
              MM LOADER_BL_CS
              LD AmDownload
              + LOADER_BL_END
              MM ld_carmem
              LD LOADER_DATA_TEMP
ld_carmem     $   /0001
              ;var de controle
              LD LOADER_BL_END
              + h0002
              MM LOADER_BL_END
              LD LOADER_BL_TAM
              - h0001
              MM LOADER_BL_TAM
              LD LOADER_TAM
              - h0001
              MM LOADER_TAM
              JP lerDadoBloco

verificaCS    SC READ
              - LOADER_BL_CS
              JZ okCS
              JP erroCS

okCS          JP verifica


erroCS        LD hFFFC
              JP veryEnd


endLD       LD LOADER_TAM
            JZ procFinal
            JP veryEnd

procFinal   SC READ
            JP veryEnd

veryEnd     RS LOADER

READ        $ /0001
            LD hD300
            +  LOADER_UL
             MM ld_ins0
ld_ins0     $ /0001 ;LEU primeira palavra : end inicial
            RS READ

# PACK

