# definindo objeto como função:

fun <- function(a, b){
  return(a+b)
}

#consigo deixar 7 como default
fun <- function(a, b = 7){
  a + b
}

#----------------------------- VETORIZAÇÃO

nums <- 1:10
nums + 1

#----------------------------- RECICLAGEM

x <- c(1, 2)
y <- c(2, 3, 4, 5)
x + y

#----------------------------- 
#será convertido automaticamente:

c("a", 1, TRUE, T)
c(0.5, 1, TRUE, T)

sum(c(T,F,T,F,T))

#----------------------------- FACTORS

f <- factor(c("teste", "oi", "hello", "world"))
#R ordenou as string e atribuiu os indices
levels(f) 
#imprimindo na ordem dos indices

#----------------------------- MATRIZES E ARRAYS                                                                                                                                                          


vet <- c(1, 2, 3)
mat <- matrix(1:6, ncol = 3, nrow = 2)
arr <- array(1:12, dim = c(4,4,3))

#length() = qnt elementos
#dim() => dimensões
#nrow() => num linhas
#ncol() => num colunas

#----------------------------- MATRIZES E DATA FRAMES

df <- data.frame(x = 1:4, y = c("dd", "dd", "dd", "dd"), z = 4, stringsAsFactors = F)
#stringsAsFactors = F -- para retornar strings como caracteres, se n retornará strings como factors no str()
df2 <- data.frame(xx = 5:8, yy = c("ff", "ff", "ff", "ff"), zz = 200, stringsAsFactors = F)
df
str(df) #retornando a estrutura

names(df)

rbind(df, df2)
cbind(df, df2)

#----------------------------- SUBSETTING

x <- c(13, 8, 5, 2, 1, 1)
x[c(1,2,3)] # quero o que esté nos índices 1, 2, 3 

order(x) #mostra qual a ordem dos elementos
x[order(x)] #ordena o vetor

x[-c(2,5,6)] # não quero o que está nos indices 2, 5, 6
x[-(2:4)] # não quero o que está entre indice 2 e 4

#Em matrizes:

m <- matrix(8:15, 1:8, ncol = 8, nrow = 8)
m

m[5,2] # específico
m[,2] # só coluna 2
m[1,] # só linha 1
m[c(1,5),] #linha 1 e 5 de todas as colunas
m[ ,c(2,6)] #colunas 2 e 6  
m[m>5] #elementos maiores que 5

#Alterando valores usando subsetting:

x <- c(13, 8, 5, 3, 2, 1, 1)
x[x > 5] <- 0
x

#----------------------------- SUBSETTING

