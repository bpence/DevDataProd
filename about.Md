## Body Mass Index Calculator

* * * 

#### Background

This is the documentation for a Shiny app which calculates an individual's body mass index (BMI) and displays
it graphically on a normal density curve which approximates the distribution of BMI in males or females
(depending on user selection) in the United States. The data are based on Wave 8 of the Framingham Heart
Study as reported in Block et al. (2013) and thus are current to approximately 2008.
<br><br>
Although for ease of use I have coded the distribution as normal, BMI is actually displays a slight right
(positive) skew that has become more pronounced in the past several decades (Penman, 2006).  This may be
due to an increase in proportion of morbidly obese individuals (BMI > 40) with no concomitant increase in 
very low BMIs (BMI < 15). Therefore the approximations in the figure do not completely represent the actual
distribution of BMI in the U.S., but for the purposes of this app I have considered it to be close enough.
<br><br>
One final caveat is that the categorization (underweight, normal weight, overweight, etc.) may not be appropriate
in some cases. For example, individuals with higher than normal muscle mass (e.g. bodybuilders, weight lifters)
may classify as overweight or obese but have very low body fat percentages. Thus, information from this BMI
calculator should be interpreted with care.

* * *

#### Using the App
   
To calculate your BMI, enter your height (select inches or centimeters) and weight (select pounds or kilograms).
The app automatically converts these entries (if necessary) to weight in kilograms and height in meters, then
calculates BMI as kg/m<sup>2</sup>. The app also takes as input a selection for sex.  This has been coded as
a binary selection of male or female because data useful for approximating population-level distributions are 
available only for these categories.
<br><br>
Once sex has been selected and height and weight input, clicking "Update" will calculate BMI and ouput your BMI,
BMI category (see Table 1 below), and a histogram showing the distribution of BMI for your selected sex. The 
histogram includes vertical lines showing U.S. mean (solid blue), standard deviations (dashed blue), and your
calculated BMI (solid red). Omitting either height or weight values or entering non-numeric values will throw
an error.
<br><br>
<b>Table 1</b>: BMI values by category.
<table>
<tr><td><b>Category</b></td><td><b>BMI Range</b></td></tr>
<tr><td>Underweight</td><td>&lt; 18.5</td></tr>
<tr><td>Normal weight</td><td>18.5-25</td></tr>
<tr><td>Overweight</td><td>25-30</td></tr>
<tr><td>Obese</td><td>30-40</td></tr>
<tr><td>Morbidly obese</td><td>&gt; 40</td></tr>
</table>
<br><br>
* * *

#### References

Block JP, Subramanian SV, Christakis NA, O'Malley AJ. Population trends and variation in body mass index from 
1971 to 2008 in the Framingham Heart Study Offspring Cohort. PLoS One, 8(5): e63217, 2013.
<br><br>
Penman AD, Johnson WD. The changing shape of the body mass index distribution curve in the population: 
Implications for public health policy to reduce the prevalence of adult obesity. Prev Chronic Dis, 3(3): 
A74, 2006.