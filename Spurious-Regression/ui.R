# Andy Philips
# aphilips@pols.tamu.edu
# 12/23/15
# --------------------------------#


shinyUI(fluidPage(
	titlePanel("Spurious Regression Simulation"),

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
								  checkboxInput('regressors', "Add A Second Regressor", FALSE)
									),
								mainPanel(
									"This app examines the spurious regression problem with unit-roots in time series. Users can specify the number of observations, and add an additional regressor. A plot of the resulting series is shown, as well as a regression of Y on the X's--which have been generated independently.",
									plotOutput("plot"),
									br(),
									verbatimTextOutput("summary"),
									br(),
									plotOutput("resids", height = 300, width = 400),
									br(),
									p("Author: ",
										a("Andrew Q. Philips", href = "http://people.tamu.edu/~aphilips/"))
								)
	)



))