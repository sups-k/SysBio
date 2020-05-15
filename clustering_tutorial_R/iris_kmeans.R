# K-Means Clustering with the "iris" dataset created by Ronald Fischer
# Created by Suparna Kumar
# 9 May 2020


# Include iris dataset
data(iris)

# View the data using the Environment pane
View(iris)

# The iris dataset contains 3 species of iris - setosa, versicolor, and virginica.
# Four parameters are measured - sepal length, sepal width, petal length, and petal width.

# Plot the scatter plot of sepal length and sepal width
plot(iris$Sepal.Length, iris$Sepal.Width, ylim = c(2,7.9), xlim = c(2,7.9))

# Plot the scatter plot of petal length and petal width
plot(iris$Petal.Length, iris$Petal.Width, xlim = c(0.1, 6.9), ylim = c(0.1, 6.9))


### 1. Print quality of clustering of petal length and petal width.

# Cluster petal length and petal width into 3 clusters
petal <- iris[,c(3,4)]
petal_cluster <- kmeans(x = petal, centers = 3, nstart = 25)

plot(petal, col = petal_cluster$cluster, xlim = c(0.1, 6.9), ylim = c(0.1, 6.9))

# Plot cluster centres
points(petal_cluster$centers, col = 1:2, pch = 8, cex = 2)

# Print the number of data points in each cluster:
print(petal_cluster$size)

# Print cluster category of each data point:
print(petal_cluster$cluster)

# Print cluster centroids
print(petal_cluster$centers) 

#Print the total sum of squares of distances of each point in the data space to the global centroid
print(petal_cluster$totss)

# Print the total sum of squares of distances of each cluster centroid to the global centroid
print(petal_cluster$betweenss)

# Clustering Ratio of between SS to total SS - check if ratio is close to 1
clratio = petal_cluster$betweenss/petal_cluster$totss
print(clratio)
# 0.9430539






### 2. Perform clustering on sepal length and sepal width for various numbers of clusters.

# Cluster sepal length and sepal width into 3 clusters
sepal <- iris[,c(1,2)]
sepal_cluster <- kmeans(x = sepal, centers = 3, nstart = 25)

plot(sepal, col = sepal_cluster$cluster, ylim = c(2,7.9), xlim = c(2,7.9))

# Plot cluster centres
points(sepal_cluster$centers, col = 1:2, pch = 8, cex = 2)

# Print the number of data points in each cluster:
print(sepal_cluster$size)

# Print cluster centroids
print(sepal_cluster$centers) 

# Clustering Ratio of between SS to total SS - check if ratio is close to 1
clratio_3 = sepal_cluster$betweenss/sepal_cluster$totss
print(clratio_3)
# 0.7160328



# Cluster sepal length and sepal width into 4 clusters
sepal_cluster <- kmeans(x = sepal, centers = 4, nstart = 25)

plot(sepal, col = sepal_cluster$cluster, ylim = c(2,7.9), xlim = c(2,7.9))

# Plot cluster centres
points(sepal_cluster$centers, col = 1:2, pch = 8, cex = 2)

# Print the number of data points in each cluster:
print(sepal_cluster$size)

# Print cluster centroids
print(sepal_cluster$centers) 

# Clustering Ratio of between SS to total SS - check if ratio is close to 1
clratio_4 = sepal_cluster$betweenss/sepal_cluster$totss
print(clratio_4)
# 0.7856576



# Cluster sepal length and sepal width into 5 clusters
sepal_cluster <- kmeans(x = sepal, centers = 5, nstart = 25)

plot(sepal, col = sepal_cluster$cluster, ylim = c(2,7.9), xlim = c(2,7.9))

# Plot cluster centres
points(sepal_cluster$centers, col = 1:2, pch = 8, cex = 2)

# Print the number of data points in each cluster:
print(sepal_cluster$size)

# Print cluster centroids
print(sepal_cluster$centers) 

# Clustering Ratio of between SS to total SS - check if ratio is close to 1
clratio_5 = sepal_cluster$betweenss/sepal_cluster$totss
print(clratio_5)
# 0.8393768



# Cluster sepal length and sepal width into 6 clusters
sepal_cluster <- kmeans(x = sepal, centers = 6, nstart = 25)

plot(sepal, col = sepal_cluster$cluster, ylim = c(2,7.9), xlim = c(2,7.9))

# Plot cluster centres
points(sepal_cluster$centers, col = 1:2, pch = 8, cex = 2)

# Print the number of data points in each cluster:
print(sepal_cluster$size)

# Print cluster centroids
print(sepal_cluster$centers) 

# Clustering Ratio of between SS to total SS - check if ratio is close to 1
clratio_6 = sepal_cluster$betweenss/sepal_cluster$totss
print(clratio_6)
# 0.8671559

# As we can see, the sepal width and sepal length cluster well into 6 clusters instead of 3.