#Pass Rate OOS Forecast Plot
plot(
  pass.rate.ts,
  xlim = c(1, 113),
  ylim = range(
    pass.rate.ts,
    pass.rate.oos.lower,
    pass.rate.oos.upper
  ),
  main = "Exam P Pass Rate Forecast - OOS Model",
  xlab = "Exam Sitting Number",
  ylab = "Pass Rate",
  type = "l"
)

#Point Forecast
lines(
  108:113,
  pass.rate.oos.forecast$pred,
  col = "blue",
  lwd = 2
)

#95% Forecast Interval
lines(
  108:113,
  pass.rate.oos.lower,
  col = "red",
  lty = 2
)

lines(
  108:113,
  pass.rate.oos.upper,
  col = "red",
  lty = 2
)

#Pass Rate In-Sample Forecast Plot
plot(
  pass.rate.ts,
  xlim = c(1, 113),
  ylim = range(
    pass.rate.ts,
    pass.rate.insample.lower,
    pass.rate.insample.upper
  ),
  main = "Exam P Pass Rate Forecast - In-Sample Model",
  xlab = "Exam Sitting Number",
  ylab = "Pass Rate",
  type = "l"
)

#Point Forecast
lines(
  108:113,
  pass.rate.insample.forecast$pred,
  col = "blue",
  lwd = 2
)

#95% Forecast Interval
lines(
  108:113,
  pass.rate.insample.lower,
  col = "red",
  lty = 2
)

lines(
  108:113,
  pass.rate.insample.upper,
  col = "red",
  lty = 2
)

#Candidate Volume OOS Forecast Plot
plot(
  candidate.number.ts,
  xlim = c(1, 113),
  ylim = range(
    candidate.number.ts,
    candidate.oos.lower,
    candidate.oos.upper
  ),
  main = "Exam P Candidate Volume Forecast - OOS Model",
  xlab = "Exam Sitting Number",
  ylab = "Candidate Volume",
  type = "l"
)

#Point Forecast
lines(
  108:113,
  candidate.oos.forecast$pred,
  col = "blue",
  lwd = 2
)

#95% Forecast Interval
lines(
  108:113,
  candidate.oos.lower,
  col = "red",
  lty = 2
)

lines(
  108:113,
  candidate.oos.upper,
  col = "red",
  lty = 2
)

#Candidate Volume In-Sample Forecast Plot
plot(
  candidate.number.ts,
  xlim = c(1, 113),
  ylim = range(
    candidate.number.ts,
    candidate.insample.lower,
    candidate.insample.upper
  ),
  main = "Exam P Candidate Volume Forecast - In-Sample Model",
  xlab = "Exam Sitting Number",
  ylab = "Candidate Volume",
  type = "l"
)

#Point Forecast
lines(
  108:113,
  candidate.insample.forecast$pred,
  col = "blue",
  lwd = 2
)

#95% Forecast Interval
lines(
  108:113,
  candidate.insample.lower,
  col = "red",
  lty = 2
)

lines(
  108:113,
  candidate.insample.upper,
  col = "red",
  lty = 2
)