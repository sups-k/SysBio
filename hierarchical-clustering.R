# 9 May 2020

dat = read.table("tissue_data.txt", header = T)
y = as.matrix(dat)

dd = dist(y, method = "euclidean") # no need to transpose; finds distance measure on genes
hr <- hclust(dd, method = "complete", members = NULL)

# For clustering tissues, just transpose the matrix
yy = t(y)
dd1 = dist(yy)
hr1 <- hclust(dd1)

# Making heatmaps for publications - pheatmap
library(pheatmap)

data <- read.table()

pheatmap(data, scale = "row", clustering_distance_rows = "correlation")