##             Tutorial for hierarchical and K-means clustering


######################################################################

##################  A-1.  K-means ckustering  #########################

## read data file
dat = read.table("clusterdata.txt", header=TRUE)

## Look at the scatter plot for any cluster patterns
plot(dat$BP_condition_1, dat$BP_condition_2, col="blue")



# In the scatter plot, we say 3 clusters.
# Perform k-means clustering with 3 clusters
cl <- kmeans(dat, 3, algorithm="Lloyd") # this is default algorithm, if you forget to mention
# Other options are:  algorithm = c("Hartigan-Wong", "Lloyd", "Forgy","MacQueen"))

# Plot the cluster data and the cluster centers:
plot(dat, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex=2)

## print the number of data points in each cluster:
print(cl$size)

## print various results of clustering
## Print cluster category of each data point:
print(cl$cluster)

## print cluster centroids
print(cl$centers) 
x
## print sum of squared distances of each data point to the global sample mean(centroid.  This is called "total_SS" paramter
print(cl$totss)

## print the sum of squared distances of means(centroids) of individual clusters to the global mean(centroid) . This is called " between_SS" paramter
### NOTE : When computing this, you multiply the squared distance of each centroid to the global centroid by the number of data points it represents.
print(cl$betweenss)

## NOTE:
## Take a ratio of between_SS to the total_SS.   
## If there is no identifiable clustering, the centroid of individual clusters should
##   close to the global means, and this ratio should be small.
## If the ratio is big, this means there is discernable clustering
clratio = cl$betweenss/cl$totss
print(clratio) 


################   K-means cluster of iris data set

## include iris data set (created by Ronald Fisher in 1936)
data(iris)

## see the data
print(iris)

## For 3 species of iris flower, 4 paramters namely "Sepal length", Sepal width",
##  "petal length" and 'petal width" are measured.

## plot the scatter plot of Sepal.Length and Sepal.width
plot(iris$Sepal.Length, iris$Sepal.Width)

## plot the scatter plot of Petal.Length and Petal.Width
plot(iris$Petal.Length, iris$Petal.Width)

### Student exercise :
## 1. Print the quality of 3 clustering of 3rd and 4th columns

## 2. perform clustering of 1 and 2 column for various number of clusters

##  etc etc.





###################################

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
# If c is imilariry, d = max(c) - c
d <- as.dist(1-c)

# perform hierarchical clustering with "complete" linkage
hr <- hclust(d, method = "complete", members=NULL) 

# plot the cluster result into a dendogram
par(mfrow = c(2, 2))
plot(hr, hang = 0.1)
plot(hr, hang = -1) 
plot(as.dendrogram(hr), edgePar=list(col=3, lwd=4), horiz=T) 

##########







