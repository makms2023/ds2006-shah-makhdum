data<-read.csv("soda.csv")
head(data)

cola_counts <- table(data$cola)
cola_proportions <- prop.table(cola_counts)

# Create the cola_table dataframe with counts and proportions formatted as "N (p)"
cola_table <- data.frame(
  
  count_probability = paste(cola_counts, " (", round(cola_proportions, 2), ")", sep = "")
)

rownames(cola_table) <- c("colas", "not colas")

# Print the formatted table
print(cola_table)



sugar_counts <- table(data$sugar)
sugar_proportions <- prop.table(sugar_counts)

# Create the cola_table dataframe with counts and proportions formatted as "N (p)"
sugar_table <- data.frame(
  
  count_probability = paste(sugar_counts, " (", round(sugar_proportions, 2), ")", sep = "")
)

rownames(sugar_table) <- c("Regular", "Zero")

# Print the formatted table
print(sugar_table)


contingency_table <- table(data$cola, data$sugar)

# Add row names and column names
rownames(contingency_table) <- c("colas", "not colas")
colnames(contingency_table) <- c("Regular", "Zero")

# Print the contingency table
print(contingency_table)


