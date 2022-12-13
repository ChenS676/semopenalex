#import numpy as np
#import random
#import pandas as pd
import csv
import sys


delim_char = "\t"

def convert_triple_strings_to_int(fn):

    line_count = 0
    entity_count = 0
    relations_count = 0
    entity_dict = {}
    relations_dict = {}
    fn_new = fn+'no_header'
    
    # read triple file and add all node or relation identifiers to a dictionary 
    with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/03_imported_nt_kgtk/" + fn), "r", encoding='utf-8') as f:
        print("Creating dictionaries.. ")
        for line in f:
            line=line.strip("\n")
            #print("Dictionary: " + str(line_count))
            if len(line.split(delim_char)) > 1 and line_count != 0:
                sub = line.split(delim_char)[0]
                pred = line.split(delim_char)[1]
                obj = line.split(delim_char)[2]
                if not sub in entity_dict:
                    entity_dict[sub] = entity_count
                    entity_count += 1
                if not pred in relations_dict:
                    relations_dict[pred] = relations_count
                    relations_count += 1
                if not obj in entity_dict:
                    entity_dict[obj] = entity_count
                    entity_count += 1 

            if line_count%25000000==0:
                print("Reading line", (line_count/1000000),"mio.")
            line_count += 1

    print("FILE: ",str(fn))
    print('entity count', entity_count)
    print(relations_dict)
    print('^ relation count', relations_count)
    line_count = 0
    
    # write dictionaries (they describe the mapping of node and relation identifiers to integers used later in training)
    with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/04_integer_mapped/"+fn_new+"_entities.dict"), "w") as f:
        for item in entity_dict:
            f.write(str(entity_dict[item]) + "\t" + str(item) + "\n")
    with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/04_integer_mapped/"+fn_new+"_relations.dict"), "w") as f:
        for item in relations_dict:
            f.write(str(relations_dict[item]) + "\t" + str(item) + "\n")
    with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/04_integer_mapped/"+fn_new+"counts.txt"), "w") as f:
        s = str('entity count: '+ str(entity_count)+' - relation count: '+ str(relations_count))
        f.write(s)
    
    # convert the source edge list (of mostly strings) to an all-integer mapped edge list in .csv format using the previously created mapping dictionaries
    with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/03_imported_nt_kgtk/" + fn), "r", encoding='utf-8') as f:

        with open(str("/lsdf/kit/aifb/projects/sqa/semopenalex/embeddings/04_integer_mapped/"+fn_new+"_mapped.csv"),"w",encoding='utf-8',newline='') as m:

            print("Mapping...")
            writer = csv.writer(m)
            for line in f:
                line=line.strip("\n")
                if len(line.split(delim_char)) > 1 and line_count != 0:
                    sub = line.split(delim_char)[0]
                    pred = line.split(delim_char)[1]
                    obj = line.split(delim_char)[2]
                    #num = random.randint(1, 1000)
                    #writer.writerow(str(entity_dict[sub]) + "\t" + str(relations_dict[pred]) + "\t" + str(entity_dict[obj]))
                    writer.writerow((entity_dict[sub],relations_dict[pred],entity_dict[obj]))

                if line_count%25000000==0:
                    print("Mapping line", (line_count/1000000),"mio.")
                line_count += 1

    print('entity count', entity_count)
    print(relations_dict)
    print('^ relation count', relations_count)

    return True


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print(('usage: python3 integer_mapping_lsdf_.py <file_to_process.tsv>'))
        sys.exit()
    text_file_to_process = sys.argv[1]  # "all_objects.tsv"
    ret = convert_triple_strings_to_int(text_file_to_process)
    if not ret:
        print("### Done ###")
        sys.exit()
