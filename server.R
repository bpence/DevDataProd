

library(shiny)

shinyServer(function(input, output) {
    
    bmi <- eventReactive (input$go, {
        if (input$wtunit == "pounds") {
            weight <- input$wt / 2.2
        } else {
            weight <- input$wt
        }
        
        if (input$htunit == "inches") {
            height <- input$ht * 0.0254
        } else {
            height <- input$ht * 0.01
        }
        
        bmi <- weight / height ^ 2
        
        bmi
        
    })
    
    bmicat <- eventReactive (input$go, {
        if (bmi() < 20) {
            bmicat = "underweight (BMI < 18.5)"
        } else if (bmi() >= 18.5 & bmi() < 25) {
            bmicat = "normal weight (20 < BMI < 25)"
        } else if (bmi() >= 25 & bmi() < 30) {
            bmicat = "overweight (25 < BMI < 30)"
        } else if (bmi() >= 30 & bmi() < 40) {
            bmicat = "obese (30 < BMI < 40)"
        } else if (bmi() >=40) {
            bmicat = "morbidly obese (BMI > 40)"
        } else if (is.na(bmi())) {
            bmicat = "undefined"
        }
    })
    
    output$plot <- renderPlot({
        
        if (input$sex == "Male") {
            plot(function(x) dnorm(x, mean=29.0, sd=4.73), 12, 60,
                 main = "Distribution of BMI (Males) in the United States",
                 ylab="Frequency", xlab="BMI (kg/m^2")
            abline(v=29.0, col="blue")
            abline(v=(29.0+c(-3,-2,-1,1,2,3)*4.73), col="blue", lty=2)
            abline(v=bmi(), col="red")
        } else {
            plot(function(x) dnorm(x, mean=27.7, sd=6.15), 9, 60,
                 main="Distribution of BMI (Females) in the United States",
                 ylab="Frequency", xlab="BMI (kg/m^2)")
            abline(v=27.7, col="blue")
            abline(v=(27.7+c(-3,-2,-1,1,2,3)*6.15), col="blue", lty=2)
            abline(v=bmi(), col="red")
        }
    })
    
    output$bmi <- renderText ({
        
        out <- paste("Your BMI is", round(bmi(), digits=1))
        out # need to round to 1 decimal
        
    })
    
    output$bmicat <- renderText ({
        out2 <- paste("You fall into the", bmicat(), "category")
        out2
        
    })
    
    output$caption <- eventReactive (input$go, {
        "Figure 1: Density function for BMI distribution in the United States.
        The distribution is automatically changed based on your selection in 
        the Sex selection box. The solid blue line represents the mean BMI, 
        while the dashed blue lines represent 1, 2, and 3 standard deviations 
        above and below the mean. The red line is automatically generated at 
        your calculated BMI."
    })
    
    })
