#
# Shiny project UI
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Attackers Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        uiOutput("checks"),
        actionButton("recalc", "Refresh Map")
        ),
    
    # Show a plot of the generated distribution
    mainPanel(
        leafletOutput("mymap")
    )
  )
))
