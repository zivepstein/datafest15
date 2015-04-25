library(ggplot2)
# histogram of all prices
hist(transactions$price_bought, breaks = 100)

ggplot(transactions) + 
  geom_point(aes(x = model_year_bought, y = mileage_bought, color =  new_or_used_bought))

# what is option_name? leads$price_promise_flag (guaranteed price?)
# difference between gas and electric shoppers?
hist(visitor$session_count, breaks = 1000, xlim = c(0, 50))
max(visitor$session_count) # wow...lonely dude


max(visitor$page_views)
mean(visitor$page_views)
median(visitor$page_views)

# do people who use the comparason tool get cheaper cars?
table(visitor$comparator)
hist(visitor$comparator)


# does seeing gm ads make you more likely to buy gm cars?


