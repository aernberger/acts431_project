#Try all p and q values of 0-2
pass_rate_results <- data.frame()
for (p in 0:2) {
  for (q in 0:2) {
    
    model <- arima(
      pass.rate.ts,
      order = c(p, 1, q)
    )
    
    pass_rate_results <- rbind(
      pass_rate_results,
      c(p, 1, q, AIC(model), BIC(model))
    )
  }
}

names(pass_rate_results) <- c("p", "d", "q", "AIC", "BIC")

# Rank by AIC
pass_rate_results[order(pass_rate_results$AIC), ]

# Rank by BIC
pass_rate_results[order(pass_rate_results$BIC), ]

#ARIMA modeling for pass rates ARIMA(2,1,0) from script 2
prmodel1 <- arima(
  pass.rate.ts,
  order = c(2,1,0)
)

#ARIMA modeling for pass rates using best aic/bic results
prmodel2 <- arima(
  pass.rate.ts,
  order = c(1,1,1)
)

#ARIMA modeling for pass rates using ma
prmodel3 <- arima(
  pass.rate.ts,
  order = c(0,1,2)
)

#Model outputs and AIC/BIC Comparison
prmodel1
prmodel2
prmodel3

AIC(prmodel1)
AIC(prmodel2)
AIC(prmodel3)

BIC(prmodel1)
BIC(prmodel2)
BIC(prmodel3)

tsdiag(prmodel1)
tsdiag(prmodel2)
tsdiag(prmodel3)

#Final selection model is ARIMA(1,1,1)




