#### Setup ####

con <- file("./functional_cluster/NCI.log")
sink(con, append=T)
sink(con, append=T, type="message")

cat("#### Setup ####\n\n")
rm(list = ls())
invisible(gc())
set.seed(42)
# setwd("./")
library(tidyverse)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = T)

#### Data ####

cat("#### Data ####\n\n")
load("./functional_save/Individuals.Rdata")
load("./functional_save/CompetitionMatrix.Rdata")

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
  list(N = nrow(data_trait),
       J = nrow(Competition_trait),
       C = length(unique(data_trait$Genus)),
       S = length(unique(data_trait$Species)),
       Trait = as.numeric(scale(data_trait[trait], center = F)),
       individual = Competition_trait$idTree,
       DBHj = as.numeric(scale(Competition_trait$DBHj, center = F)),
       Deltaj = as.numeric(scale(Competition_trait$dij, center = F)),
       species = as.numeric(as.factor(data_trait$Species)),
       complex = as.numeric(as.factor(data_trait$Genus)),
       speciesincomplex = unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[order(unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[,1]),2],
       weights = 1-data_trait$AreaOutside20,
       data = data_trait,
       competition = Competition_trait)})
names(mdata) <- traits

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("./functional_cluster/NCI.stan")
fits <- lapply(mdata, function(x)
  sampling(Model, data = x, chains = 2, save_warmup = F,
           include = F, pars = c('NCIj', "alpha_s", "betaComp_s",
                                 "alpha_s_tilde", "betaComp_s_tilde")))
names(fits) <- traits
save(fits, file = "./functional_save/NCI.Rdata")

#### Alert ####

cat("#### Alert ####\n\n")
library(RPushbullet)
pbPost("note", "NCI", "sampling done")
