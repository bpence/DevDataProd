---
title       : BMI Calculator
subtitle    : Developing Data Products, April-May 2016
author      : Brandt Pence
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Body Mass Index

* ...
* Originally intended as a population-level measure
* Commonly-used now due to simplicity of calculation

--- .class #id 

## Body Mass Index cont.

* Calculated by ratio of weight (kg) to square of height (m)
* Categorizations are by range of BMI<br><br>
<b>Table 1</b>: BMI values by category.
<table>
<tr><td><b>Category</b></td><td><b>BMI Range</b></td></tr>
<tr><td>Underweight</td><td>&lt; 18.5</td></tr>
<tr><td>Normal weight</td><td>18.5-25</td></tr>
<tr><td>Overweight</td><td>25-30</td></tr>
<tr><td>Obese</td><td>30-40</td></tr>
<tr><td>Morbidly obese</td><td>&gt; 40</td></tr>
</table>

---

## The BMI Calculator

* Takes height (in inches or cm) and weight (in kg or pounds) as inputs
* Simple calculations


```r
bmi <- eventReactive (input$go, {
    if (input$wtunit == "pounds") {  
        weight <- input$wt / 2.2     # converts pounds to kg
    } else {
        weight <- input$wt           # leaves as is
    }
    
    if (input$htunit == "inches") {
        height <- input$ht * 0.0254  # converts inches to m
    } else {
        height <- input$ht * 0.01    # converts cm to m
    }
        
    weight / height ^ 2 })           # calculates BMI
```

---

## The Output

* Calculator outputs calculated BMI and category
<br><br>
* Output also includes a figure showing U.S. distribution of BMI
* Split by sex
* Also includes means and standard deviations (+/- 1, 2, 3)
* Red line shows where the calculated BMI falls on the distribution

---

## The Output cont.

* Example: male with BMI 28.0:<br>
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

