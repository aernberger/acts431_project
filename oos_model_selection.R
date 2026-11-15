#Function to calculate oos performance metrics
oos_metrics <- function(actual, predicted) {
  mse <- mean((actual - predicted)^2)
  rmse <- sqrt(mse)
  mae <- mean(abs(actual-predicted))
  mape <- mean(abs((actual - predicted) / actual)) * 100
  
  return(c(
    MSE = mse,
    RMSE = rmse,
    MAE = mae,
    MAPE = mape
  ))
}



#Train on the first 95, test on last 12 sittings for oos performance

pass.rate.train <- head(pass.rate.ts, -12)
pass.rate.test <- tail(pass.rate.ts, 12)

candidate.train <- head(candidate.number.ts, -12)
candidate.test <- tail(candidate.number.ts, 12)


#Use the different model options to determine best model by oos
#ARIMA(2,1,0)   # prmodel1
#ARIMA(1,1,1)   # prmodel2
#ARIMA(0,1,2)   # prmodel3

#SARIMA(2,1,0)(1,0,0)[3]   # scvmodel1
#SARIMA(2,1,0)(0,0,1)[3]   # scvmodel2
#SARIMA(2,1,0)(1,0,0)[6]   # scvmodel3
#SARIMA(2,1,0)(0,0,1)[6]   # scvmodel4

#Pass rate models
pass.rate.pred1 <- numeric(12)
pass.rate.pred2 <- numeric(12)
pass.rate.pred3 <- numeric(12)

for (i in 1:12) {
  
  # Expanding training set
  current.train <- head(
    pass.rate.ts,
    length(pass.rate.train) + i - 1
  )
  
  # ARIMA(2,1,0)
  model1 <- arima(
    current.train,
    order = c(2,1,0)
  )
  
  # ARIMA(1,1,1)
  model2 <- arima(
    current.train,
    order = c(1,1,1)
  )
  
  # ARIMA(0,1,2)
  model3 <- arima(
    current.train,
    order = c(0,1,2)
  )
  
  # One-step-ahead forecasts
  pass.rate.pred1[i] <- predict(model1, n.ahead = 1)$pred[1]
  pass.rate.pred2[i] <- predict(model2, n.ahead = 1)$pred[1]
  pass.rate.pred3[i] <- predict(model3, n.ahead = 1)$pred[1]
}

pass.rate.oos <- rbind(
  ARIMA_210 = oos_metrics(pass.rate.test, pass.rate.pred1),
  ARIMA_111 = oos_metrics(pass.rate.test, pass.rate.pred2),
  ARIMA_012 = oos_metrics(pass.rate.test, pass.rate.pred3)
)

pass.rate.oos

#Candidate volume models
candidate.pred1 <- numeric(12)
candidate.pred2 <- numeric(12)
candidate.pred3 <- numeric(12)
candidate.pred4 <- numeric(12)
candidate.pred5 <- numeric(12)

for (i in 1:12) {
  
  current.train <- head(
    candidate.number.ts,
    length(candidate.train) + i - 1
  )
  
  # ARIMA(2,1,0)
  model1 <- arima(
    current.train,
    order = c(2,1,0)
  )
  
  # SARIMA(2,1,0)(1,0,0)[3]
  model2 <- arima(
    current.train,
    order = c(2,1,0),
    seasonal = list(
      order = c(1,0,0),
      period = 3
    )
  )
  
  # SARIMA(2,1,0)(0,0,1)[3]
  model3 <- arima(
    current.train,
    order = c(2,1,0),
    seasonal = list(
      order = c(0,0,1),
      period = 3
    )
  )
  
  # SARIMA(2,1,0)(1,0,0)[6]
  model4 <- arima(
    current.train,
    order = c(2,1,0),
    seasonal = list(
      order = c(1,0,0),
      period = 6
    )
  )
  
  # SARIMA(2,1,0)(0,0,1)[6]
  model5 <- arima(
    current.train,
    order = c(2,1,0),
    seasonal = list(
      order = c(0,0,1),
      period = 6
    )
  )
  
  candidate.pred1[i] <- predict(model1, n.ahead = 1)$pred[1]
  candidate.pred2[i] <- predict(model2, n.ahead = 1)$pred[1]
  candidate.pred3[i] <- predict(model3, n.ahead = 1)$pred[1]
  candidate.pred4[i] <- predict(model4, n.ahead = 1)$pred[1]
  candidate.pred5[i] <- predict(model5, n.ahead = 1)$pred[1]
}

candidate.oos <- rbind(
  ARIMA_210 = oos_metrics(candidate.test, candidate.pred1),
  SARIMA_100_3 = oos_metrics(candidate.test, candidate.pred2),
  SARIMA_001_3 = oos_metrics(candidate.test, candidate.pred3),
  SARIMA_100_6 = oos_metrics(candidate.test, candidate.pred4),
  SARIMA_001_6 = oos_metrics(candidate.test, candidate.pred5)
)

candidate.oos


#OOS favors ARIMA(2,1,0) and SARIMA(2,1,0)(1,0,0)[3]
