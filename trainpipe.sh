#!/bin/bash -l
#SBATCH --job-name="trainpipe"
#SBATCH --account="cta02"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=andrii.neronov@epfl.ch
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH -o logs/%x_%A.log
#SBATCH --partition=normal
#SBATCH --constraint=mc
#SBATCH --hint=nomultithread
#SBATCH --mem=100G

export HDF5_USE_FILE_LOCKING=FALSE
source $HOME/.bashrc
conda activate lst
pwd
ls

#PYTHONNOUSERSITE=1
lstchain_mc_trainpipe \
    --fg dl1_20220511_allsky_std_dec_2276_GammaDiffuse_merged.h5 \
    --fp dl1_20220511_allsky_std_dec_2276_Protons_merged.h5 \
    -o models
