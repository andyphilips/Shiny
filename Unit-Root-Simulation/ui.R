# Andy Philips
# andrew.philips@colorado.edu
# 2017
# --------------------------------#
library(shiny)

shinyUI(fluidPage(
	includeCSS("style.css"),
  titlePanel("Unit-Root Simulation"),
  sidebarLayout(position = "right",
    sidebarPanel(
                    selectInput(inputId = "obs",
                                label = "Observations:",
                                choices = c(10, 25, 50, 100, 250, 500, 1000),
                                selected = 100),
                    br(),
                    actionButton("goButton", "Re-Simulate"),
                    br(),
                    br(),
                    radioButtons("pType", "Choose plot type:",
                                 list("Unit Root", "With Drift", "With Trend", "With Drift and Trend")),
                    br(),
                    br(),
                    checkboxInput('struc.break', "Add structural break halfway through the series", FALSE),
                    br(),
                    sliderInput(inputId = "drift.size", label = ("Magnitude of Drift"), min = -5.00, max = 5.00, value = 0.25, step = 0.25),
                    br(),
                    sliderInput(inputId = "trend.size", label = ("Magnitude of Trend"), min = -.20, max = .20, value = 0.02, step = 0.02),
                    br(),
                    sliderInput(inputId = "break.size", label = ("Magnitude of Break"), min = -3.00, max = 3.00, value = 0.00, step = 0.25)
                  ),
    mainPanel("This app lets you simulate unit-root processes. You have the option of adding a drift and/or deterministic trend to the series. You can also add a structural break to occur halfway through the series.",
            plotOutput("plot"),
            br(),
            br(),
            br(),
            p("Author: ",
              a("Andrew Q. Philips", href = "http://www.andyphilips.com"))
  )
  )
))