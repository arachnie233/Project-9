library(dplyr)
#read the dataset
dataS<-read.csv("data/air-passenger-arrivals-by-country-of-embarkation.csv", sep=",", colClasses = c("character", "character", "character", "character"))
names(dataS)[names(dataS)=="month"]<- "year"

#remove the rows with NA values
cleanData <- dataS[!data$no_of_air_passenger_arrivals=="na",]

#change the first column into year only not month
cleanData$year <- as.numeric(substr(cleanData$year,1,4))


#change the last column into numeric format
cleanData$no_of_air_passenger_arrivals <- as.numeric(cleanData$no_of_air_passenger_arrivals)

#group the table into year
cleanData<-cleanData %>%
  group_by(year, region, selected_country_of_embarkation) %>%
  summarise( 
    TOTAL_PAX= sum(no_of_air_passenger_arrivals)
    )

write.csv(cleanData,"airport-singapore.csv",row.names=FALSE)

regionlist <- unique(cleanData$region)
