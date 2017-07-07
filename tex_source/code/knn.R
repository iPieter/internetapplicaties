library("ggplot2")
library("FNN")

gen_matrix <- function(n, sd, mean, class)
{
  cluster <- matrix( rnorm(n*2, sd = sd, mean = mean),ncol = 2 )
  cluster <- cbind( cluster, rep(class,times=n) )
  colnames( cluster ) <-c("x","y","class")  
  return( cluster )
}

#generate 3 clusters

df <- data.frame( gen_matrix( 100, 0.3, 0.1, 1 ) )
df <- rbind( df, gen_matrix( 100, 0.3, 1.5, 2 ) )
df <- rbind( df, gen_matrix( 100, 0.3, 3, 3 ) )

test_point <- c(1.5, 1.5, 4)

ggplot(df,aes(x,y))+
  geom_point(aes(colour=factor(class),shape=factor(class))) +
  geom_point( aes(x=test_point[1], y=test_point[2], 
                  colour=factor(test_point[3]),
                  shape=factor(test_point[3]))) + 
  scale_colour_discrete(guide="legend", name="Clusters") +
  scale_shape(name="Clusters") + 
  theme(legend.position="bottom")

result <- knn( df, test_point , df$class, k = 15  )
test_point[3] = as.numeric( sub("Level:","",result) )

ggplot(df,aes(x,y))+
  geom_point(aes(colour=factor(class),shape=factor(class))) +
  scale_colour_discrete(guide="legend", name="Clusters") +
  scale_shape(name="Clusters") + 
  theme(legend.position="bottom")
