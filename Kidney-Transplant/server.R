
#The server function calls any data processing or plot rendering when items from
#ui.r are invoked from the session
#this function is fundamental for shiny

function(input, output, session) {
  
  # Pulls the data for the word cloud (the input)
  # Define a reactive expression for the document term matrix.  This resets the
  # Wordcloud when menu options are changed
  
  SurvivalRates <- reactive({
    
    input$update
    
    isolate({
      withProgress({
        #adds a processing message while the wordcloud data is generated 
        
        setProgress(message = "Processing data...")
        #Retrieve the data
        
        getSurvivalData(input$timePeriod,input$category)
      })
    })
  })

  
  #Renders the wordcloud
  output$survivalprobplot <- renderPlot({
    v <- SurvivalRates()
    
    #ggplot here
    
    ggplot(data = v, 
                        aes(x=Year,y=SurvivalRate, colour=Value))+geom_line()+geom_point(size=2)
  })
}
