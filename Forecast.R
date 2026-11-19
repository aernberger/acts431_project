#Pass Rate In-Sample
pass.rate.insample.forecast <- predict(
  prmodel2,
  n.ahead = 6
)

#Pass Rate OOS 
pass.rate.oos.forecast <- predict(
  oos.pass.rate,
  n.ahead = 6
)

#Candidate Volume In-Sample
candidate.insample.forecast <- predict(
  scvmodel3,
  n.ahead = 6
)

#Candidate Volume OOS 
candidate.oos.forecast <- predict(
  oos.candidate,
  n.ahead = 6
)

pass.rate.insample.forecast
pass.rate.oos.forecast

candidate.insample.forecast
candidate.oos.forecast