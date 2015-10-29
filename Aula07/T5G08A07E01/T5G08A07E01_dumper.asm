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
DUMPER >


& /0000

;**************************** DUMPER() ***************************************;

DUMPER  $ /0001
        LD h0000 ;inicio
        MM DUMP_PT
loop    LD DUMP_PT
        - h0002
        - h0FFE
        JZ endDp
        LD hE300 ;carrega o tipo do dispositivo
        +  DUMP_UL ;soma com a UL do disp
        MM Dp_wr
        LD AmLoad
        +  DUMP_PT
        MM dp_rd
dp_rd   $  /0001
Dp_wr   $  /0001 ;PD /3UL
        LD DUMP_PT
        +  h0002
        MM DUMP_PT
        JP loop
endDp   RS DUMPER


# PACK

