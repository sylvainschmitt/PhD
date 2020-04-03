#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0)
  stop("At least one argument must be supplied (chain number).", call.=FALSE)
chain <- as.numeric(args[1])
print(paste("Chain ", chain))
library(rstan)
options(mc.cores = 1)
rstan_options(auto_write = T)
load("../symcapture_save/growthPar.Rdata")
gmaxgenoenv <- stan_model("../symcapture_models/GmaxGenoEnv.stan")
fit <- sampling(gmaxgenoenv, chains = 1, data = mdata, save_warmup = F, init = "0",
                control = list(adapt_delta = 0.99, max_treedepth = 12))
save(fit, file = paste0("../symcapture_save/gmaxgenoenv/gmaxgenoenv", chain, ".Rdata"))
