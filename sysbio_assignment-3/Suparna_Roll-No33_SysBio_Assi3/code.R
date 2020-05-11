library(igraph)

# Load the interactions file
interactions <- read.table("gene_attribute_edges.txt", sep = "\t", header = TRUE, stringsAsFactors = FALSE)

# Create a new data frame with relevant information for building a network
TF_to_gene_table = data.frame(TF = interactions$target, GENE = interactions$source, weight = interactions$weight, stringsAsFactors = FALSE)

# Build directed network
graph_TF_G = graph_from_data_frame(d=TF_to_gene_table, directed = T)

## Question 1
# Calculate degrees of transcription factors only
degs_TF <- degree(graph = graph_TF_G, loops = FALSE, mode = "out", v = unique(TF_to_gene_table$TF))

# Find transcription factor with maximum degree
TF <- degs_TF[which(degs_TF == max(degs_TF))]

print(TF)

## Question 2
# Find out the gene names
genes_without_TF <- setdiff(unique(TF_to_gene_table$GENE), unique(TF_to_gene_table$TF))

# Calculate degrees of genes only
degs_genes <- degree(graph = graph_TF_G, loops = FALSE, mode = "in", v = genes_without_TF)

# Find gene with maximum degree
gene <- degs_genes[which(degs_genes == max(degs_genes))]

print(gene)

### Question 3

## For ETV7
# Logical vector
vals <- grepl("ETV7", TF_to_gene_table$GENE)

# Select TF for ETV7
tf <- TF_to_gene_table[vals,1]

# Save to text file
sink(file = "TF-ETV7.txt", append = TRUE)
print(degs_genes["ETV7"], quote = FALSE)
print("Transcription factors connected to gene ETV7 are: ", quote = FALSE)
print(tf, quote = FALSE)
sink()

## For OAS2
# Logical vector
vals <- grepl("OAS2", TF_to_gene_table$GENE)

# Select TF for OAS2
tf <- TF_to_gene_table[vals,1]

# Save to text file
sink(file = "TF-OAS2.txt", append = TRUE)
print(degs_genes["OAS2"], quote = FALSE)
print("Transcription factors connected to gene OAS2 are: ", quote = FALSE)
print(tf, quote = FALSE)
sink()

## For AFF1
# Logical vector
vals <- grepl("AFF1", TF_to_gene_table$GENE)

# Select TF for AFF1
tf <- TF_to_gene_table[vals,1]

# Save to text file
sink(file = "TF-AFF1.txt", append = TRUE)
print(degs_genes["AFF1"], quote = FALSE)
print("Transcription factors connected to gene AFF1 are: ", quote = FALSE)
print(tf, quote = FALSE)
sink()

## For ITPKB
# Logical vector
vals <- grepl("ITPKB", TF_to_gene_table$GENE)

# Select TF for ITPKB
tf <- TF_to_gene_table[vals,1]

# Save to text file
sink(file = "TF-ITPKB.txt", append = TRUE)
print(degs_genes["ITPKB"], quote = FALSE)
print("Transcription factors connected to gene ITPKB are: ", quote = FALSE)
print(tf, quote = FALSE)
sink()

## For RORA
# Logical vector
vals <- grepl("RORA", TF_to_gene_table$GENE)
# Select TF for RORA
tf <- TF_to_gene_table[vals,1]

# Save to text file
sink(file = "TF-RORA.txt", append = TRUE)
print(degs_genes["RORA"], quote = FALSE)
print("Transcription factors connected to gene RORA are: ", quote = FALSE)
print(tf, quote = FALSE)
sink()

## Question 4

# Plot histogram and save as PNG
png(filename = "Histogram.png")
hist(x = degs_genes, xlab = "No. of Transcription Factors", ylab = "Number of Genes", main = "Histogram of Number of Transcription Factors Per Gene", ylim = c(0,2000), xlim = c(0,200), breaks = 50)
dev.off()