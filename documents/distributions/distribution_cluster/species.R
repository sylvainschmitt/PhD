rm(list = ls()) ; invisible(gc()) ; set.seed(42)
library(rstan)
options(mc.cores = 3)
rstan_options(auto_write = T)
load("../distribution_save/species.Rdata")
Model <- stan_model("../distribution_models/species.Rdata")
fits <- lapply(mdata, function(data) sampling(Model, chains = 2, data))
names(fits) <- complexes
save(fits, mdata, file = "../distribution_save/species.Rdata")