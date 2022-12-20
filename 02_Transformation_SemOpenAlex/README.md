## Transformation OpenAlex -> SemOpenAlex

The script files in this directory transform raw data dump `.jsonl` files of the OpenAlex data set into semantic RDF files in `.nt` format 
that serve as the basis for SemOpenAlex.

Since the dump files are separated for the five main entity types works, authors, institutions, venues and concepts, the transformation 
is carried out separately. 

The author and work transformations utilize multiprocessing via the Python multiprocessing package. 
