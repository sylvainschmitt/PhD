#### Setup ####

cat("#### Setup ####\n\n")
rm(list = ls())
invisible(gc())
set.seed(42)
# setwd("./")
library(tidyverse)
library(rstan)
options(mc.cores = 2)
rstan_options(auto_write = T)

#### Data ####

cat("#### Data ####\n\n")
load("./functional_save/Individuals.Rdata")
load("./functional_save/CompetitionMatrix.Rdata")
Individuals <- Individuals %>% 
  group_by(Species) %>% 
  filter(n() > 10) %>% 
  ungroup()

#### Model Data ####

cat("#### Model Data ####\n\n")
traits <- c("invSLA", "LDMC", "LT", "invLA", "CC")
mdata <- lapply(traits, function(trait){
  data_trait <- Individuals[!is.na(unlist(Individuals[,trait])),] %>% 
    left_join(select(Competition, idTree, AreaOutside20) 
              %>% unique())
  Competition_trait <- Competition
  Competition_trait$idTree <- match(Competition_trait$idTree, data_trait$idTree)
  Competition_trait <- filter(Competition_trait, !is.na(idTree))
  list(Model = trait,
       N = nrow(data_trait),
       J = nrow(Competition_trait),
       S = length(unique(data_trait$Species)),
       Trait = unlist(data_trait[trait])/sd(unlist(data_trait[trait])),
       DBH = data_trait$DBH/sd(data_trait$DBH),
       TWI = data_trait$TWI/sd(data_trait$TWI),
       DBHj = Competition_trait$DBHj/sd(Competition_trait$DBHj),
       Deltaj = Competition_trait$dij/sd(Competition_trait$dij),
       weights = 1-data_trait$AreaOutside20,
       individual = as.numeric(as.factor(Competition_trait$idTree)),
       species = as.numeric(as.factor(data_trait$Species)),
       data = data_trait,
       competition = Competition_trait,
       sd = c(Trait = sd(unlist(data_trait[trait])), 
              DBH = sd(data_trait$DBH), 
              TWI = sd(data_trait$TWI), 
              DBHj = sd(Competition_trait$DBHj), 
              Deltaj = sd(Competition_trait$dij)))
})
names(mdata) <- traits

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("./functional_cluster/InteractionSpecies.stan")
fits <- lapply(mdata, function(x)
  sampling(Model, chains = 2, data = x, save_warmup = F,
           include = F, pars = c('NCIj')))
names(fits) <- traits
save(fits, file = "./functional_save/InteractionSpecies.Rdata")

#### Alert ####

cat("#### Alert ####\n\n")
library(RPushbullet)
pbPost("note", "Interaction", "sampling done")
