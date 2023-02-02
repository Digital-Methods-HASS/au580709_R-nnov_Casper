###Rscript for Transforming historical research through digital methods and approaches: part B###



###1. Read the processed resistance movement list###
resistance <- read.csv("resistancelist_pro.csv",
                       sep = ";" ,
                       na = "NA") 

##Install and unpack the relevant packages
install.packages("plotly")
library(tidyverse)
#Plotly's R graphing library makes interactive, publication-quality graphs WEBPAGES: https://plotly.com/ggplot2/
library(plotly)



###2. Visualize the relationship between the resistancepeople and a specific social class###

##Create a stacking bar plots.The order of the fill is designed to match the legend. WEBPAGE: https://plotly.com/ggplot2/bar-charts/
library(plotly)
res <- ggplot(resistance, aes(region))

resistviz <- res + geom_bar(aes(fill = socialclass))  + 
  labs(title = "The resistancemovement in Denmark",
       x = "Regions in Denmark",
       y = "Number of resisters") +
  
  #Rotating x-axis Text Label by 45 Degrees WEBPAGE: https://datavizpyr.com/rotate-x-axis-text-labels-in-ggplot2/
  theme(axis.text.x = element_text(angle = 45))  +
  ylim(0, 10000)  +
 
   #Set the values for discrete x scale aesthetics https://search.r-project.org/CRAN/refmans/ggplot2/html/scale_discrete.html
  scale_x_discrete(labels = c("Bornholm", "Central Jutland", "Copenhagen", "Funen", "No registered address", "Northern Jutland", "Southern Jutland", "Zealand")) 
 
  

#Visualize the plot
library(plotly)
ggplotly(resistviz)


####3. Visualize Shows the distribution between gender and specific social class###

library(plotly)

res_2 <- ggplot(resistance, aes(socialclass))

res_2viz <- res_2 + geom_bar(aes(fill = sex)) +
  labs(title ="",
       x = "Socialclass",
       y = "Amount of resisters") +
  theme(axis.text.x = element_text(angle = 45)) +
  scale_x_discrete(labels = c("Academic students", "The military","Socialgroup I", 
                              "Socialgroup II","Socialgroup III", "Socialgroup IV", "Socialgroup V", "Students",
                              "Theoretical students", "Unidentified"))

ggplotly(res_2viz)


### Other relevant functions ###

#See n in any social group  
count(resistance, socialclass, name = NULL)

#See n in any region i Denmark 
count(resistance, region, name = NULL) 

count(resistance, resistance_type, name = NULL)







