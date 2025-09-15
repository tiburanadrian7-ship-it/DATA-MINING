sample_num <- c(20,55,70)
all <- all(sample_num > 50)
any <- any(sample_num > 50)

if(all == TRUE){
  print("All are above 50")
} else if(any == TRUE){
  print("Some are above 50")
} else{
  print("None are above 50")
}
