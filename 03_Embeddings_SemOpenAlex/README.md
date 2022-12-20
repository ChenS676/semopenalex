## Graph Entity Embeddings for SemOpenAlex

### Pre-processing, training and evaluation

*01:* Extracts triples from full RDF dump of SemOpenAlex. Mostly, relevant entity <> entity relations are extracted. Also auxiliary classes are cut short, i.e. intermediate hops are eliminated such as HostVenue between Work and Venue. 

*02:* Converts the extracted triples using the [KGTK package](https://github.com/usc-isi-i2/kgtk), for string abbreviation (replacement of common namespace prefixes and data type labels). Uses `kgtk import_triples` command.

*03:* Map all URIs to integers: enumerate entities and relation identifiers separately, write this conversion to a dict for later re-substitution

*04:* Import the edge list in integer form with Marius to ready for training, produces .bin format files. In addition, the modified source code file of the employed Marius system is given to reproduce the altered Marius import sequence in the directory *marius_code_modifications*. For Marius, see [Marius GitHub](https://github.com/marius-team/marius).

*05:* Embeddings training using five different approaches. Carry out evaluation after each epoch. Re-run the bash script for each epoch subsequently (for GraphSAGE and GAT, only one epoch + eval. fit into the allowed bwHPC runtime of 48h). The included `.sh` shell scripts trigger one epoch of embedding training using the `.yaml` model configuration files in the directory *model_configs*.

*06:* Export the embedding vectors for later use using `marius_postprocess` command on SDIL bwHPC partition.

### Evaluation results

Visualization scripts to plot scores and determine relation-wise performance in folder *evluation*.
Further, the sheet that aggregates the evaluation scores for the training runs for all five approaches. 
