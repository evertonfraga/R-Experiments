#
library(ggplot2)
rawFlights <- read.csv(
                    file = 'Projects/R-Experiments/seed/VRA-2014-12-manip2.csv',
                    header = TRUE,
                    fileEncoding="UTF-8",
                    sep = ";",
                    quote = '"'
                  )

# Considering only domestic flights
domestic <- rawFlights[rawFlights$TipoLinha == "N",]

# Considering non-canceled flights
domestic <- domestic[domestic$Situacao == "Realizado",]

# Converting string times to Date Time objects
domestic$PartidaPrevista <- strptime(domestic$PartidaPrevista, "%d/%m/%Y %H:%M")
domestic$PartidaReal <- strptime(domestic$PartidaReal, "%d/%m/%Y %H:%M")
domestic$ChegadaPrevista <- strptime(domestic$ChegadaPrevista, "%d/%m/%Y %H:%M")
domestic$ChegadaReal <- strptime(domestic$ChegadaReal, "%d/%m/%Y %H:%M")

# Calculating delays
domestic$delayDeparture <- as.numeric(difftime(domestic$PartidaReal, domestic$PartidaPrevista, units = 'min'))
domestic$delayArrival <- as.numeric(difftime(domestic$ChegadaReal, domestic$ChegadaPrevista, units = 'min'))
domestic$totalDelay <- domestic$delayDeparture + domestic$delayArrival

# removing outliers
#domestic <- domestic[domestic$totalDelay > -500,]
#domesticOutliers <- domestic[domestic$totalDelay < -499,]

# Flights per carrier
carrierFlights <- data.frame(table(domestic$SiglaEmpresa))
carrierFlights <- carrierFlights[carrierFlights$Freq > 0,]

# Total delay per carrier
carrierAggregate0 <- tapply(domestic$totalDelay, domestic$SiglaEmpresa, FUN = sum)
carrierAggregate <- aggregate(domestic$totalDelay, by=list(SiglaEmpresa=domestic$SiglaEmpresa), FUN=sum)


# Calculating flight durations
domestic$flighDurationExpected <- as.numeric(difftime(domestic$ChegadaPrevista, domestic$PartidaPrevista, units = 'min'))
domestic$flighDurationReal <- as.numeric(difftime(domestic$ChegadaReal, domestic$PartidaReal, units = 'min'))
domestic$timeAdded <- domestic$flighDurationReal - domestic$flighDurationExpected

