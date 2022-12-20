## Transformation OpenAlex -> SemOpenAlex

The script files in this directory transform raw data dump `.jsonl` files of the OpenAlex data set into semantic RDF files in `.nt` format that serve as the basis for SemOpenAlex.

Since the dump files are separated for the five main entity types `works`, `authors`, `institutions`, `venues` and `concepts`, the transformation is carried out separately. 

The `rdflib` package introduces some namespaces and vocabularies, while others are introduced via the SemOpenAlex ontology, and validates and serializes the created triples via a buffer graph.

The author and work transformations employ multiprocessing via the Python `multiprocessing` package. 
