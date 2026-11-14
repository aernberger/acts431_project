#Residuals for final pass rate model
pass.rate.resid <- prmodel2$residuals

#Standardized residuals
pass.rate.stdresid <- pass.rate.resid / sd(pass.rate.resid)

#Residuals for final candidate volume model
candidate.resid <- scvmodel3$residuals

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