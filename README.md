# HansTbExcluir
Identifica notificações de Hanseníase e Tuberculose no SINAN NET passíveis de exclusão.  
O programa considera que notificações de TB (Tuberculose), não deveriam estar no banco de dados do SINAN NET por não se enquadrarem em nenhum critério conhecido para que o caso seja considerado confirmado, já que casos suspeitos, não devem ser notificados para esse agravo.  
Portanto, devem ser excluídas do banco de dados do SINAN NET, notificações de TB que:  
1-A baciloscopia diagnóstica seja negativa ou não realizada;  
2-Radiografia do tórax não realizada ou que seja positiva para outra patologia;  
3-Histopatologia não positiva para TB ou não realizada;  
4-Exame de cultura negativo ou não realizado;  
5-Teste molecular rápido (TMR-TB) não detectável, inconclusivo ou não realizado.  
Quando um arquivos de notificações de TB é gerado no SINAN NET e colocada na pasta apropriada do HansTbExcluir (dbf/tb), o programa identifica quais casos são compatíveis com os cinco critérios mostrados acima e o resultado é disponibilizado em uma planilha de extensão DBF na subpasta "out".

Sintaxe do executável:

~~~
HansTbExcluir.exe [--agravo] [/opção].


--agravo              Escolhe o agravo a ser processado. Podem ser dois: --tb e --hans.

/opção               A opção /andamento, inclui nos critérios histopatologia e cultura o item "em andamento" quando este for marcado na notificação do caso.
~~~





  
