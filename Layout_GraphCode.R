#Ncliqie
Nclique <- read.csv("~/Google Drive/Hofstra/classes/BAN 257 /Nclique-2.csv", header=T)
colnames(Nclique) = c(1:10)
g = graph.adjacency(as.matrix(Nclique) )
# orginal Plot 
plot(g, edge.arrow.size=0,vertex.cex = .8)
# Lets stimplify
g = simplify(g, remove.loops = TRUE)
plot(g, edge.arrow.size=0,vertex.cex = .8)

# Now lets focus on changing the same graph 
set.seed(8888)
#We can change a number of the edge attributes
plot(g, edge.arrow.size=.2,vertex.cex = .8)  # adds a small arrow
plot(g, edge.arrow.mode=0,vertex.cex = .8)  # removes arrow
plot(g, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue
plot(g, edge.arrow.size=0, edge.color="blue", edge.width=.2, vertex.cex = .8)  # change color to blue and thins it out. 
plot(g, edge.arrow.size=0, edge.color="blue", edge.width=.2, edge.lty=2, vertex.cex = .8)  # change color to blue and thins it out and converts to dashed line
#0 and “blank” mean no edges, 1 and “solid” are for solid lines, the other possible values are: 2 (“dashed”), 3 (“dotted”), 4 (“dotdash”), 5 (“longdash”), 6 (“twodash”).
plot(g, edge.curved=TRUE, edge.arrow.size=0, edge.color="blue", edge.width=.2, edge.lty=2, vertex.cex = .8)  # Now curve the edges, especially useful for directed graphs

plot(g, edge.arrow.mode=0,vertex.cex = .8, vertex.size = 10 )  # Controls the text size and changes the circle size
plot(g, edge.arrow.mode=0,vertex.cex = .8, vertex.size = 10, vertex.color="red" )  # Controls the text size and changes the circle size, now change the color
plot(g, edge.arrow.mode=0,vertex.cex = .8, vertex.size = 10, vertex.color="red", vertex.frame.color="yellow" )  # Controls the text size and changes the circle size, now change the color, change the outline
plot(g, edge.arrow.mode=0,vertex.cex = .8, vertex.size = 20, vertex.color="red", vertex.frame.color="yellow", vertex.shape="square" )  # Controls the text size and changes the circle size, now change the color, change the outline, change the shape to rectangle
plot(g, edge.arrow.mode=0,vertex.cex = .8, vertex.size = 20, vertex.size2 =80,vertex.color="red", vertex.frame.color="yellow", vertex.shape="rectangle" )  #  For some of the shapes size2 can be used
#“circle”, “square”, “csquare”, “rectangle”, “crectangle”, “vrectangle”, “pie” (see vertex.shape.pie), ‘sphere’, and “none”

plot(g, vertex.label.family="Helvetica", vertex.label.font = 0, vertex.cex=.1, vertex.size=20)
plot(g,   vertex.cex=.4, vertex.size=20)
plot(g,   vertex.cex=.4, vertex.size=20, vertex.label.color='purple') # change color of label 
plot(g,   vertex.cex=.4, vertex.size=30, vertex.label.dist=1, vertex.label.degree=pi) #0,1,pi -pi/2

# For more info on fonts: https://cran.r-project.org/web/packages/svglite/vignettes/fonts.html
#1 is plain text, 2 is bold face, 3 is italic, 4 is bold and italic and 5 specifies the symbol font.

# aspect ratio  provides a zoom in zoom out
plot(g, asp=.8, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue
plot(g, asp=.2)

# provide a set of axes

plot(g, axes=TRUE,  edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue

#notice that the coordinates appear to be from -1,1 on the x-axis, and -1,1 on the y axis
# this is becuase the coordinates are scaled

# turn off scaling

plot(g, rescale=F , axes=TRUE,  edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue
# but now we cant (may not) be able to see the graph.

# So lets change the aspect ratio. 
plot(g, rescale=F , axes=TRUE, asp=.3, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue

# where are the coordinates? 

# coordinates come from the different layouts. 
# The matrix is ultimately a xy coordinate for each of the vertexes, thus we need to have a row for each of the verteces

#How many vertices in each graph ? 
gsize(g)  # of edges

length(V(g))  # number of Vertices
length(E(g))  # number of Edges

# So what now? We could put the coordinates where ever we want
newcoords = matrix( c(rnorm(10,0,1), rnorm(10,0,1)), byrow=T, ncol=2)
newcoords
plot(g, layout=newcoords, rescale=F , axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)  # change color to blue

#now there are some better layouts than random
# we can use them directly in the function 



#Cirlce Layout
coords <- layout_in_circle(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#Component Wise Layout
coords <- layout_as_tree(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#nicely  Layout
coords <- layout_nicely(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#Davidson-Harel layout algorithm
coords <- layout_with_dh(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#Fruchterman-Reingold layout algorithm
coords <- layout_with_fr(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#GEM layout algorithm
coords <- layout_with_gem(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#The graphopt layout algorithm, for large graphs
coords <- layout_with_gem(g)
plot(g, layout=coords,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)

#Kamada-Kawai layout algorithm 3d
#layout_with_lgl for larger graphs
#layout_with_mds based on Multidimensional Scaling
coords = layout_with_sugiyama(g)
plot(g, layout=coords$layout,axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8)


# now more fun with plots
rglplot(g)  #3D rotational plots 
tkplot(g)  # interactive plots to get. 


#Focusing on certain edges and certain nodes. 
V(g)$name[1:2] = c('a','b')
plot(g, axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8, )


#Focusing on certain edges and certain nodes. 
E(g)$
plot(g, axes=TRUE, asp=1.2, edge.arrow.size=.2, edge.color="blue", vertex.cex = .8, )

