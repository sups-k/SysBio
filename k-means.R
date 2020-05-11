# 9 May 2020
# K-means clustering

dat = read.table("bp.txt", header = TRUE)

plot(dat$BP_condition_1, dat$BP_condition_2)

cl <- kmeans(dat, 3, algorithm = "Lloyd") # Can also use MacQueen algorithm - check online what is used where

plot(dat, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)

print(cl$size)
print(cl$cluster)
print(cl$centers)

# K-means using R dataset "iris" - created by Ronald Fischer
data("iris")

plot(iris$Sepal.Length, iris$Sepal.Width)

plot(iris$Petal.Length, iris$Petal.Width)

# 1. Print quality of 3 clustering of 3rd and 4th col
# 2. Perform clustering on 1 and 2 col for various clusters