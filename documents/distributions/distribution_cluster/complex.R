#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0)
  stop("At least one argument must be supplied (complex).n", call.=FALSE)
complex <- args[1]
print(paste("Complex is", complex))
library(rstan)
options(mc.cores = 2)
rstan_options(auto_write = T)
load("../distribution_save/complexesData.Rdata")
Model <- stan_model("../distribution_models/SingleModelUnscale.stan")
fit <- sampling(Model, chains = 2, mdata[[complex]], save_warmup = F,
                control = list(adapt_delta = 0.9, max_treedepth = 12))
save(fit, file = paste0("../distribution_save/complexes", complex, ".Rdata"))
