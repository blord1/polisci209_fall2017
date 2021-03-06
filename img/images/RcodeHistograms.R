### Histograms, Means, and SD
### Florian Hollenbach
### Polisci 209 - Fall 2017



##### first make sure ggplot2 is installed
library(ggplot2)
### if you didn't get an error, you already installed this package
### we will use ggplot to make some nice graphs
### you can always find help for ggplot here: http://ggplot2.tidyverse.org/


### ggplot also comes within a different package suit that we will use, but it is good to know you installed it separately
### let's install tidyverse which allows us to manipulate and play with data

install.packages("tidyverse")
### load tidyverse
library("tidyverse")


### we are now ready to load our data set

#income_data <- readr::read_csv("~/Dropbox/TAMU/Teaching/Fall2017/slides/week3/data.csv")
### this is for mac, you need to change the path to where you saved the file
### mac:
income_data <- readr::read_csv("~/Desktop/class209/data.csv")

### your windows path would be something like this
#### income_data <- readr::read_csv("C:\\Users\\fhollenbach\\Desktop\\class209\\data.csv")


### remeber the head function, glimpse in tiblle does the same
tibble::glimpse(income_data)
head(income_data)

### the object data is a data frame
class(income_data)
### you can access individual columns or variables using the $$$ sign and the name of the column or variable
###. for example
income_data$lGDP

### alternatively, recall that a data frame is just a matrix
### matrices can also be accessed by indexing their columns or rows, the first index is the row, second is the column
income_data[,1] ### accesses the first column, i.e. the GDP variable
income_data[1,] ### accesses the first row for all variables


## the function dim() can tell us the dimensions of a data frame, i.e. rows and columns
dim(income_data)

### ggplot() allows us to draw nice plots
### first step we have to tell ggplot what data to use, this is the first argument
ggplot(data = income_data, aes(x = lGDP)) + geom_histogram() ###aes is the aesthetic argument, here we tell ggplot we want logged GDP on the x-axis



ggplot(data = income_data, aes(x = lGDP, y = ..density..)) + geom_histogram() ###aes is the aesthetic argument, here we tell ggplot we want logged GDP on the x-axis
### now y is the density, cause we tell r to do so


#### we can subset data frames and assign the subset to new objects using the subset() function
data2010 <- subset(income_data, Year == 2010) ## remember to use == not +
### same plot for 2010
ggplot(data = data2010, aes(x = lGDP, y = ..density..)) + geom_histogram() ###aes is the aesthetic argument, here we tell ggplot we want logged GDP on the x-axis


#### scatter plot with total taxation as % GDP on the y-axis and logged GDP on x-axis
ggplot(data = data2010, aes(x = lGDP, y = TotalTax)) + geom_point() ###aes is the aesthetic argument, here we tell ggplot we want logged GDP on the x-axis



#### democracy needs to be a factor variable 
income_data$democracy <- as.factor(income_data$democracy)
#### let's see if democracies and dictatorship are different from each other
ggplot(data = data2010, aes(x = lGDP, y = ..density..)) + geom_histogram() + facet_wrap(~democracy)###aes is the aesthetic argument, here we tell ggplot we want logged GDP on the x-axis



#### or we can use color and fill to see the difference between the regimes
ggplot(data = data2010, aes(x = lGDP, y = ..density.., color = democracy)) + geom_histogram() 


ggplot(data = data2010, aes(x = lGDP, y = ..density.., fill = democracy)) + geom_histogram() 



### alpha changes how strong the colors are, lower values make the coloring more transparent
ggplot(data2010, aes(x = lGDP, color = democracy, fill = democracy)) + geom_density(alpha = 0.1)

ggplot(data2010, aes(x = lGDP, color = democracy, fill = democracy)) + geom_density(alpha = 0.5)

ggplot(data2010, aes(x = lGDP, color = democracy, fill = democracy)) + geom_density(alpha = 0.8)

ggplot(income_data, aes(x = lGDP, fill = democracy)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~Year)
