library("dplyr")
library("readr")
library("ggplot2")
library("tidyverse")
library("quantmod")

#1.1	Write a R program to create three vectors a,b,c with 1 to 10 integers. 
#Combine the three vectors to become a 3x3 matrix where each column represents a vector.
#Print the content of the matrix?

a <- seq(1,10)
b <- c(1,2,3,4,5,6,7,8,9,10)
c <- 1:10

mat <- cbind(a,b,c)

print(mat)


# 2.Write a R program to create or read a Data frame which contain details of 5 employees and display summary of the data and details. 


employees_df <- data.frame(
  name = c("Raghu", "Rodrigo", "Neiro", "Janine", "Cass","Martin"),
  age = c(50, 25, 53, 22, 30,25),
  department = c("Teacher", "Marketing", "Engineer", "IoT", "Assistant","Manager"),
  village = c("Laval", "Montreal", "Southouest", "NordMTL", "Lachine","Hochelaga")
)

print(employees_df)

summary(employees_df)


#3.	Write a R program to access elements at 3rd column and 2nd row, only the 3rd row and only the 4th column of a given matrix?
matrix3 <- matrix(c(1,5,9,13,2,6,10,14,3,7,11,15,4,8,12,16), nrow = 4, byrow = TRUE,
            dimnames = list(c("row1", "row2", "row3", "row4"),
                            c("col1", "col2", "col3", "col4")))

cat("Original Matrix:\n")
print(matrix3)

# Access elements at 3rd column and 2nd row
cat("3rd column and 2nd row element is: ")
print(matrix3[2, 3])

# Access only the 3rd row
cat("Only the 3rd row: ")
print(matrix3[3, ])

# Access only the 4th column
cat("Only 4th column: ")
print(matrix3[, 4])


#4.	Write a R program to concatenate(combine) two 3x3 matrix same column but different rows?

matrix41 <- matrix(1:9, nrow=3, ncol=3, byrow=TRUE)

matrix42 <- matrix(10:18, nrow=3, ncol=3, byrow=TRUE)

matrix_result <- rbind(matrix41, matrix42)

print(matrix_result)


#5.	Write a R program to Calculate Human BMI all the values should be entered from prompt by passing the argument in function.


height <- readline(prompt="Enter your height in cm: ")
weight <- readline(prompt="Enter your weight in kg: ")

height <- as.numeric(height)
weight <- as.numeric(weight)

calc_BMI <- function(height, weight) {
  bmi5 <- weight / (height/100)^2
  return(bmi5)
}

bmi5 <- calc_BMI(height, weight)
cat("Your BMI is", round(bmi5, 2))

#6.	Write a R program to create two 2x3 matrix and convert it to data frame.  


matrix61 <- matrix(c(0, 2, 4, 6, 8, 10), nrow=2, ncol=3)

matrix62 <- matrix(c(1, 3, 5, 7, 9, 11), nrow=2, ncol=3)

df_6 <- data.frame(matrix61, matrix62)

print(df_6)



#11.	Write R program to visualize the stock data, using Yahoo Finance?  Show the different visualization skill using different plots and charts. 


cadusd_df<-read.csv("CADUSD=X.csv")
head(cadusd_df)

cadusd_df$Date<- as.Date(cadusd_df$Date)

ggplot(cadusd_df, aes(x=cadusd_df$Date, y=cadusd_df$Close)) +
  geom_line(color="blue")

chartSeries(cadusd_df,name = "CAD/USD Exchange Rate", type = "candlesticks")


plot(cadusd_df[, c("Open", "Close")], main = "CAD/USD Exchange Rate", xlab = "Opening Price", ylab = "Closing Price")




#12 Write a R program to convert a given matrix to a 1-dimensional array


matrix12 <- matrix(c(1, 2, 3, 4, 5, 6,7,8,9,10,11,12), nrow = 3, ncol = 4)

array12 <- as.vector(matrix12)

print(array12)


#13.	Write a R program to create an array of two 3x3 matrices each with 3 rows and 3 columns from two given vectors. 


vector131 <- c(1,2,3,4,5,6,7,8,9)
vector132 <- c(10,11,12,13,14,15,16,17,18)

arre13 <- array(c(vector131 ,vector132), dim = c(3,3,2))


print(arre13)



#14.	Write a R program to create two 2x3 matrix and add, subtract, multiply and divide the matrixes?

mat141 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
mat142 <- matrix(c(7,8,9,8,7,6), nrow = 2, ncol = 3)


sum14 <- mat141 + mat142

subs14 <- mat141 - mat142

multip14 <- mat141 * mat142

div14 <- mat141 / mat142

print(mat141)
print(mat142)
print(sum14)
print(subs14)
print(multip14)
print(div14)


#Main goal is how did you approached to solve the below problem.
#15.	A lifestyle publication is trying to gain web subscription, which cost $10 a month. They decide to offer a one-month free trail to pull in leads, they create a post about the trial for twitter which include a tracking URL that leads to the free-trial landing page. 
#They boost the post for four days with a budget of $25 per day. In the timespan of the posted boost, they received 100 visitors and 20 signed up for a free trail. Of the 20, four become paid subscribers. Calculate ROI using R programming. 

#Data
cost_per_month <- 10
trial_length <- 1
campaign_duration <- 4
daily_budget <- 25
total_budget <- daily_budget * campaign_duration
num_visitors <- 100
num_signups <- 20
num_paid <- 4

#To calculate the ROI we need more variables 
#Return on investment (ROI): (total revenue - total campaign cost) / total campaign cost

cost_per_visitor <- total_budget / num_visitors
conversion_rate <- num_signups / num_visitors
cpa <- total_budget / num_signups
total_revenue <- num_paid * cost_per_month
roi <- (total_revenue - total_budget) / total_budget

cat("Cost per visitor: $", round(cost_per_visitor, 2), "\n")
cat("Conversion rate: ", round(conversion_rate * 100, 2), "%\n")
cat("Cost per acquisition: $", round(cpa, 2), "\n")
cat("ROI: ", round(roi * 100, 2), "%\n")




