# Question 1
set.seed(20200323)
y <- c("q", "w", "e", "r", "z", "c")
for (letter in y) {
  print(letter)
}

# Question 2
set.seed(20200323)
coin_outcomes <- numeric(200)
for (i in 1:200) {
  outcome <- sample(0:1, 1, replace = TRUE)
  coin_outcomes[i] <- outcome
}
print(coin_outcomes)

# Question 3
set.seed(20200323)
N <- c(6, 11, 21)
for (i in 4:20) {
  N[i] <- round(0.5 * N[i - 1] + sqrt(N[i - 2]) + log10(1 + N[i - 3]))
}
print(N)

# Question 4
set.seed(20200323)
vector <- rnorm(100)
positive_count <- 0
negative_count <- 0
zero_count <- 0

for (element in vector) {
  if (element > 0) {
    positive_count <- positive_count + 1
  } else if (element < 0) {
    negative_count <- negative_count + 1
  } else {
    zero_count <- zero_count + 1
  }
}

cat("Number of positive elements:", positive_count, "\n")
cat("Number of negative elements:", negative_count, "\n")
cat("Number of zero elements:", zero_count, "\n")

# Question 5
calculate_stats <- function(vector, print_median = FALSE) {
  mean_val <- mean(vector)
  cat("Mean:", mean_val, "\n")

  std_dev <- sd(vector)
  cat("Standard Deviation:", std_dev, "\n")

  if (print_median) {
    median_val <- median(vector)
    cat("Median:", median_val, "\n")
  }
}

calculate_stats(vector, print_median = TRUE)
