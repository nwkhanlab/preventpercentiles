# PREVENT percentiles for 30-year risk estimates

The Predicting Risk of cardiovascular disease EVENTs (PREVENT) equations were developed in 2023 by the American Heart Association to predict 10-year and 30-year risk for total cardiovascular disease (CVD), atherosclerotic CVD (ASCVD), or heart failure (HF). This code can be used to calculate age- and sex-standardized percentiles of risk based on the US population from PREVENT 30-year risk estimates for CVD, ASCVD, or HF among individuals aged 30 to 59 years. Details on the methodology used to derive standardized risk percentiles can be found *here*. An interactive online tool is also available at https://nwkhanlab.shinyapps.io/percentiles/.  

**Steps**
1. Ensure that variables for age, sex, and 30-year PREVENT risk estimates are available in your dataset. Absolute 30-year risk estimates can be calculated using the "AHAprevent" code (available for R and STATA) from the [American Heart Association](https://professional.heart.org/en/guidelines-and-statements/prevent-calculator). For access to this code, please agree to the [Terms & Conditions](https://www.jotform.com/240774577352161). 
2. Download "prevent30Ypercentiles.xlsx" from nwkhanlab/preventpercentiles.
3. Save "prevent30Ypercentiles.xlsx" in your working directory.
4. Load all functions from "30Ypercentiles.R" from *nwkhanlab/preventpercentiles* into your global environment.
5. Calculate 30-year risk percentile using the functions **return_percentile_30yr_CVD** for 30-year CVD risk, **return_percentile_30yr_ASCVD** for 30-year ASCVD risk, or **return_percentile_30yr_HF** for 30-year HF risk.

**Usage**  
return_percentile_30yr_CVD(age, sex, risk)  
return_percentile_30yr_ASCVD(age, sex, risk)  
return_percentile_30yr_HF(age, sex, risk)  

**Arguments**  
*age*: Age, numeric (30-59 years)  
*sex*: Sex, numeric (1=female, 0=male)  
*risk*: Absolute 30-year risk for CVD, ASCVD, or HF calculated with the PREVENT equations, numeric. 

**Notes**  
Since all individuals absolute risk estimates >98th percentile will be at the 99th percentile, the 99th percentile is set at a risk of 100%.   

**Please see the following links for more details about PREVENT**  
[AHA PREVENT Online Calculator](https://professional.heart.org/en/guidelines-and-statements/prevent-calculator)  
[Development and Validation of the AHA PREVENT equations](https://doi.org/10.1161/circulationaha.123.067626)  
[AHA Scientific Statement on the PREVENT equations](https://doi.org/10.1161/CIR.0000000000001191)  
[Academic access to the PREVENT statistical software code (R or STATA)](https://www.jotform.com/240774577352161)  


