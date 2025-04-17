#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(leaflet)
library(viridis)
library(sf)
# read in data and make lat and long into sf objects
dat <- read.csv('clean_data.csv')
dat <- st_as_sf(dat, coords = c('long', 'lat'))
# make unique haplogroups have their own unique color
happal <- colorFactor(viridis(length(unique(dat$y_hap_simp))),
                      dat$y_hap_simp)

# fix dates  (log transform)
dat$date_lBP <- log10(dat$date_BP + 1)

# starts app
if (interactive()) {
  options(device.ask.default = FALSE)
  
# describes app 
  ui <- fluidPage(
   
# make time slider to toggle years before present data    
    sliderInput("BP", "Years Before Present", 
                
                min = min(dat$date_BP), max = max(dat$date_BP), value = 0, 
                step = 100
                
    ),
    
# specify leaflet plot   
    leafletOutput("leafletPlot", height = "100vh"))
  
  
  
  
  
  
# This is the Server and simply describes how to run app it has things like 
# how big the circles should be, how the time slider should present data (we 
# want it to only show relevant dates to chosen time not all of them), where 
# and what to put in legend.
  server <- function(input, output) {
    
    output$leafletPlot <- renderLeaflet({
      leaflet(subset(dat, date_BP > input$BP)) %>%
        addProviderTiles("CartoDB.Positron") %>%
        addCircleMarkers(radius = 2.5, 
                         fillColor = ~happal(y_hap_simp),
                         stroke=FALSE,
                         fillOpacity = 0.8,
                         popup = ~y_hap_simp) %>%
        addLegend(position = c("topleft"), pal = happal,
                  values = ~y_hap_simp, labels = "haplogroups",
                  title = "Y haplogroups")})
  }
}

# Complete app with UI and server components (running only this will launch 
# full app as if you were pressing "run app" at top)
shinyApp(ui, server)


