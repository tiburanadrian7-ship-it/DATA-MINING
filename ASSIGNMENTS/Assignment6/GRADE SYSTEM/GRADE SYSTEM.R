grade <- "F"

mark <- switch(
  grade,
  A = "Excellent",
  B = "Good",
  C = "Satisfactory",
  D = "Below Average",
  F = "Failure"
)
print(mark)