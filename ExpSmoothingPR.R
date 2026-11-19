#Finding optimal alpha for smoothing

#Smoothing Function
exp.smooth <- function(data, alpha) {
  smoothed <- numeric(length(data))
  smoothed[1] <- data[1]
  
  for (t in 2:length(data)) {
    smoothed[t] <-
      alpha * data[t] +
      (1 - alpha) * smoothed[t - 1]
  }
  
  return(smoothed)
}

#Evaluate Alpha using MAE
alpha.mae <- function(data, alpha) {
  
  smoothed <- exp.smooth(data, alpha)
  
  predicted <- smoothed[1:(length(smoothed) - 1)]
  actual <- data[2:length(data)]
  
  mae <- mean(abs(actual - predicted))
  
  return(mae)
}

#Find Optimal Alpha
alpha.values <- seq(0.01, 0.99, by = 0.01)

alpha.mae.values <- numeric(length(alpha.values))

for (i in 1:length(alpha.values)) {
  alpha.mae.values[i] <- alpha.mae(
    pass.rate.train,
    alpha.values[i]
  )
}

optimal.alpha <- alpha.values[
  which.min(alpha.mae.values)
]

optimal.alpha
min(alpha.mae.values)

#Pass Rate smoothed OOS Forecasts
pass.rate.smooth.pred <- numeric(12)

#Fit smoothing to training data
pass.rate.smooth.train <- exp.smooth(
  pass.rate.train,
  alpha = optimal.alpha
)

#Last smoothed training value predicts first test observation
current.level <- tail(pass.rate.smooth.train, 1)

for (i in 1:12) {

  pass.rate.smooth.pred[i] <- current.level
  
  current.level <-
    optimal.alpha * pass.rate.test[i] +
    (1 - optimal.alpha) * current.level
}

pass.rate.smooth.oos <- oos_metrics(
  pass.rate.test,
  pass.rate.smooth.pred
)

pass.rate.smooth.oos