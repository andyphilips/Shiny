# Andy Philips
# aphilips@pols.tamu.edu
# 12/04/15
# --------------------------------#
library(shiny)

shinyUI(fluidPage(
  titlePanel("Unit-Root Simulation"),
  sidebarLayout(position = "right",
    sidebarPanel(
                    selectInput(inputId = "obs",
                                label = "Observations:",
                                choices = c(10, 25, 50, 100, 250, 500, 1000),
                                selected = 100),
                    br(),
                    radioButtons("pType", "Choose plot type:",
                                 list("Unit Root", "With Drift", "With Trend", "With Drift and Trend"))
                  ),
    mainPanel("This app lets you simulate unit-root processes. You have the option of adding a drift and/or deterministic trend to the series.",
            plotOutput("plot"),
            br(),
            br(),
            br(),
            p("Author: ",
              a("Andrew Q. Philips", href = "http://people.tamu.edu/~aphilips/"))
  )
  )
))