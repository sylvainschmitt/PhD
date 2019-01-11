#### Setup ####

cat("#### Setup ####\n\n")
rm(list = ls()) ; invisible(gc()) ; set.seed(42)
library(parallel)
library(tidyverse)
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

#### Alert start ####

cat("#### Alert start ####\n\n")
library(RPushbullet)
pbPost("note", "Competition Species", "matrix start")

#### Model Data ####

cat("#### Competition matrix ####\n\n")
cl <- makeCluster(4)
clusterExport(cl, list("data", "path"))
Competition <- clusterMap(cl,
  function(id, plot, census, x, y, species){
  library(dplyr)
  src_sqlite(file.path(path, "trees/Paracou.sqlite")) %>%
    tbl("Paracou") %>%
    filter(CensusYear == census) %>%
    filter(Plot == plot) %>%
    filter(Species == species) %>% 
    filter(idTree != id) %>%
    mutate(DBH = CircCorr/pi) %>%
    filter(DBH >= 10) %>% # != INRA plots
    mutate(dij = sqrt((x - Xutm)^2+(y - Yutm)^2)) %>%
    filter(dij < 10) %>%
    summarise(BAspecies = sum(0.25*pi*DBH^2)) %>%
    mutate(idTree = id) %>%
    dplyr::select(idTree, BAspecies) %>%
    collect()},
  id = trees$idTree,
  plot = trees$Plot,
  x = trees$Xutm,
  y = trees$Yutm,
  census = trees$CensusYear,
  species = trees$Species,
  SIMPLIFY = F)
stopCluster(cl)
rm(cl)
Competition <- bind_rows(Competition)
save(Competition, file = "./distribution_save/CompetitionSpecies.Rdata")

#### Alert done ####

cat("#### Alert done ####\n\n")
library(RPushbullet)
pbPost("note", "Competition Species", "matrix done")
