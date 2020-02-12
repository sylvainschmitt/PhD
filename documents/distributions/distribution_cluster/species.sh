#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -J species
#SBATCH -e species.err
#SBATCH -o species.out
#SBATCH --mem=20G
#SBATCH --constraint=broadwell
#SBATCH --cpus-per-task=3
#SBATCH --mail-type=BEGIN,END,FAIL

# Environment
module purge
module load compiler/gcc-7.2.0
module load system/R-3.5.3

# script
R_LIBS_USER=" " Rscript species.R