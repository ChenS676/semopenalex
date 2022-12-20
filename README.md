# SemOpenAlex
This is the private code repo for the master's thesis on OpenAlex, SemOpenAlex and the generation of entity embeddings for SemOpenAlex.  

## Contents 
This repository covers:
1. the code for initial analysis of the source OpenAlex data set in *01_Analysis_OpenAlex*,
2. the code for transforming the OpenAlex data dump into the semantic scholarly knowledge graph SemOpenAlex in *02_Transformation_SemOpenAlex*, 
3. and code and configuration files for the generation of graph entity embeddings on the data in SemOpenAlex *03_Embeddings_SemOpenAlex*.


## Embeddings

Pre-processing, training and evaluation:
*01:* Extracts triples from full RDF dump of SemOpenAlex. Mostly, relevant entity <> entity relations are extracted. Also auxiliary classes are cut short, i.e. intermediate hops are eliminated such as HostVenue between Work and Venue. 

*02:* Converts the extracted triples using the [KGTK package](https://github.com/usc-isi-i2/kgtk), for string abbreviation (replacement of common namespace prefixes and data type labels)

*03:* Map all URIs to integers: enumerate entities and relation identifiers separately, write this conversion to a dict for later re-substitution

*04:* Import the edge list in integer form with Marius to ready for training, produces .bin format files. In addition, the modified source code file of the employed Marius system is given to reproduce the altered Marius import sequence. For Marius, see [Marius GitHub](https://github.com/marius-team/marius).

*05:* Embeddings training using five different approaches. Carry out evaluation after each epoch. Re-run the bash script for each epoch subsequently (for GraphSAGE and GAT, only one epoch + eval. fit into the allowed bwHPC runtime of 48h).
Further, the included `.sh` shell scripts trigger one epoch of embedding training using the `.yaml` model configuration files in the directory *model_configs*.

*06:* Export the embedding vectors for later use.


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
