#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=15:00:00 
#SBATCH --mem=752000
#SBATCH --job-name=mtrain_complex_w01_gpu_8_100dim_v10_adam_500negs
#SBATCH --mail-type=ALL
#SBATCH --mail-user=udevz@student.kit.edu
#SBATCH --output=sh/_log_mtrain_complex_w01_gpu_8_100dim_v10_adam_500negs.txt
#SBATCH --container-name nv_marius_gpu8_cuda_cudnn_pyxis_container
#SBATCH --container-mounts=/pfs/work7/workspace/scratch/udevz-ennrot_train_ws:/mount_ws,/home/kit/stud/udevz:/mount_home
#SBATCH --container-writable
#SBATCH --container-remap-root
#SBATCH --gres=gpu:1
echo 'los'
marius_train /mount_home/mmm/mcon/03_complex/lp_complex_w01_train_100dim_allv10_hms_adam_500negs.yaml
echo 'done training'
echo 'start eval #1'
marius_eval /mount_home/mmm/mcon/03_complex/lp_complex_w01_train_100dim_allv10_hms_adam_500negs.yaml
echo 'done eval'
echo 'all done'