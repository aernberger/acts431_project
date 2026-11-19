#Find Optimal Alpha for Candidate Volume
candidate.alpha.values <- seq(0.01, 0.99, by = 0.01)

candidate.alpha.mae.values <- numeric(
  length(candidate.alpha.values)
)

for (i in 1:length(candidate.alpha.values)) {
  
  candidate.alpha.mae.values[i] <- alpha.mae(
    candidate.train,
    candidate.alpha.values[i]
  )
}

candidate.optimal.alpha <- candidate.alpha.values[
  which.min(candidate.alpha.mae.values)
]

candidate.optimal.alpha
min(candidate.alpha.mae.values)

#Candidate Volume Smoothed OOS Forecasts
candidate.smooth.pred <- numeric(12)

#Fit smoothing to training data
candidate.smooth.train <- exp.smooth(
  candidate.train,
  alpha = candidate.optimal.alpha
)

#Last smoothed training value predicts first test observation
current.level <- tail(candidate.smooth.train, 1)

for (i in 1:12) {
  
  candidate.smooth.pred[i] <- current.level
  
  current.level <-
    candidate.optimal.alpha * candidate.test[i] +
    (1 - candidate.optimal.alpha) * current.level
}

candidate.smooth.oos <- oos_metrics(
  candidate.test,
  candidate.smooth.pred
)

candidate.smooth.oos