data <- read.csv("homework6data.csv")
str(data)
summary(data)

# manual
# backward
full_model <- lm(LifeExp ~ Population + Income + Murder + HSGrad + Frost + Area + Illiteracy, data = data)
summary(full_model)

reduced_model <- lm(LifeExp ~ Population + Income + Murder + HSGrad + Frost + Illiteracy, data = data)
summary(reduced_model)

reduced_model <- lm(LifeExp ~ Population + Income + Murder + HSGrad + Illiteracy, data = data)
summary(reduced_model)


# forward
base_model <- lm(LifeExp ~ 1, data = data)
model1 <- lm(LifeExp ~ Population, data = data)
model2 <- lm(LifeExp ~ Population + Income, data = data)
summary(model2)
model3 <- lm(LifeExp ~ Population + Income + Murder, data = data)
summary(model3)


# with step
# backward
full_model <- lm(LifeExp ~ Population + Income + Murder + HSGrad + Frost + Area + Illiteracy, data = data)
backward_model <- step(full_model, direction = "backward")
summary(backward_model)
# forward
base_model <- lm(LifeExp ~ 1, data = data)
forward_model <- step(base_model, direction = "forward", scope = formula(full_model))
summary(forward_model)

