#
# Shiny project server
#

library(shiny)
library(leaflet)


r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()
data <- read.csv('https://praderas.org/attackers.csv', header=TRUE, row.names = NULL, sep=';')
myfactor <- as.factor(data$action)
mylevels <- levels(myfactor)
myselected <- mylevels

shinyServer(function(input, output, session) {
   

    output$checks <-  renderUI({  
        checkboxGroupInput("actions","Choose action(s):",mylevels, selected = myselected)
    })

    output$mymap <- renderLeaflet({
        leaflet(data) %>%
            addProviderTiles(providers$Stamen.TonerLite,
                             options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addMarkers(~longitude,~latitude,  clusterOptions = markerClusterOptions(), 
                       label=~as.character(org))
    })
    
    observeEvent(input$recalc,{
        mydata <- subset(data, action %in% input$actions)
        leafletProxy("mymap", data = mydata) %>%
            clearMarkers() %>%
            clearMarkerClusters() %>%
            addProviderTiles(providers$Stamen.TonerLite,
                             options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addMarkers(~longitude,~latitude,  clusterOptions = markerClusterOptions(), 
                       label=~as.character(mydata$org))
    })
})
