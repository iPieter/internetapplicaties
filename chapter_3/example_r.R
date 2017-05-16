#Comments beginnen met een #-teken.
#Het alloceren van een vector
positie <- c(0,5,0)
#Het is ook mogelijk om automatisch een vector op te vullen
sequence <- seq(from=0, to=10, by=1) #sequence = {0,1,2,3,4,5,6,7,8,9,10}
#Of om een bepaalde herhaling uit te voeren
rep = rep(2, times=5) #rep = {2, 2}, 2 kan ook een vector zijn
#Optellen van 2 vectoren
delta_pos <- {1,0,0}
positie = positie + delta_pos
#constanten en een vector:
positie = positie * 0.5
#Vectoren in R beginnen, in tegenstelling tot veel andere talen, bij 1:
first_element = sequence[1]
last_element = sequence[11]
#Alles behalve 1 element:
all_without_first = sequence[-1]
#Subset:
first_five = sequence[1:5]
#Matrices
mat = matrix(1:9, nrow=3, byrow=TRUE) #Vult de matrix met waarden per rij( dus rij 1: 1,2,3 )
mat = matrix(1:9, nrow=3, byrow=FALSE) #Vult de matrix met waarden per kolom( dus rij 1: 1,4,7 )
#Matrices indexering:
top_left = mat[1,1] #top_left = 1
row_two = mat[2,] #row_to = {2,5,8}

mean <- function( input )
{
	return( sum( input ) / length( input ) )
}
mean( c( 5, 10 ) ) #print 7.5 uit