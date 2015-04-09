# Plotting bus route on map

routes <- read.csv("http://dadosabertos.rio.rj.gov.br/apiTransporte/Apresentacao/csv/gtfs/onibus/percursos/gtfs_linha308-shapes.csv",
                   header=TRUE, sep=",")

library(ggmap, ggplot2)
rio <- get_map(location="Rio de Janeiro, Brazil", zoom=11, maptype="roadmap")

ggmap(rio) +
geom_point(aes(x=longitude, y=latitude), data=routes, color="red", size=1)
