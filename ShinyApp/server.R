library(dplyr)
library(ggplot2)

load("./Data/appData.Rdata")

shinyServer(

        function(input, output) {
         
                output$plot <- renderPlot({
                        
                        if (input$extreme == T)
                                temp <- filter(data, BestFatalityEstimate < 500000)
                        else temp <- data
                        
                        temp <- switch(input$actor,
                                       "Both" = group_by(temp, Region) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate)),
                                       "Government" = filter(temp, IsGovernmentActor == 1) %>%
                                               group_by(Region) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate)),
                                       "Non-government" = filter(temp, IsGovernmentActor == 0) %>%
                                               group_by(Region) %>%
                                               summarise(Fatalities = sum(BestFatalityEstimate))
                                       )

                        ggplot(data = temp, aes(x= Region, y=Fatalities/1000)) +
                                geom_bar(stat = "identity")
                })
                
        }      
)