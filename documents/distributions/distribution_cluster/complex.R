#### Setup ####

cat("#### Setup ####\n\n")
rm(list = ls()) ; invisible(gc()) ; set.seed(42)
library(parallel)
library(tidyverse)
library(rstan)
library(bayesplot)
cores <- 3
options(mc.cores = cores)
rstan_options(auto_write = T)
path <- "../../../data/Paracou/"

#### Data ####

cat("#### Data ####\n\n")
d <- 20
trees <- src_sqlite(file.path(path, "trees", "Paracou.sqlite")) %>% 
  tbl("Paracou") %>% 
  filter(CensusYear == 2015) %>%
  filter(Plot %in% c(1, 6, 11, 13:16)) %>% # control and biodiv only
  filter(Xfield > d, Xfield < 250-d, Yfield > d, Yfield < 250-d) %>% 
  filter(Species != "Indet.") %>% 
  mutate(DBH = CircCorr/pi) %>% 
  collect()
load("../distribution_save/env.Rdata")
load("../distribution_save/Competition.Rdata")
Complexes <- bind_rows(
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
  left_join(Complexes) %>% 
  filter(!is.na(Plot))

#### Model Data ####

cat("#### Model Data ####\n\n")
complexes <- unique(Complexes$Complex)
data <- mutate(data, Complex = ifelse(is.na(Complex), "no", Complex))
mdata <- lapply(complexes, function(complex) {
  data_complex <- left_join(data,
                            Competition %>% 
                              left_join(Complexes, by = c("Genusj" = "Genus", "Speciesj" = "Species")) %>%
                              left_join(dplyr::select(trees, idTree, Genus, Species)) %>% 
                              mutate(Complex = ifelse(is.na(Complex), "no", Complex)) %>% 
                              mutate(dij = ifelse(dij <1, 1, dij)) %>% 
                              mutate(complex = as.numeric(Complex == complex)) %>% 
                              mutate(con = as.numeric(Genusj == Genus, Speciesj == Species)) %>% 
                              mutate(hetero = ifelse(complex == 1 & con == 0, 1, 0)) %>% 
                              group_by(idTree) %>% 
                              summarise(NCIother = log(sum(DBHj^2*exp(-0.25*dij)*complex)+1),
                                        NCIhetero = log(sum(DBHj^2*exp(-0.25*dij)*hetero)+1),
                                        NCIcon = log(sum(DBHj^2*exp(-0.25*dij)*con)+1)))
  list(N = nrow(data_complex),
       K = 4,
       Y = as.numeric(data_complex$Complex == complex),
       X = dplyr::select(data_complex, TWI, NCIother, NCIhetero, NCIcon) %>%
         mutate_all(funs(scale)) %>%
         as.matrix(),
       w = ifelse(data_complex$Complex == complex,
                  1-sum(data_complex$Complex == complex)/length(data_complex$Complex),
                  sum(data_complex$Complex == complex)/length(data_complex$Complex)))
})
names(mdata) <- complexes

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("../distribution_models/SingleModelUnweighted.stan")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data))
names(fits) <- complexes
save(fits, file = "../distribution_save/complexes.Rdata")
