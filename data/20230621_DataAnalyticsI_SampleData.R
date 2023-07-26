#Generate 5 data sets of random dummy meta data
i <- 1
for (i in 1:5){
	participant <- c(1:100)
	age <- round(rnorm(100, 50,10))
	age <- pmax(pmin(age,100),18)
	sex <- sample(c("Female","Male"), 100, replace = TRUE)
	race <- sample(c("Black","White", "Asian","Hispanic/Latino","Other"), 100, replace = TRUE)
	SES <- sample(c("Low","Medium","High"), 100, replace = TRUE)
	disease_status <- sample(c("Diseased","Not Disease"), 100, replace = TRUE)
	crp <- rnorm(100, mean=0.3, sd=0.1)
	
	df <- data.frame(participant, age, sex, race, SES, disease_status, crp)
	
	write.csv(df, paste0("/Users/noellekosarek/Documents/GitHub/QBS103/data/Data_Analytics_1_In_Class_Assignment_Data/sample_data_",i,".csv"), row.names = F)
	i = i +1
}