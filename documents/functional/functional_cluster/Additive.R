#### Setup ####

cat("#### Setup ####")
rm(list = ls())
invisible(gc())
set.seed(42)
# setwd("./")
library(tidyverse)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = T)

#### Data ####

cat("#### Data ####")
load("./functional_save/Individuals.Rdata")
load("./functional_save/CompetitionMatrix.Rdata")

#### Model Data ####

cat("#### Model Data ####")
traits <- c("invSLA", "LDMC", "LT", "invLA", "CC")
mdata <- lapply(traits, function(trait){
  data_trait <- Individuals[!is.na(unlist(Individuals[,trait])),]
  list(N = nrow(data_trait),
       J = nrow(Competition),
       C = length(unique(data_trait$Genus)),
       S = length(unique(data_trait$Species)),
       Trait = as.numeric(scale(data_trait[trait], center = F)),
       DBH = as.numeric(scale(data_trait$DBH, center = F)),
       TWI = as.numeric(scale(data_trait$TWI, center = F)),
       individual = as.numeric(as.factor(Competition$idTree)),
       DBHj = as.numeric(scale(Competition$DBHj, center = F)),
       Deltaj = as.numeric(scale(Competition$dij, center = F)),
       species = as.numeric(as.factor(data_trait$Species)),
       complex = as.numeric(as.factor(data_trait$Genus)),
       speciesincomplex = unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[order(unique(cbind(as.numeric(as.factor(data_trait$Species)), as.numeric(as.factor(data_trait$Genus))))[,1]),2])})
names(mdata) <- traits

#### Sampling ####

cat("#### Sampling ####")
Model <- stan_model("./functional_files/Additive.stan")
fits <- lapply(mdata, function(x) sampling(Model, chains = 2, data = x))
names(fits) <- traits
save(fits, file = "./functional_save/Additive.Rdata")
