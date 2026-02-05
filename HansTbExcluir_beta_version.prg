Function main()

set century on
set date to british
set color to bg+
clear

@ 1,0 say "-----------------------------------------------------------------"
@ 2,0 say "HansTbExcluir.exe - versao beta - 03/02/2026                     "
@ 3,0 say "Procura por notificacoes passiveis de exclusao no SINAN NET.     "
@ 4,0 say "https://github.com/Regional-Entorno-Sul/HansTbExcluir            "
@ 5,0 say "Regional de saude Entorno Sul                                    "
@ 6,0 say "Sintaxe do executavel: HansTbExcluir [--agravo] [/resultado]     "
@ 7,0 say "--hans --tb /andamento                                           "
@ 8,0 say "Ex: HansTbExcluir.exe --tb /andamento                            "
@ 9,0 say "-----------------------------------------------------------------"

cArg1 := alltrim( HB_ArgV( 1 ) )
cArg2 := alltrim( HB_ArgV( 2 ) )

if empty( cArg1 ) = .T.
set color to r+/
? "Erro!"
? "O argumento na linha de comando e obrigatorio. --hans ou --tb."
? "Fim do programa."
wait
set color to bg+/
quit
endif

if cArg1 <> "--hans" .and. cArg1 <> "--tb"
set color to r+/
? "Erro!"
? "Os argumentos validos na linha de comando sao: --hans ou --tb."
? "Fim do programa."
wait
set color to bg+/
quit
endif

if empty( cArg2 ) <> .T. .and. cArg2 <> "/andamento"
set color to r+/
? "Erro!"
? "O segundo argumento e opcional, mas se declarado, deve ser obrigatoriamente: /andamento."
? "Fim do programa."
wait
set color to bg+/
quit
endif

* Excluindo arquivos auxiliares remanescentes...
delete file "c:\HansTbExcluir\out\tb_forma_out.dbf"
delete file "c:\HansTbExcluir\run\tb\tubenet2.dbf"

if cArg1 = "--tb"
set color to w+/
@ 10,0 say "Argumento escolhido: --tb."
if empty( cArg2 ) = .F. .and. cArg2 = "/andamento"
@ 10,0 say "Argumentos escolhidos: --tb e /andamento."
endif

set color to g+/

if file("c:\HansTbExcluir\dbf\tb\tubenet.dbf") = .F.
set color to r+/
? "Erro!"
? "Arquivo 'tubenet.dbf' nao existe no diretorio \dbf\tb\."
? "Fim do programa."
wait
set color to bg+/
quit
else
copy file "c:\HansTbExcluir\dbf\tb\tubenet.dbf" to "c:\HansTbExcluir\run\tb\tubenet2.dbf"
endif

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 11,0 say "Procura por inconsistencias na baciloscopia diagnostica..."
do while .not. eof()
replace tp_not with "x" for bacilosc_e = "2" .or. bacilosc_e = "3" .or. empty( bacilosc_e ) = .T.
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nBacilo for tp_not = "x"
if nBacilo = 0
@ 12,0 say "0 registros com problemas."
close
else
set color to r+/
@ 12,0 say alltrim(str( nBacilo )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 13,0 say "Procura por inconsistencias no raio-x..."
do while .not. eof()
replace agravaids with "x" for raiox_tora = "3" .or. raiox_tora = "4" .or. empty( raiox_tora ) = .T.
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nRaioX for agravaids = "x"
if nRaioX = 0
@ 14,0 say "0 registros com problemas."
close
else
set color to r+/
@ 14,0 say alltrim(str( nRaioX )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 15,0 say "Procura por inconsistencias na histopatologia..."
do while .not. eof()

if cArg2 <> "/andamento"
replace agravalcoo with "x" for histopatol = "3" .or. histopatol = "5" .or. empty( histopatol ) = .T.
else
replace agravalcoo with "x" for histopatol = "3" .or. histopatol = "5" .or. histopatol = "4" .or. empty( histopatol ) = .T.
endif
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nHisto for agravalcoo = "x"
if nHisto = 0
@ 16,0 say "0 registros com problemas."
close
else
set color to r+/
@ 16,0 say alltrim(str( nHisto )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 17,0 say "Procura por inconsistencias no exame de cultura..."
do while .not. eof()

if cArg2 <> "/andamento"
replace agravdiabe with "x" for cultura_es = "2" .or. cultura_es = "4" .or. empty( cultura_es ) = .T.
else
replace agravdiabe with "x" for cultura_es = "2" .or. cultura_es = "4" .or. cultura_es = "3" .or. empty( cultura_es ) = .T.
endif
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nCult for agravdiabe = "x"
if nCult = 0
@ 18,0 say "0 registros com problemas."
close
else
set color to r+/
@ 18,0 say alltrim(str( nCult )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 19,0 say "Procura por inconsistencias no teste molecular..."
do while .not. eof()
replace agravdoenc with "x" for test_molec = "3" .or. test_molec = "4" .or. test_molec = "5" .or. empty( test_molec ) = .T.
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nTMR for agravdoenc = "x"
if nTMR = 0
@ 20,0 say "0 registros com problemas."
close
else
set color to r+/
@ 20,0 say alltrim(str( nTMR )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 21,0 say "Marcando os registros com problema..."
do while .not. eof()
replace agravoutra with "x" for tp_not = "x" .and. agravaids = "x" .and. agravalcoo = "x" .and. agravdiabe = "x" .and. agravdoenc = "x" 
enddo
close

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
set color to w+/
count to nExcluir for agravoutra = "x"
if nExcluir = 0
@ 22,0 say "0 registros com problemas."
close
else
set color to r+/
@ 22,0 say alltrim(str( nExcluir )) + " registros com problemas."
endif
close
set color to g+/

use "c:\HansTbExcluir\run\tb\tubenet2.dbf"
@ 23,0 say "Excluindo os registros sem problemas..."
delete for agravoutra <> "x"
pack

@ 24,0 say "Transferindo registros com problema para um arquivo menor..."
use "c:\HansTbExcluir\for\tb_forma.dbf"
zap
close
copy file "c:\HansTbExcluir\for\tb_forma.dbf" to "c:\HansTbExcluir\out\tb_forma_out.dbf"
use "c:\HansTbExcluir\out\tb_forma_out.dbf"
append from "c:\HansTbExcluir\run\tb\tubenet2.dbf"
close
set color to w+/
@ 25,0 say "Arquivo final disponivel na subpasta 'out'."
wait

endif

if cArg1 = "--hans"

use "c:\nindinet_full\nindi25.dbf"
do while .not. eof()

tokeninit(alltrim(nm_pacient), " ", 1)
do while .not. tokenend()
? tokennext(alltrim(nm_pacient))
enddo
tokenend()
? "--------------------------------"

skip
enddo

endif

return