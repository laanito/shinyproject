#
# Shiny project UI
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        actionButton("recalc", "New points")
        ),
    
    # Show a plot of the generated distribution
    mainPanel(
        leafletOutput("mymap")
    )
  )
))
