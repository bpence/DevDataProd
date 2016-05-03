

library(shiny)

shinyUI(fluidPage(
    sidebarPanel(
        selectInput(inputId="sex", label="Sex", choices=c("Male", "Female")),
        br(),
        fluidRow(
            column(width=6,
                   numericInput(inputId="wt", label="Enter Weight", value=NA)
            ),
            column(width=6,
                   selectInput(inputId="wtunit", label="Units", choices=c("pounds","kilograms"))
            )
        ),
        br(),
        fluidRow(
            column(width=6,
                   numericInput(inputId="ht", label="Enter Height", value=NA)
            ),
            column(width=6,
                   selectInput(inputId="htunit", label="Units", choices=c("inches","centimeters"))
            )
        ),
        br(),
        actionButton(inputId="go", label="Update")
    ),
    
    mainPanel(
        plotOutput(outputId="plot"),
        textOutput(outputId="caption"),
        br(),
        h4(textOutput(outputId="bmi")),
        h4(textOutput(outputId="bmicat"))
    )
    
))