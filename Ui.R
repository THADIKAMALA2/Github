
#------------------------------------------------------------------------
# Topic: Shiny App to demonstrate UDPipe NLP workflow
#
# Authors: Shyla Kumar (11910070), Rakesh (11910046), Vinayak (11910022)
#
# Program / Component: ui.R - It is user interface part of Shiny App
#
# Date: 19-May-2018
#
# ------------------------------------------------------------------------


if (!require(shiny)){install.packages("shiny")}

library("shiny") # Library required to work this APP

shinyUI(

    fluidPage(
    
      titlePanel("UDPipe NLP Workflow"),
    
      sidebarLayout( 
      
        sidebarPanel(  
        
          fileInput("file", "Upload text data"),
        
          radioButtons(inputId = "language", label = "Language Model", choices = c("english")),
        
          checkboxGroupInput(inputId = "speech", label = "Universal Parts-of-Speech Tags", choices = c("ADJ", "NOUN", "PROPN", "ADV", "VERB"),selected=c("ADJ","NOUN","PROPN")),
        downloadButton("download", "Download Annotation")
        
              ),   # end of sidebar panel
      
      
        mainPanel(
        
          tabsetPanel(type = "tabs",
                    
            tabPanel("About App",
                 h4(p("About this Shiny App")),
                 p("This app ia all about a Shini App to showcase UDPipe NLP Workflow",align="justify"),
                 br(),
                 h4('How to use this App'),
                 p("* This app supports only TEXT files.",align="justify"),
                 p("* Before click on any TAB, upload the TEXT file",align="justify"),
                 p("* This APP has three Tabs i.e, Annotation, Word Cloud, Network Plot",align="justify"),
                 p("   * Annotaton - All about Tokens and catagorize them with Part of Speech"),
                 p("   * Word Cloud - Two Word Clouds, one with VERBs and one with NOUNs",align="justify"),
                 p("   * Network Plot - Top 30 co-occurances at document level based on UPOS selection (sidebar)",align="justify"),
                 p("* Also download Annotation option available",align="justify")
                  ),
                    
                    
            tabPanel("Annotation", 
                 dataTableOutput('plot1')),
                    
            tabPanel("Word Cloud",
                 plotOutput('cloud')),
                    
            tabPanel("Network Plot",
                 plotOutput('co_occ'))
                    
        ) # end of tabsetPanel
      )# end of main panel
    ) # end of sidebarLayout
  )  # end if fluidPage
) # end of UI
