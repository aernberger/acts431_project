
library(tseries)

#Stationarity Testing for Pass Rates
acf(pass.rate.ts)
pacf(pass.rate.ts)
adf.test(pass.rate.ts)

#Stationarity Testing for Candidate Sittings
acf(candidate.number.ts)
pacf(candidate.number.ts)
adf.test(candidate.number.ts)

# Difference Pass Rate
pass.rate.diff <- diff(pass.rate.ts)

plot.ts(
  pass.rate.diff,
  main = "Differenced Exam P Pass Rates",
  ylab = "Change in Pass Rate",
  xlab = "Exam Sitting Number"
)

acf(pass.rate.diff)
pacf(pass.rate.diff)

adf.test(pass.rate.diff)

# Difference Candidate Volume
candidate.number.diff <- diff(candidate.number.ts)

plot.ts(
  candidate.number.diff,
  main = "Differenced Exam P Candidate Volume",
  ylab = "Change in Number of Candidates",
  xlab = "Exam Sitting Number"
)

acf(candidate.number.diff)
pacf(candidate.number.diff)

adf.test(candidate.number.diff)

#Determine that d=1 for both time series


