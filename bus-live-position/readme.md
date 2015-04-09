## Plotting buses' live position on map, from CSV file

Features tested:
* CSV parsing
* Map plotting
* Map customization: map type
* Point color and size associated with bus speed

Packages used:
* GGMap - Google maps imagery
* GGPlot2

Data gathered from [http://data.rio.rj.gov.br/dataset/gps-de-onibus]

![Buses position plot](image.png?raw=true)

Plotting map: 
```{r}

positions <- read.csv(file = 'http://dadosabertos.rio.rj.gov.br/apiTransporte/apresentacao/csv/onibus.cfm', header = TRUE)

positions$velocidade[positions$velocidade > 100] <- 100

library(ggmap, ggplot2)
rio <- get_map(location="-22.9,-43.3", zoom=11, maptype="terrain",color="bw")

ggmap(rio, extent = "device") +
  geom_point(aes(x = longitude, y = latitude, color = velocidade, size = velocidade), 
             data=positions,
            ) +
  scale_color_gradientn(colours = rainbow(10))

```
