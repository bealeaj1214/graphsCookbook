
metals <- read.csv("../data/metals.csv")

book.recipe.03 <-function() {
  boxplot(Cu ~ Source, data=metals, varwidth=TRUE,
          main="Summary of Copper concentrations by Site")
}
