#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0)
  stop("At least one argument must be supplied (simulation number).n", call.=FALSE)
chain <- as.numeric(args[1])
print(paste("Chain ", chain))
library(rstan)
options(mc.cores = 1)
rstan_options(auto_write = T)
load("../parvicapture_save/dataGrowthPar.Rdata")
model <- stan_model("../parvicapture_models/Gmax.stan")
if(!file.exists("../parvicapture_save/Gmax")) stop("Saving folder doesn't exist.")
fit <- sampling(model, chains = 1, data = mdata, save_warmup = F,
                     control = list(adapt_delta = 0.99, max_treedepth = 12))
save(fit, file = paste0("../parvicapture_save/Gmax/Gmax", chain, ".Rdata"))
