# Week 4 assignment: EDA using R
# Install tidyverse.
install.packages('tidyverse')

# Import required libraries
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

# Set the working directory to the directory where the file is located
setwd('/Users/haticegormez/Downloads/LSE_DA301_assignment_files')

# Check if you are now in the correct working directory
getwd()

# Import the data set.
turtle_sales <- read.csv('turtle_sales.csv')

# Print the data frame.
head(turtle_sales)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 
turtle_sales_subset <- select(turtle_sales, -c(Ranking, Year, Genre, Publisher))

# View the data frame.
head(turtle_sales_subset)

# View the descriptive statistics.
summary(turtle_sales_subset)

# 2. Review plots to determine insights into the data set.
## 2a) Scatterplots
# Create scatterplots.
ggplot(turtle_sales_subset, aes(x = NA_Sales, y = Global_Sales)) +
  geom_point() +
  labs(x = "North American Sales", y = "Global Sales")

## 2b) Histograms
# Create histograms.
ggplot(turtle_sales_subset, aes(x = Global_Sales)) +
  geom_histogram(binwidth = 10) +
  labs(x = "Global Sales", y = "Frequency")

## 2c) Boxplots
# Create boxplots.
ggplot(turtle_sales_subset, aes(y = Global_Sales)) +
  geom_boxplot() +
  labs(y = "Global Sales")

###############################################################################
# Week 5 assignment: Cleaning and maniulating data using R
 
# View the new data frame created in previous section.
head(turtle_sales_subset)

# Check output: Determine the min, max, and mean values.
# Using summary() for summary statistics
summary(turtle_sales_subset[, c("NA_Sales", "EU_Sales", "Global_Sales")])

# Using min(), max(), and mean() for individual calculations
min_na_sales <- min(turtle_sales_subset$NA_Sales)
max_na_sales <- max(turtle_sales_subset$NA_Sales)
mean_na_sales <- mean(turtle_sales_subset$NA_Sales)

min_eu_sales <- min(turtle_sales_subset$EU_Sales)
max_eu_sales <- max(turtle_sales_subset$EU_Sales)
mean_eu_sales <- mean(turtle_sales_subset$EU_Sales)

min_global_sales <- min(turtle_sales_subset$Global_Sales)
max_global_sales <- max(turtle_sales_subset$Global_Sales)
mean_global_sales <- mean(turtle_sales_subset$Global_Sales)

# Print the results
min_na_sales
max_na_sales
mean_na_sales

min_eu_sales
max_eu_sales
mean_eu_sales

min_global_sales
max_global_sales
mean_global_sales

# View the descriptive statistics.
summary(turtle_sales_subset)

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
sales_by_product <- turtle_sales_subset %>%
  group_by(Product) %>%
  summarize(
    Total_NA_Sales = sum(NA_Sales),
    Total_EU_Sales = sum(EU_Sales),
    Total_Global_Sales = sum(Global_Sales)
  )

# View the data frame.
head(sales_by_product)

# Explore the data frame
summary(sales_by_product)

## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.
plot(sales_by_product$Total_NA_Sales, sales_by_product$Total_EU_Sales, 
     xlab = "Total NA Sales", ylab = "Total EU Sales",
     main = "Scatterplot of NA Sales vs. EU Sales")

# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.

qqnorm(sales_by_product$Total_NA_Sales)
qqline(sales_by_product$Total_NA_Sales)

## 3b) Perform Shapiro-Wilk test
# Install and import Moments.
install.packages("moments")
library(moments)

# Perform Shapiro-Wilk test.
shapiro.test(sales_by_product$Total_NA_Sales)

# Print the result
print(shapiro.test)

## 3c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.

na_sales_skewness <- skewness(sales_by_product$Total_NA_Sales)
na_sales_kurtosis <- kurtosis(sales_by_product$Total_NA_Sales)

# Print the result
print(na_sales_skewness)
print(na_sales_kurtosis)

## 3d) Determine correlation
# Determine correlation.
correlation_matrix <- cor(sales_by_product[,c("Total_NA_Sales", "Total_EU_Sales", "Total_Global_Sales")], use="complete.obs", method="pearson")

# Print the correlation matrix
print(correlation_matrix)

###############################################################################

# 4. Plot the data
# Create plots to gain insights into data.
# Histogram for Total NA Sales
ggplot(sales_by_product, aes(x=Total_NA_Sales)) +
  geom_histogram(binwidth=5, fill="skyblue", color="black") +
  labs(title="Histogram of Total NA Sales", x="Total NA Sales", y="Frequency") +
  theme_minimal()

###############################################################################

# Week 6 assignment: Making recommendations to the business using R

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
correlation_matrix <- cor(turtle_sales_subset[, c("NA_Sales", "EU_Sales", "Global_Sales")], 
                          use = "complete.obs", 
                          method = "pearson")
# Print the correlation matrix
print(correlation_matrix)

# Create a linear regression model on the original data.
linear_model <- lm(Global_Sales ~ NA_Sales, data = turtle_sales_subset)

# Print the summary of the model
print(summary(linear_model))

## 2b) Create a plot (simple linear regression)
# Basic visualisation.
# Create a scatter plot and add the regression line
ggplot(turtle_sales_subset, aes(x = NA_Sales, y = Global_Sales)) +
  geom_point() +  # Plot the points
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  
  labs(title = "Linear Regression of Global Sales on NA Sales",
       x = "NA Sales",
       y = "Global Sales") +
  theme_minimal()


###############################################################################

# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.
numeric_data <- turtle_sales_subset[, sapply(turtle_sales_subset, is.numeric)]
# Multiple linear regression model.
multiple_linear_model <- lm(Global_Sales ~ NA_Sales + EU_Sales, data = numeric_data)

# Print the summary of the model
print(summary(multiple_linear_model))

# Calculate the correlation matrix for the sales columns
correlation_matrix <- cor(numeric_data[, c("NA_Sales", "EU_Sales", "Global_Sales")])

# Print the correlation matrix
print(correlation_matrix)

###############################################################################

# 4. Predictions based on given values
# Create a new data frame with the provided NA_Sales and EU_Sales sums
provided_data <- data.frame(
  NA_Sales = c(34.02, 3.93, 2.73, 2.26, 22.08),
  EU_Sales = c(23.80, 1.56, 0.65, 0.97, 0.52)
)

# Make predictions for Global_Sales based on the provided data
predicted_global_sales <- predict(multiple_linear_model, newdata = provided_data)

# Print the predicted Global_Sales values
print(predicted_global_sales)

# Create a data frame to display the provided NA_Sales, EU_Sales, and predicted Global_Sales
result_df <- data.frame(
  NA_Sales = c(34.02, 3.93, 2.73, 2.26, 22.08),
  EU_Sales = c(23.80, 1.56, 0.65, 0.97, 0.52),
  Predicted_Global_Sales = predicted_global_sales
)

# Compare with observed values for a number of records.
print(result_df)





