# Thank you professor and GTA for a great year. Have a great summer.

install.packages("ggplot2")
install.packages("fivethirtyeight")

# Question 1
set.seed(123)

cost <- 2500 + 4500 + 4500 + 2500
cost

S1 <- rnorm(1, mean = 10000, sd = 2500) # value from the distribution for weekdays
S2 <- rnorm(1, mean = 7000, sd = 1400) # value from the distribution for weekdends

# revenue for any given week
r1 <- S1 + S2 - cost
r1

S3 <- rnorm(10000, mean = 10000, sd = 2500) # 10000 random values from the normal distribution corresponding to weekdays
S4 <- rnorm(10000, mean = 7000, sd = 1400) # 10000 random values from the normal distribution corresponding to weekends
r2 <- S3 + S4 - cost


perc <- mean(r2 > 0) * 100 # percentage of values that is greater than 0 among r2
"On any given week, what is the probability that the restaurant is making money?"
cat("Probability that the restaurant is making money: ", perc, "%") 


# Question 2
library(dplyr)
library(ggplot2)
data("fandango")

five_best_rotten <- fandango %>% 
  arrange(desc(rottentomatoes)) %>% 
  slice_head(n = 5)
five_best_rotten[1] # Print 5 best

five_worst_rotten <- fandango %>% 
  arrange(rottentomatoes) %>% 
  slice_head(n = 5)
five_worst_rotten[1] # Print 5 worst 

fandango <- fandango %>% 
  mutate(average_user_score = (rottentomatoes_user + metacritic_user + imdb) / 3)

# Top 5 best and worst rated movies based on average user scores
five_best_userscore <- fandango %>% 
  arrange(desc(average_user_score)) %>% 
  slice_head(n = 5)
five_best_userscore[1] # Print 5 best by userscore

five_worst_userscore <- fandango %>% 
  arrange(average_user_score) %>% 
  slice_head(n = 5)
five_worst_userscore[1] # Print 5 worst by user score


ggplot(fandango, aes(x = fandango_stars, y = fandango_ratingvalue)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "orange") +
  labs(title = "Fandango Stars vs. Fandango Ratings",
       x = "Fandango Stars",
       y = "Actual Fandango Ratings by Users") +
  theme_minimal()
t_test_result <- t.test(fandango$fandango_ratingvalue, fandango$fandango_stars, paired = TRUE)
print(t_test_result)


# Question 3
library(ggplot2)
library(dplyr)
df <- read.csv("salary(1).csv")
colnames(df) <- tolower(colnames(df))

## using ggplot to create the scatterplot
ggplot(df, aes(x = anxiety, y = salary, color = factor(education))) +
  geom_point() +
  labs(title = "Relationship between Salaries, Anxiety Levels, and Education Levels",
       x = "Anxiety Level",
       y = "Salary",
       color = "Education Level") +
  theme_minimal()

# People with better education are often being paid more. They also have slightly more anxiety. 

# subset
education_levels <- unique(df$education)
subsets <- lapply(education_levels, function(level) {
  subset(df, education == level)
})
names(subsets) <- education_levels

# make linear regression
models <- lapply(subsets, function(data) {
  lm(salary ~ anxiety, data = data)
})
names(models) <- education_levels

for (level in names(models)) {
  cat("Education Level:", level, "\n")
  print(summary(models[[level]]))
  cat("\n\n")
}

# we're able to see that there is a stronger correlation between education and salary. People with better education are often being paid more. They also have slightly more anxiety.


# Question 4
admin_data <- read.csv("admin(1).csv", header = TRUE, sep = ",")
head(admin_data)

install.packages("dplyr")
library(dplyr)


admission_summary <- admin_data %>%
  group_by(Gender) %>%
  summarize(
    Admitted = sum(Freq[Admit == "Admitted"]),
    Total = sum(Freq)
  )

admission_summary <- admission_summary %>%
  mutate(Admission_Rate = (Admitted / Total) * 100)


print(admission_summary) # Men were admitted at a nearly 50% higher rate that women.

summary <- admin_data %>%
  group_by(Gender, Dept) %>%
  summarize(
    Admitted = sum(Freq[Admit == "Admitted"]),
    Total = sum(Freq)
  ) %>%
  mutate(Admission_Rate = (Admitted / Total) * 100)


print(summary)

# There is gender discrimination against women as their acceptance rate is nearly 30%, while men is nearly 45% (50% more!) . 


# Question 5
your_virus_count <- 400 # in millions
friend_virus_count <- 120 # in millions
days <- 14

your_virus <- numeric(days)
friend_virus <- numeric(days)

your_virus[1] <- your_virus_count
friend_virus[1] <- friend_virus_count

# Use for loop to show decrease of virus count in the body
for (day in 2:days) {
  your_virus[day] <- your_virus[day - 1] * 0.8
  friend_virus[day] <- friend_virus[day - 1] * 0.9 # changed this to decrease instead of increase, i beilive this was a typo on the pdf, where you wrote increase by new * 0.9
}

# Make chart
plot(1:days, your_virus, type = "o", col = "black", ylim = range(c(your_virus, friend_virus)),
     xlab = "Days After Infection", ylab = "Virus Count (millions)", main = "COVID-19 Virus Count Over 14 Days")
lines(1:days, friend_virus, type = "o", col = "red")
legend("topright", legend = c("Your Virus Count", "Friend's Virus Count"),
       col = c("black", "red"), lty = 1, pch = 1)


surpass_day <- which(friend_virus > your_virus)[1]
surpass_day # print when your friend's count surpasses yours