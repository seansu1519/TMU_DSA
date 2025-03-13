# 讀取使用者輸入
  num <- as.integer(readline("請輸入一個 0 到 255 之間的數字: "))

# 確保輸入範圍正確
if (is.na(num) || num < 0 || num > 255) {
  cat("錯誤: 請輸入範圍內的數字!\n")
} else {
  # 手動轉換為二進位
  to_binary <- function(n) {
    binary <- rep(0, 8)
    for (i in 7:0) {
      binary[8 - i] <- n %/% (2^i)
      n <- n %% (2^i)
    }
    paste(binary, collapse="")
  }
  
  # 手動轉換為16進位
  to_hex <- function(n) {
    hex_chars <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F")
    high <- n %/% 16
    low <- n %% 16
    paste0(hex_chars[high + 1], hex_chars[low + 1])
  }
  
  # 轉換與顯示結果
  binary <- to_binary(num)
  hex <- to_hex(num)
  
  cat("二進位表示法:", binary, "\n")
  cat("16進位表示法:", hex, "\n")
}
