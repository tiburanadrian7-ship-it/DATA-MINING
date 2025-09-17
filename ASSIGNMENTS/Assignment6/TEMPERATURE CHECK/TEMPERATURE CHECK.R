temp <- c(32,35,29,40,38)

if(all(temp>=30)){
  print("All Days were Hot")
}else if(any(temp<30)){
  print("Some Days were below 30")
}