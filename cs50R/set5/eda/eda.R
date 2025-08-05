# Exploratory data analysis (EDA) a method  to find interistinmg characteristic  and test hypotheses
# write a program to visualize and explore a data set of your choice.

# Load the necessary libraries
library(ggplot2)
library(dplyr)

# Load a dataset for exploratory analysis
# For this example, let's use the 'storms' dataset from the 'ggplot2' package
data("storms")

# Perform some basic data exploration
# View the structure of the data
str(storms)

# Basic data summary
summary(storms)

# Clean the data (e.g., removing NA values)
cleaned_storms <- na.omit(storms)

# Create a visualization
# Let's create a scatter plot for wind speed vs. pressure
plot <- ggplot(cleaned_storms, aes(x = pressure, y = wind)) + geom_point()

# Save the visualization as a PNG file
ggsave("visualization.png", plot = plot)

# Print a message for completion
print("Exploratory Data Analysis complete. Visualization saved as 'visualization.png'.")
