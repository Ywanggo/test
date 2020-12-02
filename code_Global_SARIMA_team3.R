library(readxl)
library(forecast)
library(leaflet)


Global <- read_excel("C:/Users/ywang/Desktop/Term 3/Predictive Analysis/Team Project/GlobalTemperatures.xlsx")

View(Global)
Global1 <-ts(Global[,2],frequency = 12, start = c(1960,1), end = c(2013,8))
plot(decompose(Global1))
seasonplot(Global1)
plot(Global1)

#ARIMA model
Global.training <- window(Global1, start = c(1960,1), end = c(2008,12))
Global.testing <- window(Global1, start = c(2009,1), end = c(2013,8))

model1 <- auto.arima(Global.training)
model1

Global.forecast <-forecast(model1, h =56)
Global.forecast
accuracy(Global.forecast,Global.testing)

checkresiduals(model1)

summary(model1)




