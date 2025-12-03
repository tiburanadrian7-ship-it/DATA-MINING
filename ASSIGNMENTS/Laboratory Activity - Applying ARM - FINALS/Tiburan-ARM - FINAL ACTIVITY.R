library(arules)
library(arulesViz)

# Load the dataset from arules
data("Groceries")
summary(Groceries)

# Generate Frequent Itemsets
frequent_items <- apriori(Groceries,
                          parameter = list(supp = 0.01, target = "frequent itemsets"))
inspect(head(frequent_items))

# Generate Rules
rules <- apriori(Groceries,
                 parameter = list(supp = 0.01, conf = 0.3))
inspect(head(rules))

# Sort rules by lift and get Top 10
rules_lift <- sort(rules, by = "lift", decreasing = TRUE)
inspect(head(rules_lift, 10))


# Visualize the result using methods (top 15 rules)
plot(rules_lift[1:15], method = "graph")
plot(rules_lift[1:15], method = "scatterplot")
plot(rules_lift[1:15], method = "grouped")
plot(rules_lift[1:15], method = "paracoord")
