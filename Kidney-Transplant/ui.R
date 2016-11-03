

shinyUI(
  
    navbarPage("Kidney Transplants",
                   tabPanel("Survival Rates",
                            sidebarLayout(
                              # Sidebar with a dropdown for year, sliders for word frequency and slider input
                              sidebarPanel(
                                radioButtons("timePeriod","Time Period:",timeperiods),
                                selectInput("category", "Choose a category:",choices = categories),
                                actionButton("update", "Update")
                             ),
                             mainPanel(plotOutput("survivalprobplot"))
                            )
                   ),
                   #add more tabPanels here
               
                   navbarMenu("More",
                              tabPanel("Table"
                              ),
                              tabPanel("About",
                                       fluidRow(
                                         column(6,
                                                includeMarkdown("about.md")
                                         ),
                                         column(3,
                                                img(src='kidneywalsh0509.jpg'))
                                         )
                                       )
                              )
                   
))
