# 載入 hash 套件
library(hash)

# 讀取檔案
setwd("D:/TMU/三/DSA")
file_path <- "hw2_data.txt"
words <- readLines(file_path, warn = FALSE)

# 建立 hash table 來存放單字出現次數
word_count <- hash()

# 統計單字頻率
for (word in words) {
  if (has.key(word, word_count)) {
    word_count[[word]] <- word_count[[word]] + 1
  } else {
    word_count[[word]] <- 1
  }
}

# 計算不重複的英文字數
unique_word_count <- length(keys(word_count))

# 轉換 hash 為 data frame
word_freq <- data.frame(
  word = keys(word_count),
  frequency = values(word_count),
  stringsAsFactors = FALSE
)

# 依照出現次數排序
word_freq <- word_freq[order(-word_freq$frequency), ]

# 繪製直方圖
barplot(word_freq$frequency, names.arg = word_freq$word, las = 2, cex.names = 0.7, col = "blue",
        main = "單字出現次數直方圖", xlab = "單字", ylab = "出現次數")

# 印出結果
cat("不重複的單字總數:", unique_word_count, "\n")
print(head(word_freq, 10))  # 顯示前 10 個單字