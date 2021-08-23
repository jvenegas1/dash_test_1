temp = list.files(pattern="*.tif")
myfiles = lapply(temp, raster)

allrasters <- stack(temp)

pal = colorNumeric("viridis", values(allrasters[[1]]),na.color = "transparent")

ubicacion<-matrix(0,15,2)
ubicacion<-data.frame(ubicacion)
file_js_2<-readOGR("shape/agrospace_piloto.kml")

for(i in seq(1:15)){
  ubicacion[i,1]<-data.frame(file_js_2@polygons[[i]]@labpt[1])
  ubicacion[i,2]<-data.frame(file_js_2@polygons[[i]]@labpt[2])
}

ubicacion<-cbind(file_js_2@data$Name,ubicacion)
colnames(ubicacion)<-c("name","long","lat")

series<-matrix(0,42,15)
series<-data.frame(series)
colnames(series)<-ubicacion$name
names(allrasters)

fechas<-str_sub(names(allrasters), 18, 27)

rownames(series)<-fechas

escala<-c(0,0.2,0.4,0.6,0.8,1)


# output interactive plot
fig2<-leaflet() %>%
  setView(lng = ubicacion$long[8], lat = ubicacion$lat[8], zoom = 14) %>%
  addTiles() %>%
  addProviderTiles("Stamen.TonerLite", options = providerTileOptions(noWrap = TRUE)) %>%
  leaflet::addLegend(pal=pal, position='bottomright', values=values(allrasters[[1]]), title='NDVI')
