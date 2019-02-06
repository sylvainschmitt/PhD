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
  data.frame(Complex = "E. Chartacea", Genus = "Eschweilera",
             Species = c("simiorum", "congestiflora")),
  data.frame(Complex = "E. Parvifolia", Genus = "Eschweilera",
             Species = c("pedicellata", "coriacea", "decolorans", "sagotiana",
                         "wachenheimii", "grandiflora_form2")),
  data.frame(Complex = "Licania", Genus = "Licania",
             Species = c("alba", "membranacea", "canescens", "micrantha",
                         "ovalifolia", "sprucei", "densiflora",
                         "laxiflora", "parvifructa")),
  data.frame(Complex = "Iryanthera", Genus = "Iryanthera",
             Species = c("hostmannii", "sagotiana")),
  data.frame(Complex = "Talisia", Genus = "Talisia",
             Species = c("hexaphylla", "praealta", "simaboides")),
  data.frame(Complex = "Symphonia", Genus = "Symphonia",
             Species = c("globulifera", "sp.1")))
data <- trees %>% 
  left_join(env) %>% 
  left_join(complexes) %>% 
  left_join(Competition) %>% 
  mutate(BAother = BA - BAspecies) %>% 
  filter(!is.na(Plot))

#### Model Data ####

cat("#### Model Data ####\n\n")
complexes <- unique(complexes$Complex)
data <- mutate(data, Complex = ifelse(is.na(Complex), "no", Complex))
mdata <- lapply(complexes, function(complex)
  list(N = nrow(data),
       K = 3,
       Y = as.numeric(data$Complex == complex),
       X = dplyr::select(data, TWI, BAother, BAgenus) %>%
         mutate_all(funs(scale)) %>%
         as.matrix(),
       w = ifelse(data$Complex == complex,
                  1/(2*sum(data$Complex == complex)),
                  1/(2*sum(data$Complex != complex)))))
names(mdata) <- complexes

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("A01-SingleModel.stan")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data = data))
names(fits) <- complexes
save(fits, file = "./distribution_save/complexes.Rdata")
