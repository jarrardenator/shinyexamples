
library(ggplot2)
library(dplyr)
#Get the data files
#Set the path

#Read the data files they should be within the master file for the shiny application

Timeperiod="90 days"
Category = "Sex"
getSurvivalData2 <- 
  function(timeperiod,category) {
    # Careful not to let just any name slip in here; a
    # malicious user could manipulate this value.
    #if (!(category %in% categories) | !(timePeriod %in% timeperiods))
    # stop("Error")
    
    survival.data <- read.csv("SurvivalRates_DeceasedDonor.csv")
    survival.data <- as.data.frame(survival.data)
    
    head(survival.data)
    
    survival.filtered <- filter(survival.data, Category == category & TimePeriod == timeperiod)
    print(timeperiod)
    print(category)
    head(survival.filtered)
    return(survival.filtered)
  }
v <- getSurvivalData2(Timeperiod,Category)

linechart <- ggplot(data = v, 
                    aes(x=Year,y=SurvivalRate, colour=Value))+geom_line()+geom_point(size=2)
linechart
