library(tidyverse)
library(shiny)
library(shinydashboard)
theme_set(bayesplot::theme_default())

simulator2D <- function(
    grid = 20, # size
    Ngen = 50,
    muG = 0, # genetics
    sigmaG = 1,
    muE = 0, # environment
    sigmaE = 1,
    Elim = 5,
    seedlings = 4, # reproduction
    dispersal = 1,
    viability_deterministic = T
){
    A <- array(dim = c(grid, grid, Ngen)) # objects
    Z <- array(dim = c(grid, grid, Ngen))
    A[,,1] <- array(rnorm(grid*grid, muG, sigmaG), dim = c(grid,grid))
    Z[,,1] <- A[,,1] + array(rnorm(grid*grid, muE, sigmaE), dim = c(grid,grid))
    E <- seq(-Elim, Elim, length.out = grid) %*% t(seq(-Elim, Elim, length.out = grid))
    for(g in 2:Ngen){ # iterations
        Aoffsprings <- array(
            as.vector(
                sapply(1:grid, function(i)
                    sapply(1:grid, function(j)
                        sapply(1:seedlings, function(s)
                            rnorm(1, 
                                  sample(A[max(1,i-dispersal):min(i+dispersal,grid),
                                           max(1,j-dispersal):min(j+dispersal,grid),
                                           g-1], 2),
                                  sigmaG/2)
                        )
                    )
                )
            ), dim = c(grid, grid, seedlings))
        Zoffsprings <- Aoffsprings + array(rnorm(grid*grid*seedlings, muE, sigmaE), dim = c(grid,grid,seedlings))
        if(viability_deterministic){
            survivors <- array(apply(apply(Zoffsprings, 3, function(x) as.array(sqrt((x - E)^2), dim = c(grid,grid))), 1, which.min), dim = c(grid,grid))
        } else {
            # stop("not available")
            survivors <- array(apply(1/apply(Zoffsprings, 3, function(x) as.array(sqrt((x - E)^2), dim = c(grid,grid))), 1, 
                                     function(w) sample.int(seedlings, 1, replace = T, prob = w)), dim = c(grid,grid))
            # survivors <- apply(1/apply(Zoffsprings, 1, function(x) sqrt((x - gradient)^2)), 1, 
            #                    function(w) sample.int(seedlings, 1, replace = T, prob = w)) 
        }
        A[,,g] <- Aoffsprings[cbind(rep(1:grid, grid), rep(1:grid, each = grid), as.vector(survivors))]
        Z[,,g] <- Zoffsprings[cbind(rep(1:grid, grid), rep(1:grid, each = grid), as.vector(survivors))]
        
    }
    return(lapply(list("breeding value (a)" = A, "trait value (z)" = Z), function(M)
        reshape2::melt(M) %>%
            dplyr::rename(X = Var1, Y = Var2, generation = Var3)) %>%
            bind_rows(.id = "var") %>%
            left_join(reshape2::melt(E) %>%
                          dplyr::rename(X = Var1, Y = Var2, environment = value),
                      by = c("X", "Y")) %>% 
            mutate(individual = paste0("X",X,"Y",Y)))
}

plot_env <-function(sim) {
    dplyr::select(sim, X, Y, environment) %>% 
        unique() %>% 
        ggplot(aes(X, Y, fill = environment)) +
        geom_tile() +
        viridis::scale_fill_viridis(guide = "none")
}
plot_maps <- function(sim){
    filter(sim, generation %in% c(1, floor(max(sim$generation)/2), max(sim$generation))) %>% 
        ggplot(aes(X, Y, fill = value)) +
        facet_wrap(~ generation) +
        geom_tile() +
        facet_grid(var ~ generation) +
        viridis::scale_fill_viridis(guide = "none")
}
plot_trajectories <- function(sim, thin = NA){
    if(is.na(thin)) thin <- length(unique(sim$individual))
    filter(sim, individual %in% sample(unique(sim$individual), thin)) %>% 
        ggplot(aes(generation, value, 
                   group = individual, col = environment)) + 
        geom_line(alpha = 0.5) +
        facet_wrap(~ var) +
        viridis::scale_color_viridis(guide = "none")
}
plot_all <- function(sim,thin = NA){
    gridExtra::grid.arrange(
        plot_env(sim),
        plot_maps(sim),
        plot_trajectories(sim, thin = NA),
        nrow = 2,
        widths = c(1,2),
        layout_matrix = rbind(c(1, 2),
                              c(3, 3))
    )
}

ui <- dashboardPage(
    dashboardHeader(title = "Eco-evo simulator 2D"),
    dashboardSidebar(
        tags$head(tags$style(HTML(".sidebar {
                      height: 90vh; overflow-y: auto;
                    }"))), 
        checkboxInput("viability_deterministic", "Determinist/Probabilist viability", value = TRUE),
        sliderInput("grid", "Grid size (NxN individuals):",
                    min = 1, max = 100, value = 25),
        sliderInput("Ngen", "Number of generations:",
                    min = 1, max = 500, value = 10),
        sliderInput("muG", "Genetic mean:",
                    min = -10, max = 10, value = 0),
        sliderInput("sigmaG", "Genetic variance:",
                    min = 0, max = 10, value = 2),
        sliderInput("muE", "Environmental mean:",
                    min = -10, max = 10, value = 0),
        sliderInput("sigmaE", "Environmental variance:",
                    min = 0, max = 10, value = 1),
        sliderInput("Elim", "Environmental gradient size:",
                    min = 0, max = 100, value = 10),
        sliderInput("seedlings", "Seedlings:",
                    min = 0, max = 50, value = 10),
        sliderInput("dispersal", "Dispersal:",
                    min = 0, max = 50, value = 1)
    ),
    dashboardBody(fluidRow(plotOutput("simulator")))
)

server <- function(input, output) {
    output$simulator = renderPlot(height = 600,
                                  plot_all(
                                      simulator2D(grid = input$grid,
                                              Ngen = input$Ngen,
                                              muG = input$muG,
                                              sigmaG = input$sigmaG,
                                              muE = input$muE,
                                              sigmaE = input$sigmaE,
                                              Elim = input$Elim,
                                              seedlings = input$seedlings,
                                              dispersal = input$dispersal,
                                              viability_deterministic = input$viability_deterministic)),
                                  )
}

shinyApp(ui = ui, server = server)
