oos.pass.rate <- arima(
  pass.rate.ts,
  order = c(2,1,0)
)

oos.candidate <- arima(
  candidate.number.ts,
  order = c(2,1,0),
  seasonal = list(
    order = c(1,0,0),
    period = 3
  )
)

#Residuals for final pass rate model
pass.rate.resid <- oos.pass.rate$residuals

#Standardized residuals
pass.rate.stdresid <- pass.rate.resid / sd(pass.rate.resid)

#Residuals for final candidate volume model
candidate.resid <- oos.candidate$residuals

#Standardized residuals
candidate.stdresid <- candidate.resid / sd(candidate.resid)

#Pass Rate Residual Diagnostics
plot.ts(
  pass.rate.stdresid,
  main = "Standardized Residuals: Exam P Pass Rate",
  ylab = "Standardized Residual",
  xlab = "Exam Sitting Number"
)

acf(pass.rate.stdresid)

pacf(pass.rate.stdresid)

qqnorm(
  pass.rate.stdresid,
  main = "Q-Q Plot: Exam P Pass Rate Residuals"
)

qqline(pass.rate.stdresid)

#Candidate Volume Residual Diagnostics
plot.ts(
  candidate.stdresid,
  main = "Standardized Residuals: Exam P Candidate Volume",
  ylab = "Standardized Residual",
  xlab = "Exam Sitting Number"
)

acf(candidate.stdresid)

pacf(candidate.stdresid)

qqnorm(
  candidate.stdresid,
  main = "Q-Q Plot: Exam P Candidate Volume Residuals"
)

qqline(candidate.stdresid)

#Squared residuals for Pass Rate
pass.rate.resid.squared <- pass.rate.stdresid^2

plot.ts(
  pass.rate.resid.squared,
  main = "Squared Residuals: Exam P Pass Rate",
  ylab = "Squared Standardized Residual",
  xlab = "Exam Sitting Number"
)

acf(pass.rate.resid.squared)

Box.test(
  pass.rate.resid.squared,
  lag = 12,
  type = "Ljung-Box"
)

#Squared residuals for Candidate Volume
candidate.resid.squared <- candidate.stdresid^2

plot.ts(
  candidate.resid.squared,
  main = "Squared Residuals: Exam P Candidate Volume",
  ylab = "Squared Standardized Residual",
  xlab = "Exam Sitting Number"
)

acf(candidate.resid.squared)

Box.test(
  candidate.resid.squared,
  lag = 12,
  type = "Ljung-Box"
)


#Serial correlation test for pass rate residuals
Box.test(
  pass.rate.stdresid,
  lag = 12,
  type = "Ljung-Box"
)

#Serial correlation test for candidate volume residuals
Box.test(
  candidate.stdresid,
  lag = 12,
  type = "Ljung-Box"
)
