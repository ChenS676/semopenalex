#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=48:00:00 
#SBATCH --mem=376000
#SBATCH --constraint=LSDF
#SBATCH --job-name=kgtk_import_all_2022_10_sdil_v10
#SBATCH --mail-type=ALL
#SBATCH --mail-user=udevz@student.kit.edu
#SBATCH --output=sh/_log_kgtk_import_all_2022_10_sdil_v10.txt
conda activate kgtk_conda_py39_env
export PYTHONPATH='/home/kit/stud/udevz/miniconda3/envs/kgtk_conda_py39_env/bin'
echo 'Start reduction process with KGTK' 
kgtk import-ntriples -i /lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/02_extracted_triples_nt/all_objects_2022_10.nt_v10.nt --verbose -o /lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/03_imported_nt_kgtk/all_objects_2022_10_v10.tsv
echo 'KGTK worked successfully'