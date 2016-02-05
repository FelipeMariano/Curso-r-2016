library(shiny)
library(ggplot2)

# Ajusta modelo para as variaveis y e x no banco de dados diamonds
ajustar_modelo <- function(y, x){
  form <- as.formula(paste(y, x, sep='~'))
  modelo <- lm(form, data = diamonds)
  return(modelo)
}

shinyServer(function(input, output) {

  output$reta_ajustada <- renderPlot({

    # definição das variáveis
    y <- input$resposta
    x <- input$x
    coefct <- coef(ajustar_modelo(y,x))

    # faça um gráfico da variável resposta pela variável selecionada para o eixo X
    # inclua a reta de regressão ajustada.
  ggplot(data = diamonds) +
    geom_point(aes_string(x, y), color = 'sky blue') +
    geom_abline(intercept = coefct[1], slope = coefct[2])

  })

})
