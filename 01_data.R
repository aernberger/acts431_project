#Verify project data
exam.p.data <- read.csv(
  "soa_exam_p_pass_rates_431_clean.csv"
)

head(exam.p.data)
summary(exam.p.data)

#Convert Pass Rate to a time series object
pass.rate <-exam.p.data$raw_pass_rate
pass.rate.ts <- ts(pass.rate)

#Pass Rate Stats
summary(pass.rate)
sd(pass.rate)

#Plot Time Series
plot.ts(
  pass.rate.ts,
  main = "SOA Exam P Pass Rates over Time",
  ylab = "Raw Pass Rate",
  xlab = "Exam Sitting Number"
)

#Convert Sittings to a time series object
candidate.number <-exam.p.data$candidates
candidate.number.ts <- ts(candidate.number)

#Candidate Sittings Stats
summary(candidate.number)
sd(candidate.number)

#Plot Time Series
plot.ts(
  candidate.number.ts,
  main = "SOA Exam P Number of Candidates over Time",
  ylab = "Number of Candidates",
  xlab = "Exam Sitting Number"
)
