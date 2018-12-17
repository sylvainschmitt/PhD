#### Setup ####

con <- file("./functional_cluster/Additive.log")
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
  list(trait = trait,
       N = nrow(data_trait),
       J = nrow(Competition_trait),
       C = length(unique(data_trait$Genus)),
       S = length(unique(data_trait$Species)),
       Trait = as.numeric(scale(data_trait[trait], center = F)),
       DBH = as.numeric(scale(data_trait$DBH, center = F)),
       TWI = as.numeric(scale(data_trait$TWI, center = F)),
       DBHj = as.numeric(scale(Competition_trait$DBHj, center = F)),
       Deltaj = as.numeric(scale(Competition_trait$dij, center = F)),
       weights = 1-data_trait$AreaOutside20,
       individual = as.numeric(as.factor(Competition_trait$idTree)),
       species = as.numeric(as.factor(data_trait$Species)),
       complex = as.numeric(as.factor(data_trait$Genus)),
       speciesincomplex = unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[order(unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[,1]),2],
       data = data_trait,
       competition = Competition_trait)
})
names(mdata) <- traits

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("./functional_cluster/Additive.stan")
fits <- lapply(mdata, function(x) {
  cat("#### Sampling of ", x$trait, "####\n\n")
  sampling(Model, chains = 2, data = x)})
names(fits) <- traits
save(fits, file = "./functional_save/Additive.Rdata")
