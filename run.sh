#! /bin/env bash


Rscript -e 'renv::restore()' && Rscript script.R 2>&1 | tee out.txt

