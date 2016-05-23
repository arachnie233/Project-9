library(shiny)
library(ggplot2)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Singapore Airport Air Passenger Arrivals - By Country of Embarkation"),
  

  sidebarLayout(
    sidebarPanel(

      selectInput("Year", "Choose a year from 1961 to 2015:", choices = c(1961:2015), selected=2000),
      selectInput("Region", "Choose a region:", choices = c("South East Asia", "North East Asia", "Europe"  )),
      h6("Click the Documentation Tab for more information")
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot1")), 
        tabPanel("Documentation",
          strong("Summary"),
          br(),
          div("This application summarise the total numbers of arriving airline passengers in Singapore Airport, queried using regions (Europe, South East Asia and North East Asia. The dataset is taken from Singapore's Open Data Portal: data.gov.sg for the year from January 1961 to December 2015. Before the data is being visualised as in this application, the datasets were cleaned and prepared i.e. removing NA values, grouping and summarising the tables. The original datasets have the number of passengers in term of months, however, this application sums up the monthly figures into year."),
          br(),
          
          strong("How to Use"),
          br(),
          div("Click on the drop down on the left panel to choose the year and the region"),
          
          strong("The Codes"),
          br(),
          div("The codes can be downloaded at Github:")#Put the github link here
        )
        ) 
      )
    )
  )

)
