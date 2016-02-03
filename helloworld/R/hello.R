# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Hello
#'
#' Printa a palavra hello
#'
#' Destalhes ftw
#'
#' @param i i é o parâmetro que a função pra usar (no caso nem tem)
#'
#' @export
#'
#' @examples hello()
#'
hello <- function(i) {
  print("Hello, world!")
}

#' Soma
#' Faz a soma de um vetor
#'
#' @param x vetor que você quer somar
#'
soma <- function(x){
  k <- 0
  for (i in 1:length(x)){
    k <- k + x[i]
  }
}
