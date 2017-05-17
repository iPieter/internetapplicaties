library("ggplot2")

#generate 3 clusters
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1.5, sd = 0.4), ncol = 2),
           matrix(rnorm(100, mean = -2, sd = 0.6), ncol = 2))
colnames(x) <- c("x", "y")
(cl <- kmeans(x, 2))

#make a dataframe of the generated
df <- as.data.frame(x)

#plot initial data
ggplot(data=df, aes(x=x, y=y)) + 
  geom_point()

#k-means, nstart=20 means 20 tries and using the best result
cf <- kmeans(x[, 1:2], 3, nstart = 20)

#add k means clusters to original data frame
df$cluster <- as.factor(cf$cluster)

#plot clustered data
ggplot(data=df, aes(x=x, y=y, color=cluster,shape=cluster)) +
  geom_point() +
  scale_colour_discrete(guide="legend", name="Clusters") +
  scale_shape(name="Clusters") + 
  theme(legend.position="bottom")