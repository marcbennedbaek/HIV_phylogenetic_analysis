# Module with LSD version 0.3 beta installation
module load lsd/0.3beta

# Command line usage for dating of subtypes using LSD and isolation of subtype specific trees, rooted based on outgroups
lsd -i <input_tree.nwk> -d <date_file> -g <outgroup_list> -o <output_name> -c -s 7125 -f 1000
