importData <- function(){
  require(data.table)
  config <- fread("/Users/Zivvy/Documents/DataFest2015/configuration.csv")
  leads <- fread("/Users/Zivvy/Documents/DataFest2015/leads.csv")
  shop <- fread("/Users/Zivvy/Documents/DataFest2015/shopping.csv")
  trans <- fread("/Users/Zivvy/Documents/DataFest2015/transactions.csv")
  visitor <- fread("/Users/Zivvy/Documents/DataFest2015/visitor.csv")

  #so obviously they want us to connect visitor key. does clicking 
  #relate to purchases? does leads relate to purchases? do ads affect what
  #you buy? 
  #geographic stuff could be cool 
  #trans is the key here
  #how good is edmunds?
  #car clustering. cars to people 
  #age, geography,