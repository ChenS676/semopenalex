# SemOpenAlex
This is the private code repo for the master's thesis on OpenAlex, SemOpenAlex and the generation of entity embeddings for SemOpenAlex.  

## Contents 
This repository covers the code for:
1. analysis of the source OpenAlex data set for all entity types and key statistics in *01_Analysis_OpenAlex*,
2. transforming the OpenAlex data dump into the semantic scholarly knowledge graph SemOpenAlex in *02_Transformation_SemOpenAlex*, 
3. and code and configuration files for the generation of graph entity embeddings on the data in SemOpenAlex *03_Embeddings_SemOpenAlex*.

Detailed instructions can be found in the respective sub-directories.

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

## Schema 

The full current schema of the knowledge graph SemOpenAlex is included in the file `SemOpenAlex_full_schema_2022_12_02.pdf`.
