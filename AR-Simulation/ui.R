# Andy Philips
# aphilips@pols.tamu.edu
# 12/23/15
# --------------------------------#

shinyUI(fluidPage(
  titlePanel("AR Simulation"),

  sidebarLayout(position = "right",
    sidebarPanel(
    	selectInput(inputId = "obs",
    		label = "Observations:",
    		choices = c(10, 25, 50, 100, 250, 500, 1000),
    		selected = 100),
				br(),
    		sliderInput(inputId = "phi", label = ("Autoregressive Parameter"), min = 0.00, max = .99, value = .50),
				br(),
				actionButton("goButton", "Re-Simulate")
   	),
    mainPanel(
      "This app lets you simulate autoregressive (AR) processes",
      plotOutput("plot"),
      br(),
      br(),
      br(),
      p("Author: ",
      a("Andrew Q. Philips", href = "http://people.tamu.edu/~aphilips/"))
    )
  )



))
