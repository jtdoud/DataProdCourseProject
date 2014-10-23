library(dplyr)
library(ggplot2)
library(scales)

my_theme <- theme_bw() +
        theme(panel.border = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.minor = element_blank(),
              panel.grid.major.x = element_blank(),
              panel.grid.major.y = element_line(size = 1),
              axis.title = element_text(colour = "grey40"),
              plot.title = element_text(vjust = 2.0))

load("./Data/appData.Rdata")

shinyServer(

        function(input, output) {
         
                output$plot <- renderPlot({
                        
                        if (input$extreme == T)
                                temp <- filter(data, BestFatalityEstimate < 500000)
                        else temp <- data
                        
                        temp <- switch(input$actor,
                                       "Both" = group_by(temp, Region, Year) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate)),
                                       "Government" = filter(temp, IsGovernmentActor == 1) %>%
                                               group_by(Region, Year) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate)),
                                       "Non-government" = filter(temp, IsGovernmentActor == 0) %>%
                                               group_by(Region, Year) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate))
                                       )

                        ggplot(data = temp, aes(x= Year, y=Fatalities, color = Region)) +
                                geom_line(size = 1) + 
                                scale_y_continuous(labels = comma) + 
                                my_theme
                })
                
        }      
)