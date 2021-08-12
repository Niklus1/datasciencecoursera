data <- read.csv("C:/Users/win96/OneDrive/Desktop/Covid_R/COVID19_line_list_data(1).csv")
rm(list()) # removes all variables stored previously

describe(data) # Hmisc

library(Hmisc) # import

# cleaned up death column
data$death_dummy <- as.integer(data$death !=0)

#Age
# claim: people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
# is this statistically signifcant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0,95)
# normally, if p-value < 0,05, we reject null hypothesis
# here, p-value ~ 0, so we reject the null hypothesis and 
# conclude that this is statistically significant

#Gender
# claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8,4%
mean(women$death_dummy, na.rm = TRUE) #3,7%
# is this statistically signifcant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0,95)
# 99% confidence: men have from 0.8% to 8,8% higher chance
# of dying
# p-value = 2,2e-16 < 0,05, so this is statistically
# significant
