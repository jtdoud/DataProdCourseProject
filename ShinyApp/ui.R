library(shiny)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Targeted Civilian Death Toll in Armed Conflitcs 1989 - 2013"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar inputs
            sidebarPanel(
                p("This app plots a time-series of fatalities due to use of armed 
                  force against civilians by a government or organized group"),
                selectInput("actor", "Actor Responsible:", 
                            choices=c("Both", 
                                      "Government", 
                                      "Non-government")),
                checkboxInput("extreme", "Exclude Extreme Case:",
                              value = F),
                p(span(em("Actor Responsible ")),"can be used to show fatalities
                  caused by government or non-government perpetrators only."),
                p("Select ", span(em("Exclude Extreme Case ")), "to exclude
                  extreme case of Rwandan Genocide in 1994 which obscures other 
                  trends."),
                p("Data obtained from the ",
                  a("Uppsala Conflict Data Program.", 
                    href = "http://www.pcr.uu.se/research/ucdp/datasets/"))
            ),
            
            # Create a spot for the plot
            mainPanel(
                plotOutput("plot")  
            )
            
        )
    )
)
