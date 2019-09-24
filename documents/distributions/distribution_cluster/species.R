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
  filter(Xfield > d, Xfield < 250-d, Yfield > d, Yfield < 250-d) %>% 
  filter(Species != "Indet.") %>% 
  mutate(DBH = CircCorr/pi) %>% 
  collect()
load("../distribution_save/env.Rdata")
load("distribution_save/Competition.Rdata")
Competition <- Competition %>% 
  mutate(dij = ifelse(dij <1, 1, dij)) %>% 
  left_join(dplyr::select(trees, idTree, Genus, Species)) %>% 
  mutate(strata = as.numeric(Genusj == Genus, Speciesj == Species)) %>% 
  group_by(idTree) %>% 
  summarise(NCIhetero = log(sum(DBHj^2*exp(-0.25*dij)*abs(strata-1))+1),
            NCIcon = log(sum(DBHj^2*exp(-0.25*dij)*strata)+1))
Complexes <- bind_rows(
  data.frame(Complex = "Chartacea", Genus = "Eschweilera",
             Species = c("simiorum", "congestiflora")),
  data.frame(Complex = "Parvifolia", Genus = "Eschweilera",
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
  left_join(Competition) %>% 
  filter(!is.na(Plot)) %>% 
  filter(!is.na(Complex)) %>% 
  group_by(Complex, Species) %>% 
  filter(n() > 10) %>%
  ungroup()

#### Model Data ####

cat("#### Model Data ####\n\n")
complexes <- unique(Complexes$Complex)
mdata <- lapply(complexes, function(complex) {
  data<- filter(data, Complex == complex)
  list(N = nrow(data),
       S = length(unique(data$Species)),
       K = 3,
       Y = sapply(levels(as.factor(data$Species)),
                  function(sp) as.numeric(data$Species == sp)),
       X = dplyr::select(data, TWI, NCIhetero, NCIcon) %>%
         mutate_all(funs(scale)) %>%
         as.matrix())
})
names(mdata) <- complexes

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("../distribution_models/JointModel.stan")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data = data))
names(fits) <- complexes
save(fits, file = "../distribution_save/species.Rdata")
