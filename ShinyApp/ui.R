library(shiny)

# Define the overall UI
shinyUI(
        
        # Use a fluid Bootstrap layout
        fluidPage(    
                
                # Give the page a title
                titlePanel("One-Sided Violence Since XXXX"),
                
                # Generate a row with a sidebar
                sidebarLayout(      
                        
                        # Define the sidebar with one input
                        sidebarPanel(
                                selectInput("actor", "Actor Responsible:", 
                                            choices=c("Both", 
                                                      "Government", 
                                                      "Non-government")),
                                checkboxInput("extreme", "Exclude Extreme Case:",
                                              value = F),
                                br(),
                                p("Talk about data source..."),
                                p("Talk about extremem outlier")
                        ),
                        
                        # Create a spot for the barplot
                        mainPanel(
                                plotOutput("plot")  
                        )
                        
                )
        )
)
