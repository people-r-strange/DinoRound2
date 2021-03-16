library(readr)
library(dplyr)
library(ggplot2)
library(plotly)
library(hrbrthemes)
library(writexl)

#Read in communication Data 
comm_data_Fri <- read_csv("DC2-data/Communication Data/comm-data-Fri.csv")
comm_data_Sat <- read_csv("DC2-data/Communication Data/comm-data-Sat.csv")
comm_data_Sun <- read_csv("DC2-data/Communication Data/comm-data-Sun.csv")

#Determining group size 
#sun_length <- comm_data_Sun %>% group_by(from) %>% mutate(Result=n_distinct(to))

#size <- count(comm_data_Fri, from, sort = TRUE)

sunday_size <- comm_data_Sun %>%
  count(Timestamp) 

write_xlsx(sunday_size, "sunday_size.xlsx") 

Sunday_from_size <- comm_data_Sun %>%
  select(Timestamp,from, to, location)%>%
  group_by(from) %>%
  summarize(count_from = n())

Sunday_to_size <- comm_data_Sun %>%
  select(Timestamp,from, to, location)%>%
  group_by(to) %>%
  summarize(count_to = n())
  
write_xlsx(Sunday_to_size, "Sunday_to_count.xlsx")