# Homework 5 - Max Shalom
# Question 1
install.packages("ISwR")
library(ISwR)
data(react)
hist(react, breaks = 20, main = "Histogram of react Dataset", xlab = "Values") #make a histogram
shapiro.test(react) # testing if normally distributed
t_test_result <- t.test(react)
t_test_result


# Question 2
# install.packages('ggplot2')
library(ggplot2)
data(midwest)
mu <- 42
differences <- midwest$percollege - mu
abs_differences <- abs(differences)
ranked <- rank(abs_differences) # need ranks for wilcoxen sigb-ed rank test
neg_diff <- differences < 0
W_minus <- sum(ranked[neg_diff])
W <- min(W_minus, sum(ranked) - W_minus)
n <- sum(!is.na(differences))
p_value <- pnorm(W, mean = n * (n + 1) / 4, sd = sqrt(n * (n + 1) * (2 * n + 1) / 24))


# Question 3
install.packages('ggplot2')
library(ggplot2)
data(midwest)
# splitting into two more variables to compare them indivually
il_data <- subset(midwest, state == "IL")
wi_data <- subset(midwest, state == "WI")

t_test_result <- t.test(il_data$percadultpoverty, wi_data$percadultpoverty)
t_test_result


# Question 4
library(ISwR)
data(intake)
# Miking a paired T test using true here in this statement to see the differnce between the two levels
paired_t_test_result <- t.test(intake$pre, intake$post, paired = TRUE)
paired_t_test_result
