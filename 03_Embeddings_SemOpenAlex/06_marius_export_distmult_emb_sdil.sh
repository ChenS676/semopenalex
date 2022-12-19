#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=48:00:00 
#SBATCH --mem=376000
#SBATCH --job-name=emb_export_distmult_csv_marius_im_ws_container
#SBATCH --mail-type=ALL
#SBATCH --mail-user=udevz@student.kit.edu
#SBATCH --output=sh/_log_emb_export_distmult_csv_marius_im_ws_container.txt
#SBATCH --container-name nv_marius_gpu8_cuda_cudnn_pyxis_container
#SBATCH --container-mounts=/pfs/work7/workspace/scratch/udevz-ennrot_train_ws:/mount_ws
#SBATCH --container-writable
#SBATCH --container-remap-root
#SBATCH --gres=gpu:1
echo 'los'
marius_postprocess --model_dir /mount_ws/mmm_ws/mmod/02_distmult/w01 --format csv --output_dir /mount_ws/mmm_ws/mmod/parquet_export/02_distmult
echo 'Embedding export successful!' 
echo 'start gzip of embeddings'
gzip -k -v --fast /mount_ws/mmm_ws/mmod/parquet_export/02_distmult/embeddings.csv
echo 'done zipping'
