; Coloque aqui seus imports
LOADER          <
LOADER_UL       <
DUMPER			<
DUMPER_UL   	<


 
		& 	/0000
MAIN	JP 	INI		; salta para o início do programa
UL		K 	/0000 	; parâmetro: UL onde está o arquivo de batch


INI		LD UL 		; coloque aqui o código do seu monitor batch
		SC READ
		MM dadoLeituraTemp
		- hDASH
		JZ INIOK1 ;redireciona para continuar se for um //.
		JP ERR01  ;processa erro de falta de início do JOB. Numerado de acordo com o enunciado.
				
INIOK1	SC READ
		MM dadoLeituraTemp
		- hCJB
		JZ LOOPRD
		JP ERR01  ;processa erro de falta de início do JOB. Numerado de acordo com o enunciado.
		
LOOPRD	SC READ		;PULAR LINHA
		SC READ		;ler próxima instrução
		MM dadoLeituraTemp
		- hEND	
		JZ FIMOK ; Se tiver o /*, sai com sucesso.
		LD dadoLeituraTemp
		-hDASH
		JZ COMMOK ;Comando não reconhecido. Não tem o //.
		JP ERR02
		
COMMOK	LD dadoLeituraTemp
		- hCDU
		JZ CALLDU ;Se for Dumper, chama o Dumper.
		LD dadoLeituraTemp
		- hCLO
		JZ CALLLO ;Se for Loader, chama o Loader.
		
		
		;Saulo, como faremos aqui para ver o final do arquivo?
	
CALLDU	SC PROCD
		JP LOOPRD ;CONTINUA O LOOP

CALLLO	SC PROCL
		JP LOOPRD ;CONTINUA O LOOP
		
		
PROCD  	$ /0001
		SC READ ;DESCARTA, é pular linha
		SC READ	;lê argumento do Dumper 1-Tamanho bloco
		SC VRFARG
		MM DUMP_BL
		SC READ ;RETIRA CARACTERES BRANCOS
		SC READ ;lê argumento do Dumper 2-End. Inicial
		SC VRFARG
		MM DUMP_INI
		SC READ ;RETIRA CARACTERES BRANCOS
		SC READ	;lê argumento do Dumper 3-Tamanho
		SC VRFARG
		MM DUMP_TAM
		SC READ ;RETIRA CARACTERES BRANCOS
		SC READ ;lê argumento do Dumper 4-Endereço Início Execução
		SC VRFARG
		MM DUMP_EXE
		SC READ ;RETIRA CARACTERES BRANCOS
		SC READ ;PULA LINHA		
		SC DUMPER
		RS PROCD
		
		
		
PROCL  	$ /0001
		SC READ ;DESCARTA, é pular linha
		SC READ	;lê argumento do Loader
		SC VRFARG
		MM LOADER_UL
		SC LOADER
		RS PROCL

;VERIFICA SE O QUE ESTÁ NO ARGUMENTO É UM ARGUMENTO
VRFARG	$ /0001	
		MM argVrfTemp
		- hBRAN
		JZ ERR03
		LD argVrfTemp
		- hDASH
		JZ ERR03
		LD argVrfTemp
		- hCJB
		JZ ERR03
		LD argVrfTemp
		- hEND
		JZ ERR03
		LD argVrfTemp
		- hCDU
		JZ ERR03
		LD argVrfTemp
		- hCLO
		JZ ERR03
		LD argVrfTemp
		RS VRFARG
		
		
ERR01	LD h0001
		OS /0EE						;TRATAMENTO ERRO01 - SEM INICIO JOB			
		JP FIM

ERR02	LD h0002
		OS /0EE						;TRATAMENTO ERRO02 - COMANDO DESCONHECIDO
		JP FIM

ERR03	LD h0003
		OS /0EE						;TRATAMENTO ERRO03 - SEM ARGUMENTO
		JP FIM

ERR04	LD h0004
		OS /0EE					;TRATAMENTO ERRO04 - SEM INDICADOR FINAL
		JP FIM

;-------


FIMOK	LD h0000
		OS /0EE
		JP FIM
	


	
FIM 	HM	FIM		; fim do programa


READ        $ /0001
            LD hD300
            +  LOADER_UL
             MM ld_ins0
ld_ins0     $ /0001 ;LEU primeira palavra : end inicial
            RS READ

# MAIN
