# Use the library() function to load the dplyr package

library(dplyr)
library(ggplot2)
library(GGally)

# DELIVERABLE 1 

# Import and read in the MechaCar_mpg.csv file as a dataframe.

table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
?lm()

#visualizing data pre-analysis 

ggpairs(table)

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 as the data parameter.

lm(table$mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg, data = table)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.

summary(lm(table$mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = table))

#alt way to type out analysis 
lm(table$mpg ~ vehicle_length + ., data = table)
summary(lm(table$mpg ~ ., data = table))

# DEVLIVERABLE 2

# In your MechaCarChallenge.RScript, import and read in the Suspension_Coil.csv file as a table

sus <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
summary <- sus %>% summarize ( Mean = mean (PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
summary

group_summary <- sus %>% group_by(Manufacturing_Lot) %>% summarize ( Mean = mean (PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
group_summary

# DELIVERABLE 3

# using the t.test() function, determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(sus$PSI, mu = 1500)

lot1 = subset(sus, sus$Manufacturing_Lot == "Lot1")
t.test(lot1$PSI, mu = 1500)

lot2 = subset(sus, sus$Manufacturing_Lot == "Lot2")
t.test(lot2$PSI, mu = 1500)

lot3 = subset(sus, sus$Manufacturing_Lot == "Lot3")
t.test(lot3$PSI, mu = 1500)

ggplot(sus, aes(x= Manufacturing_Lot, y= PSI)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("Lot")
