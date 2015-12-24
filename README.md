# Shiny
Here you can find my collection of Shiny apps for R. To use these apps, you need to have both [R](https://www.r-project.org/) and [RStudio](https://www.rstudio.com/). You also need to have the `shiny` library in RStudio (type `install.packages("shiny")` and then load it thorugh `library(shiny)`).

To run a particular Shiny app, type `runGitHub("andyphilips/Shiny", subdir = "<shiny-App>")` into the R console. For instance, to run the Autoregressive Shiny app, type `runGitHub("andyphilips/Shiny", subdir = "AR-Simulation")`. The interactive app will pop up in your browser. The list of apps is here:

| Name  | Purpose  |   
|---|---|
| [AR-Simulation](https://github.com/andyphilips/Shiny/tree/master/AR-Simulation)  | To simulate autoregressive (AR1) processes.   |
| [Unit-Root-Simulation](https://github.com/andyphilips/Shiny/tree/master/Unit-Root-Simulation)  |  To simulate unit-roots. |  
[Spurious-Regression](https://github.com/andyphilips/Shiny/tree/master/Spurious-Regression)	|	To examine the spurious regression problem of unit-roots.	|