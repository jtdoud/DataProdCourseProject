# Load packages
library(dplyr)
library(ggplot2)
library(scales)

# Set plot theme
my_theme <- theme_bw() +
    theme(panel.border = element_blank(),
          axis.ticks = element_blank(),
          panel.grid.minor = element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(size = 0.5),
          axis.title = element_text(colour = "grey40"),
          plot.title = element_text(vjust = 2.0))

load("./Data/appData.Rdata") # Load modified data

shinyServer(
    
    function(input, output) {
        
        filt1 <- reactive({
            if (input$extreme == T)
                return(filter(data, BestFatalityEstimate < 500000))
            else return(data)
        })
        
        output$plot <- renderPlot({
            
            filt2 <- switch(input$actor,
                            "Both" = group_by(filt1(), Region, Year) %>%
                                summarise(Fatalities = sum(BestFatalityEstimate)),
                            "Government" = filter(filt1(), IsGovernmentActor == 1) %>%
                                group_by(Region, Year) %>%
                                summarise(Fatalities = sum(BestFatalityEstimate)),
                            "Non-government" = filter(filt1(), IsGovernmentActor == 0) %>%
                                group_by(Region, Year) %>%
                                summarise(Fatalities = sum(BestFatalityEstimate))
            )
            
            ggplot(data = filt2, aes(x= Year, y=Fatalities, color = Region)) +
                geom_line(size = 1) + scale_y_continuous(labels = comma) + 
                my_theme
        })
        
    }      
)