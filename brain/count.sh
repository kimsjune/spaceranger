#!/bin/bash
#SBATCH --account=def-fdick
#SBATCH --mem-per-cpu=4g
#SBATCH --cpus-per-task=32
#SBATCH --time=3:00:00
#SBATCH --job-name=count
#SBATCH --output=%x.out
#SBATCH --error=%x.err
spaceranger count --id="Visium_FFPE_Mouse_Brain" \
          --description="Adult Mouse Brain (FFPE) using Mouse WTA Probe Set" \
          --transcriptome=refdata-gex-mm10-2020-A \
          --probe-set=Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.csv \
          --fastqs=datasets/Visium_FFPE_Mouse_Brain_fastqs \
          --image=datasets/Visium_FFPE_Mouse_Brain_image.jpg \
          --slide=V11J26-127 \
          --area=B1 \
          --reorient-images=true \
          --localcores=32 \
          --localmem=128

