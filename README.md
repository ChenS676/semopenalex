# SemOpenAlex
This is the private code repo for the master's thesis on OpenAlex, SemOpenAlex and the generation of entity embeddings for SemOpenAlex.  

## Contents 
This repository covers:
1. the code for initial analysis of the source OpenAlex data set in *01_Analysis_OpenAlex*,
2. the code for transforming the OpenAlex data dump into the semantic scholarly knowledge graph SemOpenAlex in *02_Transformation_SemOpenAlex*, 
3. and code and configuration files for the generation of graph entity embeddings on the data in SemOpenAlex *03_Embeddings_SemOpenAlex*.

Note that the folder *03_Embeddings_SemOpenAlex* includes the ordered pre-processing scripts to ready the data for training. 

Pre-processing step #2 requires the [KGTK package](https://github.com/usc-isi-i2/kgtk).

In addition, the modified source code file of the employed Marius system is given to reproduce the altered Marius import sequence. 
For Marius, see [Marius GitHub](https://github.com/marius-team/marius).
All rights regarding the Marius system belong to their developers. 

Further, the included `.sh` shell scripts trigger one epoch of embedding training using the `.yaml` model configuration files in the directory *model_configs*.


## Required packages / libraries

- requests
- json
- matplotlib
- numpy
- rdflib
- gzip
- multiprocessing
- kgtk
- marius
