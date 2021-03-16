library(readr)
library(dplyr)
library(ggplot2)
library(plotly)

#Read in communication Data 
comm_data_Fri <- read_csv("DC2-data/Communication Data/comm-data-Fri.csv")
comm_data_Sat <- read_csv("DC2-data/Communication Data/comm-data-Sat.csv")
comm_data_Sun <- read_csv("DC2-data/Communication Data/comm-data-Sun.csv")

#Determining group size 
#sun_length <- comm_data_Sun %>% group_by(from) %>% mutate(Result=n_distinct(to))

#size <- count(comm_data_Fri, from, sort = TRUE)

sunday_group_size <- comm_data_Sun %>%
  group_by(from) %>%
  tally()