library(ggplot)
library(dplyr)

survival.data <- read.csv("SurvivalRates_DeceasedDonor.csv")
survival.data <- as.data.frame(survival.data)
survival.diag90d <- filter(survival.data, 
                          survival.data$Category == "Diagnosis" & survival.data$TimePeriod == "90 days")

theme_clear <- theme_bw() + theme(plot.background=element_rect(fill="white",colour=NA)) +
  theme(panel.grid.major.y=element_blank(),panel.grid.minor=element_blank())

diagnosisplot.ts <- ggplot(data = survival.diag90d, 
       aes(x=Year,y=SurvivalRate, colour=Value))+geom_line()+geom_point(size=4) + theme_clear

diagnosisplot.ts