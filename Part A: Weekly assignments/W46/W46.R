#5) 
install.packages("tidyverse")
library(tidyverse)
library(readr)

#
kinglist <- read_csv("W45.csv", na = "null")
#
class(kinglist)
#Mean 
totalreign <- kinglist[1:54,7]
totalreign[1:54,]

totalXnum <- as.numeric(unlist(totalreign))

class(totalXnum)

mean(totalXnum)

median(totalXnum)
