#W48


# Task 1: Create a Danish equivalent of AUSmap with esri layers, 
# but call it DANmap



########## ADD DATA TO LEAFLET

# In this section you will manually create machine-readable spatial
# data from GoogleMaps: 

### First, go to https://bit.ly/CreateCoordinates1  
### Enter the coordinates of your favorite leisure places in Denmark 
# extracting them from the URL in googlemaps, adding name and type of monument.
# Remember to copy the coordinates as a string, as just two decimal numbers separated by comma. 

# Caveats: Do NOT edit the grey columns! They populate automatically!

### Second, read the sheet into R. You will need gmail login information. 
# watch the console, it may ask you to authenticate or put in the number 
# that corresponds to the account you wish to use.

# Libraries
library(tidyverse)
library(googlesheets4)
library(leaflet)

library(htmlwidgets)

# Read in a Google sheet
places <- read_sheet("https://docs.google.com/spreadsheets/d/1PlxsPElZML8LZKyXbqdAYeQCDIvDps2McZx1cTVWSzI/edit#gid=124710918",
                     col_types = "cccnncnc", range = "SA2022")
glimpse(places)

# load the coordinates in the map and check: are any points missing? Why?
leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = places$Description)

popup = c("Himmelbjerget", "Papirstårnet", "Odense_domkirke")

leaflet() %>%                                 # create a map widget by calling the library
  addProviderTiles("Esri.WorldPhysical") %>%  # add Esri World Physical map tiles
  addAwesomeMarkers(lng = c(9.684862, 9.556958, 10.388611),      # add layers, specified with longitude for 3 points
                    lat = c(56.1053065, 56.1731743, 55.3987223),      # and latitude for 3 points
                    popup = popup) %>% # specify labels, which will appear if you click on the point in the map
  esri <- grep("^Esri", providers, value = TRUE) %>% 
  
  
  
  Danmark<- leaflet() %>%
  addTiles() %>%                              # add default OpenStreetMap map tiles
  addProviderTiles("Esri.WorldImagery",       # add custom Esri World Physical map tiles
                   options = providerTileOptions(opacity=0.5)) %>%     # make the Esri tile transparent
  setView(lng = 9, lat = 56, zoom = 7) %>% 
  addProviderTiles("Esri.WorldPhysical", group = "Physical") %>% 
  addProviderTiles("Esri.WorldImagery", group = "Aerial") %>% 
  addProviderTiles("MtbMap", group = "Geo") %>% 
  
  addLayersControl(                                 # we are adding layers control to the maps
    baseGroups = c("Geo","Aerial", "Physical"),
    options = layersControlOptions(collapsed = T))           # set the location of the map 









#########################################################


# Task 2: Read in the googlesheet data you and your colleagues 
# populated with data into the DANmap object you created in Task 1.



DANmap_markers <- DANmap %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = places$Description)

DANmap_markers






# Task 3: Can you cluster the points in Leaflet? Google "clustering options in Leaflet"


DANmap_markers <- DANmap %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = places$Description,
             clusterOptions = markerClusterOptions())

DANmap_markers


# Task 4: Look at the map and consider what it is good for and what not.
## In this case, the cluster function is good for creating an overview, instead of having all the markings on one map. For example, in the area around Silkeborg there are 3 markings, but the cluster function gathers it into a cluster so that they are assembled.


# Task 5: Find out how to display notes and classifications in the map.
install.packages("tmap")
library

install.packages(c("tmap", "readr", "sf", "janitor", "tmap", "dplyr"))
library(readr)
library(sf)
library(janitor)
library(tmap)
library(dplyr)

library(tmap)

install.packages('terra')

library(leaflet)
pal <- colorBin("Greens", domain = 0:100)

leaflet(DANmap_markers) %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = places$Description,
             clusterOptions = markerClusterOptions()) %>% 
  addLegend(pal = pal, values = places)

# I tried many different methods but couldn't get it to work :( 



 



