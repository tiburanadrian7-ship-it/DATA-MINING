nums <- c(2,4,5,8)

if(all(nums %% 2 == 0)) {
  print("All Numbers are Even Numbers")
}else if(any(nums %% 2 == 0)) {
  print("At least one is Even Number")
}