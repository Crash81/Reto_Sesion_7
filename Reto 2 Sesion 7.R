install.packages("rvest")
library(rvest)

url <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
tabla <- read_html(url)
table <- html_nodes(tabla, "table")

tabla_s <- html_table(table[1], fill = TRUE)
tabla_s <- na.omit(as.data.frame(tabla_s))

a <- gsub("MXN","",tabla_s$Sueldo)
a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a <- gsub("mes", "", a)
a <- as.numeric(a)
tabla_s$Sueldo <- a
tabla_s

b <- gsub("Sueldos para Data Scientist en ", "", tabla_s$Cargo)
tabla_s$Cargo <- b

max.sueldo <- which.max(tabla_s$Sueldo)
tabla_s[max.sueldo,]

min.sueldo <- which.min(tabla_s$Sueldo)
tabla_s[min.sueldo,]
