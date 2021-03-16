library(readr)
library(dplyr)
library(ggplot2)
library(plotly)
library(tibbletime)
library(writexl)


#Read in Movement Data 
park_movement_Fri <- read_csv("DC2-data/Movement Data/park-movement-Fri.csv")
park_movement_Sat <- read_csv("DC2-data/Movement Data/park-movement-Sat.csv")
park_movement_Sun <- read_csv("DC2-data/Movement Data/park-movement-Sun.csv")

#Read in communication Data 
comm_data_Fri <- read_csv("DC2-data/Communication Data/comm-data-Fri.csv")
comm_data_Sat <- read_csv("DC2-data/Communication Data/comm-data-Sat.csv")
comm_data_Sun <- read_csv("DC2-data/Communication Data/comm-data-Sun.csv")

#Create Groups based on Time 
groups_fri <- aggregate(comm_data_Fri["from"], by=comm_data_Fri["Timestamp"], sum)
groups_sat <- aggregate(comm_data_Sat["from"], by=comm_data_Sat["Timestamp"], sum)
groups_sun <- aggregate(comm_data_Sun["from"], by=comm_data_Sun["Timestamp"], sum)


#finding matching IDs 
common_fri_sat <- intersect(groups_fri$from, groups_sat$from) 
View(common_fri_sat)

write_xlsx(common_fri_sat, "common_fri_sat.xlsx")

common_sat_sun <- intersect(groups_sat$from, groups_sun$from) 
View(common_sat_sun)

write_xlsx(common_sat_sun, "common_sat_sun.xlsx")

common_fri_sun <- intersect(groups_fri$from, groups_sun$from) 
View(common_fri_sun)
write_xlsx(common_fri_sun, "common_fri_sun.xlsx")
-----------------------------------------------------------------------------------

sus_ID_sun <- filter(groups_sun, from %in% "839736")
sus_ID_sun_comm <- filter(comm_data_Sun, from %in% "839736")

write_xlsx(sus_ID_sun, "sus_ID_sun.xlsx") 
write_xlsx(sus_ID_sun_comm, "sus_ID_sun_comm.xlsx")

sus_ID_fri<- filter(groups_fri, from %in% "839736")

write_xlsx(sus_ID_fri, "sus_ID_fri.xlsx") 

sus_ID_sat<- filter(groups_sat, from %in% "839736")

write_xlsx(sus_ID_sat, "sus_ID_sat.xlsx") 


sus_ID2_sun_comm <- filter(comm_data_Sun, from %in% "1278894")

write_xlsx(sus_ID2_sun_comm, "sus_ID2_sun_comm.xlsx") 
------------------------------------------------------------------------------------
  
tbl_park_movement_sun <- as_tbl_time(park_movement_Sun, index = Timestamp)

time_movement_sun <- filter_time(park_movement_Sun, "2014-6-08 11:00:00" ~ "2014-6-08 13:00:00")

