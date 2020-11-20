#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args) != 4)
  stop("4 argument must be supplied (sigmaZtopo, sigmaZnci, Ns, Rdispersion).n", call.=FALSE)
sigmaZtopo <- as.numeric(args[1])
sigmaZnci <- as.numeric(args[2])
Ns <- as.integer(args[3])
Rdispersion <- as.integer(args[4])
print(paste("sigmaZtopo number is", sigmaZtopo))
print(paste("sigmaZnci is", sigmaZnci))
print(paste("Ns", Ns))
print(paste("Rdispersion", Rdispersion))
load("data.Rdata")
library(ecoevosimulator)
sim <- simulator(grid = 50, Nt = 60,
                 topography = topo,
                 NCI = NCI,
                 sigmaZtopo = sigmaZtopo,
                 sigmaZnci = sigmaZnci,
                 Ns = Ns,
                 Rdispersion = Rdispersion,
                 Rpollination = 1)
sim <- simulationMetrics(sim, thin = 2)
name <- paste0("simulation_sigmaZtopo=", sigmaZtopo, "_sigmaZnci=", sigmaZnci, 
               "_Ns=", Ns, "_Rdispersion=", Rdispersion, ".tsv")
readr::write_tsv(sim,
                 file.path("simulations", name))
