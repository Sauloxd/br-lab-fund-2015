;***** variaveis para PACK() *****
packA   <
packB   < 
PACK    <

;***** variaveis para UNPACK() *****
UNPACK  <
unpackA  <
unpackB  <

;***** variaveis para CHTOI() TODO extrair *****
CHTOI <
chtoiA  <
chtoiB  <

& /0000 ;ANTES ERA @ /0000. SUBSTITUÍDO POR & /0000 APÓS COMENTÁRIO EM AULA SOBRE BUG.

MAIN  JP  INICIO
  varChtoiA K 'FA
  varChtoiB K 'FA
  varChtoiAB $ /0001
;******INICIO DO PROGRAMA******
;Utilizaremos MEMCOPY para passar a string declarado no main para seu devido lugar
INICIO  LD  varChtoiA
        MM chtoiA
        LD  varChtoiB
        MM chtoiB
        SC  CHTOI
        MM varChtoiAB
FIM   HM  FIM


# MAIN  