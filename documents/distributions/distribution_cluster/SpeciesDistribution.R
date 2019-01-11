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
  data.frame(Complex = "Eschweilera clade Parvifolia", Genus = "Eschweilera",
             Species = c("pedicellata", "coriacea", "decolorans", "sagotiana", "parviflora",
                         "micrantha", "grandiflora", "chartaceifolia")),
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
complexes <- c("Symphonia", "Eschweilera clade Parvifolia")
mdata <- lapply(complexes, function(complex) {
  data<- filter(data, Complex == complex)
  list(N = nrow(data),
       S = length(unique(data$Species)),
       K = 4,
       Y = sapply(levels(as.factor(data$Species)),
                  function(sp) as.numeric(data$Species == sp)),
       X = dplyr::select(data, 
                         TWI,
                         BA, BAgenus, BAspecies) %>%
         mutate_all(funs(scale)) %>%
         as.matrix())
})
names(mdata) <- complexes

#### Alert start ####

cat("#### Alert start ####\n\n")
library(RPushbullet)
pbPost("note", "Species distribution All", "Sampling start")

#### Sampling ####

cat("#### Sampling ####\n\n")
Model <- stan_model("A02-JointModel.stan")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data = data))
names(fits) <- complexes
save(fits, file = "./distribution_save/SpeciesAll.Rdata")

#### Alert done ####

cat("#### Alert done ####\n\n")
library(RPushbullet)
pbPost("note", "Species distribution All", "Sampling done")
