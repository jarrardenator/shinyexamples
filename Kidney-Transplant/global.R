
library(ggplot2)
library(dplyr)
library(memoise)
library(markdown)

# The list of valid books
categories <<- list("Age at Transplant" = "Age",
              "Race" = "Race",
              "Sex" = "Sex",
              "Previous Transplant"= "Transplants",
              "Diagnosis"= "Diagnosis"
              )

timeperiods <<- c("90 days","1 year")


# Using "memoise" to automatically cache the results
getSurvivalData <- memoise(
    function(tp,cat) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  #if (!(category %in% categories) | !(timePeriod %in% timeperiods))
   # stop("Error")

  survival.data <- read.csv("SurvivalRates_DeceasedDonor.csv")
  survival.data <- as.data.frame(survival.data)
  survival.filtered <- filter(survival.data, Category == cat & TimePeriod == tp)
  return(survival.filtered)
  }
)
