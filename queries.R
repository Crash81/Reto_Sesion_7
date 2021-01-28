install.packages("DBI")
install.packages("RMySQL")
install.packages("ggplot2")
install.packages("dplyr")
library("DBI")
library("RMySQL")
library("ggplot2")
library("dplyr")

BaseDatos <- dbConnect(drv = RMySQL::MySQL(),dbname = "shinydemo",host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",username = "guest",password = "guest")

Languages <- dbGetQuery(BaseDatos, "select * from CountryLanguage")

Percent_spanish <-  Languages %>% filter(Language == "Spanish")

Percent_spanish_df <- as.data.frame(Percent_spanish)

Percent_spanish_df %>% ggplot(aes( x = CountryCode, y=Percentage, fill=IsOfficial)) + 
  geom_col()