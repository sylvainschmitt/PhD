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

#### Model Data ####

cat("#### Competition matrix ####\n\n")
cl <- makeCluster(4)
clusterExport(cl, list("data", "path"))
Competition <- clusterMap(cl,
  function(id, plot, census, x, y, genus){
  library(dplyr)
  src_sqlite(file.path(path, "trees/Paracou.sqlite")) %>%
    tbl("Paracou") %>%
    filter(CensusYear == census) %>%
    filter(Plot == plot) %>%
    filter(idTree != id) %>%
    mutate(DBH = CircCorr/pi) %>%
    filter(DBH >= 10) %>% # != INRA plots
    mutate(dij = sqrt((x - Xutm)^2+(y - Yutm)^2)) %>%
    filter(dij < 10) %>%
    summarise(BA = sum(0.25*pi*DBH^2),
              BAgenus =  sum(0.25*pi*DBH^2*as.numeric(Genus == genus))) %>%
    mutate(idTree = id) %>%
    dplyr::select(idTree, BA, BAgenus) %>%
    collect()},
  id = trees$idTree,
  plot = trees$Plot,
  x = trees$Xutm,
  y = trees$Yutm,
  census = trees$CensusYear,
  genus = trees$Genus,
  SIMPLIFY = F)
stopCluster(cl)
rm(cl)
Competition <- bind_rows(Competition)
save(Competition, file = "./distribution_save/Competition.Rdata")

#### Alert ####

cat("#### Alert ####\n\n")
library(RPushbullet)
pbPost("note", "Competition", "matrix done")
