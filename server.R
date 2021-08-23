library(sp)
library(rgdal)
library(raster)
library(shiny)
library(dplyr)
library(leaflet)
library(geojsonR)
library(rgdal)
library(raster)
library(stringr)
library(plotly)
library(xts)
library(zoo)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  output$ndvi<-renderPlotly({
    
    source("modulo_1/ndvi.R")
    fig        
  })
  
  output$plot1_19<-renderLeaflet({
    
    source("modulo_1/potreros_2019.R")
    fig1
    
  })
  
  output$plot1_20<-renderLeaflet({
    
    source("modulo_1/potreros_2020.R")
    fig2  
    
  })
  observe({
    leafletProxy("plot1_20") %>% 
      addRasterImage(allrasters[[input$dateSel2]], colors=pal, project=F, opacity=0.8,method = "bilinear")
  })
    
  
  output$plot1_21<-renderLeaflet({
    
    source("modulo_1/potreros_2021.R")
    fig3    
    
  })
  
  output$ndvi_ml_pe<-renderPlotly({
    
    load("RData/ml_ndvi_punta_estero.RData")
    fig
    
  })
  
  output$ndvi_ml_pe_mae<-renderText({
    
    load("RData/ml_ndvi_punta_estero.RData")
    mae<-round(data.frame(deep_1@model$training_metrics@metrics$mae)[[1]],digits=4)
    mae<-paste0("MAE: ",mae)
  })
  
  output$ndvi_ml_pe_rmsle<-renderText({
    
    load("RData/ml_ndvi_punta_estero.RData")
    rmsle<-round(data.frame(deep_1@model$training_metrics@metrics$rmsle)[[1]],digits=4)    
    rmsle<-paste0("RMSLE: ",rmsle)
    
  })
  
  output$ndvi_ml_la<-renderPlotly({
    
    load("RData/ml_ndvi_laurel.RData")
    fig_la
    
  })
  
  output$ndvi_ml_la_mae<-renderText({
    
    load("RData/ml_ndvi_laurel.RData")
    mae<-round(data.frame(deep_2@model$training_metrics@metrics$mae)[[1]],digits=4)  
    mae<-paste0("MAE: ",mae)
    
  })
  
  output$ndvi_ml_la_rmsle<-renderText({
    
    load("RData/ml_ndvi_laurel.RData")
    rmsle<-round(data.frame(deep_2@model$training_metrics@metrics$rmsle)[[1]],digits=4)    
    rmsle<-paste0("RMSLE: ",rmsle)
    
  })
  
})
