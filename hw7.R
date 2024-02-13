data<-read.csv("soda.csv")
head(data)

cola_counts <- table(data$cola)
cola_counts
cola_proportions <- prop.table(cola_counts)
cola_proportions
cola_table <- data.frame(
  Counts = cola_counts,
  Proportions = paste(cola_proportions)
)


print(cola_table)

sugar_counts <- table(data$sugar)
sugar_counts
sugar_proportions<-prop.table(sugar_counts)
sugar_proportions

sugar_table <- data.frame(
  sugar_counts = sugar_counts,
  Proportions = paste(sugar_proportions)
)
print(sugar_table)

contingency_table <- table(data$cola, data$sugar)


print(contingency_table)


