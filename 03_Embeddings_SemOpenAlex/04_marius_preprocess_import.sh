#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=4:00:00 
#SBATCH --mem=376000
#SBATCH --constraint=LSDF
#SBATCH --job-name=marius_preprocess_all_from_int_sdil_v12_np
#SBATCH --mail-type=ALL
#SBATCH --mail-user=udevz@student.kit.edu
#SBATCH --output=sh/_log_marius_preprocess_all_sdil_from_int_v12_v10_np_slurm.txt
#SBATCH --container-name nv_marius_cuda_cudnn_pyxis_container
#SBATCH --container-mounts=/pfs/work7/workspace/scratch/udevz-ennrot_train_ws:/mount
#SBATCH --container-writable
#SBATCH --container-remap-root
echo 'Start Marius import of data to ready graph for embeddings training'
marius_preprocess --output_dir /mount/mmm_ws/mdat/all_objects_2210_v10_nh_np/ --edges /mount/mmm_ws/01_self_remapped/all_objects_2022_10_v10_np.tsvno_header_mapped.csv -d ',' --dataset_split 0.998 0.001 0.001 --columns 0 1 2 --num_partitions 1 --no_remap_ids --overwrite
echo 'MARIUS worked - all preprocessed'