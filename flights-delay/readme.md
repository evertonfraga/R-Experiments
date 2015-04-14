## Flights Delay in Brazil

Features tested:
* CSV parsing


Packages used:

Data gathered from [http://www2.anac.gov.br/vra/]

- Sanitize main CSV header: remove spaces on column names, remove special characters

- Considering only domestic flights in Brazil:
Filtering by TipoLinha == N



![](image.png?raw=true)

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
