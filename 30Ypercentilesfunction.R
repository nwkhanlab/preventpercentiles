## PLEASE READ THROUGH READ.ME FILE FOR IMPORTANT INFORMATION (https://github.com/nwkhanlab/preventpercentiles)

## The following are base functions that will be wrapped into return_percentile_30yr_CVD, return_percentile_30yr_ASCVD, and return_percentile_30yr_HF.

percentile_function <- function(risk, percentiles) {
  upper_bound <- min(which(percentiles$risk >= risk))
  return(upper_bound)
}

select_columns_30yr <- function(age, sex, outcome) {if(age>=30 & age<=59) {
 if(sex==1 & outcome=="CVD") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y CVD F")
  }
  else if(sex==1 & outcome=="ASCVD") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y ASCVD F")
  }
  else if(sex==1 & outcome=="HF") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y HF F")
  }
  else if(sex==0 & outcome=="CVD") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y CVD M")
  }
  else if(sex==0 & outcome=="ASCVD") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y ASCVD M")
  }
  else if(sex==0 & outcome=="HF") {percentiles <- read_excel("prevent30Ypercentiles.xlsx", sheet="30y HF M")
  }
  percentiles <- percentiles[c("percentile", age)]
  colnames(percentiles) <- c("percentile", "risk")
  return(percentiles)
}}

## The following are the functions that you should use to calculate percentiles. 

return_percentile_30yr_CVD <- function(age, sex, risk) {
  percentile_function(risk, select_columns_30yr(age, sex, "CVD"))
}

return_percentile_30yr_ASCVD <- function(age, sex, risk) {
  percentile_function(risk, select_columns_30yr(age, sex, "ASCVD"))
}

return_percentile_30yr_HF <- function(age, sex, risk) {
  percentile_function(risk, select_columns_30yr(age, sex, "HF"))
}

## Please ensure that variables for age, sex, and 30-year risk are available in your dataset. 
## Age, sex, and risk should all be numeric. Age should be 30-59 years, sex should be coded 1==female or 0==male. 
## Since all individuals with absolute risk estimates >98th percentile will be at the 99th percentile, the 99th percentile is set at 100%. 
