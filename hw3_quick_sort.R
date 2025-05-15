
quick_sort <- function(vec, depth = 0) {

  if (length(vec) <= 1) {
    return(vec)
  }
  
  pivot <- vec[1]
  less <- vec[vec < pivot]
  equal <- vec[vec == pivot]
  greater <- vec[vec > pivot]
  
  sorted_less <- quick_sort(less, depth + 1)
  sorted_greater <- quick_sort(greater, depth + 1)
  

  combined <- c(sorted_less, equal, sorted_greater)
  
  # cat(paste0(strrep("  ", depth), "After depth ", depth, ": "))
  print(combined)
  
  return(combined)
}

sample_vec <- c(33, 67, 8, 13, 54, 119, 3, 84, 25, 41)
cat("Original vector:\n")
print(sample_vec)
cat("Sorted vector:\n")
quick_sort(sample_vec)


