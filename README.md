# reconciliacao_de_dados.github.io
Este é um projeto de reconciliação de dados de vazão volumétrica de uma planta química industrial. 

A reconciliação de dados é necessária quando algum tipo de erro é detecado em um conjunto de dados. O objetivo da reconciliação de dados é - após a detecção e correção do erro - obter os valores reais do conjunto, ou seja, os valores dos dados sem o erro.

# Identificação e limpeza de outliers 6 sigma

Inicialmente, foi feita a limpeza de dados do DataFrame no próprio Excel, excluindo linhas em branco. Em seguida, foi avaliada a presença de outliers em cada variável – pelo desvio 6 σ – utilizando o software R. O comando do R para limpeza de variável está localizado abaixo: 

![image](https://user-images.githubusercontent.com/81119854/124486313-d8a3cd80-dd83-11eb-85bb-8214c190f29d.png)

Repare que, ao compilar o comando para exibição dos outliers, o retorno no 'Console' foi 'numeric(0)'. A confirmação desse cálculo pode ser confirmada pelo gráfico abaixo, em que não há outliers, embora haja pontos próximos ao limite superior e sobre a reta do limite inferior.

![image](https://user-images.githubusercontent.com/81119854/124486764-4d770780-dd84-11eb-94bf-3242c54af358.png)

