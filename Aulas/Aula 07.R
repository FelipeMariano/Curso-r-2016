#Aula 007:

#install.packages('devtools')
#install.packages('roxygen2')
#install.packages('testthat')
#install.packages('knitr')
#devtools::install_github('hadley/devtools')
#isntalar Rtools

library(devtools)
library(roxygen2)
library(testthat)
library(knitr)


#escolher licença
#https://choosealicense.com/

#devtools::use_package("dplyr")
#Pacotes que irei usar no meu, em DESCRIPTION aparecerá import


#devtools::document()
#cria a documentação onde é possível ver por ?
#@export permite que as pessoas usem o pacote, se eu n usar, vai ficar interno

#preciso gerar document antes de dar o build, se n não funfa

#devtools::use_testthat()

#cria pasta tests dentro da pasta do pacote



#NAMESPACE = functions que estou exportando

#devtools::use_data(mtcars)
#é criada uma pasta data com as tabelas
#consigo documentar tbm ops dados (o que são, o que tem lá, etc)
