# Question 1
#######################
a1 = ((8-32)*5)/9
a1 # in c

### writing a function, will return at the end of the semester.
convert_temp <- function(x){
  output = ((x-32)*5)/9
  return(output)
}
convert_temp(60)

# Question 2
#######################
# (1)
x <- 100:150
x
# (2)
a2 <- mean(100:120)
a2
# alternatively
a2 <- mean(x[1:21])
a2
  
# (3)
b2 <- sum(101:149)
b2
# alternatively
sum(x[-c(1,51)])


# Question 3
#######################
var1 = FALSE; var2 = pi; var3 = -2

# (1)
a3 <- (log(var2,10) + var2^3)/exp(var3)
a3
# (2)
b3 <- (var1 + var2 + var3)^(1/3)
b3

# Question 4
########################
kb = c(7.6, 15.4, 19.9, 22.5, 28.5, 25.2, 30.0, 24.0, 27.6, 35.4, 31.6, 28.3, 26.8, 27.0, 25.3, 27.9, 27.3, 13.8, 22.3, 17.6)
length(kb)
a4 <- sum(kb>25)
a4
# alternatively
length(kb[kb>25])

# Question 5
########################
m1 = matrix(1:20,nrow=5,ncol=4)
m1
colnames(m1) = c("col1", "col2", "col3", "col4")
m1
rownames(m1) = c("row1", "row2", "row3", "row4", "row5")
m1

rowSums(m1)
colSums(m1)
sum(m1)

# Question 6
########################
diet = c(50,8,20,60,30,40,40,30,40)
diet_mat = matrix(diet,nrow=3,ncol=3,byrow=TRUE)
diet_mat
rownames(diet_mat) = c("Breakfast", "Lunch", "Dinner")
colnames(diet_mat) = c("carbs", "fat", "protein")
diet_mat

# (1)
p1 <- colSums(diet_mat)
p1

# (2)
cal = c(4,9,4)
p2 = diet_mat%*%cal
p3 = sum(p2)
p3 # total cal

# (3)
p4 = cal*p1/p3
p4
# alternatively
rowSums(cal*t(diet_mat))
