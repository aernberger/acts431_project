#Pass Rate In-Sample 95% Forecast Interval
pass.rate.insample.lower <-
  pass.rate.insample.forecast$pred -
  1.96 * pass.rate.insample.forecast$se

pass.rate.insample.upper <-
  pass.rate.insample.forecast$pred +
  1.96 * pass.rate.insample.forecast$se


#Pass Rate OOS 95% Forecast Interval
pass.rate.oos.lower <-
  pass.rate.oos.forecast$pred -
  1.96 * pass.rate.oos.forecast$se

pass.rate.oos.upper <-
  pass.rate.oos.forecast$pred +
  1.96 * pass.rate.oos.forecast$se


#Candidate Volume In-Sample 95% Forecast Interval
candidate.insample.lower <-
  candidate.insample.forecast$pred -
  1.96 * candidate.insample.forecast$se

candidate.insample.upper <-
  candidate.insample.forecast$pred +
  1.96 * candidate.insample.forecast$se


#Candidate Volume OOS 95% Forecast Interval
candidate.oos.lower <-
  candidate.oos.forecast$pred -
  1.96 * candidate.oos.forecast$se

candidate.oos.upper <-
  candidate.oos.forecast$pred +
  1.96 * candidate.oos.forecast$se

#Outputs
pass.rate.insample.lower
pass.rate.insample.upper

pass.rate.oos.lower
pass.rate.oos.upper

candidate.insample.lower
candidate.insample.upper

candidate.oos.lower
candidate.oos.upper



