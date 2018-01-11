setwd("/home/lauren/PredictDB_Pipeline_GTEx_v7/model_training/scripts/")
source("gtex_v7_nested_cv_elnet_n.R")
"%&%" <- function(a,b) paste(a,b, sep='')

argv <- commandArgs(trailingOnly = TRUE)
tiss <- argv[1]
chrom <- argv[2]

snp_annot_file <- "../../prepare_data/genotype/pops_hold/" %&% tiss %&% "_annot_chr1-22.chr" %&% chrom %&% ".txt"
gene_annot_file <- "../../prepare_data/expression/gencode.v18.annotation.parsed.txt"
genotype_file <- "../../prepare_data/genotype/pops_hold/" %&% tiss %&% "_snp_chr1-22.chr" %&% chrom %&% ".txt"
expression_file <- "../../prepare_data/expression/" %&% tiss %&% "_MESA_Epi_GEX_data_sidno_Nk-20.txt"
covariates_file <- "../../prepare_data/covariates/" %&% tiss %&% "_PCs_sorted.txt"
prefix <- tiss %&% "_nested_cv"

main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, as.numeric(chrom), prefix, null_testing=FALSE)


