#!/usr/bin/env bash

##### pascal
## To Run
# Pascal --pval=resources/gwas/EUR.CARDIoGRAM_2010_lipids.HDL_ONE.txt --runpathway=on

####### Downloading files
### wget http://www2.unil.ch/cbg/images/3/3d/PASCAL.zip
### unzip PASCAL.zip; cd PASCAL; bash installScript.sh


#### Input file delimiter
## tab-separted


#### Input GWAS Summary columns
## 1- SNP-ID without header
## 2- P-value  without header

## Defualt maximum number of SNPs per gene is 3000,  --maxsnp=3000
## Default genescoring method is sum,  --genescoring=sum
## Default genomic distance in mega-bases that the program uses to fuse nearby genes during the pathway analysis is 1
    ### --mergedistance=1
## Default --mafcutoff is 0.5, --mafcutoff=0.5
## The default  upstream window is 50000, --up=50000
## The default  downstream window is 50000, --down=50000
## --genesetfile for gene set file; The default is resources/genesets/msigdb/msigBIOCARTA_KEGG_REACTOME.gmt




set -x	## To debug


input_dir=".";
output_dir="./";
binary_dir="."

gwas_summary=$1;
population=$2; #  {afr, amr, eur, eas, sas}

#outsuffix=pGWAS;

####### Run Pascal
## Output files are produced in {PascalPackage}/output/
### Output file name EUR.CARDIoGRAM_2010_lipids.HDL_ONE.MYNAME.genescores.chr22.txt


./Pascal --pval=$gwas_summary \
        --customdir=${binary_dir}/custom-1000genomes  --custom=$population \
        --runpathway=on \
        --outdir=$output_dir #\
        ## --outsuffix=${outsuffix}
##### Output files:
## 1- ${gwas_summary}.sum.genescores.txt  ----> The gene score results.
## 2- ${gwas_summary}.PathwaySet--msigBIOCARTA_KEGG_REACTOME--sum.txt ----> The pathway score results.
## 3- ${gwas_summary}.sum.fusion.genescores.txt  ----> The fusion gene score results.
## 4- ${gwas_summary}.sum.numSnpError.txt ----> A file containing all genes that contain no SNPs or contain more SNPs than given by the --maxsnp option
## 5- ${gwas_summary}.sum.fusion.numSnpError.txt  ---> A file containing all genes that contain no SNPs or contain more SNPs than given by the --maxsnp option

### ## 5- ${gwas_summary}.*.ComputeError.txt  --->  Failed to compute
