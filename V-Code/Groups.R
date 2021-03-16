library(readr)
library(dplyr)
library(ggplot2)
library(plotly)

#Read in Friday Movement Data 
park_movement_Fri <- read_csv("DC2-data/Movement Data/park-movement-Fri.csv")

#Read in Friday communication Data 
comm_data_Fri <- read_csv("DC2-data/Communication Data/comm-data-Fri.csv")

#Create Groups based on Time 
groups <- aggregate(comm_data_Fri["from"], by=comm_data_Fri["Timestamp"], sum)

#Rename "from" to "id" 
names(groups)[2] <- "id"

#Bind movement data with groups data by ID 
intersect_both <- intersect(groups, park_movement_Fri)

#Inspect check-in locations 
check_in_location <- filter(park_movement_Fri, type %in% "check-in")

#Visualize check-in locations 
c <-check_in_location %>%
  ggplot(aes(X, Y)) + 
  geom_point()+
  labs(
    title = "Map of Check-in Location"
  )
c

#Merge X and Y columns together 
check_in_location$coordinates <- paste(check_in_location$X, check_in_location$Y, sep=",")

#Create Groups based on check-in location 
check_in_groups <- aggregate(check_in_location["id"], by=check_in_location["coordinates"], sum)
