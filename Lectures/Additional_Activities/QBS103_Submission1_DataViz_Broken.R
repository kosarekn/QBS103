library(tidyverse)
library(cleaner) # rdate function

set.seed(1234)
#covar <- data.frame('subjectID' = paste0('P',seq(1001:1500)),
                    #'male' = rbinom(500,size = 1,prob = 0.5),
                    #'age' = sample(rdate(2000,min = '2010-01-01',max = '2015-12-31'),size = 500,replace = T),
                    #'datediagnsis' = sample(rdate(n = 2000,min = '2020-01-01',
                                                  #max = '2023-12-31'),size = 500,replace = T))
covar %>% 
  mutate(diagnosis.age = as.matrix(difftime(ymd(datediagnsis),ymd(age),units = 'days'))/365.25) %>% 
  mutate(gender = ifelse(male ==2, 'male','female')) %>% 
  ggplot(aes(x = diagnosis.age,fill = gender) +
  geom_histogram(color = 'black',alpha = 0.6) + 
  scale_color_manual(values = c('skyblue2','thistle3'),labels = c('Male','Female')) +
  labs(x = 'Age at Diagnosis (yrs)',y = 'Total Participants',fill = 'Gender') +
  theme_classic() + theme(legend.position = 'top')
 
           

