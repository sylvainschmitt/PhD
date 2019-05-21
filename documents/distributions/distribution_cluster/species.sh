#!/bin/bash
#SBATCH --time=36:00:00
#SBATCH -J species
#SBATCH -o species_output.out
#SBATCH -e species_error.out
#SBATCH --mem=20G
#SBATCH --constraint broadwell
#SBATCH --cpus-per-task=3
#SBATCH --mail-type=BEGIN,END,FAIL

# Environment
module purge
module load compiler/gcc-7.2.0
module load system/R-3.5.3

# script
Rscript species.R