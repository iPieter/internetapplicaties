library("ggplot2")

# Produces a data set of spiral clusters.
spirals = function (n = c(100, 100, 100), sd = c(0, 0, 0)) 
{
  clusters = length(n)
  x = NULL
  y = NULL
  for (i in 1:clusters) {
    t = seq(1/(4 * pi), 1, length.out = n[i])^0.5 * 2 * pi
    a = rnorm(n[i], sd = sd[i])
    x = c(x, cos(t + (2 * pi * i)/clusters) * (t + a))
    y = c(y, sin(t + (2 * pi * i)/clusters) * (t + a))
  }
  cbind(x, y)
}

#make a dataframe of the generated
df <- as.data.frame(spirals(n=c(100,100,100),sd=c(0.1,0.1,0.1)))

#plot initial data
ggplot(data=df, aes(x=x, y=y)) + 
  geom_point()

#k-means, nstart=20 means 20 tries and using the best result
cf <- kmeans(df, 3, nstart = 20)

#add k means clusters to original data frame
df$cluster <- as.factor(cf$cluster)

#plot clustered data
ggplot(data=df, aes(x=x, y=y, color=cluster )) + 
  geom_point() + theme(legend.position="bottom")

