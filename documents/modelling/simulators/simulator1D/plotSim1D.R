plotSim1D <- function(sim)
  lapply(list("breeding value (a)" = sim$A, "trait value (z)" = sim$Z), function(M)
    reshape2::melt(M) %>% 
      dplyr::rename(generation = Var1, individual = Var2)) %>% 
  bind_rows(.id = "var") %>% 
  left_join(data.frame(individual = 1:length(sim$E), environment = sim$E), by = "individual") %>% 
  ggplot(aes(generation, value, 
             group = individual, col = environment)) + 
  geom_line(alpha = 0.5) +
  facet_wrap(~ var) +
  viridis::scale_color_viridis()