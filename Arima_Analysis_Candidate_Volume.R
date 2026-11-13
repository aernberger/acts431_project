#Try all p and q values of 0-2
candidate_results <- data.frame()
for (p in 0:2) {
  for (q in 0:2) {
    
    model <- arima(
      candidate.number.ts,
      order = c(p, 1, q)
    )
    
    candidate_results <- rbind(
      candidate_results,
      c(p, 1, q, AIC(model), BIC(model))
    )
  }
}

names(candidate_results) <- c("p", "d", "q", "AIC", "BIC")

# Rank by AIC
candidate_results[order(candidate_results$AIC), ]

# Rank by BIC
candidate_results[order(candidate_results$BIC), ]

#ARIMA modeling for candidate volume using p=2
cvmodel1 <- arima(
  candidate.number.ts,
  order = c(2,1,0)
)

cvmodel2 <- arima(
  candidate.number.ts,
  order = c(2,1,1)
)

cvmodel3 <- arima(
  candidate.number.ts,
  order = c(2,1,2)
)

#Model outputs and AIC/BIC Comparison
cvmodel1
cvmodel2
cvmodel3

AIC(cvmodel1)
AIC(cvmodel2)
AIC(cvmodel3)

BIC(cvmodel1)
BIC(cvmodel2)
BIC(cvmodel3)

tsdiag(cvmodel1)
tsdiag(cvmodel2)
tsdiag(cvmodel3)

#Ljung_Box doesn't pass for any, add seasonality using best BIC model (simple)
scvmodel1 <- arima(
  candidate.number.ts,
  order = c(2,1,0),
  seasonal = list(
    order = c(1,0,0),
    period = 3
  )
)

scvmodel2 <- arima(
  candidate.number.ts,
  order = c(2,1,0),
  seasonal = list(
    order = c(0,0,1),
    period = 3
  )
)

scvmodel3 <- arima(
  candidate.number.ts,
  order = c(2,1,0),
  seasonal = list(
    order = c(1,0,0),
    period = 6
  )
)

scvmodel4 <- arima(
  candidate.number.ts,
  order = c(2,1,0),
  seasonal = list(
    order = c(0,0,1),
    period = 6
  )
)

scvmodel1
scvmodel2
scvmodel3
scvmodel4

AIC(scvmodel1)
AIC(scvmodel2)
AIC(scvmodel3)
AIC(scvmodel4)

BIC(scvmodel1)
BIC(scvmodel2)
BIC(scvmodel3)
BIC(scvmodel4)

tsdiag(scvmodel1)
tsdiag(scvmodel2)
tsdiag(scvmodel3)
tsdiag(scvmodel4)


#Final plot is a SARIMA(2,1,0)(1,0,0) with s=6
