library(readxl)
Recon <- read_excel("R/Recon.xlsx")
View(Recon)

## Recon é o dataframe com os dados a serem utilizados na solução


## Limpeza de dados 

# A limpeza das linhas em branco foi feita manualmente no excel
# A limpeza dos outlier será feita abaixo

## Para F1
sda <- sd(Recon$F1)
LI.6S <- mean(Recon$F1) - 3*sda
LS.6S <- mean(Recon$F1) + 3*sda

plot(Recon$F1, ylim = c(0,6000), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: F1 +- 3S")

abline(h=mean(Recon$F1),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers

Recon$F1[Recon$F1 < LI.6S]
Recon$F1[Recon$F1 > LS.6S]

## Para F2

sda <- sd(Recon$F2)
LI.6S <- mean(Recon$F2) - 3*sda
LS.6S <- mean(Recon$F2) + 3*sda

plot(Recon$F2, ylim = c(0,9000), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: F2 +- 3S")

abline(h=mean(Recon$F2),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers
Recon$F2[Recon$F2 < LI.6S]
Recon$F2[Recon$F2 > LS.6S]

## Para F1A

sda <- sd(Recon$F1A)
LI.6S <- mean(Recon$F1A) - 3*sda
LS.6S <- mean(Recon$F1A) + 3*sda

plot(Recon$F1A, ylim = c(0,1300), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: F1A +- 3S")

abline(h=mean(Recon$F1A),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers
Recon$F1A[Recon$F1A < LI.6S]
Recon$F1A[Recon$F1A > LS.6S]

## Para F3

sda <- sd(Recon$F3)
LI.6S <- mean(Recon$F3) - 3*sda
LS.6S <- mean(Recon$F3) + 3*sda

plot(Recon$F3, ylim = c(0,13000), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: F3 +- 3S")

abline(h=mean(Recon$F3),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers
Recon$F3[Recon$F3 < LI.6S]
Recon$F3[Recon$F3 > LS.6S]


# distância estatístia

Recon <- Recon[,-c(1,2)]

x <- Recon
y <- as.data.frame(mahalanobis(x, colMeans(x), cov(x)))
names(y)[1] = "Distancias"
y$Index = c(1:nrow(y))


alpha = 0.05
df <- ncol(x[,])
limite <- qchisq(1-alpha,df = df)
is_mv_outlier <- ifelse(y$Distancias > limite, "SIM", "NÃO")
x$Outliers <- is_mv_outlier
x = x[x$Outliers == "NÃO",]

x
summary(x)

x[5] = NULL

Recon <- x

## Gráfico boxplot

boxplot(Recon[3:6])

# O tipo boxplot não adiantou muito a encontrar a corrente com erro sistemático, os histogramas e os comportamentos das variáveis foram mais úteis (vide mais adiante)

## Histograma Frequência densidade da variável F1

hist(Recon$F1,freq= F,xlim = c(1000,4500),ylim = c(0,0.0015), col = 2,xlab = "Vazão (kg/h)", ylab = "Frequência",main = "Histrograma de F1")
kF1 <- seq(from=1000,to=4500,by=100)
densF1 <- dnorm(kF1,mean = mean(Recon$F1),sd=sd(Recon$F1))
lines(kF1,densF1,col=1,lwd=3)
abline(v=mean(Recon$F1),lty=2)

## Histograma da variável F2

hist(Recon$F2,freq= F, xlim = c(3000,5500), ylim = c(0,0.0015), col = 7,xlab = "Vazão (kg/h)",ylab = "Frequência", main = "Histograma de F2")
kF2 <- seq(from=3000,to=5500,by=100)
densF2 <- dnorm(kF2,mean = mean(Recon$F2),sd=sd(Recon$F2))
lines(kF2,densF2,col=3,lwd=3)
abline(v=mean(Recon$F2),lty=2)



# pode ser observado pelo histograma de F2 que não segue uma distribuição normal e os valores da vazão não são precisos.
# por isso, identifica-se F2 como sendo a corrente com erro sistemático
### para confirmar, foi construída a curva do comportamento de F2 (vazão em cada observação)

## Histograma da variável F1A

hist(Recon$F1A, freq = F,xlim = c(200,900),ylim = c(0,0.006), col = 5, xlab = "Vazão (kg/h)", ylab = "Frequência", main = "Histograma de F1A")
kF1A <- seq(from=200,to=900,by=20)
densF1A <- dnorm(kF1A,mean = mean(Recon$F1A),sd=sd(Recon$F1A))
lines(kF1A,densF1A,col=6,lwd=3)
abline(v=mean(Recon$F1A),lty=2)


## Histograma da variável F3

hist(Recon$F3,freq = F, xlim = c(3300,9500), ylim = c(0,0.0008), col=6, xlab = "Vazão (kg/h)",ylab = "Frequência", main = "Histograma de F3")
kF3 <- seq(from=3300,to=9500,by=100)
densF3 <- dnorm(kF3,mean = mean(Recon$F3),sd=sd(Recon$F3))
lines(kF3,densF3,col=1,lwd=3)
abline(v=mean(Recon$F3),lty=2)



## Comportamento da variável F1
plot(Recon$F1, ylim = c(0,6000) ,xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Comportamento de F1")

### Comportamento da variável F2
plot(Recon$F2, ylim = c(0,8000),xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Comportamento de F2")

## por essa curva, nota-se o erro sistemático e uma mudança (possível calibração do equipamento) por volta da observação 25000

## Comportamento da variável F1A
plot(Recon$F1A, ylim = c(0,1200) ,xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Comportamento de F1A")

## Comportamento da variável F3
plot(Recon$F3, ylim = c(1000,14000) ,xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Comportamento de F3")




#### Identificada a variável com erro sistemático, minimiza-se o erro quadrático de uma linha

## Instalar pracma e NlcOptim

install.packages("pracma")
install.packages("NlcOptim")

library("pracma")
library("NlcOptim")


## Função objetivo

install.packages("DataCombine")
library(DataCombine)

df <- DropNA(Recon)
iter <- nrow(df)

matrizresultados <- matrix(NA, nrow = iter, ncol = 4)

for (i in 1:24031) {
  
  erro_quadratico <- function(x){
    f1 = Recon$F1[i]
    f2 = Recon$F2[i]
    f1a = Recon$F1A[i]
    f3 = Recon$F3[i]
    obj = (f1 - x[1])^2 + (f2 - x[3])^2 + (f1a - x[2])^2 + (f3 - x[4])^2
    return(obj)
  }
  
  
  ## Restrição:
  
  ## Matriz dos coeficientes da restrição
  A = matrix(c(1, 1, 1, -1),
             ncol = 4)
  
  ## Resultado da soma dos valores A*X (matriz A vezes valores reconciliados) 
  b = c(0)
  
  x0 = c(2600,4400,500,6000)
  
  
  ## Minimização da função:
  resultado = fmincon(x0,
                      erro_quadratico,
                      method='SQP',
                      A = A,
                      b = b)
  
  #Resultado:
  matrizresultados[i,] = c(resultado$par)
  
  
}

View(matrizresultados)
