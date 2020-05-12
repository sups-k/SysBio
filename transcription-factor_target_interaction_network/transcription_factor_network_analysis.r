# create a directed network of transcription factor - target interactions 
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3079585/
# set working directory
#setwd("Applications/igraph_tutorial")
# load the database table
#gene_attribute_table = read.delim("gene_attribute_edges.txt", sep = "\t", header = T)


# load igraph
library(igraph)


gene_attribute_table = read.table("~/Downloads/R_Prog/SysBio/transcription-factor_target_interaction_network/gene_attribute_edges.txt", sep = "\t", header = T)


dim(gene_attribute_table)
head(gene_attribute_table)

# first row is also information about columns.
# remove it
#gene_attribute_table = gene_attribute_table[-1,]

# transcription factors are in the column "target" and 
# genes are in the column "source"

# create a new dataframe with two columns: "TF" and "GENE"

#TF_gene_table = data.frame(TF = gene_attribute_table$target[1:100], GENE = gene_attribute_table$source[1:100])
TF_gene_table = data.frame(TF = gene_attribute_table$target, GENE = gene_attribute_table$source)

dim(TF_gene_table)
head(TF_gene_table)

# create graph from table
g_TF_gene = graph_from_data_frame(d=TF_gene_table, directed = T)
g_TF_gene

deg = degree(g_TF_gene)

# nodes with degree more than 150
deg[deg > 150]
# histogram of degrees in log2 scale
hist(log2(deg), breaks = 100, xlim = c(0,16))

deg_high = deg[deg>150]
X11()
hist(log2(deg_high),breaks=100)


## centrality measures

degree_centrality = as.vector(degree(g_TF_gene))

closeness_centrality = as.vector(closeness(g_TF_gene))

eigenvector_centrality = as.vector(eigen_centrality(g_TF_gene)$vector)

betweenness_centrality = as.vector(betweenness(g_TF_gene))

dcm = data.frame(names(deg),deg,degree_centrality, closeness_centrality, eigenvector_centrality, betweenness_centrality)

write.csv(dcm, "TF_centrality_measures.csv",row.names=FALSE)




