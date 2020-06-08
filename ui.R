# Flight-Dashboard using Shiny. 
# Written by : Bakti Siregar, M.Sc
# Department of Business statistics, Matana University (Tangerang)
# Notes: Please don't share this code anywhere (It's just for you)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "Flight Dashboard",
                    
      # Header
      dashboardHeader(title = "Flights-Dashboard",
                      titleWidth = 200,
                      tags$li(class = "dropdown",
                      tags$img(src = "Matana.png",
                               height = 45, 
                               length = 45))),
                    
      # Side bar of the Dashboard
      dashboardSidebar(
        selectInput(
          inputId = "airline",
          label = "Airline:",
          choices = airline_list,
          selected = "DL",
          selectize = FALSE),
        
          selectInput(
            inputId = "airport",
            label = "Airport:",
            choices = airport_list,
            selected = "ADS",
            selectize = FALSE),
        
      # Side menu of the Dashboard  
      sidebarMenu(
        selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          size = 13,
          selectize = FALSE),
        actionLink("remove", icon = icon("sync-alt"),"Remove detail tabs"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/jerrel-theos/NYCFlights"),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/jerrel-audric-theos-18714a1a3"),
        menuItem("Video", icon = icon("youtube"), href = "https://youtu.be/KZ8ADut_Nlk")
        )
      ),
      
      # The body of the dashboard
      dashboardBody(
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
          value = "page1",
        fluidRow(valueBoxOutput("total_flights"),
                 valueBoxOutput("per_day"),
                 valueBoxOutput("percent_delayed")),
        fluidRow(column(width = 6,d3Output("group_totals")),
                 column(width = 6,d3Output("top_airports")),
                 column(width = 6,d3Output("top_airlines")))
      )
    )
  )
)
