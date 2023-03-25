#1
#Data
#Average sale=$6.45
avg_sale<-6.45

#Average visit=3/week
visit_week<-3

#Total number of years
years<-3

#Customer Lifetime Value formula:
#CLV= Acerage purchage value*average purchage frequency*average customer lifespam

#Calculate the number of visit in 1 year to complete the data
visits_year<-visit_week*50

#Replace the data in the formula 
#CLV = $6.45 (average purchase) * 150 (annual visits) * 3(years)
clv<-round((avg_sale*visits_year*years),2)

print(clv)


#2. Using the profit margin of 25% to get a more accurate CLV
profit<-0.25

#CLV_prof = $6.45 (average purchase) * 150 (annual visits) * 3(years) * 0.25(profit)
clv_prof<-round((avg_sale*visits_year*years*profit),2)

print (round(clv_prof,2))

#3.Evaluate the CLV for following customer

library("dplyr")
library("readr")
library("ggplot2")
library("tidyverse")

setwd("Desktop/Analytics, BD & BI - Trebas/R")
customer_eval<- read_csv("customer_eval.csv")

head(customer_eval)

#check how many different customers has the df.
unique(customer_eval$CustomerID)

#Eliminate  missing values
customer_eval <- na.omit(customer_eval)
customer_eval <- customer_eval[!is.na(customer_eval$CustomerID),]

#Create new variable Total Price 
customer_eval$Tot_Price <- (customer_eval$Quantity*customer_eval$UnitPrice)


#CLV by ARPU calculation
clv_customeval<-round((sum(customer_eval$Tot_Price)/ length(unique(customer_eval$CustomerID))))



#Evaluate by customer ID
Eval_CustomID<-customer_eval %>% 
  group_by(CustomerID) %>% 
  summarise(Tot_Price = sum(Tot_Price))

#Evaluate by Invoice No
Eval_Invoice<-customer_eval %>% 
  group_by(InvoiceNo) %>% 
  summarise(Tot_Price = sum(Tot_Price))




