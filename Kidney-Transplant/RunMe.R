library(shiny)


#This file runs the shiny app.  Make sure the shiny, tm, memoise and wordcloud packages are installed first.
#Uncomment the following line of code if you copied the application files to a location
#other than your default R Studio working directory.  Below that working directory should be
#the folder /Jarrard-Andrew-Jackson with the contents below it as shipped in Andrew-Jackson.zip
#use the R syntax appropriate to your PC platform; below is an example for Windows.  
# Use standard Mac conventions for R if you are running on a Mac.
# For this setting, I had the /Kidney-Transplant folder just below the following directory:

  setwd("C:/Users/Jeff/Documents/R/workingdirectory")

#Shiny application command runApp runs the shiny application contained in the 
#folder called Jarrard-Andrew-Jackson.  The app name is the name of the folder containing
#all the files.  Do not change the name of this folder, or ifyou have, change the parameter of the
#following runApp method call to the name of the folder. 

runApp("Kidney-Transplant")

