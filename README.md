# reconciliacao_de_dados.github.io
Este é um projeto de reconciliação de dados de vazão volumétrica de uma planta química industrial. 

A reconciliação de dados é necessária quando algum tipo de erro é detecado em um conjunto de dados. O objetivo da reconciliação de dados é - após a detecção e correção do erro - obter os valores reais do conjunto, ou seja, os valores dos dados sem o erro.

# Identificação e limpeza de outliers 6 sigma

Inicialmente, foi feita a limpeza de dados do DataFrame no próprio Excel, excluindo linhas em branco. Em seguida, foi avaliada a presença de outliers em cada variável – pelo desvio 6 σ – utilizando o software R. O comando do R para limpeza de variável está localizado abaixo: 

