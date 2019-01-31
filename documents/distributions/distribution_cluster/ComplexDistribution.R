#### Setup ####

cat("#### Setup ####\n\n")
rm(list = ls()) ; invisible(gc()) ; set.seed(42)
library(parallel)
library(tidyverse)
library(rstan)
library(bayesplot)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = T)
path <- "~/Documents/BIOGECO/PhD/data/Paracou/"
cores <- 6

#### Data ####

cat("#### Data ####\n\n")
trees <- src_sqlite(file.path(path, "trees", "Paracou.sqlite")) %>% 
  tbl("Paracou") %>% 
  filter(CensusYear == 2015) %>%
  filter(Species != "Indet.") %>% 
  mutate(DBH = CircCorr/pi) %>% 
  collect()
load("./distribution_save/env.Rdata")
load("./distribution_save/Competition.Rdata")
complexes <- bind_rows(
  data.frame(Complex = "E. Chartacea",
             Genus = c("Eschweilera", "Lecythis", "Eschweilera", "Courataria", "Lecythis"),
             Species = c("simiorum", "holocogyne", "congestiflora", "multiflora", "chartacea")),
  data.frame(Complex = "E. Parvifolia", Genus = "Eschweilera",
             Species = c("pedicellata", "coriacea", "decolorans", "sagotiana", "parviflora",
                         "micrantha", "grandiflora", "chartaceifolia")),
  data.frame(Complex = "Licania", Genus = "Licania",
             Species = c("menbranacea", "ovalifolia", "micrantha", "canescens", "laxiflora",
                         "alba", "majuscula")),
  data.frame(Complex = "Iryanthera", Genus = "Iryanthera",
             Species = c("hostmannii", "sagotiana")),
  data.frame(Complex = "Talisia", Genus = "Talisia",
             Species = c("microphylla", "hexaphylla", "praealta", "simaboides")),
  data.frame(Complex = "Symphonia", Genus = "Symphonia",
             Species = c("globulifera", "sp.1"))
)
data <- trees %>% 
  left_join(env) %>% 
  left_join(complexes) %>% 
  left_join(Competition) %>% 
  filter(!is.na(Plot))

#### Model Data ####

cat("#### Model Data ####\n\n")
complexes <- unique(complexes$Complex)
data <- mutate(data, Complex = ifelse(is.na(Complex), "no", Complex))
mdata <- lapply(complexes, function(complex)
  list(N = nrow(data),
       Y = as.numeric(data$Complex == complex),
       TWI = as.vector(scale(data$TWI)),
       BA = as.vector(scale(data$BA)),
       BAgenus = as.vector(scale(data$BAgenus)),
       w = ifelse(data$Complex == complex,
                  1/(2*sum(data$Complex == complex)),
                  1/(2*sum(data$Complex != complex)))))
names(mdata) <- complexes

#### Alert start ####

cat("#### Alert start ####\n\n")
library(RPushbullet)
pbPost("note", "Complexes distribution All", "Sampling start")

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("./distribution_save/complexes.stan")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data = data))
names(fits) <- complexes
save(fits, file = "./distribution_save/complexes.Rdata")

#### Alert done ####

cat("#### Alert done ####\n\n")
library(RPushbullet)
pbPost("note", "Complexes distribution", "Sampling done")
