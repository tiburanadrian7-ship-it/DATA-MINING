scores <- c(75,82,60,95,40)

if(all(scores>=60)){
  print("All Student Passed")
}else if(any(scores<60)){
  print("At least One Student Failed")
}
