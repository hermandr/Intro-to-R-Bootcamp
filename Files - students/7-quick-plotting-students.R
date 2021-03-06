# Session 7: Quick plotting with base R


####################
# What to Remember #
####################
# Notes: Graphs are created iteratively - run the following code one line at a time
attach(mtcars)
plot(wt, mpg) 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")



#############
# Data Used #
#############
# Notes: 

library(readxl)
facebook <- read.delim("data/facebook.tsv")
reddit <- read.csv("data/reddit.csv")
race <- read.csv("data/race-comparison.csv")
supermarket <- read_excel("data/Supermarket Transactions.xlsx", sheet = "Data")


###############
# Strip Chart #
###############
# Notes:

# default
stripchart(mtcars$mpg)

# change the type the point style w/pch
stripchart(facebook$tenure, pch = 16)   



#############
# Histogram #
#############
# Notes:

# default
hist(facebook$tenure)     

# add different parameters to change breaks, color, title, etc.
hist()

# you can also compare the histogram to a normal curve to see how it deviates
# there's a lot going on here so this is just for your reference

## remove missing values
x <- na.omit(facebook$tenure)

## create the histogram
h <- hist(x, breaks = 100, col = "grey", main = "Facebook User Tenure", 
        xlab = "Tenure (Days)")

## create normal curve data
xfit <- seq(min(x), max(x), length = 100) 
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x)) 
yfit <- yfit * diff(h$mids[1:2]) * length(x)

## add normal curve to the histogram
lines(xfit, yfit, col = "red", lwd = 2)



################
# Density Plot #
################
# Notes:

# first you need to calculate the density (be sure to remove missing data with
# na.rm = TRUE)
d <- density(facebook$tenure, na.rm = TRUE)

# you can now use plot() to plot the density data
plot()

# you can fill area under the curve with polygon()
polygon()



############
# Box Plot #
############
# Notes:

# default
boxplot(facebook$tenure)

# change to horizontal
boxplot()

# add notches
boxplot()

# you can also add mean value points but you can only do it to vertical boxplots
boxplot(mtcars$mpg, notch = TRUE)
points(mean(mtcars$mpg), pch=18, col = "red")



#############
# Your Turn #
#############
# Using the facebook data visually assess the continous variables. What insights
# do you find?








#############
# Bar Chart #
#############
# Notes:

# bar charts plot the count of each category so you first need to calculate
# the counts
table(reddit$dog.cat)

# embed this in the barplot() function
barplot(table(reddit$dog.cat))

# include and/or change features such as title, horizontal alignment, category
# names, color
barplot()

# plot this data
library(dplyr)

state <- reddit %>%
        group_by(state) %>%
        tally() %>%
        arrange(n) %>%
        filter(state != "")




############
# Dot Plot #
############
# Notes:

# now plot the same state data with a dot plot
dotchart()






#############
# Your Turn #
#############
# Using the Reddit data... 

# 1) assess the frequency of education levels (note: preceed your plot function 
# with par(mar = c(5,15,1,1), las = 2))



# 2) assess how the different cheeses rank with Reddit users. What do you find?






################
# Scatter Plot #
################
# Notes:

# default (add some color with col = ? or change the point style with pch = ?)
plot(x = race$White_unemployment, y = race$Black_unemployment)
plot(x = race$Black_unemployment, y = race$black_college)

# you can fit lines to the scatter plot to assess its linearity; note that you 
# need to use "~" rather than "x =" and "y ="
plot(White_unemployment ~ Black_unemployment, data = race)
abline()
lines()

# quickly assess multiple scatter plots with pairs()
pairs(race)
pairs(race[, c("White_unemployment", "Black_unemployment", 
               "white_college", "black_college")])


###############
# Line Charts #
###############
# Notes:

# apply different "type = ?" for line, step, and line-point charts
## turn this default to a line chart using "type = ?" 
plot(x = race$Year, y = race$black_college)

## how about a step chart
plot(x = race$Year, y = race$black_college)

## and a line chart with dots
plot(x = race$Year, y = race$black_college)


# you can plot multiple lines on a chart 
plot(x = race$Year, y = race$Black_hs, type = "l", ylim = c(0, max(race$Black_hs)))
lines(x = race$Year, y = race$black_college, col = "red")
lines(x = race$Year, y = race$Black_unemployment, col = "blue", lty = 2)

# and you probably want to add a legend
legend("topleft", legend = c("HS Rate", "College Rate", "Unemployment"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 2))



#####################
# Box Plots...again #
#####################
# Notes:

# turn this single variable boxplot into two box plots comparing gender
boxplot(supermarket$Revenue)
boxplot()

# add a third variable for marital status
boxplot()



#############
# Your Turn #
#############
# Using the supermarket data, analyze revenue by date, homeownership, city, product 
# family, etc.  Don't forget you can summarize the data using dplyr like you
# learned about earlier...example:

## this sums total sales by data
supermarket %>%
        group_by(`Purchase Date`) %>%
        summarise(Revenue = sum(Revenue, na.rm = TRUE))







######################
# Bar Charts...again #
######################
# Notes:

# we can get frequency tables across two groups
counts <- table(supermarket$`Marital Status`, supermarket$Children)

# you can plot these results either stacked or side-by-side with barplot()
barplot(counts, col = c("darkblue", "red"), legend = c("Married", "Single"))
barplot(counts, col = c("darkblue", "red"), legend = c("Married", "Single"), beside = TRUE)

# you can turn these counts into proportions
proportions <- prop.table(counts)

# now plot these results in a similar manner as above
barplot()



#############
# Your Turn #
#############
# Using the reddit data compare counts of...
# 1) product family by homeownership


# 2) annual income by homeownership


# 3) country by gender


# 4) etc.







