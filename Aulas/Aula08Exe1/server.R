#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  dados <- reactive({
    n <- input$n
    m <- mtcars[1:input$n]
    isolate({
      m[1:input$n2, ]
    })
  })


  output$id_graf <- renderPlot({
    pairs(dados())
  })

  output$id_tab <- renderTable({
    cor(dados())
  })

})
