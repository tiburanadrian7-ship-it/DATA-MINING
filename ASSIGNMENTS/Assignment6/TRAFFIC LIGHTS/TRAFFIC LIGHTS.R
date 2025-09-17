signal <- "green"

Color <- switch(
  signal,
  red = "Stop",
  yellow = "Ready",
  green = "Go",
  "Invalid Signal"
)
print(Color)