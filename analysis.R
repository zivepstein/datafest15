library(dplyr)

# only 46 states represented, some obs. list state as "", filter those out
n_distinct(transactions$state_bought)
transactions %>%
  filter(state_bought != "") %>%
  group_by(state_bought) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  filter(count > 500) %>%
  arrange(desc(mean_cost))

# using comparator makes no real difference in price paid 
inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(comparator > 10) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

  
  
