
dat <- read.table(file="binary_data.txt", header = TRUE, row.names = 1)

## Hierarchical clustering
d <- dist(dat, method = "binary")
hc <- hclust(d)
plot(hc)

clusters <- cutree(hc, k = 2)

print(clusters)

X11()

## K-means clustering
mat = as.matrix(dat)
mat.norm <- mat/ sqrt(2*rowSums(mat))
##kc = dist(mat.norm, "euclidean")
##plot(kc)
c1 = kmeans(mat.norm, 2)
 plot(mat.norm, col=c1$cluster)


