rm(list=ls())
library(tseries)
library(forecast)
library(ggplot2)
library(readxl)

Spain_model_datasetS_W07_corrected <- read_excel("Desktop/tfg*/TFG/DATA/Spain_model_datasetS&W07_corrected.xlsx", sheet = "data without crisis trend")

consumption <-  ts(Spain_model_datasetS_W07_corrected$consumption, frequency = 4, start = 1999)
modelconsumption <- auto.arima(consumption)
cons <- forecast(modelconsumption, h = 40)
c<- cons$mean

investment <- ts(Spain_model_datasetS_W07_corrected$investment, frequency = 4, start = 1999)
modelinvestment <- auto.arima(investment)
inve <- forecast(modelinvestment, h = 40)
inv <- inve$mean

output <- ts(Spain_model_datasetS_W07_corrected$output, frequency = 4, start = 1999)
modeloutput <- auto.arima(output)
outp <- forecast(modeloutput, h = 40)
y<- outp$mean

hours <- ts(Spain_model_datasetS_W07_corrected$hours, frequency = 4, start=1999)
modelhours <- auto.arima(hours)
h <- forecast(modelhours, h = 40)
hrs <- h$mean

inflation <- ts(Spain_model_datasetS_W07_corrected$inflation, frequency = 4, start = 1999)
modelinflation <- auto.arima(inflation)
infla <- forecast(modelinflation, h = 40)
pi <- infla$mean

realwage <- ts(Spain_model_datasetS_W07_corrected$`real wage`, frequency = 4, start = 1999)
modelrealw <- auto.arima(realwage)
realw <- forecast(modelrealw, h = 40)
rw <- realw$mean

interestrate <- ts(Spain_model_datasetS_W07_corrected$`interest rate`, frequency = 4, start = 1999)
modelintrate <- auto.arima(interestrate)
r <- forecast(modelintrate, h = 40)
intr <- r$mean

library(dplyr)
data <- data.frame('c'=c, 'inv'=inv,'y'=y, 'hrs'= hrs, 'pi'=pi, 'rw'=rw, 'intr'= intr)
View(data)

write.csv(data,'data.csv')






  
  