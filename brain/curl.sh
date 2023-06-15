#!/bin/bash
#SBATCH --account=def-fdick
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --job-name=curl_tar
#SBATCH --output=%x.out

# Create datasets folder
mkdir datasets
 
# Download FASTQ to datasets folder
curl https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Mouse_Brain/Visium_FFPE_Mouse_Brain_fastqs.tar -o datasets/Visium_FFPE_Mouse_Brain_fastqs.tar
 
# Download image file to datasets folder
curl https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Mouse_Brain/Visium_FFPE_Mouse_Brain_image.jpg -o datasets/Visium_FFPE_Mouse_Brain_image.jpg

# Download mouse reference
curl -O https://cf.10xgenomics.com/supp/spatial-exp/refdata-gex-mm10-2020-A.tar.gz


# Download mouse probe set reference from support website
curl -O https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.csv

# Extract sample FASTQ files
tar -xvf datasets/Visium_FFPE_Mouse_Brain_fastqs.tar -C datasets/ && rm datasets/Visium_FFPE_Mouse_Brain_fastqs.tar
 
# Extract mouse reference transcriptome
tar -xzvf refdata-gex-mm10-2020-A.tar.gz && rm refdata-gex-mm10-2020-A.tar.gz
