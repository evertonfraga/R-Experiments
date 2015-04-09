## Plotting bus route on map, from csv file

Features tested:
* CSV reading
* Map plotting

Packages used:
* GGMap - Google maps imagery
* GGPlot2

Data gathered from [http://data.rio.rj.gov.br/]

![Bus route plot](image.png?raw=true)

Plotting map: 
```{r}
ggmap(rio) +
geom_point(aes(x=longitude, y=latitude), data=routes, color="red", size=1)
```
