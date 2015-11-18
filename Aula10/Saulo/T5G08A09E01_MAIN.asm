; Coloque aqui seus imports
LOADER          <
LOADER_UL       <
DUMPER    < 
DUMP_INI  <
DUMP_TAM  <
DUMP_UL   <
DUMP_BL   <
DUMP_EXE  <
READ <
READfromACC <

;***** EXECUTA ****
EX_END_INI <
EX_VERIFICA_PAR <

;***** variaveis para CHTOI() *****
CHTOI <
chtoiA  <
chtoiB  <

;***** variaveis para ITOCH() *****
ITOCH <
RES1 <
RES2 < 
; CONSTANTS
;***** variaveis para MonitorBatch() *****
;****by Manjubs
hbb <
hDASH <
hJB  <
hEND  <
hDU  <
hLO  <
hEOL <
hEX  <
numPar <
wordDU <

h0000 <
h0001 <
h0002 <
h0003 <
h0004 <
h0005 <
hFFFF <

&   /0000
MAIN  JP  INI   ; salta para o início do programa
UL    K   /0000   ; parâmetro: UL onde está o arquivo de batch

INI   LD UL        ;Carrega UL do batch a ser lido
      MM LOADER_UL ;Joga no parametro para dar READ
      ;INICIO
      LD UL
      SC READfromACC      ;Chama READ
      -  hDASH     ;Verifica se é DASH
      JZ moveOn1
      JP Erro1     ;TRATAR ERRO1 - inicio de job
      ; //
moveOn1   LD UL
          SC READfromACC
        - hJB
        JZ moveOn2
        JP Erro1
        ; JB          ;TODO POSSIVELMENTE TENHA QUE ADICIONAR JJ
moveOn2   LD UL
          SC READfromACC       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
        ; EOL

lerProx       LD UL
              SC READfromACC      ;Voltar a esse loop ao fim de um JOB
              -  hEND      ;Verifica se ja acabou
              JZ ApplyEND  ;Aplica fim
              +  hEND
              -  hFFFF      ;Verifica se ja eh fim de arquivo
              JZ Erro4  ;Aplica fim
              +  hFFFF
              
              ;  /*
              -  hEOL      ;Verifica se há erro no fim de job
              JZ Erro4
              +  hEOL
              ;  CREL
              -  hDASH     ;Verifica se é DASH
              JZ contLerProx1
              JP Erro2     ;TRATAR ERRO1 - inicio de job
              ; //
contLerProx1  LD UL
              SC READfromACC
              -  hLO
              JZ ApplyLOAD ;Tratar LOAD
              +  hLO
              -  hDU
              JZ ApplyDUMP ;Tratar DUMP
              +  hDU
              -  hEX
              JZ ApplyEX   ;Tratar EX
              JP Erro2     ;Não existe essa funcao



FIM   HM  FIM   ; fim do programa

;**** JOBS ****
;**** EXECUTE ****
ApplyEX   LD UL
          SC READfromACC       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
          ; EOL
          LD h0001
          MM numPar 
readParEX LD UL
          SC READfromACC
          -  hEOL       ;Se for EOL, vai para bloco de comparação
          JZ verificaEX
          +  hEOL       
          ; Verificar parametros ;
          MM chtoiA
          LD UL
          SC READfromACC
          MM chtoiB
          SC CHTOI
          MM wordDU
          JP verParEX     ;verifica que parametro é esse

verParEX  LD numPar            
          - h0001
          JZ parEX1
          
parEX1    LD wordDU
          MM EX_END_INI
          SC updatenumPar
          JP readParEX

verificaEX LD numPar
           JZ executaEX     ;EXECUTA apos receber os parametros
           JP Erro3       ;FINALIZOU COM ERRO NO NUMERO DE PARAMETROS LIDOS

executaEX LD EX_END_INI
          -  EX_VERIFICA_PAR
          JN contEX
          JP Erro5
          
contEX    LD EX_END_INI 
          OS /00EF
          JP lerProx


;*** LOADER ****
ApplyLOAD LD UL
          SC READfromACC       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
          ; EOL
          LD h0001
          MM numPar 
readParLO LD UL
          SC READfromACC
          -  hEOL       ;Se for EOL, vai para bloco de comparação
          JZ verificaLO
          +  hEOL       
          ; Verificar parametros ;
          MM chtoiA
          LD UL
          SC READfromACC
          MM chtoiB
          SC CHTOI
          MM wordDU
          JP verParLO     ;verifica que parametro é esse

verParLO  LD numPar            
          - h0001
          JZ parLO1
          
parLO1    LD wordDU
          MM LOADER_UL
          SC updatenumPar
          JP readParLO

verificaLO LD numPar
           JZ executaLO     ;EXECUTA apos receber os parametros
           JP Erro3       ;FINALIZOU COM ERRO NO NUMERO DE PARAMETROS LIDOS

executaLO SC LOADER
          JP lerProx

;*** DUMP ***
ApplyDUMP LD UL
          SC READfromACC       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
          ; EOL
          LD h0005
          MM numPar      ;Carrega numero de parametros, ira utilizar como contador
readParDU LD UL
          SC READfromACC
          -  hEOL       ;Se for EOL, vai para bloco de comparação
          JZ verNumPar
          +  hEOL
          -  hbb       ;Se for EOL, vai para bloco de comparação
          JZ readParDU
          +  hbb       
          ; Verificar parametros ;
          MM chtoiA
          LD UL
          SC READfromACC
          MM chtoiB
          SC CHTOI
          MM wordDU
          JP verParDU     ;verifica que parametro é esse

verParDU  LD numPar
          -  h0005
          JZ parDU5
          + h0005
          - h0004
          JZ parDU4
          + h0004
          - h0003
          JZ parDU3
          + h0003
          - h0002
          JZ parDU2
          + h0002
          - h0001
          JZ parDU1

parDU5  LD wordDU
        MM DUMP_BL   ;Tamanho do bloco
        SC updatenumPar
        JP readParDU
parDU4  LD wordDU 
        MM DUMP_INI  ;Endereco inicial
        SC updatenumPar
        JP readParDU
parDU3  LD wordDU
        MM DUMP_TAM  ;tamanho total da imagem
        SC updatenumPar
        JP readParDU
parDU2  LD wordDU
        MM DUMP_EXE  ;End da primeira instr executavel
        SC updatenumPar
        JP readParDU
parDU1  LD wordDU
        MM DUMP_UL   ;end da LU
        SC updatenumPar
        JP readParDU

updatenumPar $ /0001
            LD numPar
            - h0001
            MM numPar
            RS updatenumPar

verNumPar   LD numPar
            JZ executaDU     ;EXECUTA apos receber os parametros
            JP Erro3       ;FINALIZOU COM ERRO NO NUMERO DE PARAMETROS LIDOS

executaDU SC DUMPER
          JP lerProx

;*** END OF JOBS ***
ApplyEND  LD h0000
          JP FIM




;**** ERROS ****
Erro1 LD h0001
      OS /00EE 
      JP FIM
Erro2 LD h0002
      OS /00EE 
      JP FIM
Erro3 LD h0003
      OS /00EE 
      JP FIM
Erro4 LD h0004
      OS /00EE
      JP FIM
Erro5 LD h0005
      OS /00EE
      JP FIM


# MAIN
