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
varDU <
wordDU <

h0001 <
h0002 <
h0003 <
h0004 <
h0005 <
hFFFF <

& 	/0000
MAIN	JP 	INI		; salta para o início do programa
UL		K 	/0000 	; parâmetro: UL onde está o arquivo de batch

INI		LD UL			   ;Carrega UL do batch a ser lido
      MM LOADER_UL ;Joga no parametro para dar READ
      ;INICIO
      SC READ      ;Chama READ
      -  hDASH     ;Verifica se é DASH
      JZ moveOn1
      JP Erro1     ;TRATAR ERRO1 - inicio de job
      ; //
moveOn1 SC READ
        - hJB
        JZ moveOn2
        JP Erro1
        ; JB          ;TODO POSSIVELMENTE TENHA QUE ADICIONAR JJ
moveOn2 SC READ       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
        ; EOL

lerProx       SC READ      ;Voltar a esse loop ao fim de um JOB
              -  hEND      ;Verifica se ja acabou
              JZ ApplyEND  ;Aplica fim
              +  hEND
              ;  /*
              -  hEOL      ;Verifica se há erro no fim de job
              JZ Erro4
              +  hEOL
              ;  CREL
              -  hDASH     ;Verifica se é DASH
              JZ contLerProx1
              JP Erro2     ;TRATAR ERRO1 - inicio de job
              ; //
contLerProx1  SC READ
              -  hLO
              JZ ApplyLOAD ;Tratar LOAD
              +  hLO
              -  hDU
              JZ ApplyDUMP ;Tratar DUMP
              JP Erro2     ;Não existe essa funcao



FIM 	HM	FIM		; fim do programa

;**** JOBS ****
ApplyLOAD SC READ       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
          ; EOL
          
          JP lerProx


;*** DUMP ***
ApplyDUMP SC READ       ;PULAR EOL -- :TODO devemos tratar quando tem algum mais de um caracter?
          ; EOL
          LD h0005
          MM varDU      ;Carrega numero de parametros, ira utilizar como contador
readParDU SC READ
          -  hEOL       ;Se for EOL, vai para bloco de comparação
          JZ endDU
          +  hEOL       
          ; Verificar parametros ;
          MM chtoiA
          SC READ
          MM chtoiB
          SC CHTOI
          MM wordDU
          JP verPar     ;verifica que parametro é esse

verPar    LD varDU
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
        SC READ      ;Descarta bb
        JP updateVarDU
parDU4  LD wordDU 
        MM DUMP_INI  ;Endereco inicial
        SC READ      ;Descarta bb
        JP updateVarDU
parDU3  LD wordDU
        MM DUMP_TAM  ;tamanho total da imagem
        SC READ      ;Descarta bb
        JP updateVarDU
parDU2  LD wordDU
        MM DUMP_EXE  ;End da primeira instr executavel
        SC READ      ;Descarta bb
        JP updateVarDU
parDU1  LD wordDU
        MM DUMP_UL   ;end da LU
        JP updateVarDU

updateVarDU LD varDU
            - h0001
            MM varDU
            JP readParDU

endDU   LD varDU
        JZ executaDU     ;EXECUTA apos receber os parametros
        JP Erro3       ;FINALIZOU COM ERRO NO NUMERO DE PARAMETROS LIDOS

executaDU SC DUMPER
          JP lerProx

;*** END OF JOBS ***
ApplyEND  LD hFFFF
          JP FIM




;**** ERROS ****
Erro1 LD h0001
      JP lerProx
Erro2 LD h0002
      JP lerProx
Erro3 LD h0003
      JP lerProx
Erro4 LD h0004
      JP lerProx

# MAIN
