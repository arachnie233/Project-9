library(shiny)

dataAirport <- read.csv("airport-singapore.csv")

shinyServer(function(input, output) {
  
  a<-reactive({
    dataAirport[dataAirport$year==input$Year & dataAirport$region==input$Region,]
  })
  
 
  output$plot1<-renderPlot(
    {
      dd<-a()
      title<-paste("Total Number of Passengers by Country of Embarkation\n", input$Region, "Region \n for Year", input$Year)
      ggplot(dd,aes(x=selected_country_of_embarkation, y=TOTAL_PAX, fill=selected_country_of_embarkation)) + ggtitle(title) + theme(plot.title = element_text(size=20, face="bold"))  +labs(x="Countries", y="Number of Passengers")+ geom_bar(colour="black", width=.8, stat="identity") + guides(fill=FALSE)
      

    })
  
  #output$doc<-renderText(
   # {
    #  "Summary",
     # h5(textOutput("Summary of the Application"))
      #htmlOutput("someHTMLElement")
      #paste("This application summarise the total numbers of arriving airline passengers in Singapore Airport, queried using regions (Europe, South East Asia and North East Asia. The dataset is taken from Singapore's Open Data Portal: data.gov.sg for the year from January 1961 to December 2015. Before the data is being visualised as in this application, the datasets were cleaned and prepared i.e. removing NA values, grouping and summarising the tables. The original datasets have the number of passengers in term of months, however, this application sums up the monthly figures into year.")
  #  })
 
 })
