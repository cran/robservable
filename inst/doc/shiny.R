## ---- include=FALSE-----------------------------------------------------------
library(robservable)
library(htmlwidgets)
knitr::opts_chunk$set(
  screenshot.force = FALSE,
  echo = TRUE
)

## ---- eval = FALSE------------------------------------------------------------
#  ## Basic robservable Shiny app
#  
#  library(shiny)
#  library(robservable)
#  
#  data("USPersonalExpenditure")
#  
#  ui <- fluidPage(
#      titlePanel("robservable basic Shiny app"),
#      sidebarLayout(
#          sidebarPanel(
#              selectInput(
#                  "year",
#                  label = "Year",
#                  choices = colnames(USPersonalExpenditure)
#              )
#          ),
#          mainPanel(
#             robservableOutput("chart", width = 600)
#          )
#      )
#  )
#  
#  
#  server <- function(input, output) {
#  
#      df <- reactive({
#          data.frame(
#              name = rownames(USPersonalExpenditure),
#              value = USPersonalExpenditure[, input$year]
#          )
#      })
#  
#      output$chart <- renderRobservable({
#          robservable(
#              "@d3/horizontal-bar-chart",
#              include = "chart",
#              input = list(
#                  data = df(),
#                  margin = list(top = 20, right = 20, bottom = 30, left = 130)
#              ),
#              width = 600
#          )
#      })
#  }
#  
#  shinyApp(ui = ui, server = server)

