library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(plotly)
library(DT)
library(shinyjqui)
library(polished)
library(knitr)
library(fresh)
library(bs4Dash)
library(waiter)
library(xts)
library(argonR)
library(argonDash)
library(shinyWidgets)
library(shinyEffects)
library(sendmailR)

ui <- fluidPage(
  useArgonDash(),setBackgroundColor(color = "ghostwhite"),
  
  
  bs4DashPage(fullscreen = TRUE,dark = NULL,skin = "green",
              dashboardHeader(title=bs4DashBrand(
                title = "AgroSpace",
                color = "primary",
                href = "https://dash.agrospace.cl",
                image = "https://pbs.twimg.com/profile_images/1063094754228011008/-AN6PKnB_400x400.jpg",opacity = 1
                
              )),
              
              
              bs4DashSidebar(width = "1000",
                             bs4SidebarMenu(
                               #menuItem("Imagenes historicas",tabName = "modulo1",icon = icon("globe-americas")),
                               bs4SidebarMenuItem("Imagenes Satelitales",tabName = "modulo1",icon = icon("globe-americas"))
                             )
              ),
              bs4DashBody(bs4TabItems(
                bs4TabItem(tabName = "modulo1",
                           
                           fluidRow(argonCard(title = "Potreros 2019",leafletOutput("plot1_19"),status = "primary"
                                              ,width = 4,maximizable = TRUE,hover_lift = TRUE,shadow = TRUE,gradient = TRUE,
                                              background_color = "lightgreen",hover_shadow = TRUE),
                                    argonCard(title = "Potreros 2020",leafletOutput("plot1_20"),status = "primary"
                                              ,width = 4,maximizable = TRUE,hover_lift = TRUE,shadow = TRUE,gradient = TRUE,
                                              background_color = "lightgreen",hover_shadow = TRUE),
                                    argonCard(title = "Potreros 2021",leafletOutput("plot1_21") ,status = "primary"
                                              ,width = 4,maximizable = TRUE,hover_lift = TRUE,shadow = TRUE,gradient = TRUE,
                                              background_color = "lightgreen",hover_shadow = TRUE),
                                    argonCard(width = 4,sliderInput("dateSel1", "Date",
                                                                    min = 9,
                                                                    max = 40,
                                                                    value = 9,
                                                                    step = 1,
                                                                    dragRange = TRUE,
                                                                    #timeFormat = "%d %b %y",
                                                                    animate = animationOptions(interval = 500, loop = FALSE))),
                                    argonCard(width = 4,sliderInput("dateSel2", "Date",
                                                         min = 9,
                                                         max = 40,
                                                         value = 9,
                                                         step = 1,
                                                         #timeFormat = "%d %b %y",
                                                         animate = animationOptions(interval = 500, loop = FALSE))),
                                    argonCard(width = 4,sliderInput("dateSel3", "Date",
                                                                    min = 9,
                                                                    max = 40,
                                                                    value = 9,
                                                                    step = 1,
                                                                    #timeFormat = "%d %b %y",
                                                                    animate = animationOptions(interval = 500, loop = FALSE)))
                
              ))))
))



