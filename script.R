rm(list = ls()) # removes previous variables

# https://towardsdatascience.com/r-tutorial-analyzing-covid-19-data-12670cd664d6
library(Hmisc)
data <- read.csv("C:/Users/Richa/Desktop/My Documents/Covid_data/COVID19_line_list_data.csv")

describe(data) #Hmisc command

#clean up death column

data$death_dummy <- as.integer(data$death!=0)

#death rate

sum(data$death_dummy)/ nrow(data)

#age_ People who died are older

dead = subset(data,death_dummy ==1)
alive = subset(data,death_dummy ==0)

mean(dead$age, na.rm = TRUE)

mean(alive$age, na.rm = TRUE)

t.test(alive$age,dead$age,alternative = "two.sided", conf.level = 0.99)

# Normally is pi value < 0.05 we reject null hypothesis 
# here pi = 2.2e-16 ~ 0
# and conclude that this is statically significant

#Gender_ has no effect

men = subset(data,gender =="male")
women = subset(data,gender =="female")

mean(men$death_dummy, na.rm = TRUE)

mean(women$death_dummy, na.rm = TRUE)

t.test(men$death_dummy,women$death_dummy,alternative = "two.sided", conf.level = 0.99)
