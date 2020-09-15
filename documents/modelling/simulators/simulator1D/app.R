library(tidyverse)
library(shiny)
library(shinydashboard)
theme_set(bayesplot::theme_default())

Rcpp::sourceCpp('build_gradient.cpp')
Rcpp::sourceCpp('simulator1D.cpp')
source("plotSim1D.R")

ui <- dashboardPage(
    dashboardHeader(title = "Eco-evo simulator 1D"),
    dashboardSidebar(
        tags$head(tags$style(HTML(".sidebar {
                      height: 90vh; overflow-y: auto;
                    }"))), 
        actionButton("simulate", "Simulate", icon = icon("recycle"), width = "200px"),
        checkboxInput("viability_deterministic", "Determinist/Probabilist viability", value = TRUE),
        sliderInput("Nind", "Number of individuals:",
                    min = 1, max = 100, value = 50),
        sliderInput("Ngen", "Number of generations:",
                    min = 1, max = 500, value = 50),
        sliderInput("muG", "Genetic mean:",
                    min = -10, max = 10, value = 0),
        sliderInput("sigmaG", "Genetic variance:",
                    min = 0, max = 10, value = 1),
        sliderInput("muE", "Environmental mean:",
                    min = -10, max = 10, value = 0),
        sliderInput("sigmaE", "Environmental variance:",
                    min = 0, max = 10, value = 1),
        sliderInput("gradientlim", "Environmental gradient size:",
                    min = 0, max = 100, value = 10),
        sliderInput("seedlings", "Seedlings:",
                    min = 0, max = 50, value = 4),
        sliderInput("dispersal", "Dispersal:",
                    min = 0, max = 50, value = 1)
    ),
    dashboardBody(fluidRow(plotOutput("simulator")))
)

server <- function(input, output) {
    observeEvent(input$simulate, {
        output$simulator = renderPlot(height = 600,
                                      plotSim1D(simulator1D_cpp(Nind = input$Nind,
                                                                Ngen = input$Ngen,
                                                                muG = input$muG,
                                                                sigmaG = input$sigmaG,
                                                                muE = input$muE,
                                                                sigmaE = input$sigmaE,
                                                                Elim = input$gradientlim,
                                                                seedlings = input$seedlings,
                                                                dispersal = input$dispersal,
                                                                viability_deterministic = input$viability_deterministic))) 
    })
}

shinyApp(ui = ui, server = server)
