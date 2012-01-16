
metals <-read.csv("../data/metals.csv")

book.recipe.07a <-function(){
  boxplot(metals[,-1],
          border="white",col="black",boxwex=0.3,
          medlwd=1,whiskcol="black",staplecol="black",
          outcol="red",cex=0.3,outpch=19,
          main="Summary of metal concentration by Site")

  grid(nx=NA,ny=NULL,col="gray",lyt="dashed")

}
