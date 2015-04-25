library(readr)
library(dplyr)
library(data.table)

# Import data, wrap in data.table
shopping <- data.table(read_csv("DataFest2015/shopping.csv"))
configuration <- data.table(read_csv("DataFest2015/configuration.csv"))
leads <- data.table(read_csv("DataFest2015/leads.csv"))
visitor <- data.table(read_csv("DataFest2015/visitor.csv"))
transactions <- data.table(read_csv("DataFest2015/transactions.csv"))
setkey(shopping, visitor_key)
setkey(configuration, visitor_key)
setkey(leads, visitor_key)
setkey(visitor, visitor_key)
setkey(transactions, visitor_key)


# leads$lead_date is all NA
sum(is.na(leads$lead_date)) == length(leads$lead_date)
leads[, lead_date := NULL]

# apply(visitor, 2, function(x) sum(is.na(x)) == length(x))
sum(is.na(visitor$last_session_start_datetime)) == length(visitor$last_session_start_datetime)
visitor[, last_session_start_datetime :=  NULL]

# using comparator makes no real difference in price paid 
inner_join(visitor, transactions, by = "visitor_key") %>%
  group_by(comparator > 0) %>%
  summarise(mean_cost = mean(na.omit(price_bought)), count = n()) %>%
  arrange(desc(mean_cost))