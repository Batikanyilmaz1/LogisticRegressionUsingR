install.packages("ggplot2")
install.packages("broom")

# Load required library
library(ggplot2)
library(broom)

# Read the data from the file
data <- read.table("C:/Users/BATIKAN YILMAZ/Documents/Question_1.txt",dec = ",")

# Assign column names if needed
colnames(data) <- c("X1", "X2", "Y")

# Display the summary of the regression
summary(model)

# Assuming Y is binary (0 or 1)
# Recode Y to be binary if necessary
data$Y_binary <- ifelse(data$Y > mean(data$Y), 1, 0)

# Perform logistic regression
logistic_model <- glm(Y_binary ~ X1 + X2, data = data, family = "binomial")

# Display the summary of the logistic regression
summary(logistic_model)

# Plot the logistic regression curve
ggplot(data, aes(x = X1, y = Y_binary)) +
  geom_point() +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE, color = "blue") +
  labs(title = "Logistic Regression", x = "X1", y = "Probability of Y_binary being 1")
