library(ggplot2)
library(scales)

#get esrd incidence data


esrd.all <- read.csv("ESRD Incidence Data/ESRDIncidenceOverTime_All.csv")
esrd.modality <- read.csv("ESRD Incidence Data/ESRDIncidenceOverTime_Modality.csv")
esrd.demo <- read.csv("ESRD Incidence Data/ESRDRates_Demographics.csv")

str(esrd.all)
str(esrd.modality)
str(esrd.demo.df)


esrd.mod.df <- as.data.frame(esrd.modality)


esrd.demo.df <- as.data.frame(esrd.demo)
colnames(esrd.demo.df) <- c("Segment","Y_1996","Y_2013")

esrd.demo.df$PctChange <- (esrd.demo.df$Y_2013/esrd.demo.df$Y_1996)-1

esrd.all.df <- as.data.frame(esrd.all)
esrd.all.df$PctChange <- (esrd.all.df$X_2013/esrd.all.df$X1996)-1

esrd.demo.df$Group <- ifelse(esrd.demo.df$Segment == ("Male") | esrd.demo.df$Segment=="Female",
                             "Sex","Ethnicity")
esrd.demo.df$Group <- factor(esrd.demo.df$Group)
segmentorder <- esrd.demo.df$Segment[order(esrd.demo.df$Group,esrd.demo.df$PctChange)]

esrd.demo.df$Segment <- factor(esrd.demo.df$Segment,levels=segmentorder)
esrd.demo.df$offset <- sign(esrd.demo.df$PctChange)*.25

theme_clear <- theme_bw() + theme(plot.background=element_rect(fill="white",colour=NA)) +
  theme(panel.grid.major.y=element_blank(),panel.grid.minor=element_blank())


demodotplot <- ggplot(esrd.demo.df, aes(x=PctChange,y=Segment)) + 
                ggtitle("1996-2013 % Change in ESRD by Demographic Segment") +
                labs(x="Percent Change since 1996",y="Demographic Segment") +
                geom_segment(aes(yend=Segment),xend=0,colour="grey50") +
                geom_point(size=7,aes(colour=Group)) +
                scale_colour_brewer(palette="Set1",limits=c("Sex","Ethnicity")) +
                geom_text(aes(label=percent(PctChange)),vjust=2,hjust=-.005)+
                theme_clear +
                facet_grid(Group
                ~ .,scales="free_y",space="free_y")

allchangeplot <- ggplot(esrd.all.df,y=)

#unpivot the time series data
#make year a number
#sort by year


ggplot(aes) + scale_y_continuous(labels=percent)

esrd.mod.df <- as.data.frame(esrd.modality)

