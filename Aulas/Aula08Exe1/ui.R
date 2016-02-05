#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Exercicio!"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    wellPanel(
      dateInput(inputId = "date", "Data:"),
      checkboxGroupInput(inputId = "valores", "Valores:", c("vl1" = "Valor 1",
                                                  "vl2" = "valor 2",
                                                  "vl3" = "valor 3"
                                                  )),
      textInput(inputId = "txtTexto", "Caption:", "Data Summary"),
      numericInput('n', label = 'N', value = 3),
      numericInput('n2', label = 'N2', value = 3)
    ),
    # Show a plot of the generated distribution
    mainPanel(
       #plotOutput("distPlot")
      fluidRow(
        tableOutput("id_tab")
      ),
      fluidRow(
        plotOutput("id_graf")
      )
    )
  )
))
