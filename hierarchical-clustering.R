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





# binary_data_cluster.r

dat <- read.table(file="binary_data.txt", header = TRUE, row.names = 1)

## Hierarchical clustering
d <- dist(dat, method = "binary")
hc <- hclust(d)
plot(hc)

clusters <- cutree(hc, k = 2)

print(clusters)

###  B-1  Hierarchicl clustering
dat = read.table("tissue_data.txt", header=TRUE)

y = as.matrix(dat)


## we cluster using direct distance measure:
dd = dist(y, method="euclidean") # no need to transpose. Finds distance measures on genes.
## perform hierarchical clustering with "complete" linkage
hr <- hclust(dd, method = "complete", members=NULL)
plot(hr)

## This will cluster on tissues -- just transpose
yy = t(y)
dd1 = dist(yy)
hr1 <- hclust(dd1, method = "complete", members=NULL)
plot(hr1)


# Create heatmap directly. This performs hierarchical clutering both ways.
heatmap(y)


### Can skip the following in a demo.

#### Clustering with correlation matrix --  similariry measures
# create correlation matrix (similarity measure)
# t(y) creates transpose of y. This is on genes. cor(y) is on samples.
# c <- cor(t(y), method="spearman")
c <- cor(y,method="spearman")

# find distance measure matrix. 
# If c is similariry, d = max(c) - c
d <- as.dist(1-c)

# perform hierarchical clustering with "complete" linkage
hr <- hclust(d, method = "complete", members=NULL) 

# plot the cluster result into a dendogram
par(mfrow = c(2, 2))
plot(hr, hang = 0.1)
plot(hr, hang = -1) 
plot(as.dendrogram(hr), edgePar=list(col=3, lwd=4), horiz=T) 

##########
