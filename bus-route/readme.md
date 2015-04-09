---
title: "Plotting bus route"
output: html_document
---

## Plotting bus route on map, from csv file

Packages used:
* GGMap
* GGPlot2

[Bus route plot](image.png?raw=true)

Data gathered from [http://data.rio.rj.gov.br/]

```{r}
ggmap(rio) +
geom_point(aes(x=longitude, y=latitude), data=routes, color="red", size=1)
```
