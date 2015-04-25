library(dplyr)
library(igraph)

Same.Lead <- function(lead_one, lead_two) {
  return(lead_one$make == lead_two$make && lead_one$model == lead_two$model)
}

leadss <- inner_join(visitor, leads, by = "visitor_key")[1:500]

adj_matrix <- matrix(0, ncol = 500, 
                     nrow = 500)

for (i in 1:500) {
  for (j in 1:500) {
    if(i == j) {
      next
    } else if (Same.Lead(leadss[i], leadss[j])) {
      adj_matrix[i, j] <- 1
    }
  }
}

g <- graph.adjacency(adj_matrix, mode = "undirected")
V(g)$label.cex <- 0.1
plot(g, vertex.size = 2)
# only 46 states represented, some obs. list state as "", filter those out
n_distinct(transactions$state_bought)
transactions %>%
  filter(state_bought != "") %>%
  group_by(state_bought) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

transactions %>%
  group_by(dma_bought) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

# using comparator makes no real difference in price paid 
inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(comparator > 0) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

# do people who followed a paid search link pay more?
inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(paid_agg_search_flag) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(free_agg_search_flag) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))

inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(paid_agg_search_flag) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))


q2 <- inner_join(transactions, leads, by = "visitor_key")
counter <- 0
for (key in q2$visitor_key) {
  if (nrow(leads[visitor_key == key]) == 1) {
    counter <- counter + 1
  }
}
counter / nrow(q2)
makes <- c("Ford")

inner_join(visitor, transactions, by = "visitor_key") %>%
  filter(make_bought == "Ford") %>%
  group_by(model_bought) %>%
  summarise(avg_num_ads_seen = mean(imp_ford), count = n()) %>%
  filter(count > 30) %>%
  arrange(desc(avg_num_ads_seen))

inner_join(visitor, transactions, by = "visitor_key") %>%
  filter(make_bought == "Ford") %>%
  group_by(model_bought) %>%
  summarise(avg_num_ads_clicked = mean(clk_ford), count = n()) %>%
  filter(count > 30) %>%
  arrange(desc(avg_num_ads_clicked))

inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(make_bought) %>%
  filter(imp_scion > 0) %>%
  summarise(avg_num_ads_seen = mean(clk_ford / imp_ford), count = n()) %>%
  arrange(desc(avg_num_ads_seen))


  



  
  
