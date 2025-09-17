ope <- 1
num1 <- 4
num2 <- 16

operation <- switch(
  ope,
  paste("Addition: ", num1+num2),
  paste("Subtraction: ", num1-num2),
  paste("Multiplication: ", num1*num2),
  paste("Division: ", num1/num2)
)
print(operation)